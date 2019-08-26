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
  int g_3[9][4];
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

uint E(struct S0* a);
uint E(struct S0* a) {
  int* b = &a->g_3[3][1];
  int* c = &a->g_3[1][1];
  int d[3];
  int* e = &a->g_3[6][0];
  int* f = &a->g_3[3][1];
  int* g = &d[2];
  int* h = &d[0];
  int* i = &d[2];
  int* j = &a->g_3[8][0];
  int* k = &d[0];
  int* l = &d[2];
    int *m[6][4] = {{&a3],&a3]},{&a3],&a3]},{&a3],&a3]},{&a3],&a3]},{&a3],&a3]},{&a3],&a3]}};
    uint n = 7UL;
    int** o = &e;
    int p, q;
    for (p = 0; p < 3; p++)
      d[p] = 0x3BA20B95L;
    ++n;
    (*o) = &d[2];
    return (*f);
}

__kernel void F(__global ulong* a, __global int* b) {
  int c, d;
  struct S0 e;
  struct S0* f = &e;
    struct S0 g = {
        {{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL},{0x7A5C62E0L,0x7A5C62E0L,0x3666A756L,0x398070ADL}},
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
    for (c = 0; c < 9; c++) {
      for (d = 0; d < 4; d++) {
        A(&h, f->g_3[c][d]);
      }
    }
    a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}