__kernel void A(__global float* a, __global float* b, int c) {
  int d = get_global_id(0);
  int e = get_global_size(0);
  int f = get_global_id(1);
  int g = d + f * c;
  b[g] = (b[g] * d + a[g] * (e - d)) / (float)e;
}