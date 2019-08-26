__kernel void A(void) {
  size_t a = get_global_id(0);
  a++;
}