void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a, global uint* b) {
  uint c = *a;

  const bool d = (c > 42);

  if (d) {
    *a = 13;
  } else {
    *b = 5;
  }
}