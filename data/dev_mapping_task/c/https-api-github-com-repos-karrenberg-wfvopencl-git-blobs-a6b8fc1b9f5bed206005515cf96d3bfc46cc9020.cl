__kernel void A(__global float* a, __global float* b, __local float* c) {
  int d = get_global_id(0);
  int e = get_local_id(0);

  c[e] = a[d];

  barrier(1);

  for (unsigned f = 0; f < 10; ++f) {
    c[e] += 1.f;

    barrier(1);

    if (e != 0)
      c[e] += c[e - 1];

    barrier(1);
  }
  b[d] = c[e];
}