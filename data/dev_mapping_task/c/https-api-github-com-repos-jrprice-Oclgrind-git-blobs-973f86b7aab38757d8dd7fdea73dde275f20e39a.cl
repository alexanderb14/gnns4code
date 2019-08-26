struct S {
  int a;
  char b[2];
};

kernel void A(global char* a) {
  volatile struct S b = {-1, {42, 7}};
  int c = get_global_id(0);
  b.b[c] = c;
  a[c] = b.b[c];
}