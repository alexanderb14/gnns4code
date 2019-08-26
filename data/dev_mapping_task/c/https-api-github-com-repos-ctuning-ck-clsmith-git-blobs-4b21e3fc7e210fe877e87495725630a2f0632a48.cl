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

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S0 d;
  struct S0* e = &d;
    struct S0 f = {
        {0x7AD95E17L,0x7AD95E17L,0x7AD95E17L},
        (-3L),
        {0x17F0A290L},
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
    for (c = 0; c < 3; c++) {
      A(&g, e->g_2[c]);
    }
    A(&g, e->g_3);
    for (c = 0; c < 1; c++) {
      A(&g, e->g_4[c]);
    }
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}