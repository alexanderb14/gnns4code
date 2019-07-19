__kernel void A(const __global float* a, const __global float* b, __global float* c, uint d, uint e) {
  uint f = get_global_id(1);
  uint g = get_global_id(0);

  float h = 0.0f;
  for (uint i = 0; i < d; ++i)
    h += a[f * d + i] * b[i * d + g];
  c[f * d + g] = h;
}