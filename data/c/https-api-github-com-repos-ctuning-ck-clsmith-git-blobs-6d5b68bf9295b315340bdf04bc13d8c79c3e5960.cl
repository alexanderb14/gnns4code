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
  int g_3;
  uint g_8[1][7][6];
  int g_12[5];
  int* volatile g_11;
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

uint E(struct S0* a);
uint E(struct S0* a) {
  int* b = &a->g_3;
  int* c = &a->g_3;
  int* d = &a->g_3;
  int* e = &a->g_3;
  int* f = &a->g_3;
  a->g_8[0][6][0]++;
  (*a->g_11) = ((*c) |= 0x50A4BA31L);
  return a->g_3;
}

__kernel void F(__global ulong* a, __global volatile int* b, __global int* c) {
  int d, e, f;
  __local volatile uint g[1];
  if (D() == 0)
    for (d = 0; d < 1; d++)
      g[d] = 0;
  struct S0 h;
  struct S0* i = &h;
    struct S0 j = {
        4L,
        {{{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL},{0x9989D221L,7UL,6UL,4294967289UL,6UL,7UL}}},
        {0L,0L,0L,0L,0L},
        &i_12[3],
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
    A(&k, i->g_3);
    for (d = 0; d < 1; d++) {
      for (e = 0; e < 7; e++) {
        for (f = 0; f < 6; f++) {
          A(&k, i->g_8[d][e][f]);
        }
      }
    }
    for (d = 0; d < 5; d++) {
      A(&k, i->g_12[d]);
    }
    A(&k, i->v_collective);
    a[C()] = k ^ 0xFFFFFFFFFFFFFFFFUL;
}