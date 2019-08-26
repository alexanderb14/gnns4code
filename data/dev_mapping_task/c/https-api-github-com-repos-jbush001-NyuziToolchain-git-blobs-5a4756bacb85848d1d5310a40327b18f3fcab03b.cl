void A(global int* a, int b) {
  *a = __builtin_clz(b);
}

void B(global long* a, long b) {
  *a = __builtin_clzl(b);
}