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

struct S2 {
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
  __local volatile uint* l_atomic_input;
  __local volatile uint* l_special_values;
};

ushort E(struct S2* a);
ushort E(struct S2* a) {
  if ((atomic_add(&a->l_atomic_input[29], 1) == 6)) {
    ulong b[8];
    int c;
    for (c = 0; c < 8; c++)
      b[c] = 0UL;
    b[7] |= 0L;
    unsigned int d = 0;
    int e;
    for (e = 0; e < 8; e++) {
      d += b[e];
    }
    atomic_add(&a->l_special_values[29], d);
  } else {
    (1 + 1);
  }
  return a->g_3;
}

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int e;
  __local volatile uint f[48];
  if (D() == 0)
    for (e = 0; e < 48; e++)
      f[e] = 0;
  __local volatile uint g[48];
  if (D() == 0)
    for (e = 0; e < 48; e++)
      g[e] = 0;
  struct S2 h;
  struct S2* i = &h;
    struct S2 j = {
        4L,
        dd(0)],
        dd(1)],
        dd(2)],
        d(0)],
        d(1)],
        d(2)],
        d(0)],
        d(1)],
        d(2)],
     h = j;
    barrier(1 | 2);
    E(i);
    barrier(1 | 2);
    ulong k = 0xFFFFFFFFFFFFFFFFUL;
    int l = 0;
    A(&k, i->g_3);
    barrier(1 | 2);
    if (!D())
      for (e = 0; e < 48; e++)
        A(&k, i->l_special_values[e]);
    a[C()] = k ^ 0xFFFFFFFFFFFFFFFFUL;
}