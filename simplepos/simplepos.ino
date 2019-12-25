#include <ESP32Servo.h>

Servo up, down;

void setup() {
  Serial.begin(115200);
  up.attach(4);
  down.attach(5);
}

void loop() {
  up.write(180);
  down.write(0);
  delay(1000);
}
