__kernel void A(__global ulong* a, __local ulong* b) {
  a[get_global_id(0)] = (ulong)(b);
  a[get_global_id(0) + 1] = (ulong)(b + 1);
  a[get_global_id(0) + 2] = (ulong)(a);
  a[get_global_id(0) + 3] = (ulong)(a + 1);
}

__kernel void B(__global ulong* a) {
  a[get_global_id(0) + 2] = a[get_global_id(0)];
  a[get_global_id(0) + 3] = a[get_global_id(0) + 1];
}