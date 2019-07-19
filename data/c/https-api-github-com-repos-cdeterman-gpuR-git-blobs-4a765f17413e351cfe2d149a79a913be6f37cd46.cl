__kernel void A(__global double* a, unsigned int b, unsigned int c) {
  a[c * b + c] = sqrt(a[c * b + c]);
}

__kernel void B(__global double* a, const int b, unsigned int c, unsigned int d, unsigned int e) {
  int f = get_global_id(0);

  if (f > e && f < c) {
    double g = a[e * d + e];

    if (b == 0) {
      a[f * d + e] = a[f * d + e] / g;

      a[e * d + f] = 0;
    } else if (b == 1) {
      a[e * d + f] = a[e * d + f] / g;

      a[f * d + e] = 0;
    } else {
      return;
    }
  }
}

__kernel void C(__global double* a, const int b, unsigned int c, unsigned int d, unsigned int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  if (f <= e || g <= e)
    return;
  if (f >= c || g > f)
    return;

  if (b == 0) {
    double h = a[f * d + e];
    double i = a[g * d + e];
    double j = a[f * d + g];

    a[f * d + g] = j - h * i;

  } else if (b == 1) {
    double h = a[e * d + f];
    double i = a[e * d + g];
    double j = a[g * d + f];

    a[g * d + f] = j - h * i;
  } else {
    return;
  }
}