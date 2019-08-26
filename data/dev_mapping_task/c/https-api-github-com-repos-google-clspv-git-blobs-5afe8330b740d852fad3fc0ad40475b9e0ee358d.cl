void kernel __attribute__((reqd_work_group_size(1, 1, 1))) A(global float* a) {
  const float b = *a;

  const bool c = (b <= 42.0f);

  const float d = c;

  *a = d;
}