__kernel void A() {
  local int a[8][8];
  a[get_local_id(0)][get_local_id(1)] = get_group_id(0);
}