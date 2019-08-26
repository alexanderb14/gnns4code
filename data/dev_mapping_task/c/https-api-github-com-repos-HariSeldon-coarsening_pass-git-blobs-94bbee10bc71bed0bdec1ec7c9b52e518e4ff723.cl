__kernel void A(__global float* a, __global const float* b, int c, int d) {
  unsigned int e = get_global_id(1);
  unsigned int f = get_global_id(0);

  unsigned int g = e * c + f;
  unsigned int h = f * d + e;
  a[h] = b[g];
}