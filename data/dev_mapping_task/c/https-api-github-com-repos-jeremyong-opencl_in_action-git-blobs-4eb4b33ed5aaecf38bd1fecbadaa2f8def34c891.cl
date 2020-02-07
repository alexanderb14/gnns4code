__kernel void A(__global float* a, __local float* b, __global float* c) {
  int d = get_local_id(0);
  int e = get_local_size(0);

  b[d] = a[get_global_id(0)];
  barrier(1);

  for (int f = e / 2; f > 0; f >>= 1) {
    if (d < f) {
      b[d] += b[d + f];
    }
    barrier(1);
  }

  if (d == 0) {
    c[get_group_id(0)] = b[0];
  }
}

__kernel void B(__global float4* a, __local float4* b, __global float* c) {
  int d = get_local_id(0);
  int e = get_local_size(0);

  b[d] = a[get_global_id(0)];
  barrier(1);

  for (int f = e / 2; f > 0; f >>= 1) {
    if (d < f) {
      b[d] += b[d + f];
    }
    barrier(1);
  }

  if (d == 0) {
    c[get_group_id(0)] = dot(b[0], (float4)(1.0f));
  }
}