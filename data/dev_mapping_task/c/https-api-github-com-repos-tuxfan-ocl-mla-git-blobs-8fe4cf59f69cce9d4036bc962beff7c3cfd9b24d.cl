void A(unsigned a, unsigned b, __local unsigned* c, __local unsigned* d); void B(unsigned a, __local unsigned* b, unsigned c, __local unsigned* d); void A(unsigned a, unsigned b, __local unsigned* c, __local unsigned* d) {
  unsigned e = c[a];

  d[a] = c[a];

  if (a > 0) {
    d[a] += c[a - 1];
  }

  barrier(1);

  for (size_t f = 2; f < b; f *= 2) {
    B(a, d, f, c);
    d[a] = c[a];
    barrier(1);
  }

  d[a] = c[a] - e;
}

void B(unsigned a, __local unsigned* b, unsigned c, __local unsigned* d) {
  d[a] = b[a];

  if (a >= c) {
    d[a] += b[a - c];
  }

  barrier(1);
}