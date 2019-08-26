float A(__global float* a, const uint b, const int c, __global const float* d, __global const float* e) {
  (void)b;
  const float f = *e;
  return a[c] + 1 / (d[c] + f);
}

__kernel void B(__global float* a, __global float* b, const uint c, const uint d, const uint e, const uint f, __global const float* g, __global const float* h) {
  int i = get_global_id(0);
  int j = i + e;
  uint k = get_local_size(0) * get_num_groups(0);
  while (i < d) {
    b[i + f] = A(a + f, c, j, g, h);
    i += k;
  }
}