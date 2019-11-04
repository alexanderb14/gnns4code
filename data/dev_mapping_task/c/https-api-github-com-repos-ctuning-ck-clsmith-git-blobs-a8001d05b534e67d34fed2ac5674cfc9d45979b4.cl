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
  int g_4[8];
  int* volatile g_3;
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
  char b = (-10L);
  uint c = 4294967289UL;
  (*a->g_3) = b;
  return c;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S1 d;
  struct S1* e = &d;
    struct S1 f = {
        {0L,0L,0L,0L,0L,0L,0L,0L},
        &eg_4[6],
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
    for (c = 0; c < 8; c++) {
      A(&g, e->g_4[c]);
    }
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}