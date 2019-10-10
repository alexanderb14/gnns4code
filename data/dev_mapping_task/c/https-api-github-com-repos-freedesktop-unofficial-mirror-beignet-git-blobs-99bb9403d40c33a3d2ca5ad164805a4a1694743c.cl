__kernel void A(__global int* a, __global int* b) {
  b[get_local_size(0) * (2 * get_group_id(0)) + get_local_id(0)] = get_local_id(0);
  b[get_local_size(0) * (2 * get_group_id(0) + 1) + get_local_id(0)] = get_local_id(0);
  barrier(2);
  a[get_local_size(0) * (2 * get_group_id(0)) + get_local_id(0)] = b[get_local_size(0) * 2 * get_group_id(0) + get_local_size(0) - (get_local_id(0) + 1)];
  a[get_local_size(0) * (2 * get_group_id(0) + 1) + get_local_id(0)] = b[get_local_size(0) * (2 * get_group_id(0) + 1) + get_local_size(0) - (get_local_id(0) + 1)];
}