__kernel void A(double a, __global const double* b, __global const double* c, int d, __global double* e) {
  int f = get_global_id(0);
  if (f < d)
    e[f] = a * b[f] + c[f];
}