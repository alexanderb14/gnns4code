__kernel void A(double a, __global double* b, double c, int d, __global double* e) {
  int f = get_global_id(0);

  if (f >= d) {
    return;
  } else {
    double g = a;
    double h = c + 1;
    double i, j, k;
    while (h > c) {
      i = 2 * b[f] * g + 2.3;

      j = 2 * b[f];

      k = g - i / j;

      h = __clc_fabs(k - g);
      g = k;
    }

    e[f] = g;
  }
}