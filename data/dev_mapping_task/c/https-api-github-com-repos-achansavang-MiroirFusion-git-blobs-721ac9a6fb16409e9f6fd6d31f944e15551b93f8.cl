__kernel void A() {
  const int a = get_global_id(0);
  const int b = get_global_id(1);
}