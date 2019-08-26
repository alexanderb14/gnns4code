inline void A(__local int* a, int b) {
  int c = get_local_id(0);
  int d = (c * 2) + 1;

  int e = 1 + (int)log2((float)b);
  for (int f = 0; f < e; f++) {
    barrier(1);
    int g = (0x1 << f) - 1;
    if ((c & g) == g) {
      int h = (0x1 << f);
      int i = d - h;
      a[d] += a[i];
    }
  }
}

inline void B(__local int* a, int b) {
  int c = get_local_id(0);
  int d = (c * 2) + 1;

  int e = (int)log2((float)b);
  for (int f = e; f > -1; f--) {
    barrier(1);
    int g = (0x1 << f) - 1;
    if ((c & g) == g) {
      int h = (0x1 << f);
      int i = d - h;
      int j = a[i];
      a[i] = a[d];
      a[d] += j;
    }
  }
}

inline void C(__local int* a, int b) {
  int c = get_local_id(0);
  int d = (c * 2) + 1;
  A(a, b);
  if (d == (b - 1)) {
    a[d] = 0;
  }
  B(a, b);
}
__kernel void D(__global int* a, __local int* b, int c) {
  int d = get_global_id(0);
  int e = (d * 2);
  int f = (d * 2) + 1;

  b[e] = a[e];
  b[f] = a[f];

  C(b, c);

  a[e] = b[e];
  a[f] = b[f];
}

__kernel void E(__global int* a, __local int* b, int c) {
  int d = get_global_id(0);
  int e = (d * 2);
  int f = (d * 2) + 1;
  int g = 2 * get_local_size(0);

  b[e] = e < c ? a[e] : 0;
  b[f] = f < c ? a[f] : 0;

  A(b, g);
  if (f == (g - 1)) {
    b[f] = 0;
  }
  B(b, g);

  if (e < c)
    a[e] = b[e];
  if (f < c)
    a[f] = b[f];
}
__kernel void F(__global int* a, __local int* b, __global int* c, int d

                ) {
  int e = get_local_size(0);

  int f = get_global_id(0);
  int g = (2 * f);
  int h = (2 * f) + 1;

  int i = get_local_id(0);
  int j = (2 * i);
  int k = (2 * i) + 1;
  int l = get_group_id(0);

  int m = e * 2;
  int n = get_num_groups(0);

  b[j] = (g < d) ? a[g] : 0;
  b[k] = (h < d) ? a[h] : 0;

  A(b, m);

  if (i == (e - 1)) {
    c[l] = b[k];
    b[k] = 0;
  }

  B(b, m);

  if (g < d) {
    a[g] = b[j];
  }
  if (h < d) {
    a[h] = b[k];
  }
}
__kernel void G(__global int* a, __local int* b, __global int* c, int d

                ) {
  int e = get_global_id(0);
  int f = (2 * e);
  int g = (2 * e) + 1;

  int h = get_local_id(0);
  int i = (2 * h);
  int j = (2 * h) + 1;
  int k = get_group_id(0);

  b[i] = (f < d) ? a[f] : 0;
  b[j] = (g < d) ? a[g] : 0;

  b[i] += c[k];
  b[j] += c[k];

  if (f < d) {
    a[f] = b[i];
  }
  if (g < d) {
    a[g] = b[j];
  }
}