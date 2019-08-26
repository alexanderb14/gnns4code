__kernel void A(__global int* a, char b, short c, int d) {
  int e = (int)get_global_id(0);
  a[e] = b + c + d;
}