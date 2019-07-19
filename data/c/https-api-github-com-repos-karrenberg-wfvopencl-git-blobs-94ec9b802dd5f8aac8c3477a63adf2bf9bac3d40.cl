__kernel void A(__global float* a, __global float* b) {
  int c = get_global_id(0);
  int d = get_global_id(1);

  const int e = d + c * get_global_size(1);
  b[e] = a[c] + a[d];
}