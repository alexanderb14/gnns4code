typedef int INT_TYPE; double A(double* a, double* b, double c, double d, double e, double f) {
  double g, h, i, j;
  double k;
  double l;
  double m;
  double n;
  double o;
  int p;

  g = c * *b;
  p = g;
  k = p;
  l = *b - e * k;

  g = c * *a;
  p = g;
  m = p;
  n = *a - e * m;
  g = k * n + l * m;

  p = c * g;
  h = p;
  o = g - e * h;
  i = e * o + l * n;
  p = d * i;
  j = p;
  *a = i - f * j;
  return (d * *a);
}
double B(int a, int b, long c, double d, double e, double f, double g, double h, double i) {
  double j, k;
  long l, m, n, o;

  if (a == 0)
    return d;

  l = (c / 4 + b - 1) / b;
  m = l * 4 * a;

  j = d;
  k = e;
  n = m;
  while (n > 1) {
    o = n / 2;
    if (2 * o == n) {
      (void)A(&k, &k, f, g, h, i);
      n = o;
    } else {
      (void)A(&j, &k, f, g, h, i);
      n = n - 1;
    }
  }
  (void)A(&j, &k, f, g, h, i);

  return (j);
}

__kernel void C(__global INT_TYPE* a, double b, double c) {
  double d, e;
  INT_TYPE f, g;

  INT_TYPE h, i;
  double j = c;
  int k, l;
  INT_TYPE m;

  double n, o, p, q;
  n = 1.0;
  o = 1.0;
  p = 1.0;
  q = 1.0;

  for (f = 1; f <= 23; f++) {
    n = 0.50 * n;
    p = 2.0 * p;
  }
  for (f = 1; f <= 46; f++) {
    o = 0.50 * o;
    q = 2.0 * q;
  }

  k = get_global_id(0);
  l = get_global_size(0);

  m = ((1 << 23) + l - 1) / l;
  h = m * k;
  i = h + m;
  if (i > (1 << 23))
    i = (1 << 23);

  e = B(k, l, (long)4 * (1 << 23), b, j, n, o, p, q);

  g = (1 << 19) / 4;

  for (f = h; f < i; f++) {
    d = A(&e, &j, n, o, p, q);
    d += A(&e, &j, n, o, p, q);
    d += A(&e, &j, n, o, p, q);
    d += A(&e, &j, n, o, p, q);

    a[f] = g * d;
  }
}

__kernel void D(__global INT_TYPE* a, __global INT_TYPE* b, __global const INT_TYPE* c, int d) {
  int e;

  a[d] = d;
  a[d + 10] = (1 << 19) - d;

  for (e = 0; e < 5; e++)
    b[e] = a[c[e]];
}

__kernel void E(__global INT_TYPE* a, __global INT_TYPE* b) {
  int c = 19 - 9;

  INT_TYPE d, e, f, g;

  int h = get_global_id(0);
  int i = get_global_size(0);

  __global INT_TYPE* j = &b[h * (1 << 9)];

  for (d = 0; d < (1 << 9); d++)
    j[d] = 0;

  g = ((1 << 23) + i - 1) / i;
  e = g * h;
  f = e + g;
  if (f > (1 << 23))
    f = (1 << 23);
  for (d = e; d < f; d++)
    j[a[d] >> c]++;
}

__kernel void F(__global INT_TYPE* a, __global INT_TYPE* b, __global INT_TYPE* c, __global INT_TYPE* d) {
  int e = 19 - 9;

  INT_TYPE f, g, h, i, j;

  int k = get_global_id(0);
  int l = get_global_size(0);

  __global INT_TYPE* m = &c[k * (1 << 9)];

  m[0] = 0;
  for (g = 0; g < k; g++)
    m[0] += b[g * (1 << 9) + 0];

  for (f = 1; f < (1 << 9); f++) {
    m[f] = m[f - 1];
    for (g = 0; g < k; g++)
      m[f] += b[g * (1 << 9) + f];
    for (g = k; g < l; g++)
      m[f] += b[g * (1 << 9) + f - 1];
  }

  j = ((1 << 23) + l - 1) / l;
  h = j * k;
  i = h + j;
  if (i > (1 << 23))
    i = (1 << 23);
  for (f = h; f < i; f++) {
    g = a[f];
    d[m[g >> e]++] = g;
  }
}

__kernel void G(__global INT_TYPE* a, __global INT_TYPE* b, __global INT_TYPE* c, __global const INT_TYPE* d) {
  int e = 19 - 9;
  INT_TYPE f = (1L << e);

  INT_TYPE g, h, i, j, k, l, m, n;

  int o = get_global_id(0);
  int p = get_global_size(0);

  __global INT_TYPE* q = &b[o * (1 << 9)];

  if (o < p - 1) {
    for (g = 0; g < (1 << 9); g++)
      for (j = o + 1; j < p; j++)
        q[g] += a[j * (1 << 9) + g];
  }

  n = ((1 << 9) + p - 1) / p;
  h = n * o;
  i = h + n;
  if (i > (1 << 9))
    i = (1 << 9);
  for (g = h; g < i; g++) {
    k = g * f;
    l = k + f;
    for (j = k; j < l; j++)
      c[j] = 0;

    m = (g > 0) ? q[g - 1] : 0;
    for (j = m; j < q[g]; j++)
      c[d[j]]++;

    c[k] += m;
    for (j = k + 1; j < l; j++)
      c[j] += c[j - 1];
  }
}

__kernel void H(__global INT_TYPE* a, __global INT_TYPE* b, __global const INT_TYPE* c, __global int* d, int e) {
  int f, g;
  int h = 0;

  for (f = 0; f < 5; f++) {
    g = a[f];
    if (0 < g && g <= (1 << 23) - 1) {
      INT_TYPE i = b[g - 1];
      int j = 0;

      switch ('A') {
        case 'S': {
          if (f <= 2) {
            if (i != c[f] + e)
              j = 1;
            else
              h++;
          } else {
            if (i != c[f] - e)
              j = 1;
            else
              h++;
          }
          break;
        }
        case 'W':
          if (f < 2) {
            if (i != c[f] + (e - 2))
              j = 1;
            else
              h++;
          } else {
            if (i != c[f] - e)
              j = 1;
            else
              h++;
          }
          break;
        case 'A':
          if (f <= 2) {
            if (i != c[f] + (e - 1))
              j = 1;
            else
              h++;
          } else {
            if (i != c[f] - (e - 1))
              j = 1;
            else
              h++;
          }
          break;
        case 'B':
          if (f == 1 || f == 2 || f == 4) {
            if (i != c[f] + e)
              j = 1;
            else
              h++;
          } else {
            if (i != c[f] - e)
              j = 1;
            else
              h++;
          }
          break;
        case 'C':
          if (f <= 2) {
            if (i != c[f] + e)
              j = 1;
            else
              h++;
          } else {
            if (i != c[f] - e)
              j = 1;
            else
              h++;
          }
          break;
        case 'D':
          if (f < 2) {
            if (i != c[f] + e)
              j = 1;
            else
              h++;
          } else {
            if (i != c[f] - e)
              j = 1;
            else
              h++;
          }
          break;
      }
      if (j == 1) {
      }
    }
  }

  *d += h;
}

__kernel void I(__global INT_TYPE* a, __global INT_TYPE* b, __global INT_TYPE* c, __global INT_TYPE* d) {
  INT_TYPE e, f, g, h, i;
  INT_TYPE j, k;

  int l = get_global_id(0);
  int m = get_global_size(0);

  __global INT_TYPE* n = &a[l * (1 << 9)];

  i = ((1 << 9) + m - 1) / m;
  g = i * l;
  h = g + i;
  if (h > (1 << 9))
    h = (1 << 9);

  for (f = g; f < h; f++) {
    k = (f > 0) ? n[f - 1] : 0;
    for (e = k; e < n[f]; e++) {
      j = --c[b[e]];
      d[j] = b[e];
    }
  }
}

__kernel void J(__global INT_TYPE* a, __global INT_TYPE* b, __local INT_TYPE* c) {
  INT_TYPE d, e, f, g, h;

  int i = get_global_id(0);
  int j = get_global_size(0);

  h = ((1 << 23) - 1 + j - 1) / j;
  f = h * i;
  g = f + h;
  if (f == 0)
    f = 1;
  if (g > (1 << 23))
    g = (1 << 23);

  e = 0;
  for (d = f; d < g; d++)
    if (a[d - 1] > a[d])
      e++;

  int k = get_local_id(0);
  c[k] = e;

  barrier(1);

  if (k == 0) {
    int l = get_group_id(0);

    b[l] = c[0];
    for (d = 1; d < get_local_size(0); d++) {
      b[l] += c[d];
    }
  }
}