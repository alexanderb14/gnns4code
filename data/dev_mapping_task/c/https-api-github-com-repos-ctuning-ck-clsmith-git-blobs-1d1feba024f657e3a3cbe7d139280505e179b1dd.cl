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
  volatile uchar g_5[3];
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
  __laint d, e, f;
  --a->g_5[1];
  return a->g_5[1];
}

__kernel void
F(__global ulong* a, __global volatile int* b, __global int* c) {
  int d;
  __local volatile uint e[1];
  if (D() == 0)
    for (d = 0; d < 1; d++)
      e[d] = 0;
  struct S1 f;
  struct S1* g = &f;
    struct S1 h = {
        0L,
        {255UL,255UL,255UL},
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
    A(&i, g->g_3);
    for (d = 0; d < 3; d++) {
      A(&i, g->g_5[d]);
    }
    A(&i, g->v_collective);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}