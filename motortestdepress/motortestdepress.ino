#include <ESP32Servo.h>

/* pianoMan.ino
  @author: Anthony Nardomarino
  6.111 Digital Systems Laboratory
  12-01-2019
  ESP32 Interface with FPGA Piano Playing Robot Hands
*/

//                Key:
//
// 0100_0000 - A     0101_0000 - C#   0100_1000 - F
// 0010_0000 - A#    0011_0000 - D    0010_1000 - F#
// 0110_0000 - B     0111_0000 - D#   0110_1000 - G
// 0001_0000 - C     0000_1000 - E    0001_1000 - G#

// motors cover one octave
const int NUM_MOTORS = 12;

// microsecond pulse width for down and up positions
const int DOWNSTRAT = 2350;
const int __UPSTRAT = 2250;

const int ACT_DELAY = 100;

Servo fgA, fgAs, fgB, fgC, fgCs, fgD;
Servo fgDs, fgE, fgF, fgFs, fgG, fgGs;

Servo keys[NUM_MOTORS] = {fgA,  fgAs, fgB, fgC,  fgCs, fgD,
                          fgDs, fgE,  fgF, fgFs, fgG,  fgGs};
const byte addresses[NUM_MOTORS] = {129, 130, 131, 132, 133, 134,
                                    135, 136, 137, 138, 139, 140};

                                    
const byte servoPins[NUM_MOTORS] = {4, 5, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22};

// strategies for all motors
byte dirs[NUM_MOTORS] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};     // 0 for down, 1 for up

// Min/Max micros for pwm angles (min - 0degs, max - 180degs)

int buttons[NUM_MOTORS];    // onset control

int depress;

int interest = 6;

void setup() {
  Serial.begin(115200);
  for (int i = 0; i < NUM_MOTORS; i ++){
    keys[i].attach(servoPins[i]);
  }
  keys[interest].writeMicroseconds(2400);
}

void loop() {
  if(Serial.available()){
    Serial.println("available");
    depress = Serial.parseInt();
    Serial.read();
    if (depress != 0) {
      for (int i = 0; i < NUM_MOTORS; i ++){
        keys[interest].write(depress);
      }
      delay(400);
    }
  }
}
