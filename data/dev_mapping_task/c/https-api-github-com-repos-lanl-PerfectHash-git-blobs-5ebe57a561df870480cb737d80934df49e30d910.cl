typedef float real; struct rcell {
  real low;
  real high;
};

__kernel void A(const real a, const real b, const uint c, __global const real* d, __global int* e) {
  const uint f = get_global_id(0);

  if (f >= c)
    return;

  e[(uint)((d[f] - a) / b)] = f;
}

__kernel void B(const real a, const real b, const uint c, __global const struct rcell* d, __global int* e) {
  const uint f = get_global_id(0);

  if (f < c) {
    uint g = (int)((d[f].low + a) / b);
    uint h = (int)((d[f].high + a) / b);

    while (g < h) {
      e[g] = f;
      g++;
    }
  }
}

__kernel void C(const real a, const real b, const uint c, const uint d, __global struct rcell* e, __global real* f, __global struct rcell* g, __global int* h, __global real* i) {
  const uint j = get_global_id(0);
  if (j < d) {
    uint k = (g[j].low - a) / b;
    uint l = (g[j].high - a) / b;

    if (k > c - 1) {
      i[j] = 0.0;
      return;
    }
    if (l > c)
      l = c;

    i[j] = 0.;
    for (uint m = k; m < l; m++) {
      if (h[m] >= 0) {
        i[j] += f[h[m]] * 1. / (e[h[m]].high - e[h[m]].low);
      }
    }
  }
}