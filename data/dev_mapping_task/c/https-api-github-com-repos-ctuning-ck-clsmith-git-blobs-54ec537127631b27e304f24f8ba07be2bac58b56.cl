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

struct S3 {
  volatile uchar g_2;
  volatile int g_4[8][2];
  volatile int* volatile g_3;
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

uint E(struct S3* a);
uint E(struct S3* a) {
  short b = 0L;
  (*a->g_3) = a->g_2;
  return b;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d;
  struct S3 e;
  struct S3* f = &e;
    struct S3 g = {
        0x65L,
        {{1L,0x1F1EB32AL},{1L,0x1F1EB32AL},{1L,0x1F1EB32AL},{1L,0x1F1EB32AL},{1L,0x1F1EB32AL},{1L,0x1F1EB32AL},{1L,0x1F1EB32AL},{1L,0x1F1EB32AL}},
        &fg_4[6][0],
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
    e = g;
    barrier(1 | 2);
    E(f);
    barrier(1 | 2);
    ulong h = 0xFFFFFFFFFFFFFFFFUL;
    int i = 0;
    A(&h, f->g_2);
    for (c = 0; c < 8; c++) {
      for (d = 0; d < 2; d++) {
        A(&h, f->g_4[c][d]);
      }
    }
    a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}