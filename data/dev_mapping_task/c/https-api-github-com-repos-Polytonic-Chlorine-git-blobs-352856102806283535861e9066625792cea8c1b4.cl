__kernel void A(__global float const* a, __global float const* b, int c, __global int* d) {
  unsigned int e = get_global_id(0);

  float f = a[e];
  float g = b[e];
  int h = 0;

  while ((f * f + g * g <= 2 * 2) && h < c) {
    float i = f * f - g * g + a[e];
    g = 2 * f * g + b[e];
    f = i;
    h++;
  }

  d[e] = f * f + g * g <= 2 * 2 ? -1 : h;
}