__kernel void A(__global ulong8* a, __global long8* b) {
  int c = get_global_id(0);
  b[c] = !a[c];
}