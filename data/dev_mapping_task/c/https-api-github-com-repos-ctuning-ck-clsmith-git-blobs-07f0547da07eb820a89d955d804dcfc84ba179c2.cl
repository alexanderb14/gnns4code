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
  int g_2[3][10][8];
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
  return a->g_2[2][6][4];
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d, e;
  struct S3 f;
  struct S3* g = &f;
    struct S3 h = {
        {{{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L}},{{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L}},{{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L},{0x67ED6F18L,(-1L),0x68CB667FL,1L,0x67AB6CE1L,0x67ED6F18L,1L,5L}}},
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
    f = h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    for (c = 0; c < 3; c++) {
      for (d = 0; d < 10; d++) {
        for (e = 0; e < 8; e++) {
          A(&i, g->g_2[c][d][e]);
        }
      }
    }
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}