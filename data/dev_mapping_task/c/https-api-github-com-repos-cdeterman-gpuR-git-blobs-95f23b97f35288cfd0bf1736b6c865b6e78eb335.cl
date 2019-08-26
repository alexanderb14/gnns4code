__kernel void A(__global int* a, const int b, const int c, const int d, const int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  if ((f <= c) && (g <= d)) {
    a[f * e + g] = b / a[f * e + g];
  }
}