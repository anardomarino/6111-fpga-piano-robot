// Support functions

void test(Servo x) {
  x.write(180);
  delay(520);
  x.write(0);
  delay(520);
}

void copy(int* src, int* dst, int len) {
    memcpy(dst, src, sizeof(src[0])*len);
}
