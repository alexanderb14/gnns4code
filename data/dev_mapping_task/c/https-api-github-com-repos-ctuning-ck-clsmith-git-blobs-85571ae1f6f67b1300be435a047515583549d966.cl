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
  volatile char2 g_3;
  ushort4 g_5;
  int g_7[8];
  int* volatile g_6;
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

short E(struct S1* a);
short E(struct S1* a) {
  uint b[4] = {2UL, 2UL, 2UL, 2UL};
  ushort8 c = (ushort8)(0xA733L, (ushort4)(0xA733L, (ushort2)(0xA733L, 5UL), 5UL), 5UL, 0xA733L, 5UL);
  int d[6][1][9] = {{{0L, 0L, 0x17312B94L, 0x288AF16DL, 0x45C3C3AEL, 0L, (-8L), 0x7E011B55L, (-8L)}}, {{0L, 0L, 0x17312B94L, 0x288AF16DL, 0x45C3C3AEL, 0L, (-8L), 0x7E011B55L, (-8L)}}, {{0L, 0L, 0x17312B94L, 0x288AF16DL, 0x45C3C3AEL, 0L, (-8L), 0x7E011B55L, (-8L)}},
                    {{0L, 0L, 0x17312B94L, 0x288AF16DL, 0x45C3C3AEL, 0L, (-8L), 0x7E011B55L, (-8L)}}, {{0L, 0L, 0x17312B94L, 0x288AF16DL, 0x45C3C3AEL, 0L, (-8L), 0x7E011B55L, (-8L)}}, {{0L, 0L, 0x17312B94L, 0x288AF16DL, 0x45C3C3AEL, 0L, (-8L), 0x7E011B55L, (-8L)}}};
  uchar e = 0UL;
  int8 f = (int8)(0x6232C2A4L, (int4)(0x6232C2A4L, (int2)(0x6232C2A4L, 0x30971CF7L), 0x30971CF7L), 0x30971CF7L, 0x6232C2A4L, 0x30971CF7L);
  short g = (-1L);
  int h = 5L;
  long i[4][3] = {{2L, 2L, 2L}, {2L, 2L, 2L}, {2L, 2L, 2L}, {2L, 2L, 2L}};
  uint j = 0xB81C666DL;
  int k, l, m;
  if (b[1]) {
    int* n = &a->g_7[6];
    int* o = &a->g_7[6];
    int* p = (void*)0;
        int *q[10] = {&d][0][8],&d][0][8],&d][0][8],&d][0][8],&d][0][8],&d][0][8],&d][0][8],&d][0][8],&d][0][8],&d][0][8]};
        int k;
        (*a->g_6) = (((char4)(((char16)(a->g_3.xxxyyxxyxxxyxxyy)).s7688)).y <= (((ushort16)(add_sat(((ushort4)(c.s6435)).xzwxwxzzyxywxwwx, ((ushort16)(((ushort16)(a->g_5.xxzwzwzwyzyyzxzz))))))).se ^ a->g_5.z));
        (*n) = (b[2] > (((char2)(((char8)(((char2)(0x1FL, 0x06L)).yxxxxyyx)).s67)).even == (get_group_id(0) > ((ulong2)(2UL, 0x046E74A6E8F59172L)).even)));
        e++;
  } else {
    int r = 0x7B996340L;
    int s = 0x7FD326D3L;
    int t = 0x3986B299L;
    int u = 0x6288A3D8L;
    int v = 1L;
    int w = 0L;
    int x = 8L;
    uint y = 6UL;
    (*a->g_6) &= ((int16)(f.s1741257010325740)).sa;
    for (e = 15; (e == 26); e = safe_add_func_int16_t_s_s(e, 4)) {
      int* z = (void*)0;
      int* aa[3];
      int k;
      for (k = 0; k < 3; k++)
        aa[k] = &d[3][0][8];
      y++;
    }
  }
  return j;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S1 d;
  struct S1* e = &d;
    struct S1 f = {
        (char2)((-2L), 0L),
        (ushort4)(65529UL, (ushort2)(65529UL, 1UL), 1UL),
        {(-3L),(-3L),(-3L),(-3L),(-3L),(-3L),(-3L),(-3L)},
        &e_7[6],
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
    d = f;
    barrier(1 | 2);
    E(e);
    barrier(1 | 2);
    ulong g = 0xFFFFFFFFFFFFFFFFUL;
    int h = 0;
    A(&g, e->g_3.x);
    A(&g, e->g_3.y);
    A(&g, e->g_5.x);
    A(&g, e->g_5.y);
    A(&g, e->g_5.z);
    A(&g, e->g_5.w);
    for (c = 0; c < 8; c++) {
      A(&g, e->g_7[c]);
    }
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}