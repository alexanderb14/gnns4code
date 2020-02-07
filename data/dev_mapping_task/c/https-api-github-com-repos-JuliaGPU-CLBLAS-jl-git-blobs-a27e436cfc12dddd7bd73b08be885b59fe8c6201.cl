__kernel void A(__global float4* a, __local float* b, __global float* c) {
  float d;
  float4 e, f, g;
  uint h, i;

  h = get_global_id(0) * 2;
  e = a[h];
  f = a[h + 1];
  g = e + f;

  i = get_local_id(0);
  b[i] = g.s0 + g.s1 + g.s2 + g.s3;
  barrier(1);

  if (get_local_id(0) == 0) {
    d = 0.0f;
    for (int j = 0; j < (int)get_local_size(0); j++) {
      d += b[j];
    }
    c[get_group_id(0)] = d;
  }
}