__kernel void A(__global float4* a, __global int* b, float4 c, float4 d) {
  const int e = get_global_id(0);
  float3 f = a[e].xyz;
  if (any(isless(f, c.xyz)) || any(isgreater(f, d.xyz)))
    b[e] = 1;
}

__kernel void B(__global float4* a, __global int* b, float4 c) {
  const int d = get_global_id(0);
  float3 e = a[d].xyz;
  float3 f = c.xyz;
  float g = c.w * c.w;
  float3 h = e - f;
  if (dot(h, h) > g)
    b[d] = 1;
}

__kernel void C(__global float4* a, __global int* b, float c) {
  const int d = get_global_id(0);
  if (a[d].w < c)
    b[d] = 1;
}

__kernel void D(__global float4* a, __global float4* b, __global float* c, float d, float e, float4 f, float g, float h, float i) {
  const int j = get_global_id(0);
  float3 k = a[j].xyz;
  float l = a[j].w;
  float3 m = b[j].xyz;
  float n = b[j].w;
  float o = c[j];

  if (n < 0)
    i -= n;
  n += i;

  m += i * (d * l * f.xyz - e * o * f.xyz);
  k += i * m;

  o -= i * g * o;
  l -= i * h * l;

 a[j] = (flob[j] = (floanmc[j] = o;
}