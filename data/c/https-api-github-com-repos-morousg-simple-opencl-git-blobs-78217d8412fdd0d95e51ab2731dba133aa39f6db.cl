__kernel void A(__global float* a, float b, __local float* c) {
  int d = get_local_id(0);
  int e = get_global_id(0);

  if (d == 0) {
    *c = b;
  }

  barrier(1);

  a[e] = a[e] * *c;

  barrier(2);
}