#include <ESP32Servo.h>

#define RXD2 16
#define TXD2 17

/* testMotor.ino
  @author: Anthony Nardomarino
  6.111 Digital Systems Laboratory
  11-25-2019
  Test ESP32 Motor Connections
*/

ESP32PWM pwm;
const int MIN_US = 500;
const int MAX_US = 2350;

const int NUM_MOTORS = 6;

// Initiate fingersstratCounts should start iterating
Servo fgA;
Servo fgB;
Servo keys[NUM_MOTORS] = {fgA, fgB};
const byte servoPins[NUM_MOTORS] = {14, 32};

// strategies for all motors
//int downStrat[6] = {942, 1223, 1505, 1787, 2068, 2350};
//int __upStrat[6] = {2068, 1787, 1505, 1223, 942,  600};
int downStrat[6] = {2350, 2350, 2350, 2350, 2350, 2350};
int __upStrat[6] = {1150, 1150, 1150, 1150, 1150, 1150};
byte hasStrat[NUM_MOTORS] = {0, 0}; // 1 if active, 0 if inactive
byte dirs[NUM_MOTORS] = {0, 0};     // 0 for down, 1 for up
byte stratCounts[NUM_MOTORS] = {0, 0};

const uint32_t LOOPTIME = 100;

const int ACT_DELAY = 30;


// Min/Max micros for pwm angles (min - 0degs, max - 180degs)

int buttons[2];
int butt_in[2] = {34, 33};
int active_motors; // amount of motors with active strategies

void setup() {
  Serial.begin(115200);
  Serial2.begin(115200, SERIAL_8N1, RXD2, TXD2);
  Serial.println("Serial Txd is on pin: " + String(TX));
  Serial.println("Serial Rxd is on pin: " + String(RX));
  active_motors = 0;
  fgA.setPeriodHertz(300);
  fgB.setPeriodHertz(300);
  //  locations[0] = 0;
  //  locations[1] = 0;
  //  dirs[0] = 1;
  //  dirs[1] = 1;
  pinMode(2, OUTPUT);
  pinMode(34, INPUT);
  pinMode(33, INPUT);
  digitalWrite(2, HIGH);
  delay(100);
  digitalWrite(2, LOW);
}

void loop() {
  while (Serial2.available()) {
    Serial.print(char(Serial2.read()));
  }
  // start sequence
  pwm.attachPin(27, 10000);
  delay(10);
  digitalWrite(2, HIGH);
  delay(10);
  digitalWrite(2, LOW);

  buttons[0] = digitalRead(butt_in[0]);
  buttons[1] = digitalRead(butt_in[1]);

  for (int i = 0; i < NUM_MOTORS; i ++) {
    Serial.print("START ");
    Serial.println(i);
    if (buttons[i] == 1 && hasStrat[i] == 0) {
      hasStrat[i] = 1;
      dirs[i] = !dirs[i];
      active_motors ++;
    }
    if (hasStrat[i]) {
      keys[i].attach(servoPins[i], MIN_US, MAX_US);
      delay(1);
      if(dirs[i]){
        keys[i].writeMicroseconds(downStrat[stratCounts[i]]);
      }else{
        keys[i].writeMicroseconds(__upStrat[stratCounts[i]]);
      }
      delay(100);
      
      stratCounts[i] ++;
      if (stratCounts[i] >= 6) {
//        if (dirs[i]){
//          keys[i].writeMicroseconds(600);
//        }else{
//          keys[i].writeMicroseconds(2350);
//        }
//        delay(10);
        active_motors --;
        hasStrat[i] = 0;
        stratCounts[i] = 0;
      }
      keys[i].detach();
    }
  }

  // end sequence
  delay(5);
  digitalWrite(2, HIGH);
  delay(5);
  digitalWrite(2, LOW);
  pwm.detachPin(27);
}
