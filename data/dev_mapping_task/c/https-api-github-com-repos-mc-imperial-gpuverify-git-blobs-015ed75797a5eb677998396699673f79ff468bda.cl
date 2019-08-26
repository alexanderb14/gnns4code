__kernel void A(__global float* a, __global float* b) {
  __global float* c;

  __global float* d;

  c = a;

  d = b;

  for (int e = 0; e < 100; e++) {
    c[get_global_id(0)] = c[get_global_id(0)] + 1.0f;
  }

  barrier(2);

  for (int e = 0; e < 100; e++) {
    d[get_global_id(0)] = d[get_global_id(0)] + 1.0f;
  }
}