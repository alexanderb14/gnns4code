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
  int g_3;
  uint g_8[1][7][6];
  int g_12[5];
  int* volatile g_11;
  ulong global_0_offset;
  ulong global_1_offset;
  ulong global_2_offset;
  ulong local_0_offset;
  ulong local_1_offset;
  ulong local_2_offset;
  ulong group_0_offset;
  ulong group_1_offset;
  ulong group_2_offset;
};

uint E(struct S0* a);
uint E(struct S0* a) {
  int* b = &a->g_3;
  int* c = &a->g_3;
  int* d = &a->g_3;
  int* e = &a->g_3;
  int* f = &a->g_3;
  a->g_8[0][6][0]++;
  (*a->g_11) = ((*c) |= 0x50A4BA31L);
  return a->g_3;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S0 f;
  struct S0* g = &f;
    struct S0 h = {
        4L,
        {{{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL}}},
        {0L,0L,0L,0L,0L},
        &g_12[3],
        bd(0)],
        bd(1)],
        bd(2)],
        b(0)],
        b(1)],
        b(2)],
        b(0)],
        b(1)],
        b(2)],
    };
    f = h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    A(&i, g->g_3);
    for (c = 0; c < 1; c++) {
      for (d = 0; d < 7; d++) {
        for (e = 0; e < 6; e++) {
          A(&i, g->g_8[c][d][e]);
        }
      }
    }
    for (c = 0; c < 5; c++) {
      A(&i, g->g_12[c]);
    }
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}