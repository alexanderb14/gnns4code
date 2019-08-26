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
  volatile uint f1;
  long f2;
  volatile ulong f3;
  long f4;
};

struct S2 {
  struct S0 g_2;
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

ushort E(struct S2* a);
ushort E(struct S2* a) {
  struct S0* b[1];
  int c;
  for (c = 0; c < 1; c++)
    b[c] = &a->g_2;
  a->g_2 = a->g_2;
  return a->g_2.f4;
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S2 c;
  struct S2* d = &c;
    struct S2 e = {
        {0x173BF38CL,4294967294UL,0x2FA4AD744D0289A6L,0x5768819570A50B5FL,0x3101AAE4B9A733E3L},
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
    A(&f, d->g_2.f0);
    A(&f, d->g_2.f1);
    A(&f, d->g_2.f2);
    A(&f, d->g_2.f3);
    A(&f, d->g_2.f4);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}