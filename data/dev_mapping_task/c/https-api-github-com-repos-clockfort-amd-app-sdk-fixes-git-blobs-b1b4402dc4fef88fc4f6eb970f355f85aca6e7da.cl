__kernel void A() {
  size_t a = get_global_id(0);
  size_t b = get_global_id(1);
}