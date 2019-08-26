__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void A(const __global float* a, __global float* __restrict b, __global float* __restrict c, __global float* __restrict d, const __global float* __restrict e, const __global float* __restrict f, double g) {
  float h, i;
  float j, k, l;
  float m, n;
  unsigned int o, p, q;

  int r = get_global_id(0);
  int s = get_global_id(1);
  int t = get_global_size(1);

  int u = 1 * r;

  for (int v = 0; v < 1; v += t) {
    p = v + s;
    if (p < 1) {
      o = u + p;
      h = c[o];
      i = d[o];
      j = (1.f / sqrt(__clc_fabs(i + g)));
      m = e[o];
      n = f[o];
      for (int w = 0; w < 1; w++) {
        q = 1 * w + o;
        k = a[q] - h;
        l = k * j;
        b[q] = mad(m, l, n);
      }
    }
  }
}