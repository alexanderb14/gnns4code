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

struct S5 {
  char g_9;
  char* g_8;
  char** g_7[1][1][9];
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

ushort E(struct S5* a);
char** F(uchar a, char** b, long c, struct S5* d);
ushort E(struct S5* a) {
  uint b[7];
  char*** c = &a->g_7[0][0][4];
  int d;
  for (d = 0; d < 7; d++)
    b[d] = 0x6F1860ECL;
  (*c) = F(b[6], a->g_7[0][0][4], a->g_9, a);
  return b[5];
}

char** F(uchar a, char** b, long c, struct S5* d) {
  char** e = &d->g_8;
  for (d->g_9 = 0; (d->g_9 <= 18); d->g_9++)
    b f = 0xBD017g;
b*g[6g = {
    {
      d b fg gurnb ggeturn e;gneb_gg*gg igb grgbceggeg_g)g    bl_ig]gb[getgidbup_ggg    b[geb b[gegoup_idg,
  f
 gh= c_2g   barrier(1 | 2);
 E(g);
    barrier(1 | 2);
    ulong i = 0xFFFFFFFFFFFFFFFFUL;
    int j = 0;
    A(&i, g->g_9);
    a[C()] = i ^ 0xFFFFFFFFFFFFFFFFUL;
    }