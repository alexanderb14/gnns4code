float A(float a, float b, float c) {
  return a / (__clc_pow(1.0f - b, 2.0f) + (__clc_pow(b, 2.0f) + 2.0f * b * (1.0f - b) / c) * a);
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  if (g < e && h < f) {
    const int i = g * f + h;
    d[i] = A(a[i], b[i], c[i]);
  }
}