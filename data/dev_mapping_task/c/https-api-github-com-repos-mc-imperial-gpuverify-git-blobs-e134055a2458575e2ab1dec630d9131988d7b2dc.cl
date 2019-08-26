__kernel void A(__local float* a, __local float* b) {
  __local float* c;

  c = a + 10;

  for (int d = 0; d < 100; d++) {
    c[get_local_id(0)] = c[get_local_id(0)] + 1.0f;
  }
}