__kernel void A(__global char* a) {
  int b = (int)get_global_id(0);
  a[b] = (char)b;
}