__kernel void A(__local float* a, __local float* b) {
  __local float* c;

  __local float* d;

  c = a;

  d = b;

  for (int e = 0; e < 100; e++) {
    c[get_local_id(0)] = c[get_local_id(0)] + 1.0f;
  }

  barrier(1);

  for (int e = 0; e < 100; e++) {
    d[get_local_id(0)] = d[get_local_id(0)] + 1.0f;
  }
}