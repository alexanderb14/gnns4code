__kernel void A(__global float4* a, __global float4* b, __global float* c, __local float4* d) {
  int e = get_global_id(0);
  int f = get_local_id(0);
  int g = get_local_size(0);

  d[f] = a[e] * b[e];
  barrier(1);

  for (int h = g / 2; h > 0; h >>= 1) {
    if (f < h) {
      d[f] += d[f + h];
    }
    barrier(1);
  }

  if (f == 0) {
    c[get_group_id(0)] = dot(d[0], (float4)(1.0f));
  }
}