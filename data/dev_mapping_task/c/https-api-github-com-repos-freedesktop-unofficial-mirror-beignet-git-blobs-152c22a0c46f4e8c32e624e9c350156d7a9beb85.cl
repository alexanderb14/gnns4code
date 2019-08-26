__kernel void A(__global int* a, __global int* b) {
  int c[32];
  for (int d = 0; d < 16; ++d) {
    for (int e = 0; e < 16; ++e)
      c[e] = get_global_id(0);
    for (int e = 0; e < a[0]; ++e)
      c[e] = 1 + a[e];
    c[16 + d] = c[d];
  }
  b[get_global_id(0)] = c[16 + get_global_id(0)];
}