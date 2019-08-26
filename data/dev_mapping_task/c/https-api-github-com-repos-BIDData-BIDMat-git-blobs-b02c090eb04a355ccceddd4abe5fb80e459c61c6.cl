typedef float realM; typedef float realN; typedef float real; inline void A(realM a[(8 / 8)][(8 / 8) / 1]) {
  for (int b = 0; b < (8 / 8) / 1; ++b) {
    for (int c = 0; c < (8 / 8); ++c) {
      a[c][b] = 0.0f;
    }
  }
}
inline void B(const __global realM* restrict a, realM b[(8 / 8) / 1], const int c, const int d, const int e) {
  for (int f = 0; f < (8 / 8) / 1; ++f) {
    int g = f + get_local_id(0) * ((8 / 8) / 1);

    int h = g + get_group_id(0) * (8 / 1);

    b[f] = a[d * (c / 1) + h];
  }
}

inline void C(const __global realN* restrict a, realN b[(8 / 8) / 1], const int c, const int d) {
  for (int e = 0; e < (8 / 8) / 1; ++e) {
    int f = e + get_local_id(1) * ((8 / 8) / 1);

    int g = f + get_group_id(1) * (8 / 1);

    b[e] = a[d * (c / 1) + g];
  }
}
inline realM D(realM a, const realM b, const real c) {
  a += b * c;
  return a;
}

inline void E(realM a[(8 / 8)][(8 / 8) / 1], realM b[(8 / 8) / 1], realN c[(8 / 8) / 1]) {
  for (int d = 0; d < (8 / 8) / 1; ++d) {
    for (int e = 0; e < (8 / 8) / 1; ++e) {
      a[d * 1 + 0][e] = D(a[d * 1 + 0][e], b[e], c[d]);
    }
  }
}

inline void F(__global realM* a, realM b[(8 / 8)][(8 / 8) / 1], const int c, const real d, const real e) {
  for (int f = 0; f < (8 / 8); ++f) {
    for (int g = 0; g < (8 / 8) / 1; ++g) {
      int h = g + get_local_id(0) * ((8 / 8) / 1);

      int i = f + get_local_id(1) * (8 / 8);

      int j = h + get_group_id(0) * (8 / 1);
      int k = i + get_group_id(1) * 8;

      int l = k * (c / 1) + j;
      realM m = a[l];

      a[l] = d * b[f][g] + e * m;
    }
  }
}

inline void G(const int a, const int b, const int c, const __global realM* restrict d, const __global realN* restrict e, __global realM* f, realM g[(8 / 8)][(8 / 8) / 1]

              ) {
  realM h[(8 / 8) / 1];
  realN i[(8 / 8) / 1];

  A(g);

  for (int j = 0; j < c; j += 8) {
    for (int k = 0; k < 8; k += 1) {
      for (int l = 0; l < 1; ++l) {
        int m = j + k + l;
        B(d, h, a, m, j);

        C(e, i, b, m);

        E(g, h, i);
      }
    }
  }
}

__attribute__((reqd_work_group_size(8, 8, 1))) __kernel void H(const int a, const int b, const int c, const real d, const real e, const __global realM* restrict f, const __global realN* restrict g, __global realM* h) {
  realM i[(8 / 8)][(8 / 8) / 1];

  G(a, b, c, f, g, h, i);

  F(h, i, a, d, e);
}