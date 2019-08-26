__constant sampler_t Ga = 0x0000 | 0x0004 | 0x0000; float3 A(const float3 a, __constant float* b) {
  float3 c;
  c.x = a.x * b[0] + a.y * b[1] + a.z * b[2] + b[3];
  c.y = a.x * b[4] + a.y * b[5] + a.z * b[6] + b[7];
  c.z = a.x * b[8] + a.y * b[9] + a.z * b[10] + b[11];
  return c;
}

__kernel void B(__read_only image2d_t a, __global float* b, __private float c, __private float d, __local float* e, __global float* f, __private float g, __private float h, __private int i) {
  const int j = get_global_id(0);
  const int k = get_global_id(1);
  const int l = get_global_size(0);
  const float2 m = vload2(k * 2, b);
  const float2 n = vload2(k * 2 + 1, b);
  const float o = -c / 2.0f + j * d;

  float2 p = m + o * n;
  p.x /= g;
  p.y /= h;

  e[j] = (float)read_imageui(a, Ga, p).x;

  barrier(1);

  float q = 0.0f;
  float r = 0.0f;
  float s = 0.0f;
  int t = -1;
  int u = -1;
  for (int v = 0; v < l; v++) {
    if (t == -1 && e[v] > 0)
      t = v;
    if (t >= 0 && e[v] == 0) {
      u = v;
    }
    if (t >= 0 && u == -1) {
      if (v <= j) {
        q += e[v];
      } else if (v <= j + i) {
        r += e[v];
      }
    }
  }
  if (u < 0)
    u = l - 1;

  const float w = q / (j + 1 - t);
  const float x = r / i;

  const float y = x - w;

  f[j + k * l] = y;
}