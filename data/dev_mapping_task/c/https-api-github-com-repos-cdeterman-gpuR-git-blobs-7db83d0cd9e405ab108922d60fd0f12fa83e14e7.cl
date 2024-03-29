__kernel void A(__global const float* a, __global float* b, const float c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  if ((g <= d) && (h <= e)) {
    b[g * f + h] = max(a[g * f + h], c);
  }
}