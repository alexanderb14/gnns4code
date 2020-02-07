__kernel void A(__constant float4* a, __constant float4* b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_size(0) / 4;

  float f = 0.0f;
  for (int g = 0; g < e; ++g)
    f += dot(a[d * e + g], b[g]);

  c[d] = f;
}