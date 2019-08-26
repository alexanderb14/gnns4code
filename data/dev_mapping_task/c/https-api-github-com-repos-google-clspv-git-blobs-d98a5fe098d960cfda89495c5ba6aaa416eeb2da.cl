void kernel __attribute__((reqd_work_group_size(42, 13, 5))) A(global uint* a) {
  a[0] = get_local_size(0);
  a[1] = get_local_size(1);
  a[2] = get_local_size(2);
  a[3] = get_local_size(3);
}

void kernel __attribute__((reqd_work_group_size(42, 13, 5))) B(global uint* a) {
  a[0] = get_local_size(0);
  a[1] = get_local_size(1);
  a[2] = get_local_size(2);
  a[3] = get_local_size(3);
}