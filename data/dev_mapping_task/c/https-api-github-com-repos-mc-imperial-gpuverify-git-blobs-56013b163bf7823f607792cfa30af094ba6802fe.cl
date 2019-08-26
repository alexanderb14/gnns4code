__kernel void A(__local int* a, int b) {
  int c = get_local_id(0);
  a[c] += a[c + b];
}