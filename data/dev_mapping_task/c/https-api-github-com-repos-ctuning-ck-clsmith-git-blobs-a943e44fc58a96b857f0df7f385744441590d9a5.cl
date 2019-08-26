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
  volatile ushort g_14;
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

short E(struct S0* a);
short E(struct S0* a) {
  int* b = &a->g_3;
  int* c = (void*)0;
  int* d = &a->g_3;
  int* e = &a->g_3;
  int* f = (void*)0;
  int* g = &a->g_3;
  int* h = &a->g_3;
  int* i = &a->g_3;
  int* j = &a->g_3;
  int* k = &a->g_3;
  int* l[10][1] = { {&aaaaaaaaaa int m, n;
  a->g_14++;
  return (*g);
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S0 c;
  struct S0* d = &c;
    struct S0 e = {
        (-7L),
        65528UL,
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
    A(&f, d->g_14);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}