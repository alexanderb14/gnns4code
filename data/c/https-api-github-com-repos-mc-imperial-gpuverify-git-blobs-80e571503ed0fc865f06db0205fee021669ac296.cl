__kernel void A() {
  __local int a[32][32];

  a[get_local_id(1)][get_local_id(0)] = 2;
}