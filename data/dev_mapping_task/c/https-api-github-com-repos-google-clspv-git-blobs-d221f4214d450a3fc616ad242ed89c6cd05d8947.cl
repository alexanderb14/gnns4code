void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a) {
  a[get_global_id(0)] = 42;
}