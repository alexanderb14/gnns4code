kernel void A(global int* a) {
  int b = 0x777;
  int c = 0x888;
  int d = b + c;
  *a = d;
}