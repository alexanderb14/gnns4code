typedef uint2 bus_t; typedef union {
  bus_t b;
  short s[(4)];
} bus_to_short_t;

void A(bus_t a, short b[(4)]) {
  bus_to_short_t c;

  c.b = a;

  for (int d = 0; d < (4); d++) {
    b[d] = c.s[d];
  }
}

bus_t B(short a[(4)]) {
  bus_to_short_t b;

  for (int c = 0; c < (4); c++) {
    b.s[c] = a[c];
  }

  return b.b;
}

void C(__global bus_t* a, short b[11 * 11]) {
  for (int c = 0; c < (((11 * 11) - 1) / ((4)) + 1); c++) {
    short d[(4)];
    A(a[c], d);

    for (int e = 0; e < (4); e++) {
      int f = c * (4) + e;
      if (f < 11 * 11) {
        b[f] = d[e];
      }
    }
  }
}

void D(short a[11 * 11], global bus_t* b, global bus_t* c) {
  short d[11][((((11 + (4) - 1) - 1) / ((4)) + 1) * (4))]

      ;

  short e[11 - 1][(((1024 - ((((11 + (4) - 1) - 1) / ((4)) + 1) * (4))) - 1) / ((4)) + 1) * (4)]

      ;

  for (size_t f = 0; f < (((1024 * 1024) - 1) / ((4)) + 1); f++) {
    short g[(4)];

    A(b[f], g);

    for (size_t h = 0; h < 11 - 1; h++) {
      for (size_t i = 0; i < ((((11 + (4) - 1) - 1) / ((4)) + 1) * (4)) - (4); i++) {
        d[h][i] = d[h][i + (4)];
      }

      for (size_t j = 0; j < (4); j++) {
        d[h][(((((11 + (4) - 1) - 1) / ((4)) + 1) * (4)) - (4)) + j] = e[h][j + (4) * (f % ((((1024 - ((((11 + (4) - 1) - 1) / ((4)) + 1) * (4))) - 1) / ((4)) + 1)))];
      }

      for (size_t j = 0; j < (4); j++) {
        e[h][j + (4) * (f % ((((1024 - ((((11 + (4) - 1) - 1) / ((4)) + 1) * (4))) - 1) / ((4)) + 1)))] = d[h + 1][j];
      }
    }

    for (size_t i = 0; i < (((((11 + (4)) - 1) / ((4)) + 1) - 1) * (4)); i++) {
      d[11 - 1][i] = d[11 - 1][i + (4)];
    }

    for (size_t j = 0; j < (4); j++) {
      d[11 - 1][(((((11 + (4) - 1) - 1) / ((4)) + 1) * (4)) - (4)) + j] = g[j];
    }

    short k[(4)];

    for (size_t j = 0; j < (4); j++) {
      int l = 0;

      for (size_t h = 0; h < 11; h++) {
        for (size_t i = 0; i < 11; i++) {
          const size_t m = ((((11 + (4) - 1) - 1) / ((4)) + 1) * (4)) - 11 - (4) + 1;
          short n = d[h][m + i + j];

          l += (int)a[h * 11 + i] * (int)n;
        }
      }

      if (l > 32767) {
        l = 32767;
      } else if (l < (-32767 - 1)) {
        l = (-32767 - 1);
      }

      k[j] = l;
    }

    c[f] = B(k);
  }
}

__attribute__((reqd_work_group_size(1, 1, 1))) __kernel void E(__global bus_t* a, __global bus_t* b, __global bus_t* c) {
  short d[11 * 11]

      ;

  C(a, d);

  D(d, b, c);
}