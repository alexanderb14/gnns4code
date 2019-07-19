__kernel void A(__global const float* a, const float b, const int c, __global float* d) {
  int e = get_global_id(0);

  if (e < c)
    d[e] = a[e] + b;
}