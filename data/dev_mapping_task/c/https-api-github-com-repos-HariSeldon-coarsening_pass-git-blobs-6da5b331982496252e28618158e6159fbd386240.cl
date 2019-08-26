__kernel void A(unsigned int a, __global unsigned int* b, unsigned int c, __global unsigned int* d, unsigned int e) {
  __local unsigned int f[(1024 + (1024 >> 4) + (1024 >> (2 * 4)))];

  __global unsigned int* g = b + c;
  __global unsigned int* h = d + e;

  unsigned int i = get_local_id(0);
  unsigned int j = get_group_id(0) * 2 * get_local_size(0) + get_local_id(0);
  unsigned int k = j + get_local_size(0);

  unsigned int l = i;
  unsigned int m = i + get_local_size(0);

  l += (((unsigned int)(l) >> min((unsigned int)(4) + (l), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
  m += (((unsigned int)(m) >> min((unsigned int)(4) + (m), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));

  f[l] = (j < a) ? g[j] : 0;
  f[m] = (k < a) ? g[k] : 0;

  unsigned int n = 1;
  for (unsigned int o = get_local_size(0); o > 0; o >>= 1) {
    barrier(1);

    if (i < o) {
      unsigned int p = 2 * n * i;
      unsigned int q = p + n - 1;
      unsigned int r = q + n;

      q += (((unsigned int)(q) >> min((unsigned int)(4) + (q), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
      r += (((unsigned int)(r) >> min((unsigned int)(4) + (r), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));

      f[r] += f[q];
    }

    n *= 2;
  }

  if (i == 0) {
    unsigned int s = get_local_size(0) * 2 - 1;
    s += (((unsigned int)(s) >> min((unsigned int)(4) + (s), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
    h[get_group_id(0)] = f[s];
    f[s] = 0;
  }

  for (unsigned int o = 1; o <= get_local_size(0); o *= 2) {
    n >>= 1;

    barrier(1);

    if (i < o) {
      unsigned int p = 2 * n * i;
      unsigned int q = p + n - 1;
      unsigned int r = q + n;

      q += (((unsigned int)(q) >> min((unsigned int)(4) + (q), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
      r += (((unsigned int)(r) >> min((unsigned int)(4) + (r), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));

      unsigned int t = f[q];
      f[q] = f[r];
      f[r] += t;
    }
  }

  barrier(1);

  if (j < a) {
    g[j] = f[l];
  }
  if (k < a) {
    g[k] = f[m];
  }
}

__kernel void B(__global unsigned int* a, unsigned int b) {
  __local unsigned int c[1024];

  unsigned int d = get_local_id(0);
  unsigned int e = get_global_id(0);
  unsigned int f = 2 * b * e;
  unsigned int g = f + b - 1;
  unsigned int h = g + b;

  unsigned int i = 2 * d;
  unsigned int j = 2 * d + 1;

  i += (((unsigned int)(i) >> min((unsigned int)(4) + (i), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
  j += (((unsigned int)(j) >> min((unsigned int)(4) + (j), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));

  c[i] = a[g];
  c[j] = a[h];

  unsigned int k = 1;
  for (unsigned int l = get_local_size(0); l > 0; l >>= 1) {
    barrier(1);

    if (d < l) {
      unsigned int m = 2 * k * d;
      unsigned int n = m + k - 1;
      unsigned int o = n + k;

      n += (((unsigned int)(n) >> min((unsigned int)(4) + (n), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
      o += (((unsigned int)(o) >> min((unsigned int)(4) + (o), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
      c[o] += c[n];
    }

    k *= 2;
  }

  barrier(1);

  a[g] = c[i];
  a[h] = c[j];
}

__kernel void C(__global unsigned int* a, unsigned int b) {
  __local unsigned int c[1024];

  unsigned int d = get_local_id(0);
  unsigned int e = get_global_id(0);
  unsigned int f = 2 * b * e;
  unsigned int g = f + b - 1;
  unsigned int h = g + b;

  unsigned int i = 2 * d;
  unsigned int j = 2 * d + 1;

  i += (((unsigned int)(i) >> min((unsigned int)(4) + (i), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
  j += (((unsigned int)(j) >> min((unsigned int)(4) + (j), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));

  c[i] = a[g];
  c[j] = a[h];

  unsigned int k = get_local_size(0) * 2;

  for (unsigned int l = 1; l <= get_local_size(0); l *= 2) {
    k >>= 1;

    barrier(1);

    if (d < l) {
      unsigned int m = 2 * k * d;
      unsigned int n = m + k - 1;
      unsigned int o = n + k;

      n += (((unsigned int)(n) >> min((unsigned int)(4) + (n), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));
      o += (((unsigned int)(o) >> min((unsigned int)(4) + (o), (unsigned int)(32 - (2 * 4)))) >> (2 * 4));

      unsigned int p = c[n];
      c[n] = c[o];
      c[o] += p;
    }
  }
  barrier(1);

  a[g] = c[i];
  a[h] = c[j];
}

__kernel void D(unsigned int a, __global unsigned int* b, unsigned int c, __global unsigned int* d, unsigned int e) {
  __local unsigned int f;

  __global unsigned int* g = b + c;
  __global unsigned int* h = d + e;

  if (get_local_id(0) == 0) {
    f = h[get_group_id(0)];
  }
  barrier(1);

  unsigned int i = get_group_id(0) * 2 * get_local_size(0) + get_local_id(0);
  unsigned int j = i + get_local_size(0);

  if (i < a) {
    g[i] += f;
  }
  if (j < a) {
    g[j] += f;
  }
}