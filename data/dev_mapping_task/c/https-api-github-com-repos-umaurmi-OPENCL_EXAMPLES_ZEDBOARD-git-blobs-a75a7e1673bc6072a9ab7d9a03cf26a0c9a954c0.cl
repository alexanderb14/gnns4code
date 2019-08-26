__kernel void A(__global float* a, __global float* b, int c, int d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);

  unsigned int g = f * c + e;
  if (b[g] > d) {
    a[g] = 255;
  } else {
    a[g] = 0;
  }
}