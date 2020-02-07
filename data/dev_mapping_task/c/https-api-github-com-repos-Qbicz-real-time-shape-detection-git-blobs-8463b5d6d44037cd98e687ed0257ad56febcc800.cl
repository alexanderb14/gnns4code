__kernel void A(__global float4* a, __local float* b, __global float* c) {
  float d;
  float4 e, f, g;

  float16 h;

  uint i, j;

  i = get_global_id(0) * 2;
  e = a[i];
  f = a[i + 1];
  g = e + f;

  j = get_local_id(0);
  b[j] = g.s0 + g.s1 + g.s2 + g.s3;
  barrier(1);

  if (get_local_id(0) == 0) {
    d = 0.0f;
    for (int k = 0; k < get_local_size(0); k++) {
      d += b[k];
    }
    c[get_group_id(0)] = d;
  }
}