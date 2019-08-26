__kernel void A() {
  local int a[64];
  ((local char*)a)[get_global_id(0)] = get_global_size(0);
}