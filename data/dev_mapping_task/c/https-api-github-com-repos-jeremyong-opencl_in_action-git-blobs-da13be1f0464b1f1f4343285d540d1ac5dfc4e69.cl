__kernel void A(__global float4* a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f) {
  a[0] = (float4)(-0.15f, -0.15f, 1.00f, -0.15f);
  a[1] = (float4)(0.15f, 1.00f, 0.15f, 0.15f);
  a[2] = (float4)(1.00f, 0.15f, -0.15f, 1.00f);

  b[0] = (float4)(0.00f, 0.00f, 0.00f, 0.25f);
  b[1] = (float4)(0.00f, 0.00f, 0.50f, 0.00f);
  b[2] = (float4)(0.00f, 0.75f, 0.00f, 0.00f);

  c[0] = (float4)(-0.30f, -0.30f, 0.00f, -0.30f);
  c[1] = (float4)(0.30f, 0.00f, 0.30f, 0.30f);
  c[2] = (float4)(0.00f, 0.30f, -0.30f, 0.00f);

  d[0] = (float4)(0.00f, 0.00f, 0.00f, 0.00f);
  d[1] = (float4)(0.25f, 0.00f, 0.00f, 0.50f);
  d[2] = (float4)(0.00f, 0.00f, 0.75f, 0.00f);

  e[0] = (float4)(-0.45f, -0.45f, -1.00f, -0.45f);
  e[1] = (float4)(0.45f, -1.00f, 0.45f, 0.45f);
  e[2] = (float4)(-1.00f, 0.45f, -0.45f, -1.00f);

  f[0] = (float4)(0.00f, 0.00f, 0.00f, 0.00f);
  f[1] = (float4)(0.00f, 0.25f, 0.00f, 0.00f);
  f[2] = (float4)(0.50f, 0.00f, 0.00f, 0.75f);
}