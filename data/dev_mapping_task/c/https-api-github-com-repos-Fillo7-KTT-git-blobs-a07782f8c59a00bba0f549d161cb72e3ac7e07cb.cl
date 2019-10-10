__kernel void A(float a, __global float4* b, __global float4* c, __global float4* d, __global float4* e, float f, float g) {
  const float4 h = (float4)(a .0f);
  int i = get_global_id(0);
  int j = get_local_id(0);
  int k = get_global_size(0);
  int l = get_local_size(0);
  int m = k / l;
  __local float4 n[1024];
  float4 o = b[i];
  float4 p = d[i];
  float4 q = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  for (int r = 0; r < m; r++) {
    n[j] = b[r * l + j];
    barrier(1);
    for (int s = 0; s < l; s++) {
      float4 t = n[s];
      float4 u = t - o;
      float v = (1.f / sqrt(u.x * u.x + u.y * u.y + u.z * u.z + g));
      float w = t.w * v * v * v;
      q += w * u;
    }
    barrier(1);
  }
  o += h * p + f * h * h * q;
  p += h * q;

  c[i] = o;
  e[i] = p;
}