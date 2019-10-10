__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, __private unsigned int e, __private unsigned int f) {
  size_t g = get_global_id(0);
  size_t h = e + g;

  float i = 0;

  if (g < f)
    i = (a[h] - c[h]) / b[h];

  d[h] = i;
}