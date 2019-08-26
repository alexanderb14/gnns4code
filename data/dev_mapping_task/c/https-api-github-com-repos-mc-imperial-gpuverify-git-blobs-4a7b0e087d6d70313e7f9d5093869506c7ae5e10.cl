__attribute__((always_inline)) inline void A(local int* a) {
  unsigned int b = get_local_id(0);
  unsigned int c = b % 32;

  if (c >= 1)
    a[b] = a[b - 1] + a[b];
  if (c >= 2)
    a[b] = a[b - 2] + a[b];
  if (c >= 4)
    a[b] = a[b - 4] + a[b];
  if (c >= 8)
    a[b] = a[b - 8] + a[b];
  if (c >= 16)
    a[b] = a[b - 16] + a[b];
}

__kernel void B(local int* a) {
  unsigned int b = get_local_id(0);
  unsigned int c = b % 32;
  local int d[32];
  A(a);
  barrier(1);
  if (c == 31)
    d[b / 32] = a[b];
  barrier(1);
  if (b / 32 == 0)
    A(d);
  barrier(1);
  a[b] += d[b / 32];
}