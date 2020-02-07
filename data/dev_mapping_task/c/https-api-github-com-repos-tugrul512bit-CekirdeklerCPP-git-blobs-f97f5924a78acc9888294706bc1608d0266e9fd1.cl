uint A(uint a) {
  a = (a ^ 61) ^ (a >> 16);
  a *= 9;
  a = a ^ (a >> 4);
  a *= 0x27d4eb2d;
  a = a ^ (a >> 15);
  return a;
}

unsigned int B(__global unsigned int* a, int b) {
  uint c = A(a[b]);
  a[b] = c;
  return c;
}

unsigned int C(__global unsigned int* a, int b) {
  uint c = A(a[b]);

  atomic_xchg(&a[b], c);
  return c;
}

void kernel D(global unsigned int* a) {
  int b = get_global_id(0);
  unsigned int c = 0;
  c--;

  unsigned int d = C(a, b);

  if (d < c / 2) {
    C(a, b);

    C(a, b);
  }
}