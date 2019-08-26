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
  volatile uchar g_2;
  volatile int g_4[4];
  volatile int* volatile g_3;
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

uint E(struct S3* a);
uint E(struct S3* a) {
  uint b[5] = {0x2A831D26L, 0x2A831D26L, 0x2A831D26L, 0x2A831D26L, 0x2A831D26L};
  int c;
  (*a->g_3) = a->g_2;
  return b[4];
}

__kernel void F(__global ulong* a, __global volatile int* b, __global int* c) {
  int d;
  __local volatile uint e[1];
  if (D() == 0)
    for (d = 0; d < 1; d++)
      e[d] = 0;
  struct S3 f;
  struct S3* g = &f;
    struct S3 h = {
        0x65L,
        {7L,7L,7L,7L},
        &gg_4[1],
        0,
        cd(0)],
        cd(1)],
        cd(2)],
        c(0)],
        c(1)],
        c(2)],
        c(0)],
        c(1)],
        c(2)],fb= h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    A(&i, g->g_2);
    for (d = 0; d < 4; d++) {
      A(&i, g->g_4[d]);
    }
    A(&i, g->v_collective);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}