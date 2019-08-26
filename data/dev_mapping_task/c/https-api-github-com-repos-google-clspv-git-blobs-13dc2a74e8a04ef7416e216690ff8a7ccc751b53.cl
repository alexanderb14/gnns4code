void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a, uint b) {
  a[get_local_size(b)] = get_local_size(3);
}