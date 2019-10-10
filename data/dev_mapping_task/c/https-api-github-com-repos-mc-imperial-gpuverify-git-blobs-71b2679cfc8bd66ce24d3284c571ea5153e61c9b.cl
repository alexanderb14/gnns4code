__kernel void A() {
  __local int a;

  a = get_local_id(0);
}