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
  int* g_2;
  int g_8;
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

ulong E(struct S1* a);
ulong E(struct S1* a) {
  int** b = &a->g_2;
  int c[6][6] = {{0x213EC752L, 0x7E8B0D19L, 0x60566A92L, 0x7E8B0D19L, 0x213EC752L, 0x213EC752L}, {0x213EC752L, 0x7E8B0D19L, 0x60566A92L, 0x7E8B0D19L, 0x213EC752L, 0x213EC752L}, {0x213EC752L, 0x7E8B0D19L, 0x60566A92L, 0x7E8B0D19L, 0x213EC752L, 0x213EC752L}, {0x213EC752L, 0x7E8B0D19L, 0x60566A92L, 0x7E8B0D19L, 0x213EC752L, 0x213EC752L}, {0x213EC752L, 0x7E8B0D19L, 0x60566A92L, 0x7E8B0D19L, 0x213EC752L, 0x213EC752L}, {0x213EC752L, 0x7E8B0D19L, 0x60566A92L, 0x7E8B0D19L, 0x213EC752L, 0x213EC752L}};
  int d, e;
  (*b) = a->g_2;
  for (a->g_3 = 19; (a->g_3 < (-7)); a->g_3 = safe_sub_func_int64_t_s_s(a->g_3, 1)) {
    int* f = &a->g_8;
    (*f) &= (*a->g_2);
    return (*f);
  }
  (**b) = c[1][2];
  return a->g_3;
}

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int;
  struct S1 e;
  struct S1* f = &e;
    struct S1 g = {
        1L,
        &f_3,
        1L,
        dd(0)],
        dd(1)],
        dd(2)],
        d(0)],
        d(1)],
        d(2)],
        d(0)],
        d(1)],
        d(2)],
    };
    e = g;
    barrier(1 | 2);
    E(f);
    barrier(1 | 2);
    ulong h = 0xFFFFFFFFFFFFFFFFUL;
    int i = 0;
    A(&h, f->g_3);
    A(&h, f->g_8);
    a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}