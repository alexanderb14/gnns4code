__kernel void A(__constant float4* a, __constant float4* b, __global float* c) {
  int d = get_global_size(0);
  int e = d / 4;
  int f = get_global_id(0) * e;
  a += f;
  c += f * 4;

  float g;

  for (int h = 0; h < d; ++h) {
    g = 0.0f;
    for (int i = 0; i < e; ++i)
      g += dot(a[i], b[h * e + i]);

    c[h] = g;
  }
}