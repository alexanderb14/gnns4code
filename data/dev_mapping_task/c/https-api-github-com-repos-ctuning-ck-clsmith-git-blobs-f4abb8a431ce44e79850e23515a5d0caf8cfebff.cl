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
  int g_2[1];
  int g_3;
  volatile int g_6;
  int g_7;
  volatile int g_8;
  char g_9;
  volatile ushort g_10[9];
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

int E(struct S0* a);
int E(struct S0* a) {
  int* b = (void*)0;
  int* c[2];
  int d;
  for (d = 0; d < 2; d++)
    c[d] = &a->g_3;
  for (a->g_3 = 0; (a->g_3 <= 0); a->g_3 += 1) {
    int d;
    return a->g_2[a->g_3];
  }
  a->g_10[3]++;
  return a->g_9;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S0 d;
  struct S0* e = &d;
    struct S0 f = {
        {(-1L)},
        0x2DE2167FL,
        0x0184DCC8L,
        5L,
        1L,
        1L,
        {0x8BBDL,0x8838L,0x8BBDL,0x8BBDL,0x8838L,0x8BBDL,0x8BBDL,0x8838L,0x8BBDL},
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
    for (c = 0; c < 1; c++) {
      A(&g, e->g_2[c]);
    }
    A(&g, e->g_3);
    A(&g, e->g_6);
    A(&g, e->g_7);
    A(&g, e->g_8);
    A(&g, e->g_9);
    for (c = 0; c < 9; c++) {
      A(&g, e->g_10[c]);
    }
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}