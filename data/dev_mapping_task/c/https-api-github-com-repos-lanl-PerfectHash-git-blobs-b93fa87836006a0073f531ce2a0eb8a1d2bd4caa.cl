typedef float real; __kernel void A(const uint a, const uint b, const uint c, const uint d, __global const real* e, __global const real* f, __global const real* g, __local real* h, __local real* i, __local real* j, __global const real* k, __global const real* l, __global real* m) {
  const uint n = get_local_id(0);
  const uint o = get_local_size(0);
  const uint p = get_global_id(0);

  if (n < b)
    h[n] = e[n];
  if (n < c)
    i[n] = f[n];

  for (uint q = n; q < d; q += o) {
    j[q] = g[q];
  }

  barrier(1);

  real r = (h[50] - h[0]) / 50.0;
  real s = (i[22] - i[0]) / 22.0;

  int t = 51;

  if (p < a) {
    real u = k[p];
    real v = l[p];

    int w = (int)((u - h[0]) / r);
    int x = (int)((v - i[0]) / s);
    real y = (u - h[w]) / (h[w + 1] - h[w]);
    real z = (v - i[x]) / (i[x + 1] - i[x]);

    m[p] = y * z * j[(w + 1) + ((x + 1) * t)] + (1.0 - y) * z * j[(w) + ((x + 1) * t)] + y * (1.0 - z) * j[(w + 1) + ((x)*t)] + (1.0 - y) * (1.0 - z) * j[(w) + ((x)*t)];
  }
}