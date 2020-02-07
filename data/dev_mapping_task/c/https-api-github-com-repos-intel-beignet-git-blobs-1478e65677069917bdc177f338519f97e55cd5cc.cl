__kernel void A(__global uchar* a, int b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = b / 2 + e;
  int g = b - f;

  uchar4 h = *(__global uchar4*)(a + g * c + d * 4);
  *(__global uchar4*)(a + f * c + d * 4) = h;
}