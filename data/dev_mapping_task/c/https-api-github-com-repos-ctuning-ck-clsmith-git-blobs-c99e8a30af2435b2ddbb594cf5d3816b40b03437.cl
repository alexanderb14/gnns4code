inline __attribute__((always_inline)) void A(ulong* a, ulong b) {
  *a += b;
}

inline __attribute__((always_inline)) uint B(void) {
  return (get_group_id(2) * get_num_groups(1) + get_group_id(1)) * get_num_groups(0) + get_group_id(0);
}

inline __attribute__((always_inline)) uint C(void) {
  return (get_global_id(2) * get_global_size(1) + get_global_id(1)) * get_global_size(0) + get_global_id(0);
}

inline __attribute__((always_inline)) uint D(void) {
  return (get_local_id(2) * get_local_size(1) + get_local_id(1)) * get_local_size(0) + get_local_id(0);
}

struct S0 {
  int f0;
  char f1;
  long f2;
};

struct S1 {
  uint g_26[5];
  ulong global_0_offset;
  ulong global_1_offset;
  ulong global_2_offset;
  ulong local_0_offset;
  ulong local_1_offset;
  ulong local_2_offset;
  ulong group_0_offset;
  ulong group_1_offset;
  ulong group_2_offset;
  __global volatile uint* g_atomic_input;
  __global volatile uint* g_special_values;
};

uint E(struct S1* a);
uint E(struct S1* a) {
  char b[5] = {6L, 6L, 6L, 6L, 6L};
  int c;
  if ((atomic_add(&a->g_atomic_input[72 * B() + 10], 1) == 0)) {
    ushort d = 0x0FE1L;
    if (d) {
      int e = (-8L);
      for (e = 4; (e >= 0); e -= 1) {
        int* f = (void*)0;
        int g[2][9][4] = {{{(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}},
                          {{(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}, {(-1L), 5L, 0x193C1DE6L, 0x7E44142BL}}};
        int* h = &g[1][3][2];
        int c, i, j;
        h = (f = (void*)0);
        for (g[1][3][2] = 0; (g[1][3][2] <= 1); g[1][3][2] += 1) {
          long k = 4L;
          uint l[4] = {2UL, 2UL, 2UL, 2UL};
          int c;
          l[0] |= (k = b[(g[1][3][2] + 1)]);
          for (k = 0; (k <= 4); k += 1) {
            int m = 0x67AB6CE1L;
            ulong n[6];
            int o = 0x1C90E69CL;
            uchar p = 0x3CL;
            struct S0 q = {0x44184EB3L, 0x0AL, 0L};
            struct S0 r = {0x4E10B49FL, 0x37L, 0x26243A5D8D34108FL};
            int c, i, j;
            for (c = 0; c < 6; c++)
              n[c] = 1UL;
            p ^= ((o = (g[g[1][3][2]][(e + 1)][(g[1][3][2] + 1)], (n[5] = m))), 0x1532955FL);
            r = q;
          }
        }
        for (g[1][3][2] = 0; (g[1][3][2] <= 4); g[1][3][2] += 1) {
          char s = (-2L);
          uint t = 4294967295UL;
          int** u = (void*)0;
          int v[4];
          int* w = &v[1];
          int** x[3][3][2];
          int c, i, j;
          for (c = 0; c < 4; c++)
            v[c] = 0x4628AEA3L;
          for (c = 0; c < 3; c++) {
            for (i = 0; i < 3; i++) {
              for (j = 0; j < 2; j++)
                x[c][i][j] = &w;
            }
          }
          t++;
          h = (void*)0;
          x[0][2][1] = (u = u);
        }
      }
    } else {
      int y = 1L;
      int z = (-1L);
      z ^= y;
    }
    unsigned int aa = 0;
    aa += d;
    atomic_add(&a->g_special_values[72 * B() + 10], aa);
  } else {
    (1 + 1);
  }
  return a->g_26[0];
}

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int e;
  struct S1 f;
  struct S1* g = &f;
    struct S1 h = {
        {8UL,8UL,8UL,8UL,8UL},
        dd(0)],
        dd(1)],
        dd(2)],
        d(0)],
        d(1)],
        d(2)],
        d(0)],
        d(1)],
        d(2)],
     f = h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    for (e = 0; e < 5; e++) {
      A(&i, g->g_26[e]);
    }
    barrier(1 | 2);
    if (!C())
      for (e = 0; e < 72; e++)
        A(&i, g->g_special_values[e + 72 * B()]);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}