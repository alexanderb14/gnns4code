void A(int* a) {
  *a += 1;
}

int B() {
  int a = 0;
  A(&a);
  return a;
}

kernel void C(global int* a, int b) {
  int c = 0;
  for (int d = 0; d < b; d++) {
    c += B();
  }
  a[get_global_id(0)] = c;
}