void A(int* a, int* b, int* c) {
  int d;
  if (*a > *b) {
    d = *a;
    *a = *b;
    *b = d;
  }
  if (*a > *c) {
    d = *a;
    *a = *c;
    *c = d;
  }
  if (*b > *c) {
    d = *b;
    *b = *c;
    *c = d;
  }
}

__kernel void B(__global float* a, __global float* b, __global int* c, __global int* d) {
  int e = *c;
  int f = *d;
  int g = get_global_id(1);
  int h = get_global_id(0);
  int i = e * h + g;

  if (g == 0 || h == 0 || g == e - 1 || h == f - 1) {
    b[i] = a[i];
  } else {
    int j, k, l, m, n, o, p, q, r;
    j = a[i - 1 - e];
    k = a[i - e];
    l = a[i + 1 - e];
    m = a[i - 1];
    n = a[i];
    o = a[i + 1];
    p = a[i - 1 + e];
    q = a[i + e];
    r = a[i + 1 + e];

    A(&(j), &(k), &(l));
    A(&(m), &(n), &(o));
    A(&(p), &(q), &(r));

    A(&(j), &(m), &(p));
    A(&(k), &(n), &(q));
    A(&(l), &(o), &(r));

    A(&(j), &(n), &(r));

    b[i] = n;
  }
}