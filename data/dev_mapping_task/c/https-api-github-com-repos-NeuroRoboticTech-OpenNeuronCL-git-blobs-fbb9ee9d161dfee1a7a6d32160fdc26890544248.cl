__kernel void A(__global float* a, __global unsigned int* b, __global unsigned int* c, __global float* d, unsigned int e) {
  unsigned int f = get_global_id(0);

  unsigned int g = b[f];

  unsigned int h = c[f];

  unsigned int i = g + h;

  float j = 0;
  for (unsigned int k = g; k < i; k++)
    j += a[k];

  d[f] = j;
}

__kernel void B(__global float* a, __global unsigned int* b, __global unsigned int* c, __global float* d, unsigned int e) {
  unsigned int f = get_global_id(0);

  unsigned int g = b[f];

  unsigned int h = c[f];

  unsigned int i = g + h;

  float j = 0;
  for (unsigned int k = g; k < i; k++)
    j += a[g + (k * e)];

  d[f] = j;
}