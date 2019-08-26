typedef unsigned char u8; typedef char s8; typedef unsigned short u16; typedef short s16; typedef uint16 bus_t; typedef union {
  bus_t b;
  u8 a[(64)];
} bus_to_u8_t;

void A(bus_t a, u8 b[(64)]) {
  bus_to_u8_t c;

  c.b = a;

  for (size_t d = 0; d < (64); d++) {
    b[d] = c.a[d];
  }
}

bus_t B(u8 a[(64)]) {
  bus_to_u8_t b;

  for (size_t c = 0; c < (64); c++) {
    b.a[c] = a[c];
  }

  return b.b;
}

__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void C(global bus_t* a, global bus_t* b) {
  u8 c[(3)][(((((3) + (64) - 1) - 1) / ((64)) + 1) * (64))] __attribute__((xcl_array_partition(complete, 1))) __attribute__((xcl_array_partition(complete, 2)));

  u8 d[(3) - 1][(((1024 - (((((3) + (64) - 1) - 1) / ((64)) + 1) * (64))) - 1) / ((64)) + 1) * (64)] __attribute__((xcl_array_partition(complete, 1))) __attribute__((xcl_array_partition(cyclic, (64), 2)));

  s8 const e[3 * 3] __attribute__((xcl_array_partition(complete, 0))) = {-1, 0, 1, -2, 0, 2, -1, 0, 1};

  s8 const f[3 * 3] __attribute__((xcl_array_partition(complete, 0))) = {1, 2, 1, 0, 0, 0, -1, -2, -1};

  __attribute__((xcl_pipeline_loop)) for (size_t g = 0; g < (((1895 * 1024) - 1) / ((64)) + 1); g++) {
    u8 h[(64)];

    A(a[g], h);

    for (size_t i = 0; i < (3) - 1; i++) {
      for (size_t j = 0; j < (((((3) + (64) - 1) - 1) / ((64)) + 1) * (64)) - (64); j++) {
        c[i][j] = c[i][j + (64)];
      }

      for (size_t k = 0; k < (64); k++) {
        c[i][((((((3) + (64) - 1) - 1) / ((64)) + 1) * (64)) - (64)) + k] = d[i][k + (64) * (g % ((((1024 - (((((3) + (64) - 1) - 1) / ((64)) + 1) * (64))) - 1) / ((64)) + 1)))];
      }

      for (size_t k = 0; k < (64); k++) {
        d[i][k + (64) * (g % ((((1024 - (((((3) + (64) - 1) - 1) / ((64)) + 1) * (64))) - 1) / ((64)) + 1)))] = c[i + 1][k];
      }
    }

    for (size_t j = 0; j < ((((((3) + (64)) - 1) / ((64)) + 1) - 1) * (64)); j++) {
      c[(3) - 1][j] = c[(3) - 1][j + (64)];
    }

    for (size_t k = 0; k < (64); k++) {
      c[(3) - 1][((((((3) + (64) - 1) - 1) / ((64)) + 1) * (64)) - (64)) + k] = h[k];
    }

    u8 l[(64)];

    for (size_t j = 0; j < (64); j++) {
      s16 m = 0;
      s16 n = 0;

      for (size_t o = 0; o < (3); o++) {
        for (size_t p = 0; p < (3); p++) {
          const size_t q = (((((3) + (64) - 1) - 1) / ((64)) + 1) * (64)) - (3) - (64) + 1;
          u8 r = c[o][q + p + j];

          m += (s16)e[o * (3) + p] * (s16)r;
          n += (s16)f[o * (3) + p] * (s16)r;
        }
      }

      u16 s = (m >= 0) ? m : -m;
      u16 t = (n >= 0) ? n : -n;

      u16 u = s + t;

      u8 v;

      if (u > 0xFF) {
        v = 0xFF;
      } else {
        v = (u8)u;
      }

      l[j] = v;
    }

    b[g] = B(l);
  }
}