__kernel void A(__global float* a, __global float* b, int c, int d, int e, int f) {
  int g = 0;
  int h = 0;
  int i = 0;
  int j = 0;

  g = get_global_id(0) > e ? e : get_global_id(0);
  h = get_global_id(1) > f ? f : get_global_id(1);

  i = c + mul24(h, e) + g;
  j = d + mul24(h, e) + g;

  float k = a[j] - a[i];

  if ((h <= f) && (g <= e)) {
    b[i] = k;
  }
}