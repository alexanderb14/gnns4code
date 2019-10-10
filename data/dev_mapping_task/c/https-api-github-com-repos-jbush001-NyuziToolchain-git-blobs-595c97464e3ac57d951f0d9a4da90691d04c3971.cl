kernel void A(__global int* a, __constant int* b, __local int* c) {
  *a = *b + *c;
}