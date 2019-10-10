__kernel void A(__global float* a, __global float* b, int c) {
  unsigned int d = get_global_id(0);
  unsigned int e = get_global_id(1);

  unsigned int f = e * c + d;
  unsigned int g = d * c + e;

  a[f] = 255 - b[f];
}