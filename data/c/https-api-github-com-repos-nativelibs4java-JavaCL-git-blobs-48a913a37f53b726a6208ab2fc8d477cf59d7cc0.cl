double2 A(double2 a, double2 b) {
 return (double2)(
  db
}

__kernel void B(__global const double2* a, __global double2* b, int c, __global const int* d, double e) {
  int f = get_global_id(0);
  if (f >= c)
    return;

  int g = d[f];
  b[f] = a[g] * e;
}

__kernel void C(int a, __global double2* b) {
  int c = get_global_id(0);
  double d = -3.14 * 2 * c / (double)a;
  double e, f = sincos(d, &e);
  b[c] = (double2)(f, e);
}
__kernel void D(__global double2* a, int b, __global double2* c, int d) {
  int e = get_global_id(0);
  int f = b / 2;
  int g = get_global_id(1) * b;

  double2 h = c[e];
  if (d)
    h.x = -h.x;

  int i = g + e;
  int j = i + f;
  double2 k = a[i];
  double2 l = a[j];

  double2 m = A(l, h);
  a[i] = k + m;
  a[j] = k - m;
}