__kernel void A(__global const double2* a, __global double2* b, int c, int d) {
  int e = get_global_id(0);

  if (e >= c)
    return;

  double2 f = 0;
  double g = (-2 * d * e) * 3.14 / (double)c;

  for (int h = 0; h < c; h++) {
    double2 i = a[h];

    double j;
    double k = sincos(h * g, &j);

  f += (double2)(
   dot(iouble2)(j, -k)),
   dot(iouble2)(k, j))
  );
  }

  if (d == 1) {
    b[e] = f;
  } else {
    b[e] = f / (double)c;
  }
}