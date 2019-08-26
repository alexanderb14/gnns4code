__kernel void A(__global int* a, __global int* b, __local int* c, const uint d) {
  int e = get_local_id(0);

  int f = 1;

  c[2 * e] = a[2 * e];
  c[2 * e + 1] = a[2 * e + 1];

  for (int g = d >> 1; g > 0; g >>= 1) {
    barrier(1);

    if (e < g) {
      int h = f * (2 * e + 1) - 1;
      int i = f * (2 * e + 2) - 1;

      c[i] += c[h];
    }
    f *= 2;
  }

  if (e == 0)
    c[d - 1] = 0;

  for (int g = 1; g < d; g *= 2) {
    f >>= 1;
    barrier(1);

    if (e < g) {
      int h = f * (2 * e + 1) - 1;
      int i = f * (2 * e + 2) - 1;

      float j = c[h];
      c[h] = c[i];
      c[i] += j;
    }
  }

  barrier(1);

  b[2 * e] = c[2 * e];
  b[2 * e + 1] = c[2 * e + 1];
}
__kernel void B(__global int* a,

                __local int* b,

                __global int* c, const uint d) {
  const uint e = get_global_id(0);
  const uint f = get_local_id(0);
  const uint g = get_group_id(0);
  const uint h = get_local_size(0);

  const uint i = h << 1;
  int j = 1;

  const int k = f << 1;
  const int l = k + 1;

  const int m = e << 1;
  const int n = m + 1;
  b[k] = (m < d) ? a[m] : 0;
  b[l] = (n < d) ? a[n] : 0;

  for (uint o = h; o > 0; o >>= 1) {
    barrier(1);

    if (f < o) {
      const uint p = mad24(j, (l + 0), -1);
      const uint q = mad24(j, (l + 1), -1);

      b[q] += b[p];
    }
    j <<= 1;
  }

  barrier(1);
  if (f < 1) {
    c[g] = b[i - 1];

    b[i - 1] = 0;
  }

  for (uint o = 1; o < i; o <<= 1) {
    j >>= 1;
    barrier(1);

    if (f < o) {
      const uint p = mad24(j, (l + 0), -1);
      const uint q = mad24(j, (l + 1), -1);

      int r = b[p];
      b[p] = b[q];
      b[q] += r;
    }
  }

  barrier(1);

  if (m < d)
    a[m] = b[k];
  if (n < d)
    a[n] = b[l];
}
__kernel void C(__global int* a, __global const int* b, const uint c) {
  uint d = get_global_id(0) * 2;
  const uint e = get_local_id(0);
  const uint f = get_group_id(0);

  __local int g[1];

  if (e < 1)
    g[0] = b[f];

  barrier(1);

  if (d < c)
    a[d] += g[0];
  d++;
  if (d < c)
    a[d] += g[0];
}