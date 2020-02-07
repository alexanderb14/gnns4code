typedef double special_func_scalar_type; special_func_scalar_type A(special_func_scalar_type a, __constant const special_func_scalar_type* b, int c) {
  special_func_scalar_type d;
  int e;
  __constant const special_func_scalar_type* f;

  f = b;
  d = *f++;
  e = c;

  do
    d = d * a + *f++;
  while (--e);

  return (d);
}

special_func_scalar_type B(special_func_scalar_type a, __constant const special_func_scalar_type* b, int c) {
  special_func_scalar_type d;
  __constant const special_func_scalar_type* e;
  int f;

  e = b;
  d = a + *e++;
  f = c - 1;

  do
    d = d * a + *e++;
  while (--f);

  return (d);
}

special_func_scalar_type C(__constant const special_func_scalar_type* a, __constant const special_func_scalar_type* b, special_func_scalar_type c, int d) {
  special_func_scalar_type e, f;
  if (c <= 1) {
    e = a[d - 1];
    f = b[d - 1];
    for (int g = (int)d - 2; g >= 0; --g) {
      e *= c;
      f *= c;
      e += a[g];
      f += b[g];
    }
  } else {
    c = 1 / c;
    e = a[0];
    f = b[0];
    for (unsigned g = 1; g < d; ++g) {
      e *= c;
      f *= c;
      e += a[g];
      f += b[g];
    }
  }
  return e / f;
}