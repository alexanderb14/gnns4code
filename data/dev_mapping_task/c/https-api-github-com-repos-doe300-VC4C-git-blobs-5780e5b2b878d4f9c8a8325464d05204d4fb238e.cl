__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void A(const __global float* __restrict a, __global float* __restrict b, const __global float* __restrict c, const __global float* __restrict d, const __global float* __restrict e, const __global float* __restrict f, double g) {
  int h = get_global_id(0);
  int i = get_global_id(1);
  local float j;
  local float k;
  local float l;
  local float m;

  unsigned int n = h * 1;
  unsigned int o;

  float p, q, r;
  float s;
  float t, u;

  if (get_local_id(1) == 0) {
    j = c[h];
    k = d[h];
    l = e[h];
    m = f[h];
  }
  barrier(1);

  if (i < 1) {
    p = j;
    q = k;
    t = l;
    u = m;
    r = (1.f / sqrt(__clc_fabs(q + g)));

    for (int v = 0; v < 1; v++) {
      o = v * 1 + n + i;
      s = (a[o] - p) * r;
      b[o] = mad(t, s, u);
    }
  }
}