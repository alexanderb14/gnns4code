void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global uint* a) {
  uint b = *a;

  const bool c = (b < 42);

  if (c)

  {
    *a = 13;
  }
}