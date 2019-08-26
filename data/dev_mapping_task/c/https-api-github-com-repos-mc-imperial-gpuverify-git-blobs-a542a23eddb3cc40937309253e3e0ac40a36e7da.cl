__kernel void A(__local int* a, int b) {
  int c = get_local_id(0);
  int d = a[c + b];
  barrier(1);
  a[c] += d;
}