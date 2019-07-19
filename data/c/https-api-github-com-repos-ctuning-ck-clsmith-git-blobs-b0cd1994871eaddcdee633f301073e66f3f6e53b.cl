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
  uint f0;
  uint f1;
  uint f2;
  ulong f3;
};

struct S1 {
  uint f0;
  volatile int f1;
  volatile int f2;
  volatile struct S0 f3;
  int f4;
  long f5;
};

struct S2 {
  int g_3;
  int* g_2;
  int* g_5;
  struct S1 g_6;
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

struct S1 E(struct S2* a);
struct S1 E(struct S2* a) {
  int** b = &a->g_2;
  a->g_5 = ((*b) = a->g_2);
  return a->g_6;
}

__kernel void
F(__global ulong* a, __global int* b) {
  int;
  struct S2 c;
  struct S2* d = &c;
    struct S2 e = {
        1L,
        &dg_3,
        &dg_3,
        {0UL,0x3CCD2466L,0x1F08664AL,{0x1600D549L,0xE623B470L,0xBA87A5EAL,0xB5D1CB6A7F4EA14CL},0x530C4E2BL,0x5F40E13F5E3D1AA1L},
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
    A(&f, d->g_6.f0);
    A(&f, d->g_6.f1);
    A(&f, d->g_6.f2);
    A(&f, d->g_6.f3.f0);
    A(&f, d->g_6.f3.f1);
    A(&f, d->g_6.f3.f2);
    A(&f, d->g_6.f3.f3);
    A(&f, d->g_6.f4);
    A(&f, d->g_6.f5);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}