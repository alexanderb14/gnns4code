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
  long g_2[8];
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
  return a->g_2[6];
}

__kernel void F(__global ulong* a, __global volatile uint* b, __global volatile uint* c, __global int* d) {
  int e;
  struct S0 f;
  struct S0* g = &f;
    struct S0 h = {
        {0x48F69F7FD1E814B7L,(-2L),0x48F69F7FD1E814B7L,0x48F69F7FD1E814B7L,(-2L),0x48F69F7FD1E814B7L,0x48F69F7FD1E814B7L,(-2L)},
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
    f = h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    for (e = 0; e < 8; e++) {
      A(&i, g->g_2[e]);
    }
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}