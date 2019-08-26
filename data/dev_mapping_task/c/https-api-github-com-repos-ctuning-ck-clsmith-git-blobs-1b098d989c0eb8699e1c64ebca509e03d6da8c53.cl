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
  int g_3;
  int g_4;
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

long E(struct S1* a);
long E(struct S1* a) {
  uchar b[6][9] = {{0x5DL, 246UL, 0xA6L, 0xB7L, 246UL, 0xB7L, 0xA6L, 246UL, 0x5DL}, {0x5DL, 246UL, 0xA6L, 0xB7L, 246UL, 0xB7L, 0xA6L, 246UL, 0x5DL}, {0x5DL, 246UL, 0xA6L, 0xB7L, 246UL, 0xB7L, 0xA6L, 246UL, 0x5DL}, {0x5DL, 246UL, 0xA6L, 0xB7L, 246UL, 0xB7L, 0xA6L, 246UL, 0x5DL}, {0x5DL, 246UL, 0xA6L, 0xB7L, 246UL, 0xB7L, 0xA6L, 246UL, 0x5DL}, {0x5DL, 246UL, 0xA6L, 0xB7L, 246UL, 0xB7L, 0xA6L, 246UL, 0x5DL}};
  int* c[5][10] = {{&a & a(void*) 0, &a & a & a(void*) 0, &a & a(void*) 0}, {&a & a(void*) 0, &a & a & a(void*) 0, &a & a(void*) 0}, {&a & a(void*) 0, &a & a & a(void*) 0, &a & a(void*) 0}, {&a & a(void*) 0, &a & a & a(void*) 0, &a & a(void*) 0}, {&a & a(void*) 0, &a & a & a(void*) 0, &a & a(void*) 0}};
  int d, e;
  for (a->g_3 = 0; a->g_3 < 6; a->g_3 += 1) {
    for (a->g_4 = 0; a->g_4 < 9; a->g_4 += 1) {
      b[a->g_3][a->g_4] = 251UL;
    }
  }
  a->g_4 = a->g_4;
  return a->g_4;
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S1 c;
  struct S1* d = &c;
    struct S1 e = {
        0x4CB63E8EL,
        (-1L),
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
    c = e;
    barrier(1 | 2);
    E(d);
    barrier(1 | 2);
    ulong f = 0xFFFFFFFFFFFFFFFFUL;
    int g = 0;
    A(&f, d->g_3);
    A(&f, d->g_4);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}