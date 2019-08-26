__kernel void A(__global float4* a, __global float4* b, __local float4* c) {
  uint d = get_global_size(0);

  uint e = get_group_id(0);
  uint f = get_group_id(1);

  uint g = get_num_groups(0);

  uint h = e;
  uint i = (e + f) % g;

  uint j = get_local_id(0);
  uint k = get_local_id(1);

  uint l = get_local_size(0);

  uint m = i * l + j;
  uint n = h * l + k;
  int o = m + (n)*d * 4;

  int p = k * l * 4 + j;
  c[p] = b[o];
  c[p + l] = b[o + d];
  c[p + l * 2] = b[o + d * 2];
  c[p + l * 3] = b[o + d * 3];

  barrier(1);

  m = h * l + j;
  n = i * l + k;
  int q = m + (n)*d * 4;

  p = j * l * 4 + k;
  float4 r = c[p];
  float4 s = c[p + l];
  float4 t = c[p + l * 2];
  float4 u = c[p + l * 3];

  a[q] = (float4)(rx, sx, tx, ux);
  a[q + d] = (float4)(ry, sy, ty, uy);
  a[q + d * 2] = (float4)(rz, sz, tz, uz);
  a[q + d * 3] = (float4)(rw, sw, tw, uw);
}