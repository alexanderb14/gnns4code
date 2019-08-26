__kernel void A(__global const float4* a, __global float4* b) {
  int c = get_global_id(0);
  float4 d = a[c];
  b[c] = d;
}

__kernel void B(__global const float4* a, __global const float4* b, __global float4* c) {
  int d = get_global_id(0);
  float4 e = a[d];
  float4 f = b[d];
  float4 g;
  float h;
  float i;
  float j = e.w + f.w;

  j = j == 0 ? 1 : j;

  h = e.w / j;
  i = 1.0f - h;

  g.xyz = h * e.xyz + i * f.xyz;
  g.w = j;
  c[d] = g;
}