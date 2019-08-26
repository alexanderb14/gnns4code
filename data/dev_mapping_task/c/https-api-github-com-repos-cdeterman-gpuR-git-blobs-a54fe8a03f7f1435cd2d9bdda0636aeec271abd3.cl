__kernel void A(__global float* a, __global float* b, const float c, const unsigned int d) {
  const int e = get_global_id(0);

  if (e < d) {
    b[e] = min(a[e], c);
  }
}