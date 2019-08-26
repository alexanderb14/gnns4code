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

struct S2 {
  int16 g_3;
  int g_13[9];
  volatile uint g_17;
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

int E(struct S2* a);
int E(struct S2* a) {
  int* b = (void*)0;
  int* c = (void*)0;
  int* d = (void*)0;
  int* e = (void*)0;
  int* f = (void*)0;
  int* g = (void*)0;
  int* h = (void*)0;
  int* i = (void*)0;
  int* j = (void*)0;
  int* k[3][5][5] = {{{(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}},
                     {{(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}},
                     {{(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}, {(void*)0, (void*)0, (void*)0, (void*)0, (void*)0}}};
  short l = 0x7743L;
  char m = (-9L);
  short n = 0L;
  int o, p, q;
  ++a->g_17;
  return a->g_3.s4;
}

__kernel void F(__global ulong* a, __global int* b) {
  int c;
  struct S2 d;
  struct S2* e = &d;
    struct S2 f = {
        (int16)((-7L), (int4)((-7L), (int2)((-7L), 0x02FF40FCL), 0x02FF40FCL), 0x02FF40FCL, (-7L), 0x02FF40FCL, (int2)((-7L), 0x02FF40FCL), (int2)((-7L), 0x02FF40FCL), (-7L), 0x02FF40FCL, (-7L), 0x02FF40FCL),
        {0x6D26586BL,0x6D26586BL,0x6D26586BL,0x6D26586BL,0x6D26586BL,0x6D26586BL,0x6D26586BL,0x6D26586BL,0x6D26586BL},
        0xC0726272L,
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
    d = f;
    barrier(1 | 2);
    E(e);
    barrier(1 | 2);
    ulong g = 0xFFFFFFFFFFFFFFFFUL;
    int h = 0;
    A(&g, e->g_3.s0);
    A(&g, e->g_3.s1);
    A(&g, e->g_3.s2);
    A(&g, e->g_3.s3);
    A(&g, e->g_3.s4);
    A(&g, e->g_3.s5);
    A(&g, e->g_3.s6);
    A(&g, e->g_3.s7);
    A(&g, e->g_3.s8);
    A(&g, e->g_3.s9);
    A(&g, e->g_3.sa);
    A(&g, e->g_3.sb);
    A(&g, e->g_3.sc);
    A(&g, e->g_3.sd);
    A(&g, e->g_3.se);
    A(&g, e->g_3.sf);
    for (c = 0; c < 9; c++) {
      A(&g, e->g_13[c]);
    }
    A(&g, e->g_17);
    a[C()] = g ^ 0xFFFFFFFFFFFFFFFFUL;
}