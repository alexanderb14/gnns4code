__kernel void A(__global int* a, __global float* b) {
  const uint c = get_global_id(0);
  const float d = b[c];
  if ((isinf(d)) || (isnan(d))) {
    atomic_min(a, c);
  }
}