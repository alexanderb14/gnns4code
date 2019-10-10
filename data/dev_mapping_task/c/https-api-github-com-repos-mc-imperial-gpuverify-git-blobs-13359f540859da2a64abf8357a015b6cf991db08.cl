__kernel void A(__global float* a, __global float* b) {
  __global float* c;

  c = a + 10;

  for (int d = 0; d < 100; d++) {
    c[get_global_id(0)] = c[get_global_id(0)] + 1.0f;
  }
}