kernel void A(global int* a, global int* b, int c) {
  float d = a[get_global_id(0)];
  float e = a[get_global_id(0)] / 10.0f + 1;
  float f = a[get_global_id(0)] / 100.0f + 2;

  for (int g = 0; g < 2048; g++) {
    d = __clc_fma(d, e, f);
    e = __clc_fma(e, d, f);
    f = __clc_fma(f, e, d);
  }

  b[get_global_id(0)] = d + e + f;
}