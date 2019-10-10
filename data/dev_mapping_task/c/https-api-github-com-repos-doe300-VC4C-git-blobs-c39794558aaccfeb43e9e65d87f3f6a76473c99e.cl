__kernel void A(__global char* a, __global char2* b) {
  int c = get_global_id(0);
  char d = a[c];

  b[c] = (char2)d;
}