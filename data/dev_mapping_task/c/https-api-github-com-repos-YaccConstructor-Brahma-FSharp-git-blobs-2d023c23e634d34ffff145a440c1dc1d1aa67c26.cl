__kernel void A(__global const float* a, __global const float* b, uint c, __global float* d) {
  size_t e = get_global_id(0);
  __global float const* f = &a[e * c];
  float g = 0.f;
  for (size_t h = 0; h < c; h++) {
    g += f[h] * b[h];
  }
  d[e] = g;
}