kernel void A(global uint a[]) {
  a[0] = 0;
}

kernel void B(global uint a[]) {
  const size_t b = get_local_id(0);
  a[b] = b;
}

kernel void C(global uint a[]) {
  const size_t b = get_global_id(0);
  a[b] = b;
}

kernel void D(global uint a[], global const uint b[]) {
  a[0] = b[0];
}

kernel __attribute__((reqd_work_group_size(256, 1, 1))) void E(global uint a[]) {
  a[0] = 0;
}

kernel __attribute__((reqd_work_group_size(192, 1, 1))) void F(global uint a[]) {
  a[0] = 0;
}

kernel __attribute__((reqd_work_group_size(128, 1, 1))) void G(global uint a[]) {
  a[0] = 0;
}

kernel __attribute__((reqd_work_group_size(64, 1, 1))) void H(global uint a[]) {
  a[0] = 0;
}