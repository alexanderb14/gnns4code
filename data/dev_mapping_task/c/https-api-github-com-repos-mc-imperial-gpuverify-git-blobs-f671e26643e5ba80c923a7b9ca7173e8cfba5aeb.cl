__kernel void A() {
  __local float a[64][64][64];

  a[get_local_id(2)][get_local_id(1)][get_local_id(0)] = get_local_id(0);
}