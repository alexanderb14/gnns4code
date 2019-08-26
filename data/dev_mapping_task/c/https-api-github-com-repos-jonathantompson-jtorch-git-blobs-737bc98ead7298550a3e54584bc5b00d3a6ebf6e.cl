__kernel void A(const __global float* a, __global float* b) {
  const int c = get_global_id(0);

  b[c] += a[c];
}