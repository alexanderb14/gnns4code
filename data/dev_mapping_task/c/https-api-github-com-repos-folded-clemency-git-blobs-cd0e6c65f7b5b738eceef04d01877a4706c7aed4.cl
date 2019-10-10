__constant int Ga = 15; __constant float Gb = 0.3492f; __constant float Gc = 2.04348f; __constant float3 Gd = (float3)(1.0f, 1.0f, 0.0f); __constant float Ge = 0.0f; __constant float3 Gf = (float3)(0.0365f, -1.8613f, 0.0365f); __constant float3 Gg = (float3)(-0.6691f, -1.3028f, -0.45775f); __constant float Gh = 1e-3; float16 A(const float3 a, const float b) {
  float c = cos(b);
  float d = 1.0f - c;
  float e = sin(b);

  return (float16)(d * a.x * a.x + c, d * a.x * a.y - e * a.z, d * a.x * a.z + e * a.y, 0.0f, d * a.x * a.y + e * a.z, d * a.y * a.y + c, d * a.y * a.z - e * a.x, 0.0f, d * a.x * a.z - e * a.y, d * a.y * a.z + e * a.x, d * a.z * a.z + c, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f);
}

float3 B(const float16* a, const float3 b) {
  return (float3)(dot(as012, b), dot(as456, b), dot(as89A, b));
}

float C(float3 a) {
  float16 b = A(normalize(Gd), Ge);
  float4 c = (float4)(GGGc_clc_fabs(Gc/ Gb;
  float d = __clc_fabs(Gc - 1.0f);
  float e = __clc_pow(__clc_fabs(Gc), (float)(1-Ga));
  float4 f = (float4)(a1.0f);
  float4 g = (float4)(Gg.0f);

  for (int h = 0; h < Ga; h++) {
    f.xyz = B(&b, f.xyz);
    f.xyz = __clc_fabs(f.xyz) + Gf;
    float i = dot(f.xyz, f.xyz);
    f *= clamp(max(Gb / i, Gb), 0.0f, 1.0f);
    f = f * c + g;
  }
  return ((length(f.xyz) - d) / f.w - e);
}

bool D(float3 a) {
  return C(a) < Gh;
}
__kernel void E(__global const float* a, __global const float* b, __global const float* c, __global uchar* d, size_t e, size_t f) {
  size_t g = get_global_id(0);
  size_t h = get_global_id(1);
  size_t i = get_global_id(2);

  size_t j = get_global_size(0);
  size_t k = get_global_size(1);

  float3 l = (float3)(ag, bh, ci);

  d[g + h * e + i * f] = D(l) ? 1 : 0;
}

__kernel void F(__global const float3* a, __global const float3* b, __global float3* c, const size_t d) {
  size_t e = get_global_id(0);

  float3 f = a[e];
  float3 g = b[e];
  float3 h;

  bool i = D(f);
  bool j = D(g);

  for (size_t k = 0; k < d; ++k) {
    h = (f + g) / 2.0f;
    bool l = D(h);
    if (l == i) {
      f = h;
    } else {
      g = h;
    }
  }

  c[e] = (f + g) / 2.0f;
}