__kernel void A(__global float* a, __global float* b, __local float* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);

  c[e] = a[d];

  barrier(1);

  b[d] = (e >= get_local_size(0) - 4) ? 0.f : c[e + 4];
}