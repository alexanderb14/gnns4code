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

struct S3 {
  volatile int g_2;
  volatile int g_3[1][10][9];
  int g_4;
  int g_8;
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

ulong E(struct S3* a);
ulong E(struct S3* a) {
  ushort b = 0UL;
  for (a->g_4 = 0; (a->g_4 == (-3)); a->g_4 = safe_sub_func_uint8_t_u_u(a->g_4, 4)) {
    int* c = &a->g_8;
    (*c) ^= 0x106D8BC0L;
  }
  return b;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S3 f;
  struct S3* g = &f;
    struct S3 h = {
        0x52086BD0L,
        {{{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L},{6L,0L,0x2F9D44C0L,0L,0x5D70512AL,0L,0x2F9D44C0L,0L,6L}}},
        0x7D66C4A8L,
        0x0DDAC0FAL,
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
    A(&i, g->g_2);
    for (c = 0; c < 1; c++) {
      for (d = 0; d < 10; d++) {
        for (e = 0; e < 9; e++) {
          A(&i, g->g_3[c][d][e]);
        }
      }
    }
    A(&i, g->g_4);
    A(&i, g->g_8);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}