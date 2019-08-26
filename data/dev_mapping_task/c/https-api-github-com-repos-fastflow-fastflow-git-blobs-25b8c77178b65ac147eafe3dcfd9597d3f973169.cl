float A(__global float* a, const uint b, const int c, __global const int* d) {
  (void)b;
  const int e = *d;
  return (float)((e + 1) + c);
}

__kernel void B(__global float* a, __global float* b, const uint c, const uint d, const uint e, const uint f, __global const int* g) {
  int h = get_global_id(0);
  int i = h + e;
  uint j = get_local_size(0) * get_num_groups(0);
  while (h < d) {
    b[h + f] = A(a + f, c, i, g);
    h += j;
  }
}