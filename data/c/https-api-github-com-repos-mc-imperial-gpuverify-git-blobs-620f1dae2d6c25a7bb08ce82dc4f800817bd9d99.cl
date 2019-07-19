float A(void); __kernel void B() {
  float a = A();
  a = (float)2 - a;
}