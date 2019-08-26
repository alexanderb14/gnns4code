kernel void A(global float* a, int b, global int* c, global float* d, int e, int f, int g, int h, int i, int j, float k) {
  int l = get_group_id(0) * get_local_size(0) * get_local_size(1) + get_local_id(1) * get_local_size(0) + get_local_id(0);

  long m = i / h;

  if (l < m) {
    long n = 0;
    for (int o = 0; o < h; o++) {
      int p = l;
      int q = 0;
      for (int r = 0; r < f; r++) {
        if (r < g) {
          n = p / (c[r] / j);
          p -= n * (c[r] / j);
          q += n * c[r];
        } else if (r > g) {
          n = p / c[r];
          p -= n * c[r];
          q += n * c[r];
        }
      }
      a[b + q + (int)((d[e + o]) - 1) * c[g]] = k;
    }
  }
}

kernel void B(global float* a, int b, global float* c, int d, global int* e, global float* f, int g, int h, int i, int j, int k, int l) {
  int m = get_group_id(0) * get_local_size(0) * get_local_size(1) + get_local_id(1) * get_local_size(0) + get_local_id(0);

  long n = k / j;

  if (m < n) {
    long o = 0;
    for (int p = 0; p < j; p++) {
      int q = m;
      int r = 0;
      int s = 0;
      for (int t = 0; t < h; t++) {
        if (t < i) {
          long u = e[t] / l;
          o = q / u;
          q -= o * u;
          r += o * u * j;
          s += o * e[t];
        } else if (t > i) {
          o = q / e[t];
          q -= o * e[t];
          r += o * e[t];
          s += o * e[t];
        }
      }
      a[b + s + ((int)(f[g + p]) - 1) * e[i]] = c[d + r + p * e[i]];
    }
  }
}

kernel void C(global float* a, int b, global float* c, int d, global int* e, global float* f, int g, int h, int i, int j, int k, int l) {
  int m = get_group_id(0) * get_local_size(0) * get_local_size(1) + get_local_id(1) * get_local_size(0) + get_local_id(0);

  long n = k / j;

  if (m < n) {
    long o = 0;
    for (int p = 0; p < j; p++) {
      int q = m;
      int r = 0;
      int s = 0;
      for (int t = 0; t < h; t++) {
        if (t < i) {
          long u = e[t] / l;
          o = q / u;
          q -= o * u;
          r += o * u * j;
          s += o * e[t];
        } else if (t > i) {
          o = q / e[t];
          q -= o * e[t];
          r += o * e[t];
          s += o * e[t];
        }
      }
      a[b + r + p * e[i]] = c[d + s + ((int)(f[g + p]) - 1) * e[i]];
    }
  }
}