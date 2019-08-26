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
  uint v_collective;
  ulong global_0_offset;
  ulong global_1_offset;
  ulong global_2_offset;
  ulong local_0_offset;
  ulong local_1_offset;
  ulong local_2_offset;
  ulong group_0_offset;
  ulong group_1_offset;
  ulong group_2_offset;
  __local volatile uint* l_atomic_reduction;
  __global volatile uint* g_atomic_reduction;
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

__kernel void F(__global ulong* a, __global volatile int* b, __global int* c) {
  int d, e, f;
  __local volatile uint g[1];
  if (D() == 0)
    for (d = 0; d < 1; d++)
      g[d] = 0;
  struct S1 h;
  struct S1* i = &h;
    struct S1 j = {
        {{{(-3L),0L},{(-3L),0L},{(-3L),0L}},{{(-3L),0L},{(-3L),0L},{(-3L),0L}},{{(-3L),0L},{(-3L),0L},{(-3L),0L}},{{(-3L),0L},{(-3L),0L},{(-3L),0L}}},
        0x3FC88EB9L,
        (-1L),
        {{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L},{0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L,0x2A165420L,0L,0L}},
        0L,
        {0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL,0x1DCEE34EL},
        (-7L),
        (-8L),
        0,
        cd(0)],
        cd(1)],
        cd(2)],
        c(0)],
        c(1)],
        c(2)],
        c(0)],
        c(1)],
        c(2)],h = j;
    barrier(1 | 2);
    E(i);
    barrier(1 | 2);
    ulong k = 0xFFFFFFFFFFFFFFFFUL;
    int l = 0;
    for (d = 0; d < 4; d++) {
      for (e = 0; e < 3; e++) {
        for (f = 0; f < 2; f++) {
          A(&k, i->g_2[d][e][f]);
        }
      }
    }
    A(&k, i->g_3);
    A(&k, i->g_6);
    for (d = 0; d < 8; d++) {
      for (e = 0; e < 10; e++) {
        A(&k, i->g_7[d][e]);
      }
    }
    A(&k, i->g_8);
    for (d = 0; d < 6; d++) {
      A(&k, i->g_9[d]);
    }
    A(&k, i->g_10);
    A(&k, i->g_11);
    A(&k, i->v_collective);
    a[C()] = k ^ 0xFFFFFFFFFFFFFFFFUL;
}