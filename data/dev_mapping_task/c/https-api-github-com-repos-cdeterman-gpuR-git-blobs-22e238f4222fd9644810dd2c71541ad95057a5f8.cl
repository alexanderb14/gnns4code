__kernel void A(__global int* a, const int b, const int c, const int d, const int e, const int f, const int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);

  if ((h <= e) && (i <= f)) {
    if (d == 0) {
      a[h * g + i] = c * a[h * g + i] + b;
    } else {
      a[h * g + i] = a[h * g + i] + c * b;
    }
  }
}