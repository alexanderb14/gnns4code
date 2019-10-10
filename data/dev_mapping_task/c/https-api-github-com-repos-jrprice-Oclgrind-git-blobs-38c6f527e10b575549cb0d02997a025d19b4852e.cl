__kernel void A(__global int* a, __global int* b) {
  size_t c = get_global_id(0);
  int3 d = 0;
  d.S2 = a[c];
  vstore3(d, 0, b);
}