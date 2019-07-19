__kernel void A(__global double* a, __global int* b, __global int* c, __global double* d, __global double* e, __global int* f, __global int* g, __global int* h, __global double* i) {
  int j = get_global_id(0);

  if (j < f[0]) {
    int k = c[j];
    int l = (k == f[0] - 1) ? (h[0]) : c[j + 1];

    double m = 0;
    for (int n = k; n < l; n++) {
      int o = b[n];
      m += (i[0]) * a[n] * d[o];
    }
    e[j] = m;
  }
}