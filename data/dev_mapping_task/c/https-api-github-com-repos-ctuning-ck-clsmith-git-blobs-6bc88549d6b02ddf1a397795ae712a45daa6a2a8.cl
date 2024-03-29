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
  char f1;
  uint f2;
  volatile ulong f3;
  uint f4;
};

struct S3 {
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

struct S0 E(struct S3* a);
struct S0 E(struct S3* a) {
  return a->g_2;
}

__kernel void
F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int;
  struct S3 e;
  struct S3* f = &e;
    struct S3 g = {
        {9UL,0x12L,0xD42CA8CDL,0x2AE7B79F6A715CC4L,0xB1647C2CL},
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
    A(&h, f->g_2.f0);
    A(&h, f->g_2.f1);
    A(&h, f->g_2.f2);
    A(&h, f->g_2.f3);
    A(&h, f->g_2.f4);
    a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}