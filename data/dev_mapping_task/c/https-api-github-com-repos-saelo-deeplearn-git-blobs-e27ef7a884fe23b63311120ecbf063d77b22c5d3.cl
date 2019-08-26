kernel void A(uint a, global const float* b, global const float* c, global float* d) {
  uint e = get_global_id(0);
  if (e < a) {
    d[e] = pown((b[e] - c[e]), 2);
  }
}