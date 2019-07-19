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
  volatile uint f0;
  uint f1;
};

struct S2 {
  int g_2;
  int g_4;
  int* volatile g_3;
  volatile struct S1 g_5;
  volatile struct S1* volatile g_6;
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

short E(struct S2* a);
short E(struct S2* a) {
  (*a->g_3) &= (a->g_2 != a->g_2);
  (*a->g_6) = a->g_5;
  return a->g_5.f1;
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S2 c;
  struct S2* d = &c;
    struct S2 e = {
        (-1L),
        0x304800FAL,
        &dg_4,
        {4294967295UL,4294967295UL},
        &dg_5,
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
    A(&f, d->g_2);
    A(&f, d->g_4);
    A(&f, d->g_5.f0);
    A(&f, d->g_5.f1);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}