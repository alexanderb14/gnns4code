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
  int g_3;
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

short E(struct S3* a);
short E(struct S3* a) {
  int* bgaaaaia = aa(4294967295UL, (uint4)(4294967295UL, (uint2)(4294967295UL, 0x15F84255L), 0x15F84255L), 0x15F84255L, 4294967295UL, 0x15F84255L);
  ushort h = 3UL;
  int i, j, k;
  ++g.s6;
  for (a->g_3 = 0; (a->g_3 > 22); a->g_3 = safe_add_func_int16_t_s_s(a->g_3, 9)) {
    if (h)
      break;
  }
  return a->g_3;
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S3 c;
  struct S3* d = &c;
    struct S3 e = {
        0x479E672CL,
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
    c = e;
    barrier(1 | 2);
    E(d);
    barrier(1 | 2);
    ulong f = 0xFFFFFFFFFFFFFFFFUL;
    int g = 0;
    A(&f, d->g_3);
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}