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
  int g_4;
  int** volatile g_5;
  int* g_8[5][7];
  int** volatile g_7;
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

long E(struct S1* a);
long E(struct S1* a) {
  int* b[9] = {&ag_4, &ag_4, &ag_4, &ag_4, &ag_4, &ag_4, &ag_4, &ag_4, &ag_4};
  int** c = &b[4];
  int** d = (void*)0;
  int e;
  (*a->g_7) = ((*c) = (void*)0);
  rfrn fff_fnf f_fulof, faf fbe;
ftf f[f1f   b_if)],
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
A(&h, f->g_4);
a[C()] = h ^ 0xFFFFFFFFFFFFFFFFUL;
}