__kernel void A(__global float* a) {
  if (get_group_id(0) == 0) {
    a[get_local_id(0)] = 42.f;
  }
}