kernel void A(global const double* a, global const double* b, global double* c, int d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_global_id(1);

  double g = d;
  for (int h = 0; h < d; h++) {
    double i = a[(e * d) + h];
    double j = b[(h * d) + f];
    g += i * j;
  }

  c[(e * d) + f] = g;
}