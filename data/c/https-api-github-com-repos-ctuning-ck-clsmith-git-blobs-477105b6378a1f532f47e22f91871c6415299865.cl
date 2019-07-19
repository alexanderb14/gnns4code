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
  int4 g_4;
  int* volatile g_3;
  int* volatile g_7;
  int* volatile g_9;
  int* volatile g_10;
  int* volatile g_12;
  int* volatile g_13;
  int* volatile g_14;
  int* volatile g_15;
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
  int* c = (void*)0;
  int* d = (void*)0;
  int* e = (void*)0;
  int* f = (void*)0;
  int* g = (void*)0;
  a->g_4.y = b;
  return a->g_4.z;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S1 d;
  struct S1* e = &d;
    struct S1 f = {
        (int4)(0L, (int2)(0L, 0L), 0L),
        (void*)0,
        (void*)0,
        (void*)0,
        (void*)0,
        (void*)0,
        (void*)0,
        (void*)0,
        (void*)0,
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
    A(&g, e->g_4.x);
    A(&g, e->g_4.y);
    A(&g, e->g_4.z);
    A(&g, e->g_4.w);
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}