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

struct S1 {
  volatile int g_2[4][3][2];
  int g_3;
  volatile int g_6;
  volatile int g_7[8][10];
  volatile int g_8;
  volatile int g_9[6];
  volatile int g_10;
  int g_11;
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

uint E(struct S1* a);
uint E(struct S1* a) {
  short b[4];
  int* c = (void*)0;
  int* d = &a->g_3;
  int* e = (void*)0;
  int* f[2][6] = { {& a& a uchar g = 0xB8L;
  int h, i;
  for (h = 0; h < 4; h++)
    b[h] = 1L;
  for (a->g_3 = 0; (a->g_3 == (-11)); a->g_3 = safe_sub_func_uint16_t_u_u(a->g_3, 1)) {
    uint j = 9UL;
    uint k = 0xFEAF86F2L;
    for (a->g_11 = 0; (a->g_11 <= (-16)); --a->g_11) {
      volatile int* l[3];
      volatile int** m = &l[1];
      int h;
      for (h = 0; h < 3; h++)
        l[h] = (void*)0;
      (*m) = &a->g_8;
      if (j)
        break;
    }
    if (k)
      break;
  }
  (*d) |= b[3];
  g++;
  return a->g_9[3];
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S1 f;
  struct S1* g = &f;
    struct S1 h = {
        {{{(-3L),0L},{(-3L),0L},{(-3L),0L}},{{(-3L),0L},{(-3L),0L},{(-3L),0L}},{{(-3L),0L},{(-3L),0L},{(-3L),0L}},{{(-3L),0L},{(-3L),0L},{(-3L),0L}}},
        0x3FC88EB9L,
        (-1L),
        {{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L}},
        0L,
        {0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL},
        (-7L),
        (-8L),
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
    for (c = 0; c < 4; c++) {
      for (d = 0; d < 3; d++) {
        for (e = 0; e < 2; e++) {
          A(&i, g->g_2[c][d][e]);
        }
      }
    }
    A(&i, g->g_3);
    A(&i, g->g_6);
    for (c = 0; c < 8; c++) {
      for (d = 0; d < 10; d++) {
        A(&i, g->g_7[c][d]);
      }
    }
    A(&i, g->g_8);
    for (c = 0; c < 6; c++) {
      A(&i, g->g_9[c]);
    }
    A(&i, g->g_10);
    A(&i, g->g_11);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}