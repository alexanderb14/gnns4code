void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a, uint b) {
  a[get_local_id(b)] = get_local_id(3);
}