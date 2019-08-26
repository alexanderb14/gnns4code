__kernel void A(__local int* a, __local int* b) {
  int c = get_local_id(0);
  int d = a[c];
  atomic_add(b + d, 1);
}