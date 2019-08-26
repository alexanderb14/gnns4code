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
  int g_3[1][4][10];
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

uint E(struct S1* a);
uint E(struct S1* a) {
  int* b = &a->g_3[0][0][6];
    int *c[6][9] = {{&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6]},{&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6]},{&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6]},{&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6]},{&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6]},{&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6],&a0][0][6]}};
    ulong d = 0xBB35B68906353005L;
    int e, f;
    d--;
    return a->g_3[0][0][6];
}

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int e, f, g;
  struct S1 h;
  struct S1* i = &h;
    struct S1 j = {
        {{{1L,1L,0x1C96C797L,(-1L),3L,(-1L),0x1C96C797L,1L,1L,0x1C96C797L},{1L,1L,0x1C96C797L,(-1L),3L,(-1L),0x1C96C797L,1L,1L,0x1C96C797L},{1L,1L,0x1C96C797L,(-1L),3L,(-1L),0x1C96C797L,1L,1L,0x1C96C797L},{1L,1L,0x1C96C797L,(-1L),3L,(-1L),0x1C96C797L,1L,1L,0x1C96C797L}}},
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
    h = j;
    barrier(1 | 2);
    E(i);
    barrier(1 | 2);
    ulong k = 0xFFFFFFFFFFFFFFFFUL;
    int l = 0;
    for (e = 0; e < 1; e++) {
      for (f = 0; f < 4; f++) {
        for (g = 0; g < 10; g++) {
          A(&k, i->g_3[e][f][g]);
        }
      }
    }
    a[C()] = k ^ 0xFFFFFFFFFFFFFFFFUL;
}