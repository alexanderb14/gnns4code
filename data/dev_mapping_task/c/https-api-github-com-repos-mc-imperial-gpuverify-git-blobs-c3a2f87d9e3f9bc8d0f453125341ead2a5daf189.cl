__kernel void A() {
  __local int a[65];

  a[get_local_id(0)] = 2;

  barrier(1);

  int b = a[get_local_id(0) + 1];
}