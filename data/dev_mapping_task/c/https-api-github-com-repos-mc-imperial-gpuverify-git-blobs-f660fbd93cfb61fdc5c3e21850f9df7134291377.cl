__kernel void A() {
  local int a[25];
  a[get_global_id(0)] = get_global_size(0);
}