__kernel void A(__global int* a, __global int* b) {
  int c[16];
  for (int d = 0; d < 16; ++d) {
    int e[16];
    for (int f = 0; f < a[0]; ++f)
      e[f] = 1 + a[0];
    for (int f = a[0]; f < 16; ++f)
      e[f] = get_global_id(0);
    c[d] = e[d];
  }
  b[get_global_id(0)] = c[get_global_id(0)];
}