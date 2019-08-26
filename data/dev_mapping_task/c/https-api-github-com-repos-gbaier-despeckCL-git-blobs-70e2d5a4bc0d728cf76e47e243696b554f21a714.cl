__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, const int f, const int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  const int j = h * g + i;

  if (h < f && i < g) {
    d[j] = 0.5f * (a[j] + b[j]) * cos(c[j]);
    e[j] = 0.5f * (a[j] + b[j]) * sin(c[j]);
  }
}