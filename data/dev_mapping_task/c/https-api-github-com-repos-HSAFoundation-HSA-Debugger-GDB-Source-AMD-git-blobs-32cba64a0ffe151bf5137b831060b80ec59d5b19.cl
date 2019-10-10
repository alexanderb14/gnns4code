__kernel void A(__global int* a) {
  a[get_global_id(0)] = 0x1;
}