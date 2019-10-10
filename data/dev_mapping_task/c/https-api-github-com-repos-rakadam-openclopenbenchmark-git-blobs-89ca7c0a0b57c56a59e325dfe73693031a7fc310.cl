kernel void A(global int* a, global int* b, int c) {
  double d = a[get_global_id(0)];
  double e = a[get_global_id(0)] / 10.0f + 1;
  double f = a[get_global_id(0)] / 100.0f + 2;

  for (int g = 0; g < 128; g++) {
    d = mad(d, e, f);
    e = mad(e, d, f);
    f = mad(f, e, d);
  }

  b[get_global_id(0)] = d + e + f;
}