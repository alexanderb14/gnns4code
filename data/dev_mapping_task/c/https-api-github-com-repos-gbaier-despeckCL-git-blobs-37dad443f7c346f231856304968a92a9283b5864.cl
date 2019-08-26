inline const int A(const int a, const int b, const int c) {
  return a + b - c;
}

inline const int B(const int a, const int b) {
  return b - a - 1;
}

__kernel void C(__global float* a, __global float* b, const int c, const int d, const int e) {
  const int f = (e - 1) / 2;

  const int g = get_global_id(1);
  const int h = get_global_id(0);

  const int i = g;
  const int j = h + f;

  const int k = d + 2 * f;
  const int l = c + f;

  if (g < c && h < d) {
    for (int m = 0; m < f * e + f; m++) {
      const int n = m * c * d + g * d + h;
      b[n] = a[m * l * k + i * k + j];
    }

    for (int o = f; o < e; o++) {
      int p = 0;
      if (o == f) {
        p = f + 1;
      }
      for (int q = p; q < e; q++) {
        const int n = (o * e + q) * c * d + g * d + h;

        const int r = A(g, o, f);
        const int s = f + A(h, q, f);
        const int t = B(o, e);
        const int u = B(q, e);
        const int v = t * e * l * k + u * l * k + r * k + s;

        b[n] = a[v];
      }
    }
  }
}