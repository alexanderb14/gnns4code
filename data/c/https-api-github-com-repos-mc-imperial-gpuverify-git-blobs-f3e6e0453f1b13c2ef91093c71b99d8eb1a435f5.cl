__kernel void A() {
  local int a[10][10];
  a[-1 * get_local_id(0)][get_global_id(1)] = get_global_size(0);
}