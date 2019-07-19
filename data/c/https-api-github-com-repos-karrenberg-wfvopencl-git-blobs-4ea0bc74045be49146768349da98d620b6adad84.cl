__kernel void A(__global float* a, __global float* b) {
  int c = get_global_id(0);
  int d = get_local_id(0);
  int e = get_group_id(0);

  int f = get_global_size(0);
  int g = get_local_size(0);

  int h = c;
  int i = d + e * g;

  b[i] = a[h];
}