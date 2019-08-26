__kernel void A(__global short* a) {
  int b = (int)get_global_id(0);
  a[b] = (short)b;
}