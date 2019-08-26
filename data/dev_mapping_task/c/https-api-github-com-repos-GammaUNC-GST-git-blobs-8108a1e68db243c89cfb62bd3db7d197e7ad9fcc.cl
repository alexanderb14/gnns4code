__kernel void A(const __global uchar* a, const __constant uint* b, const uint c, const uint d, __global int* e) {
  const __global uchar* const f = a + b[4 * get_global_id(1) + 3];

  __global int* const g = e + d * get_global_id(1);
  __local int h[128];

  const uint i = (1 << (c * 7));
  const uint j = i * (get_global_id(0) + 1) - 1;
  const uint k = i * get_global_id(0) - 1;

  if (0 == c) {
    h[get_local_id(0)] = (int)(f[get_global_id(0)]) - 128;
  } else if (j < d) {
    h[get_local_id(0)] = g[j];
  } else if (k < d) {
    h[get_local_id(0)] = g[d - 1];
  } else {
    h[get_local_id(0)] = 0;
  }

  const int l = get_local_id(0);
  uint m = 1;
  for (int n = (128 >> 1); n > 0; n = n >> 1) {
    barrier(1);
    if (l < n) {
      const uint o = m * (2 * l + 1) - 1;
      const uint p = m * (2 * l + 2) - 1;
      h[p] += h[o];
    }

    m *= 2;
  }

  m >>= 1;
  for (int q = 2; q < 128; q *= 2) {
    barrier(1);
    m >>= 1;
    if (m > 0 && 0 < l && l < q) {
      uint o = m * (2 * l) - 1;
      uint p = m * (2 * l + 1) - 1;
      h[p] += h[o];
    }
  }

  barrier(1);
  if (0 == c || j < d) {
    g[j] = h[get_local_id(0)];
  } else if (k < d && j >= d) {
    g[d - 1] = h[get_local_id(0)];
  }
}

__kernel void B(const int a, const uint b, __global int* c) {
  __global int* const d = c + b * get_global_id(1);

  uint e = 1 << (a * 7);
  uint f = e * get_group_id(0) - 1;

  uint g = 1 << ((a - 1) * 7);
  uint h = g * (get_global_id(0) + 1) - 1;

  bool i = h < (b - 1);
  i = i && f < (b - 1);
  i = i && get_group_id(0) > 0;
  i = i && get_local_id(0) != (128 - 1);
  if (i) {
    d[h] += d[f];
  }
}