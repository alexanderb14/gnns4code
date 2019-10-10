void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a, uint b) {
  a[get_group_id(b)] = get_group_id(3);
}