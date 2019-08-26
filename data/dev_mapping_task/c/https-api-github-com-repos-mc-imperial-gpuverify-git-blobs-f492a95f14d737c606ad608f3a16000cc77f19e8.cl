__kernel void A(local int* a) {
  int b = get_local_id(0);
  unsigned int c = b & 31;

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