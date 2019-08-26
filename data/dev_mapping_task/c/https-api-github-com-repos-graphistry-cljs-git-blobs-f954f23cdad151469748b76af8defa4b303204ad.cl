inline int A(int a, int b) {
  return (a >= 0 && a < b);
}

inline int B(int a) {
  return (a % 4) == 3;
}

inline uchar C(int a) {
  if (a < 0) {
    a = 0;
  }
  if (a > 255) {
    a = 255;
  }
  return (uchar)a;
}

__kernel void D(__global uchar* a, __global int* b, int c, int d, int e, __global uchar* f) {
  int g = get_global_id(0);
  int h = 0;

  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      int k = g + (4 * c * j) + (4 * i);
      k = A(k, e) ? k : g;
      int l = b[(j + 1) * 3 + (i + 1)];
      h += ((int)a[k]) * l;
    }
  }

  if (B(g)) {
    h = (uchar)255;
  }

  f[g] = C(h);
}