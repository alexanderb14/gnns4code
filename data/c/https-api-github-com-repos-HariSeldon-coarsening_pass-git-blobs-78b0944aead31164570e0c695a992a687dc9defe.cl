__kernel void A(__global float4* a, __global float4* b, int c, float d, float e, __local float4* f, __global float4* g, __global float4* h) {
  unsigned int i = get_local_id(0);
  unsigned int j = get_global_id(0);
  unsigned int k = get_local_size(0);

  unsigned int l = c / k;

  float4 m = a[j];
  float4 n = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  for (int o = 0; o < l; ++o) {
    int p = o * k + i;
    f[i] = a[p];

    barrier(1);

    for (int q = 0; q < k; ++q) {
      float4 r = f[q] - m;
      float s = r.x * r.x + r.y * r.y + r.z * r.z;
      float t = 1.0f / sqrt(s + e);
      float u = t * t * t;
      float v = f[q].w * u;

      n += v * r;
    }

    barrier(1);
  }

  float4 w = b[j];

  float4 x = m + w * d + n * 0.5f * d * d;
  x.w = m.w;
  float4 y = w + n * d;

  g[j] = x;
  h[j] = y;
}