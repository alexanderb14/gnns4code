__kernel void A(__global int* a, int b, int c, int d, int e) {
  int f = (get_global_id(0) << d) + c;
  int g = f + e;

  if (g < b)
    a[g] += a[f];
}

__kernel void B(__global float* a, __global int* b, float c) {
  int d = (get_global_id(0) << 1);
  int e = d + 1;
  int f = a[d] <= c ? 1 : 0;
  int g = a[e] <= c ? 1 : 0;

  b[d] = f;
  b[e] = f + g;
}

__kernel void C(__global int* a, __global float* b, __global float* c, int d) {
  int e = get_global_id(0);

  if (e == 0) {
    if (a[0] == 1)
      c[0] = b[0];
    else
      c[d - 1] = b[0];
  } else if (e > 0) {
    if (a[e] > a[e - 1])
      c[a[e] - 1] = b[e];
    else
      c[d - 1 - (e - a[e])] = b[e];
  }
}

__kernel void D(__global float* a, int b, int c) {
  int d = get_global_id(0);

  int e = d;
  int f = d + (1 << c);

  int g = e % (1 << (b + 2));
  int h = f % (1 << (b + 2));
  int i = (1 << (b + 1));

  int j = e % (1 << (c + 2));
  int k = f % (1 << (c + 2));
  int l = (1 << (c + 1));

  if (g < i && h < i) {
    if ((j < l && k < l) || (j >= l && k >= l)) {
      float m = a[e], n = a[f];
      if (m > n)
        a[e] = n, a[f] = m;
    }
  } else if (g >= i && h >= i) {
    if ((j < l && k < l) || (j >= l && k >= l)) {
      float m = a[e], n = a[f];
      if (m < n)
        a[e] = n, a[f] = m;
    }
  }
}