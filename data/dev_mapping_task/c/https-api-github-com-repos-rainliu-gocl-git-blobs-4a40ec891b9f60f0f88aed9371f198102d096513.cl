__kernel void A(__global int* a) {
  __local int b, c;

  b = 0;
  c = 0;

  b++;

  atomic_add(&c, 1);

  a[0] = b;
  a[1] = c;
}