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
  volatile int g_2[3];
  volatile int g_3;
  int g_4[1];
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

int E(struct S0* a);
int E(struct S0* a) {
  int* b = &a->g_4[0];
  for (a->g_4[0] = 0; (a->g_4[0] < (-27)); a->g_4[0] = safe_sub_func_uint8_t_u_u(a->g_4[0], 1)) {
    uint c = 4294967293UL;
    a->g_2[1] = a->g_4[0];
    if (c)
      break;
  }
  a->g_2[1] &= ((*b) = 0x30DE9BF9L);
  return (*b);
}

__kernel void F(__global ulong* a, __global volatile int* b, __global int* c) {
  int d;
  __local volatile uint e[1];
  if (D() == 0)
    for (d = 0; d < 1; d++)
      e[d] = 0;
  struct S0 f;
  struct S0* g = &f;
    struct S0 h = {
        {0x7AD95E17L,0x7AD95E17L,0x7AD95E17L},
        (-3L),
        {0x17F0A290L},
        0,
        cd(0)],
        cd(1)],
        cd(2)],
        c(0)],
        c(1)],
        c(2)],
        c(0)],
        c(1)],
        c(2)],f = h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    for (d = 0; d < 3; d++) {
      A(&i, g->g_2[d]);
    }
    A(&i, g->g_3);
    for (d = 0; d < 1; d++) {
      A(&i, g->g_4[d]);
    }
    A(&i, g->v_collective);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}