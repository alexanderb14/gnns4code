__kernel void A() {
  char *a, *b;

  b = ((void*)0);
  a = b + 5;

  if (a >= 0)
    a = ((void*)0);

  a = a;

  a[5] = 'a';
}