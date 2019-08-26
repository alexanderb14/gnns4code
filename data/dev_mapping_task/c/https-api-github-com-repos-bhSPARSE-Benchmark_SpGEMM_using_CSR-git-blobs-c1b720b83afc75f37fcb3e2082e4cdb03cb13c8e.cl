inline void A(__local uint* a) {
  int b = get_local_id(0);
  int c = 2 * get_local_size(0) - 1 - b;

  a[b] = b * 2 + 1;
  a[c] = b * 2;
}

inline void B(__local uint* a, __local uint* b, const int c) {
  uint d;

  if ((*a > *b) == c) {
    d = *a;
    *a = *b;
    *b = d;
  }
}

inline void C(__local uint* a, int b) {
  int c = get_local_id(0);
  int d;

  for (uint e = b >> 1; e > 0; e >>= 1) {
    barrier(1);
    d = 2 * c - (c & (e - 1));
    B(&a[d], &a[d + e], 1);
  }
}

__kernel void D(__local uint* a) {
  A(a);
  barrier(1);

  C(a, get_local_size(0) * 2);
}