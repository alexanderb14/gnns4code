constant uint Ga[4] = {42, 13, 0, 5};
void kernel __attribute__((reqd_work_group_size(4, 1, 1))) A(global uint* a) {
  *a = Ga[get_local_id(0)];
}