typedef float2 magmaFloatComplex; __kernel void A(int a, int b, __global magmaFloatComplex* c, int d, int e, __global magmaFloatComplex* f, int g, int h) {
  int i = get_group_id(0) * 64 + get_local_id(0);
  if (i < a) {
    c += (d + i);
    f += (g + i);
    __global magmaFloatComplex* j = c + e * b;
    while (c < j) {
      *f = *c;
      c += e;
      f += h;
    }
  }
}