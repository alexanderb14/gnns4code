__kernel void A(const uint a, const char b, __global char* c, const uint d) {
  __global char* e = c + d;
  for (uint f = get_global_id(0); f < (a); f += get_global_size(0)) {
    e[f] = b;
  }
}
__kernel void B(float a) {
  float b = a;
}