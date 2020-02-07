__kernel void A(const __global float* a, __global float* b, const int c, const int d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_global_id(2);

  const j = get_global_size(0);
  const k = get_global_size(1);

  const int l = f * g;
  const int m = f * h;
  float n = 0.0;
  for (int o = 0; o < e; o++) {
    const int p = (((i * d) + m + o) * c) + l;
    for (int q = 0; q < e; q++) {
      const int r = p + q;
      n = fmax(n, a[r]);
    }
  }
  b[(((i * k) + h) * j) + g] = n;
}

__kernel void B(const __global float* a, __global float* b, const int c, const int d, const int e, const int f, const int g, const int h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);
  const int k = g * i;
  const int l = h * j;
  float m = 0.0;
  for (int n = 0; n < d; n++) {
    const int o = ((l + n) * e) + k;
    for (int p = 0; p < c; p++) {
      const int q = o + p;
      m = fmax(m, a[q]);
    }
  }
  b[(j * e) + i] = m;
}