void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a, global uint* b) {
  local uint c;

  c = *a;

  *b = c;
}