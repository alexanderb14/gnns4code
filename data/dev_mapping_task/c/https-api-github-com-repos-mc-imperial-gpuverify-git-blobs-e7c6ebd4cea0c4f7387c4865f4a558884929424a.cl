__kernel void A() {
  local int a[10][10][10];
  a[get_global_id(0)][get_local_id(1)][get_local_id(2)] = get_group_id(0);
}