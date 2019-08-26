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
  volatile int g_5[8][8][4];
  volatile int* g_4[10][2];
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

long E(struct S0* a);
long E(struct S0* a) {
  int* b = (void*)0;
  int** c[3];
  int d;
  for (d = 0; d < 3; d++)
    c[d] = &b;
  a->g_4[9][1] = (void*)0;
  return a->g_5[4][1][2];
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S0 f;
  struct S0* g = &f;
    struct S0 h = {
        {{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}},{{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L},{0x63A88E00L,0x63A88E00L,0L,0L}}},
        {{&g,&g},{&g,&g},{&g,&g},{&g,&g},{&g,&g},{&g,&g},{&g,&g},{&g,&g},{&g,&g},{&g,&g}},
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
    for (c = 0; c < 8; c++) {
      for (d = 0; d < 8; d++) {
        for (e = 0; e < 4; e++) {
          A(&i, g->g_5[c][d][e]);
        }
      }
    }
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}