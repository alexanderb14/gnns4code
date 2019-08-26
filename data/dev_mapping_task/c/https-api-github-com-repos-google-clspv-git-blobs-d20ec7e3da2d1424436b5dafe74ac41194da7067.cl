void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a) {
  local uint b[5];
  *a = 5;
}