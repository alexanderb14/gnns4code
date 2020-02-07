__kernel void A(const __global float* a, const __global float* b, uint c, uint d, __global float* e) {
  uint f = get_global_id(0);
  float g = 0;
  for (int h = 0; h < c; ++h) {
    g += a[f * c + h] * b[h];
  }
  e[f] = g;
}