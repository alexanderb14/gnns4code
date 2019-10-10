typedef float real; struct neighbor {
  uint left;
  uint right;
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

__kernel void C(const real a, const real b, const uint c, __global const real* d, __global const int* e, const uint f, __global struct neighbor* g) {
  const uint h = get_global_id(0);

  if (h >= c)
    return;

  int i = (int)((d[h] - a) / b);

  int j = h;
  int k = h;

  for (int l = i + 1; l < f; l++) {
    if (e[l] != -1) {
      k = e[l];
      break;
    }
  }

  for (int l = i - 1; l >= 0; l--) {
    if (e[l] != -1) {
      j = e[l];
      break;
    }
  }

  g[h].left = j;
  g[h].right = k;
}