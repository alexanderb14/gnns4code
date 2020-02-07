kernel void A(global double* a, global double* b, global double* c) {
  int d = get_global_id(0);
  if (d % 3 != 0)
    c[d] = a[d] / b[d];
  else
    c[d] = 0.0;
}

kernel void B(double a, double b, double c, global double* d) {
  c = a / b;
  d[0] = c;
}