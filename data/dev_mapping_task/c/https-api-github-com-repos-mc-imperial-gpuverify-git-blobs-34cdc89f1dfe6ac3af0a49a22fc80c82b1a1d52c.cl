float A(float a, float b, float c, int d) {
  float e = 0.0f;
  return e;
}

__kernel void B(__constant float* a, __global float* b, __global float* c) {
  int d = get_group_id(0);
  int e = get_local_id(0);

  __local float f[(256) + 1];
  __local float g[(256) + 1];

  int h = e;
  int i;

  for (i = h; i <= (2048); i += (256)) {
    int j = d * ((2048) + 16) + (i);
    c[j] = A(a[d], a[d], a[d], i);
  }

  for (i = (2048); i > 0; i -= (2 * (16))) {
    for (int k = 0; k < i; k += ((256) - (2 * (16)))) {
      int l;
      if ((256) - 1 < i - k) {
        l = (256) - 1;
      } else {
        l = i - k;
      }
      int m = l - (2 * (16));

      barrier(1 | 2);
      if (h <= l) {
        int n = d * ((2048) + 16) + (k + h);
        f[h] = c[n];
      }

      for (int o = l - 1; o >= m;) {
        barrier(1 | 2);
        g[h] = a[d] * f[h + 1] + a[d] * f[h];
        o--;

        barrier(1 | 2);
        f[h] = a[d] * g[h + 1] + a[d] * g[h];
        o--;
      }

      barrier(1 | 2);
      if (h <= m) {
        int p = d * ((2048) + 16) + (k + h);
        c[p] = f[h];
      }
    }
  }

  if (h == 0)
    b[d] = f[0];
}