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
  int g_3;
  int* g_2;
  int** volatile g_4[8][1][2];
  int** volatile g_5;
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
uint E(struct S1 * a)
i   uloniCC590di_5)i;
    retudobal ulong *ai_dilili iii,iSi idgiai]i i[i_glidticiii)],id[ged id[giid(2)],
d(0)],
        d(1)],
        d(2)],
    }
    ;
    h = j;
    barrier(1 | 2);
    E(i);
    barrier(1 | 2);
    ulong k = 0xFFFFFFFFFFFFFFFFUL;
    int l = 0;
    A(&k, i->g_3);
    a[C()] = k ^ 0xFFFFFFFFFFFFFFFFUL;
    }