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
  int f0;
  uint f1;
  volatile long f2;
  volatile int f3;
  char f4;
  volatile int f5;
  uchar f6;
  long f7;
  int f8;
  uchar f9;
};

struct S1 {
  uint g_3;
  struct S0 g_4;
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

struct S0 E(struct S1* a);
struct S0 E(struct S1* a) {
  char b = 0x74L;
  a->g_3 = b;
  return a->g_4;
}

__kernel void
F(__global ulong* a, __global int* b) {
  int;
  struct S1 c;
  struct S1* d = &c;
    struct S1 e = {
        0xB0E1B1B5L,
        {-1L,0UL,1L,0x25155467L,0x01L,0x123CCDE6L,254UL,-1L,5L,252UL},
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
    A(&f, d->g_4.f0);
    A(&f, d->g_4.f1);
    A(&f, d->g_4.f2);
    A(&f, d->g_4.f3);
    A(&f, d->g_4.f4);
    A(&f, d->g_4.f5);
    A(&f, d->g_4.f6);
    A(&f, d->g_4.f7);
    A(&f, d->g_4.f8);
    A(&f, d->g_4.f9);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}