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
  volatile int g_2;
  volatile int g_3[3][8][2];
  int g_4;
  volatile int g_7;
  int g_8;
  int g_12;
  uint g_19;
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

uchar E(struct S1* a);
uchar E(struct S1* a) {
  char b = (-8L);
  int2 c = (int2)((-9L), 0x37C50821L);
  int d;
  for (a->g_4 = 0; (a->g_4 >= (-23)); a->g_4--) {
    int e = (-1L);
    int f[7][10] = {{0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L}, {0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L}, {0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L}, {0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L},
                    {0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L}, {0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L}, {0x1097D93CL, 0x6341F56AL, 8L, 9L, 0x7181E214L, 9L, 8L, 0x6341F56AL, 0x1097D93CL, 0x2D11E758L}};
    int d, g;
    for (a->g_8 = 0; (a->g_8 <= 13); a->g_8 = safe_add_func_int32_t_s_sa, 3)
      ad ga k = aaaaaaj, a a++ a->g_19;
    if (e)
      break;
    return a->g_2;
  }
}
return a->g_19;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S1 f;
  struct S1* g = &f;
    struct S1 h = {
        0x7BC75286L,
        {{{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L}},{{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L}},{{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L},{2L,2L}}},
        0x0EC01E6EL,
        0L,
        (-1L),
        0x1FDBD017L,
        0x380B773BL,
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
    for (c = 0; c < 3; c++) {
      for (d = 0; d < 8; d++) {
        for (e = 0; e < 2; e++) {
          A(&i, g->g_3[c][d][e]);
        }
      }
    }
    A(&i, g->g_4);
    A(&i, g->g_7);
    A(&i, g->g_8);
    A(&i, g->g_12);
    A(&i, g->g_19);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}