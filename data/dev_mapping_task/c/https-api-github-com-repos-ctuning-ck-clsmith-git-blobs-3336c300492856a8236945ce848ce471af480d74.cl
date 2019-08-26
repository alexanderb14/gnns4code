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
  uint f2;
  long f3;
  short f4;
};

struct S1 {
  int g_3;
  uint g_4;
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
  int* b[9][2] = {{&a & a, {&a & a, {&a & a, {&a & a, {&a & a, {&a & a, {&a & a, {&a & a, {&a & a};
  struct S0 c = {1L, 4294967295UL, 0x01078932L, 0x2062B000CD9D7540L, -1L};
  int d, e;
  --a->g_4;
  return c;
}

__kernel void
F(__global ulong* a, __global int* b) {
  int;
  struct S1 c;
  struct S1* d = &c;
    struct S1 e = {
        0x521DFE4BL,
        0x5613717BL,
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
    A(&f, d->g_4);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}