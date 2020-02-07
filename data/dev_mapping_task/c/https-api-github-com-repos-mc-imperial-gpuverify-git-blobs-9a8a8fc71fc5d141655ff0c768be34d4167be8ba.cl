kernel void A(local float* a, global float* b) {
  atomic_xchg(a, 10.0f);
  atomic_xchg(b, 10.0f);
}