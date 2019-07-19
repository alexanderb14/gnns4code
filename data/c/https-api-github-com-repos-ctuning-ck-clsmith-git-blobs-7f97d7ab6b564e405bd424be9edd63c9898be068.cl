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
  char f0;
  uchar f1;
};

struct S3 {
  int g_4;
  int* volatile g_3;
  uint v_collective;
  ulong global_0_offset;
  ulong global_1_offset;
  ulong global_2_offset;
  ulong local_0_offset;
  ulong local_1_offset;
  ulong local_2_offset;
  ulong group_0_offset;
  ulong group_1_offset;
  ulong group_2_offset;
  __local volatile uint* l_atomic_reduction;
  __global volatile uint* g_atomic_reduction;
};

uint E(struct S3* a);
uint E(struct S3* a) {
  ulong b[2][6][9] = {{{0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L}},
                      {{0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L},
                       {0UL, 0x6F49C23EDB39523DL, 0xEB2391CB4E76AB2AL, 0x6F49C23EDB39523DL, 0UL, 0x47C9D5FAC12265E3L, 0x1342F3D47941CE3CL, 0x78213AF72B5725D3L, 0xA5B0420410224968L}}};
  struct S0 c = {-1L, 0xDCL};
  struct S0* d = &c;
  int e, f, g;
  (*a->g_3) = b[1][2][5];
  (*d) = c;
  return c.f0;
}

__kernel void F(__global ulong* a, __global volatile int* b, __global int* c) {
  int d;
  __local volatile uint e[1];
  if (D() == 0)
    for (d = 0; d < 1; d++)
      e[d] = 0;
  struct S3 f;
  struct S3* g = &f;
    struct S3 h = {
        1L,
        &gg_4,
        0,
        cd(0)],
        cd(1)],
        cd(2)],
        c(0)],
        c(1)],
        c(2)],
        c(0)],
        c(1)],
        c(2)],fb= h;
    barrier(1 | 2);
    E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    A(&i, g->g_4);
    A(&i, g->v_collective);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
}