__kernel void A(__global float* a, __global float* b, unsigned c) {
  __local float d[1024];

  d[get_local_id(0)] = a[get_local_id(0)];
  for (int e = get_local_id(0) + 1024; e < c; e += 1024) {
    d[e] += a[e];
  }

  for (int f = 1024 / 2; f > 0; f >>= 1) {
    if (get_local_id(0) < f) {
      d[get_local_id(0)] += d[get_local_id(0) + f];
    }
  }

  if (get_local_id(0) == 0) {
    *b = d[0];
  }
}