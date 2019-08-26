kernel void A() {
  atomic_add((__global int*)0, 1);
}