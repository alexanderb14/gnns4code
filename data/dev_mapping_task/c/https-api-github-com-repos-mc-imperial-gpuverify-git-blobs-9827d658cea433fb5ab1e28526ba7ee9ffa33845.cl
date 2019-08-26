__kernel void A(__local int* a) {
  int b = get_local_id(0);
  int c = b / 32;
  __local int* d = a + (c * 32);
  a[b] = d[(b + 1) % 32];
}