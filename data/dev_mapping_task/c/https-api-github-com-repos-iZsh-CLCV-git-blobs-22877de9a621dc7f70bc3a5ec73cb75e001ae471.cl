void A(local int* a, global const int* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j) {
  const int k = e * f;

  for (int l = i; l < k; l += j) {
    const int m = l / f;
    const int n = m + g;
    const int o = l - m * f + h;

    if (n < 0 || n >= c || o < 0 || o >= d)
      a[l] = -1;
    else {
      const int p = mad24(n, d, o);
      a[l] = b[p] * 2 - 1;
    }
  }
}

void B(local int* a, global const int* b, const int c, const int d, const int e) {
  for (int f = d; f < c; f += e)
    a[f] = b[f];
}

void C(local int* a, const int b, const int c, const int d, const int e) {
  for (int f = d; f < c; f += e)
    a[f] = b;
}

void D(global const int* a, global const int* b, local int* c, local int* d, const int e, const int f, const int g, const int h, const int i, const int j, const int k, const int l, const int m) {
  B(d, b, m, e, f);

  A(c, a, g, h, i, j, k, l, e, f);

  barrier(1);
}

kernel void E(global const int* a, global int* b, const int c, const int d, const int e, const int f, const int g) {
  const int h = get_global_id(0);
  const int i = get_global_id(1);
  const int j = mad24(i, d, h);
  b[j] = ((a[j] >= e) ? (g) : (f));
}

kernel void F(global const int* a, global int* b, const int c, const int d, global int* e, const int f, const int g, const int h, const int i, local int* j, local int* k) {
  const int l = get_global_id(0);
  const int m = get_global_id(1);
  const int n = get_local_id(0);
  const int o = get_local_id(1);
  const int p = get_local_size(0);
  const int q = get_local_size(1);
  const int r = get_group_id(0) * p;
  const int s = get_group_id(1) * q;

  const int t = mad24(o, p, n);
  const int u = p * q;

  const int v = h * 2 + h;

  const int w = q + f * 2;
  const int x = p + g * 2;

  const int y = mad24(x, o + f, n + g);
  const int z = mad24(m, d, l);

  D(a, e, k, j, t, u, c, d, w, x, s - f, r - g, v);

  int aa = 0;
  for (int ab = 0; ab < (h * 2 + h); ab += 3) {
    const int ac = j[ab];
    const int ad = j[ab + 1];
    const int ae = j[ab + 2];
    const int af = mad24(x, ac, y + ad);
    const int ag = k[af];
    aa = mad24(ag, ae, aa);
  }
  b[z] = ((aa >= i) ? (1) : (0));
}
kernel void G(global const int* a, global int* b, const int c, const int d, const int e, local int* f) {
  const int g = get_local_id(0);
  const int h = get_local_size(0);

  {
    const int i = (get_group_id(0) << 5) * h + g;
    f[g + 0 * h] = a[i + 0 * h];
    f[g + 1 * h] = a[i + 1 * h];
    f[g + 2 * h] = a[i + 2 * h];
    f[g + 3 * h] = a[i + 3 * h];
    f[g + 4 * h] = a[i + 4 * h];
    f[g + 5 * h] = a[i + 5 * h];
    f[g + 6 * h] = a[i + 6 * h];
    f[g + 7 * h] = a[i + 7 * h];
    f[g + 8 * h] = a[i + 8 * h];
    f[g + 9 * h] = a[i + 9 * h];
    f[g + 10 * h] = a[i + 10 * h];
    f[g + 11 * h] = a[i + 11 * h];
    f[g + 12 * h] = a[i + 12 * h];
    f[g + 13 * h] = a[i + 13 * h];
    f[g + 14 * h] = a[i + 14 * h];
    f[g + 15 * h] = a[i + 15 * h];
    f[g + 16 * h] = a[i + 16 * h];
    f[g + 17 * h] = a[i + 17 * h];
    f[g + 18 * h] = a[i + 18 * h];
    f[g + 19 * h] = a[i + 19 * h];
    f[g + 20 * h] = a[i + 20 * h];
    f[g + 21 * h] = a[i + 21 * h];
    f[g + 22 * h] = a[i + 22 * h];
    f[g + 23 * h] = a[i + 23 * h];
    f[g + 24 * h] = a[i + 24 * h];
    f[g + 25 * h] = a[i + 25 * h];
    f[g + 26 * h] = a[i + 26 * h];
    f[g + 27 * h] = a[i + 27 * h];
    f[g + 28 * h] = a[i + 28 * h];
    f[g + 29 * h] = a[i + 29 * h];
    f[g + 30 * h] = a[i + 30 * h];
    f[g + 31 * h] = a[i + 31 * h];
  }

  {
    const int j = get_global_id(0);
    const int k = g << 5;
    b[j] = ((f[k + 0] >= c) ? (e) : (d)) << 31 | ((f[k + 1] >= c) ? (e) : (d)) << 30 | ((f[k + 2] >= c) ? (e) : (d)) << 29 | ((f[k + 3] >= c) ? (e) : (d)) << 28 | ((f[k + 4] >= c) ? (e) : (d)) << 27 | ((f[k + 5] >= c) ? (e) : (d)) << 26 | ((f[k + 6] >= c) ? (e) : (d)) << 25 | ((f[k + 7] >= c) ? (e) : (d)) << 24 | ((f[k + 8] >= c) ? (e) : (d)) << 23 | ((f[k + 9] >= c) ? (e) : (d)) << 22 | ((f[k + 10] >= c) ? (e) : (d)) << 21 | ((f[k + 11] >= c) ? (e) : (d)) << 20 |
           ((f[k + 12] >= c) ? (e) : (d)) << 19 | ((f[k + 13] >= c) ? (e) : (d)) << 18 | ((f[k + 14] >= c) ? (e) : (d)) << 17 | ((f[k + 15] >= c) ? (e) : (d)) << 16 | ((f[k + 16] >= c) ? (e) : (d)) << 15 | ((f[k + 17] >= c) ? (e) : (d)) << 14 | ((f[k + 18] >= c) ? (e) : (d)) << 13 | ((f[k + 19] >= c) ? (e) : (d)) << 12 | ((f[k + 20] >= c) ? (e) : (d)) << 11 | ((f[k + 21] >= c) ? (e) : (d)) << 10 | ((f[k + 22] >= c) ? (e) : (d)) << 9 | ((f[k + 23] >= c) ? (e) : (d)) << 8 |
           ((f[k + 24] >= c) ? (e) : (d)) << 7 | ((f[k + 25] >= c) ? (e) : (d)) << 6 | ((f[k + 26] >= c) ? (e) : (d)) << 5 | ((f[k + 27] >= c) ? (e) : (d)) << 4 | ((f[k + 28] >= c) ? (e) : (d)) << 3 | ((f[k + 29] >= c) ? (e) : (d)) << 2 | ((f[k + 30] >= c) ? (e) : (d)) << 1 | ((f[k + 31] >= c) ? (e) : (d)) << 0;
  }
}

kernel void H(global const int* a, global int* b, local int* c) {
  const int d = get_local_id(0);
  const int e = get_local_size(0);

  {
    const int f = get_global_id(0);
    const int g = d << 5;
    c[g + 0] = (a[f] >> 31) & 1;
    c[g + 1] = (a[f] >> 30) & 1;
    c[g + 2] = (a[f] >> 29) & 1;
    c[g + 3] = (a[f] >> 28) & 1;
    c[g + 4] = (a[f] >> 27) & 1;
    c[g + 5] = (a[f] >> 26) & 1;
    c[g + 6] = (a[f] >> 25) & 1;
    c[g + 7] = (a[f] >> 24) & 1;
    c[g + 8] = (a[f] >> 23) & 1;
    c[g + 9] = (a[f] >> 22) & 1;
    c[g + 10] = (a[f] >> 21) & 1;
    c[g + 11] = (a[f] >> 20) & 1;
    c[g + 12] = (a[f] >> 19) & 1;
    c[g + 13] = (a[f] >> 18) & 1;
    c[g + 14] = (a[f] >> 17) & 1;
    c[g + 15] = (a[f] >> 16) & 1;
    c[g + 16] = (a[f] >> 15) & 1;
    c[g + 17] = (a[f] >> 14) & 1;
    c[g + 18] = (a[f] >> 13) & 1;
    c[g + 19] = (a[f] >> 12) & 1;
    c[g + 20] = (a[f] >> 11) & 1;
    c[g + 21] = (a[f] >> 10) & 1;
    c[g + 22] = (a[f] >> 9) & 1;
    c[g + 23] = (a[f] >> 8) & 1;
    c[g + 24] = (a[f] >> 7) & 1;
    c[g + 25] = (a[f] >> 6) & 1;
    c[g + 26] = (a[f] >> 5) & 1;
    c[g + 27] = (a[f] >> 4) & 1;
    c[g + 28] = (a[f] >> 3) & 1;
    c[g + 29] = (a[f] >> 2) & 1;
    c[g + 30] = (a[f] >> 1) & 1;
    c[g + 31] = (a[f] >> 0) & 1;
  }

  {
    const int h = (get_group_id(0) << 5) * e + d;
    b[h + 0 * e] = c[d + 0 * e];
    b[h + 1 * e] = c[d + 1 * e];
    b[h + 2 * e] = c[d + 2 * e];
    b[h + 3 * e] = c[d + 3 * e];
    b[h + 4 * e] = c[d + 4 * e];
    b[h + 5 * e] = c[d + 5 * e];
    b[h + 6 * e] = c[d + 6 * e];
    b[h + 7 * e] = c[d + 7 * e];
    b[h + 8 * e] = c[d + 8 * e];
    b[h + 9 * e] = c[d + 9 * e];
    b[h + 10 * e] = c[d + 10 * e];
    b[h + 11 * e] = c[d + 11 * e];
    b[h + 12 * e] = c[d + 12 * e];
    b[h + 13 * e] = c[d + 13 * e];
    b[h + 14 * e] = c[d + 14 * e];
    b[h + 15 * e] = c[d + 15 * e];
    b[h + 16 * e] = c[d + 16 * e];
    b[h + 17 * e] = c[d + 17 * e];
    b[h + 18 * e] = c[d + 18 * e];
    b[h + 19 * e] = c[d + 19 * e];
    b[h + 20 * e] = c[d + 20 * e];
    b[h + 21 * e] = c[d + 21 * e];
    b[h + 22 * e] = c[d + 22 * e];
    b[h + 23 * e] = c[d + 23 * e];
    b[h + 24 * e] = c[d + 24 * e];
    b[h + 25 * e] = c[d + 25 * e];
    b[h + 26 * e] = c[d + 26 * e];
    b[h + 27 * e] = c[d + 27 * e];
    b[h + 28 * e] = c[d + 28 * e];
    b[h + 29 * e] = c[d + 29 * e];
    b[h + 30 * e] = c[d + 30 * e];
    b[h + 31 * e] = c[d + 31 * e];
  }
}

void I(local int* a, global const int* b, const int c, const int d, const int e, const int f, const int g, const int h, const int i, const int j) {
  const int k = e * f;

  for (int l = i; l < k; l += j) {
    const int m = l / f;
    const int n = m + g;
    const int o = l - m * f + h;

    if (n < 0 || n >= c || o < 0 || o >= d)
      a[l] = 0;
    else {
      const int p = mad24(n, d, o);
      a[l] = b[p];
    }
  }
}

kernel void J(global const int* a, global int* b, const int c, const int d, const int e, local uint* f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_local_id(0);
  const int j = get_local_id(1);
  const int k = get_local_size(0);
  const int l = get_local_size(1);
  const int m = d >> 5;

  const int n = get_group_id(0) * k;
  const int o = get_group_id(1) * l;

  const int p = mad24(j, k, i);
  const int q = k * l;

  const int r = l;
  const int s = k + 2;

  const int t = s * j + i + 1;
  const int u = mad24(h, m, g);

  const int v = r * s;

  for (int w = p; w < v; w += q) {
    const int x = w / s;
    const int y = x + o;
    const int z = w - x * s + n - 1;

    if (y < 0 || y >= c || z < 0 || z >= m) {
      f[w] = 0;
    } else {
      const int aa = mad24(y, m, z);
      f[w] = a[aa];
    }
  }
  barrier(1);

  if (g >= m || h >= c)
    return;

  {
    int ab = f[t];
    for (int w = 1; w <= e; ++w) {
      ab |= (f[t] >> w) | (f[t - 1] << (32 - w)) | (f[t] << w) | (f[t + 1] >> (32 - w));
    }
    b[u] = ab;
  }
}

kernel void K(global const int* a, global int* b, const int c, const int d, const int e, local uint* f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_local_id(0);
  const int j = get_local_id(1);
  const int k = get_local_size(0);
  const int l = get_local_size(1);
  const int m = d >> 5;

  const int n = get_group_id(0) * k;
  const int o = get_group_id(1) * l;

  const int p = mad24(j, k, i);
  const int q = k * l;

  const int r = l + e * 2;
  const int s = k;

  const int t = s * (j + e) + i;
  const int u = mad24(h, m, g);

  const int v = r * s;

  for (int w = p; w < v; w += q) {
    const int x = w / s;
    const int y = x + o - e;
    const int z = w - x * s + n;

    if (y < 0 || y >= c || z < 0 || z >= m) {
      f[w] = 0;
    } else {
      const int aa = mad24(y, m, z);
      f[w] = a[aa];
    }
  }
  barrier(1);

  if (g >= m || h >= c)
    return;

  {
    int ab = mad24(s, -e, t);
    int ac = f[t];
    for (int ad = -e; ad <= e; ++ad) {
      ac |= f[ab];
      ab += s;
    }

    b[u] = ac;
  }
}

kernel void L(global const int* a, global int* b, const int c, const int d, const int e, local uint* f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_local_id(0);
  const int j = get_local_id(1);
  const int k = get_local_size(0);
  const int l = get_local_size(1);
  const int m = d >> 5;

  const int n = get_group_id(0) * k;
  const int o = get_group_id(1) * l;

  const int p = mad24(j, k, i);
  const int q = k * l;

  const int r = l;
  const int s = k + 2;

  const int t = s * j + i + 1;
  const int u = mad24(h, m, g);

  const int v = r * s;

  for (int w = p; w < v; w += q) {
    const int x = w / s;
    const int y = x + o;
    const int z = w - x * s + n - 1;

    if (y < 0 || y >= c || z < 0 || z >= m) {
      f[w] = 0;
    } else {
      const int aa = mad24(y, m, z);
      f[w] = a[aa];
    }
  }
  barrier(1);

  if (g >= m || h >= c)
    return;

  {
    int ab = f[t];
    for (int w = 1; w <= e; ++w) {
      ab &= ((f[t] >> w) | (f[t - 1] << (32 - w))) & ((f[t] << w) | (f[t + 1] >> (32 - w)));
    }
    b[u] = ab;
  }
}

kernel void M(global const int* a, global int* b, const int c, const int d, const int e, local uint* f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  const int i = get_local_id(0);
  const int j = get_local_id(1);
  const int k = get_local_size(0);
  const int l = get_local_size(1);
  const int m = d >> 5;

  const int n = get_group_id(0) * k;
  const int o = get_group_id(1) * l;

  const int p = mad24(j, k, i);
  const int q = k * l;

  const int r = l + e * 2;
  const int s = k;

  const int t = s * (j + e) + i;
  const int u = mad24(h, m, g);

  const int v = r * s;

  for (int w = p; w < v; w += q) {
    const int x = w / s;
    const int y = x + o - e;
    const int z = w - x * s + n;

    if (y < 0 || y >= c || z < 0 || z >= m) {
      f[w] = 0;
    } else {
      const int aa = mad24(y, m, z);
      f[w] = a[aa];
    }
  }
  barrier(1);

  if (g >= m || h >= c)
    return;

  {
    int ab = mad24(s, -e, t);
    int ac = f[t];
    for (int ad = -e; ad <= e; ++ad) {
      ac &= f[ab];
      ab += s;
    }

    b[u] = ac;
  }
}