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

uint E(struct S0* a);
uint E(struct S0* a) {
  short b[8] = {0x7CB5L, 0x7CB5L, 0x7CB5L, 0x7CB5L, 0x7CB5L, 0x7CB5L, 0x7CB5L, 0x7CB5L};
  int c;
  for (a->g_3 = 0; a->g_3 < 8; a->g_3 += 1) {
    b[a->g_3] = 0x5688L;
  }
  return a->g_3;
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S0 c;
  struct S0* d = &c;
    struct S0 e = {
        0L,
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
    c = e;
    barrier(1 | 2);
    E(d);
    barrier(1 | 2);
    ulong f = 0xFFFFFFFFFFFFFFFFUL;
    int g = 0;
    A(&f, d->g_3);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}