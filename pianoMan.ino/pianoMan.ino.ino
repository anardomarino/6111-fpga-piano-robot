#include <ESP32Servo.h>
#include <HardwareSerial.h>

#define RXP   26  // rx pin for MySerial reading
#define TXM   17  // misc tx pin for MySerial interface
#define BAUD  115200 // Serial baud rate for FPGA interfacing
#define IDLE  0
#define PLAY  1
#define IDLE_TIME 2000  // milliseconds until idle transition
#define ACT_DELAY 100   // actuation delay for servos to reach desired position
#define NUM_MOTORS 12   // motors cover one octave

// beat states
#define OPEN    1
#define CLOSED  0

/* pianoMan.ino
  @author: Anthony Nardomarino
  6.111 Digital Systems Laboratory
  12-01-2019
  ESP32 Interface with FPGA Piano Playing Robot Hands
*/

HardwareSerial MySerial(1);

//                Key:
//
// 0100_0000 - A     0101_0000 - C#   0100_1000 - F
// 0010_0000 - A#    0011_0000 - D    0010_1000 - F#
// 0110_0000 - B     0111_0000 - D#   0110_1000 - G
// 0001_0000 - C     0000_1000 - E    0001_1000 - G#

Servo fgA, fgAs, fgB, fgC, fgCs, fgD;
Servo fgDs, fgE, fgF, fgFs, fgG, fgGs;

Servo keys[NUM_MOTORS] = {fgA,  fgAs, fgB, fgC,  fgCs, fgD,
                          fgDs, fgE,  fgF, fgFs, fgG,  fgGs};

// 8 bit addresses for each motor
const byte  addresses[NUM_MOTORS] = {64, 32, 96, 16, 80, 48, 112, 8, 72, 40, 104, 24};

// measured resting high angles for servo fingers
const int __upStrats[NUM_MOTORS] = {700, 700, 650, 2200, 2250, 2150, 2200, 2300, 2200, 700, 700, 700};

// measured low angles for activated servo fingers
const int downStrats[NUM_MOTORS] = {840, 800, 860, 2000, 2000, 1850, 2050, 2000, 2000, 900, 900, 900};
                                    
const byte  servoPins[NUM_MOTORS] = {4, 5, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22};

// strategies for all motors
byte dirs[NUM_MOTORS] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};       // 0 for up, 1 for down
                                                                    // old state of motors to be compared

byte buttons[NUM_MOTORS] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};    // onset control
                                                                    // new state of motors received serially
int state;                    // PLAY or IDLE hands

int timer;                    // idle timer
int beat_clock;
int beat_state;

int   serialIn;               // Serial input from FPGA
int   counter;                // counts 12 serial inputs before actuation
byte  needDel = 0;            // dynamic delay logic

void setup() {
  // Setup serial channels
  Serial.begin(BAUD);
  MySerial.begin(BAUD, SERIAL_8N1, RXP, TXM);
  // attach and program rest state servos
  for (int i = 0; i < NUM_MOTORS; i ++){
    keys[i].attach(servoPins[i]);
  }
  for (int i = 0; i < NUM_MOTORS; i ++){
    keys[i].writeMicroseconds(__upStrats[i]);
  }
  delay(100);
  counter = 0;
  // detach to prevent current flow from skipping motors
  for (int i = 0; i < NUM_MOTORS; i ++){
    keys[i].detach();
  }
  state = IDLE;
  timer = millis();
  beat_clock = millis();
  beat_state = IDLE;
}

void loop() {
  
  // onset reads
  // Read Serial and update onset control buttons
  serialIn = MySerial.read();
  if(serialIn != -1){
    Serial.println(serialIn);
    counter ++;
    timer = millis();
    if (state == IDLE){
      state = PLAY;
      for (int i = 0; i < NUM_MOTORS; i ++){
        keys[i].attach(servoPins[i]);
      }
    }
    for (int i = 0; i < NUM_MOTORS; i ++){
      if(serialIn == addresses[i]){
        buttons[i]  = 1;
        needDel     = 1;
      }
    }
  }
  
  if(millis() - timer > IDLE_TIME && state == PLAY){
    state = IDLE;
    for (int i = 0; i < NUM_MOTORS; i ++){
      keys[i].writeMicroseconds(__upStrats[i]);
    }
    delay(100);
    for (int i = 0; i < NUM_MOTORS; i ++){
      keys[i].detach();
    }
  }
  if(counter >= 12 && state == PLAY){
    for(int i = 0 ; i < NUM_MOTORS; i ++){
      // onset of play
      if (dirs[i] == 0 && buttons[i] == 1){
          Serial.println(String(i) + " DOWN");
          keys[i].writeMicroseconds(downStrats[i]);
      // onset of release
      } else if (dirs[i] == 1 && buttons[i] == 0) {
          Serial.println(String(i) + " UP");
          keys[i].writeMicroseconds(__upStrats[i]);
      }
    }
    if(needDel){
      delay(ACT_DELAY);
    }
    needDel = 0;
    // reset serial received states and update old states
    for(int i = 0; i < NUM_MOTORS; i ++){
      dirs[i] = buttons[i];
      buttons[i] = 0;
    }
    counter = 0;
    beat_state = CLOSED;
    beat_clock = millis();
  }
}
