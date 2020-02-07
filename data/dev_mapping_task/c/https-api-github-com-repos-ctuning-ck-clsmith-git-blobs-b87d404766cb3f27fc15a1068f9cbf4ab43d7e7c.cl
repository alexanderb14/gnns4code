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

struct S4 {
  long g_2;
  int g_5[1];
  int g_7;
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

uint E(struct S4* a);
uint E(struct S4* a) {
  int* b = (void*)0;
  int* c = &a->g_5[0];
  int* d = &a->g_7;
  (*d) = ((*c) = a->g_2);
  (*d) = a->g_2;
  return a->g_5[0];
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S4 d;
  struct S4* e = &d;
    struct S4 f = {
        0x44D1878ABC106EC6L,
        {9L},
        1L,
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
    A(&g, e->g_2);
    for (c = 0; c < 1; c++) {
      A(&g, e->g_5[c]);
    }
    A(&g, e->g_7);
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}