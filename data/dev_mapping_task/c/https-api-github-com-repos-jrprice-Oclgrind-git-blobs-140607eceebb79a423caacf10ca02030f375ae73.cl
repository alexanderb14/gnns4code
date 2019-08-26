kernel void A(global int* a, global int* b) {
  global char* c = (global char*)a + 2;
  global int* d = (global int*)c;
  *b = *d;
}