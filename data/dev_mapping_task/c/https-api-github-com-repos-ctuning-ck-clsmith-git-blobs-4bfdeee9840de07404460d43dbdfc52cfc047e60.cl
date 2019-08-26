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

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int e;
  struct S0 f;
  struct S0* g = &f;
    struct S0 h = {
        {(-1L)},
        0x2DE2167FL,
        0x0184DCC8L,
        5L,
        1L,
        1L,
        {0x8BBDL,0x8838L,0x8BBDL,0x8BBDL,0x8838L,0x8BBDL,0x8BBDL,0x8838L,0x8BBDL},
        dd(0)],
        dd(1)],
        dd(2)],
        d(0)],
        d(1)],
        d(2)],
        d(0)],
        d(1)],
        d(2)],
    };
    f = h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    for (e = 0; e < 1; e++) {
      A(&i, g->g_2[e]);
    }
    A(&i, g->g_3);
    A(&i, g->g_6);
    A(&i, g->g_7);
    A(&i, g->g_8);
    A(&i, g->g_9);
    for (e = 0; e < 9; e++) {
      A(&i, g->g_10[e]);
    }
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}