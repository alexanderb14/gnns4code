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
  volatile ulong g_2;
  ulong g_3;
  int g_9;
  int* volatile g_8;
  volatile ushort2 g_14;
  uint g_17;
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

int E(struct S0* a);
int E(struct S0* a) {
  char b = 0x16L;
  if (a->g_2) {
    b = (a->g_2 >= a->g_3);
    for (a->g_3 = 17; (a->g_3 == 6); --a->g_3) {
      uint c = 7UL;
      (*a->g_8) |= c;
    }
  } else {
    int* d = &a->g_9;
    int e = 0x64896E6AL;
    int* f = &a->g_9;
    int* g[6] = {&a_9, &a_9, &a_9, &a_9, &a_9, &a_9};
    int h;
    ++a->g_14.y;
    a->g_17 &= (*a->g_8);
  }
  return (*a->g_8);
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S0 d;
  struct S0* e = &d;
    struct S0 f = {
        1UL,
        0xA1E948708EF6B8F3L,
        4L,
        &e_9,
        (ushort2)(65534UL, 0x5612L),
        0x878ED7C3L,
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
    A(&g, e->g_3);
    A(&g, e->g_9);
    A(&g, e->g_14.x);
    A(&g, e->g_14.y);
    A(&g, e->g_17);
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}