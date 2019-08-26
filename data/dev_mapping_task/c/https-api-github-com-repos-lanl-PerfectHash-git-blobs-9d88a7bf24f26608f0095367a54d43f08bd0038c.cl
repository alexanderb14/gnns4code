typedef float real; struct neighbor2d {
  uint left;
  uint right;
  uint bottom;
  uint top;
};

__kernel void A(const uint a, __global int* b) {
  const uint c = get_global_id(0);

  if (c >= a)
    return;

  b[c] = -1;
}

__kernel void B(const real a, const real b, const uint c, __global const real* d, __global int* e) {
  const uint f = get_global_id(0);

  if (f >= c)
    return;

  e[(uint)((d[f] - a) / b)] = f;
}

__kernel void C(const uint a, const uint b, const uint c, __global const int* d, __global const int* e, __global const int* f, __global const int* g, __global int* h) {
  const uint i = get_global_id(0);

  if (i >= a)
    return;

  int j = b * d[c];

  int k = g[i];
  int l = e[i];
  int m = f[i];

  int n = c - k;

  int o = l * d[n];
  int p = (l + 1) * d[n];
  int q = m * d[n];
  int r = (m + 1) * d[n];

  for (int s = q; s < r; s++) {
    for (int t = o; t < p; t++) {
      h[(s)*j + (t)] = i;
    }
  }
}

__kernel void D(const int a, const uint b, const int c, __global const int* d, __global const int* e, __global const int* f, __global const int* g, __global const int* h, __global struct neighbor2d* i) {
  const uint j = get_global_id(0);

  if (j >= a)
    return;

  int k = b * d[c];
  int l = b * d[c];

  int m = e[j];
  int n = f[j];
  int o = g[j];
  int p = d[c - o];

  int q = h[(n * p) * k + (max(m * p - 1, 0))];
  int r = h[(n * p) * k + (min((m + 1) * p, k - 1))];
  int s = h[(max(n * p - 1, 0)) * k + (m * p)];
  int t = h[(min((n + 1) * p, l - 1)) * k + (m * p)];

  i[j].left = q;
  i[j].right = r;
  i[j].bottom = s;
  i[j].top = t;
}