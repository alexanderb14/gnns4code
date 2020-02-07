constant uint Ga[4] = {42, 13, 0, 5};
uint A(constant uint* a) {
  return a[get_local_id(0)];
}
void kernel __attribute__((reqd_work_group_size(4, 1, 1))) B(global uint* a) {
  *a = A(Ga);
}