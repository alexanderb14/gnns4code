typedef unsigned char fixed8; kernel void A(global char* a, global char* b, int c, int d) {
  int e = get_global_id(0);
  int f = get_global_id(1);
  int g = f * (c >> 1) + e;
  vstore4((vload4(0, a + (g << 2))), 0, b + (g << 2));
  char2 h = vload2(0, a + (g << 1) + c * d);
  b[g + c * d] = h.s0;
  b[g + c * d + ((c * d) >> 2)] = h.s1;
}