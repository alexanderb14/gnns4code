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
  uchar g_12;
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

uint E(struct S1* a);
uint E(struct S1* a) {
  int* b = &a->g_3;
  int* c = &a->g_3;
  int* d = &a->g_3;
  int* e = &a->g_3;
  int* f = &a->g_3;
  int* g = &a->g_3;
  int* h = &a->g_3;
  int* i = &a->g_3;
  int* j[9] = {&a_3, &a_3, &a_3, &a_3, &a_3, &a_3, &a_3, &a_3, &a_3};
  int k;
  a->g_12++;
  return a->g_12;
}

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int;
  struct S1 e;
  struct S1* f = &e;
    struct S1 g = {
        0x70A290BEL,
        8UL,
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
    A(&h, f->g_12);
    a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}