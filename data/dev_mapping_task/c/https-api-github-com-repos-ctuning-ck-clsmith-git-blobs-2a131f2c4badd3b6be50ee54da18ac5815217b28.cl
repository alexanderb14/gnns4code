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

union U0 {
  char f0;
  volatile int f1;
  short f2;
  uchar f3;
  uchar f4;
};

struct S1 {
  int4 g_2;
  union U0 g_3[10][7][3];
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

union U0 E(struct S1* a);
union U0 E(struct S1* a) {
  a->g_2.y = ((int4)(a->g_2.zyzw)).z;
  return a->g_3[8][0][1];
}

__kernel void
F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S1 f;
  struct S1* g = &f;
    struct S1 h = {
        (int4)(7L, (int2)(7L, 0x187F2FB5L), 0x187F2FB5L),
        {{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}},{{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}},{{0x3DL},{1L},{1L}}}},
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
    A(&i, g->g_2.x);
    A(&i, g->g_2.y);
    A(&i, g->g_2.z);
    A(&i, g->g_2.w);
    for (c = 0; c < 10; c++) {
      for (d = 0; d < 7; d++) {
        for (e = 0; e < 3; e++) {
          A(&i, g->g_3[c][d][e].f0);
        }
      }
    }
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}