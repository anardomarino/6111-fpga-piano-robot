

/* support.ino
  @author: Anthony Nardomarino
  6.111 Digital Systems Laboratory
  12-01-2019
  Test ESP32 Motor Support Functions
*/

const int depress[6] = {1150, 1450, 1750, 2050, 2350, 2650};
const int  ascend[6] = {2350, 2050, 1750, 1450, 1150,  600};

void test(Servo x) {
  x.write(180);
  delay(520);
  x.write(0);
  delay(520);
}

void copy(int* src, int* dst, int len) {
    memcpy(dst, src, sizeof(src[0])*len);
}

void transition(Servo finger, byte dir, int stage){
  finger.writeMicroseconds(!dir*depress[stage]+dir*ascend[stage]);
}
