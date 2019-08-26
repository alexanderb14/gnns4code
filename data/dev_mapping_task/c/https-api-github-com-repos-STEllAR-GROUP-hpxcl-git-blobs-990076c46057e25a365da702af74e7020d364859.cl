__kernel void A(__global double* a, __global double* b, __global double* c, __global int* d, __global int* e, __global int* f, __global double* g, __global double* h) {
  int i = get_global_id(1);
  int j = get_global_id(0);

  if (i < (e[0]) && j < (d[0])) {
    double k = 0.0;
    for (int l = 0; l < f[0]; l++)
      k += (g[0]) * a[i * (f[0]) + l] * b[l * (e[0]) + j];
    c[i * (e[0]) + j] = k + (h[0]) * c[i * (e[0]) + j];
  }
}