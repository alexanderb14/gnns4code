kernel void A(global int* a) {
  local int b[64][64];

  b[get_local_id(1)][get_local_id(0)] = a[get_global_id(1) * get_global_size(1) + get_global_id(0)];

  b[get_local_id(1) + 1][get_local_id(0)]++;

  a[get_global_id(1) * get_global_size(1) + get_global_id(0)] = b[get_local_id(1)][get_local_id(0)];
}