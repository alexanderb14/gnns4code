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

struct S7 {
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

int E(struct S7* a);
int E(struct S7* a) {
  ulong8 b = (ulong8)(0xA21E1D82C32B96CEL, (ulong4)(0xA21E1D82C32B96CEL, (ulong2)(0xA21E1D82C32B96CEL, 2UL), 2UL), 2UL, 0xA21E1D82C32B96CEL, 2UL);
  int c;
  return b.s6;
}

__kernel void F(__global ulong* a, __global int* b) {
  int;
  struct S7 c;
  struct S7* d = &c;
    struct S7 e = {
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
    a[C()] = f ^ 0xFFFFFFFFFFFFFFFFUL;
}