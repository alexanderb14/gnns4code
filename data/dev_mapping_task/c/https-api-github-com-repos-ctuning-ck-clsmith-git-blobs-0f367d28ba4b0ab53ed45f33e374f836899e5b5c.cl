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

union U1 {
  ulong f0;
  volatile uint f1;
  uint f2;
};

struct S4 {
  int g_3;
  int* g_2;
  union U1 g_7;
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

union U1 E(struct S4* a);
union U1 E(struct S4* a) {
  int** b = &a->g_2;
  int* c = &a->g_3;
  int** d = &c;
  (*d) = ((*b) = a->g_2);
  return a->g_7;
}

__kernel void
F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int;
  struct S4 e;
  struct S4* f = &e;
    struct S4 g = {
        4L,
        &fg_3,
        {1UL},
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
    A(&h, f->g_7.f0);
    a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}