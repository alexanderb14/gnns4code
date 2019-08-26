__kernel void A(__global float* a, __global float* b, __global float* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h;
  float i = 0;

  for (h = 0; h < d; h++)
    i += a[f * d + h] * b[h * e + g];
  c[f * e + g] = i;
}