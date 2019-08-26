kernel void A(global float4* a, global float4* b, local float* c, global float* d, uint e, float f) {
  uint g = get_local_size(0);
  uint h = get_num_groups(0);

  uint i = get_global_id(0);
  uint j = get_global_id(1);
  uint k = get_local_id(0);
  uint l = get_group_id(0);

  uint m = 1;

  int4 n = (int4)(2 * i) < (int4)(e);
  float4 o = ((n) ? (a[j * e + 2 * i] * f) : ((float4)(0.f)));
  n = (int4)(2 * i + 1) < (int4)(e);
  float4 p = ((n) ? (a[j * e + 2 * i + 1] * f) : ((float4)(0.f)));

  o.y += o.x;
  o.z += o.y;
  o.w += o.z;
  p.y += p.x;
  p.z += p.y;
  p.w += p.z;

  c[2 * k] = o.w;
  c[2 * k + 1] = p.w;

  for (uint q = g; q > 0; q >>= 1) {
    barrier(1);
    if (k < q) {
      uint r = m * (2 * k + 1) - 1;
      uint s = m * (2 * k + 2) - 1;
      c[s] += c[r];
    }
    m <<= 1;
  }

  if ((h != 1) && (k == g - 1))
    d[j * h + l] = c[2 * k + 1];

  if (k == (g - 1))
    c[2 * k + 1] = 0.f;

  for (uint q = 1; q < (2 * g); q <<= 1) {
    m >>= 1;
    barrier(1);
    if (k < q) {
      uint r = m * (2 * k + 1) - 1;
      uint s = m * (2 * k + 2) - 1;
      float t = c[r];
      c[r] = c[s];
      c[s] += t;
    }
  }
  barrier(1);

  if ((2 * i) < e) {
    o += c[2 * k];
    b[j * e + 2 * i] = o;
  }

  if ((2 * i + 1) < e) {
    p += c[2 * k + 1];
    b[j * e + 2 * i + 1] = p;
  }
}
kernel void B(global float* a, global float4* b, uint c) {
  uint d = get_num_groups(0);

  uint e = get_global_id(0);
  uint f = get_global_id(1);
  uint g = get_group_id(0);

  float h = a[f * (d + 1) + g];

  if (e < c)
    b[f * c + e] += h;
}