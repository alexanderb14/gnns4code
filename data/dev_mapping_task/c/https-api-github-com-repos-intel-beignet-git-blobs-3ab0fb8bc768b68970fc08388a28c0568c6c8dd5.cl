__kernel void A(__global int* a, __global int* b) {
  int c;
  int d[16];
  for (c = 0; c < 16; ++c) {
    int e[16], f;
    for (f = 0; f < 16; ++f)
      e[f] = get_global_id(0);
    for (f = 0; f < a[0]; ++f)
      e[f] = 1 + a[f];
    d[c] = e[c];
  }
  b[get_global_id(0)] = d[get_global_id(0)];
}