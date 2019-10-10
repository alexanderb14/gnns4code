kernel void A(global float4* a, global float* b, local float* c, uint d) {
  uint e = get_local_size(0);
  uint f = get_num_groups(0);

  uint g = get_global_id(0);
  uint h = get_global_id(1);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uint k = g << 1;
  int4 l = (uint4)(k) < (uint4)(d);
  float4 m = ((l) ? (a[h * d + k]) : ((float4)(__builtin_inff())));
  l = (uint4)(k + 1) < (uint4)(d);
  float4 n = ((l) ? (a[h * d + k + 1]) : ((float4)(__builtin_inff())));

  float2 o = fmin(m.lo, m.hi);
  float2 p = fmin(n.lo, n.hi);

  c[(i << 1)] = fmin(o.x, o.y);
  c[(i << 1) + 1] = fmin(p.x, p.y);

  for (uint q = e; q > 0; q >>= 1) {
    barrier(1);
    if (i < q)
      c[i] = fmin(c[i], c[i + q]);
  }

  if (i == 0)
    b[h * f + j] = c[0];
}
kernel void B(global uint4* a, global uint* b, local uint* c, uint d) {
  uint e = get_local_size(0);
  uint f = get_num_groups(0);

  uint g = get_global_id(0);
  uint h = get_global_id(1);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uint k = g << 1;
  int4 l = (uint4)(k) < (uint4)(d);
  uint4 m = ((l) ? (a[h * d + k]) : ((uint4)(0)));
  l = (uint4)(k + 1) < (uint4)(d);
  uint4 n = ((l) ? (a[h * d + k + 1]) : ((uint4)(0)));

  uint2 o = ((m.lo > m.hi) ? (m.lo) : (m.hi));
  uint2 p = ((n.lo > n.hi) ? (n.lo) : (n.hi));

  c[(i << 1)] = ((o.x > o.y) ? (o.x) : (o.y));
  c[(i << 1) + 1] = ((p.x > p.y) ? (p.x) : (p.y));

  for (uint q = e; q > 0; q >>= 1) {
    barrier(1);
    if (i < q)
      c[i] = ((c[i] > c[i + q]) ? (c[i]) : (c[i + q]));
  }

  if (i == 0)
    b[h * f + j] = c[0];
}
kernel void C(global float4* a, global float* b, local float* c, uint d) {
  uint e = get_local_size(0);
  uint f = get_num_groups(0);

  uint g = get_global_id(0);
  uint h = get_global_id(1);
  uint i = get_local_id(0);
  uint j = get_group_id(0);

  uint k = g << 1;
  int4 l = (uint4)(k) < (uint4)(d);
  float4 m = ((l) ? (a[h * d + k]) : ((float4)(0.f)));
  l = (uint4)(k + 1) < (uint4)(d);
  float4 n = ((l) ? (a[h * d + k + 1]) : ((float4)(0.f)));

  c[(i << 1)] = dot(m, (float4)(1.f));
  c[(i << 1) + 1] = dot(n, (float4)(1.f));

  for (uint o = e; o > 0; o >>= 1) {
    barrier(1);
    if (i < o)
      c[i] += c[i + o];
  }

  if (i == 0)
    b[h * f + j] = c[0];
}