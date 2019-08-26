__kernel void A(float a) {
  float b = a;
}

__kernel void B(const int a, const char b, __global char* c, const int d) {
  for (int e = get_global_id(0); e < a; e += get_global_size(0)) {
    c[e + d] = b;
  }
}