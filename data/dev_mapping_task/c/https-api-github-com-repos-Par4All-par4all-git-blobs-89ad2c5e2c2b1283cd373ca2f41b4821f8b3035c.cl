typedef float4 v4sf; __kernel void A(const __global float* a, __constant float* b, __global float* c, const int d, const int e) {
  int f = get_global_size(0);

  int g = get_global_id(0);
  int h = get_global_id(1);

  int i = g;
  int j = h;

  float k = 0;
  float l[4];
  int m, n, o;

  int p, q;

l99998:
  for (q = 0; q <= e - 1; q += 1) {
    m = q * e;

    n = j + q;
    o = ((i) + (n) * (d));

    int r, s;

    v4sf t, u, v;
    t = 0;

  l99999:
    for (r = 0; r <= 4 * ((e) / 4) - 1; r += 4) {
      u = vload4(0, &b[m + r]);
      v = vload4(0, &a[o + r]);
      t = (t) + (u) * (v);
    }
    vstore4(t, 0, &l[0]);
    k = k + l[0] + l[1] + l[2] + l[3];
    for (s = 4 * ((e) / 4); s <= e - 1; s += 1)
      k = ((k) + (b[m + s]) * (a[o + s]));
  }

  p = ((g) + (h) * (f));
  c[p] = k;
}