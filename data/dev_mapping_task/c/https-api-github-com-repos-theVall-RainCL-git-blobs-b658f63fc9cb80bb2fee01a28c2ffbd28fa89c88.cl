constant sampler_t Ga = 0x0001 | 0x0010 | 0x0006; kernel void A(global float4* a, global float4* b, global float4* c, const uint d, const float e, const float f, const float g, const float h, const float i, const float j) {
  uint k = get_global_id(0);

  float4 l = a[k].s0123;
  float3 m = b[k].xyz;
    float3 n = (flhloat o = distance(n, l.xyz);


 if (l.y <= -1.0f || o > 50.0f)
 {
    l.xyz = c[k].xyz + n;
    l.y += 1.f;
 }

    l.x += (i + m.x) * e;
    l.y -= m.y * e;
    l.z += (j + m.z) * e;

    a[k].s0123 = l;
}

kernel void B(global float4* a, const float b, const float c, const float d) {
  uint e = get_global_id(0);

  float4 f = a[e].xyzw;
  f.z += b * 50;
  f.x += b;

  if (__clc_fabs(fmod(f.z, 0.3f)) < 0.1)
    f.w = f.w < 255 ? f.w + 1.0 : 0;

  a[e].xzw = f.z > 250 ? (float3)(10, -250, f : f.xzw;
}