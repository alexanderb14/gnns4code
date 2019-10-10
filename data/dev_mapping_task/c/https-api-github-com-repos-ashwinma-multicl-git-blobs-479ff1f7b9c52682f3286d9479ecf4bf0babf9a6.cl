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

__kernel void E(__global INT_TYPE* a) {
  int b = get_global_id(0);
  a[b] = 0;
}

__kernel void F(__global INT_TYPE* a, __global INT_TYPE* b) {
  int c = get_global_id(0);

  INT_TYPE d = b[c];
  atom_inc(&a[d]);
}
__kernel void G(__global INT_TYPE* a, __global INT_TYPE* b, __global INT_TYPE* c, __local INT_TYPE* d) {
  INT_TYPE e = get_local_id(0);
  INT_TYPE f = get_local_size(0);

  d[e] = 0;
  int g = f + e;

  INT_TYPE h = (1 << 19) / get_num_groups(0);
  INT_TYPE i = h * get_group_id(0);
  INT_TYPE j = i + h;

  for (INT_TYPE k = i; k < j; k += f) {
    d[g] = a[k + e];

    for (uint l = 1; l < f; l <<= 1) {
      barrier(1);

      INT_TYPE m = d[g] + d[g - l];

      barrier(1);

      d[g] = m;
    }

    INT_TYPE n = (k == i) ? 0 : b[k - 1];
    b[k + e] = d[g] + n;
  }

  barrier(2);
  if (e == 0)
    c[get_group_id(0)] = b[j - 1];
}

__kernel void H(__global INT_TYPE* a, __global INT_TYPE* b, __local INT_TYPE* c) {
  INT_TYPE d = get_local_id(0);
  INT_TYPE e = get_local_size(0);

  c[d] = 0;
  int f = e + d;
  c[f] = a[d];

  for (uint g = 1; g < e; g <<= 1) {
    barrier(1);

    INT_TYPE h = c[f] + c[f - g];

    barrier(1);

    c[f] = h;
  }

  barrier(1);

  b[d] = c[f - 1];
}

__kernel void I(__global INT_TYPE* a, __global INT_TYPE* b, __global INT_TYPE* c) {
  INT_TYPE d = get_local_id(0);
  INT_TYPE e = get_local_size(0);

  INT_TYPE f = (1 << 19) / get_num_groups(0);
  INT_TYPE g = f * get_group_id(0);
  INT_TYPE h = g + f;

  INT_TYPE i = c[get_group_id(0)];
  for (INT_TYPE j = g; j < h; j += e) {
    b[j + d] = a[j + d] + i;
  }
}

__kernel void J(__global INT_TYPE* a, __global INT_TYPE* b, __global const INT_TYPE* c, __global int* d, int e) {
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

__kernel void K(__global INT_TYPE* a, __global INT_TYPE* b) {
  INT_TYPE c = get_global_id(0);
  b[c] = a[c];
}

__kernel void L(__global INT_TYPE* a, __global INT_TYPE* b, __global INT_TYPE* c) {
  INT_TYPE d = get_global_id(0);

  INT_TYPE e = a[d];
  INT_TYPE f = atom_dec(&b[e]) - 1;
  c[f] = e;
}

__kernel void M(__global INT_TYPE* a, __global INT_TYPE* b, __local INT_TYPE* c) {
  INT_TYPE d = get_global_id(0) + 1;
  int e = get_local_id(0);

  if (d < (1 << 23)) {
    if (a[d - 1] > a[d])
      c[e] = 1;
    else
      c[e] = 0;
  } else {
    c[e] = 0;
  }

  barrier(1);

  for (d = get_local_size(0) / 2; d > 0; d >>= 1) {
    if (e < d) {
      c[e] += c[e + d];
    }
    barrier(1);
  }

  if (e == 0)
    b[get_group_id(0)] = c[0];
}