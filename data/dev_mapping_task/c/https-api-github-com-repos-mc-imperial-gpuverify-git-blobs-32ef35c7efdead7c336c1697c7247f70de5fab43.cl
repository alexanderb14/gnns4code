__kernel void A(__local int* a, int b) {
  a[get_local_id(0) + 1] = 42;
  __local char* c = (__local char*)a;
  atomic_add((__local int*)(c + 1), b);
}