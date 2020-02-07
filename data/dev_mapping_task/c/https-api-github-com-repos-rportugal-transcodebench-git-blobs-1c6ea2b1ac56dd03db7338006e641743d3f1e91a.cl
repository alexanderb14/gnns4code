__kernel void A(__global float* a, __global const float* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;

  a[d] = b[d] + 1;
}