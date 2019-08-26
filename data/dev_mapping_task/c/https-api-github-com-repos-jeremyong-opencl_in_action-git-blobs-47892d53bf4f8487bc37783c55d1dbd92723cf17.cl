__kernel void A(__global float4* a, __local float4* b) {
  int c = get_local_id(0);
  int d = get_local_size(0);

  b[c] = a[get_global_id(0)];
  barrier(1);

  for (int e = d / 2; e > 0; e >>= 1) {
    if (c < e) {
      b[c] += b[c + e];
    }
    barrier(1);
  }

  if (c == 0) {
    a[get_group_id(0)] = b[0];
  }
}

__kernel void B(__global float4* a, __local float4* b, __global float* c) {
  int d = get_local_id(0);
  int e = get_local_size(0);

  b[d] = a[get_local_id(0)];
  barrier(1);

  for (int f = e / 2; f > 0; f >>= 1) {
    if (d < f) {
      b[d] += b[d + f];
    }
    barrier(1);
  }

  if (d == 0) {
    *c = b[0].s0 + b[0].s1 + b[0].s2 + b[0].s3;
  }
}