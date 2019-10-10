__kernel __attribute__((vec_type_hint(float3))) void A(__global const float* a, __global float* b, float c, int d) {
  int e = get_global_id(0);
  if (e < d) {
    float f = (a[e * 3] + a[e * 3 + 1] + a[e * 3 + 2]) * 0.33333333f;
    b[e * 3] = b[e * 3 + 1] = b[e * 3 + 2] = f <= c ? 0.0f : 1.0f;
  }
}