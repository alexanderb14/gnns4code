typedef float2 magmaFloatComplex; __kernel void A(__global magmaFloatComplex* a, int b, int c, __global magmaFloatComplex* d, int e, int f, int g, int h, int i, int j) {
  __local magmaFloatComplex k[32][32 + 1];

  int l = get_local_id(0);
  int m = get_local_id(1);
  int n = get_group_id(0) * 32;
  int o = get_group_id(1) * 32;

  d += e;
  a += b;

  d += n + l + ((o + m) * (f));
  a += o + l + ((n + m) * (c));

  int p = o + m;
  if (n + l < g) {
    if (p < i) {
      k[m + 0][l] = d[0 * f];
      if (p + 8 < i) {
        k[m + 8][l] = d[8 * f];
        if (p + 16 < i) {
          k[m + 16][l] = d[16 * f];
          if (p + 24 < i)
            k[m + 24][l] = d[24 * f];
        }
      }
    }
  }

  barrier(1);

  if (o + l < i) {
    if (n + m < g) {
      a[0 * c] = k[l][m + 0];
      if (n + m + 8 < g) {
        a[8 * c] = k[l][m + 8];
        if (n + m + 16 < g) {
          a[16 * c] = k[l][m + 16];
          if (n + m + 24 < g)
            a[24 * c] = k[l][m + 24];
        }
      }
    }
  }
}

__kernel void B(__global magmaFloatComplex* a, int b, int c, __global magmaFloatComplex* d, int e, int f, int g, int h, int i, int j) {
  __local magmaFloatComplex k[32][32 + 1];

  int l = get_local_id(0);
  int m = get_local_id(1);
  int n = get_group_id(0) * 32;
  int o = get_group_id(1) * 32;

  int p, q;
  if (n + 32 < g)
    p = 0;
  else
    p = h;

  if (o + 32 < i)
    q = 0;
  else
    q = j;

  d += e;
  a += b;

  d += n + l - p + ((o + m - q) * (f));
  a += o + l - q + ((n + m - p) * (c));

  k[m + 0][l] = d[0 * f];
  k[m + 8][l] = d[8 * f];
  k[m + 16][l] = d[16 * f];
  k[m + 24][l] = d[24 * f];

  barrier(1);

  a[0 * c] = k[l][m + 0];
  a[8 * c] = k[l][m + 8];
  a[16 * c] = k[l][m + 16];
  a[24 * c] = k[l][m + 24];
}