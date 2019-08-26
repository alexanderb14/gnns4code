__kernel void A(__global float8* a, int b, int c, int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);

  for (int g = 0; g < d; g++) {
    a[e + b * (f + g * c)] = (float8)(0.0f);
  }
}

__kernel void B(__global const float4* a, __global float2* b, int c, int d, int e, int f, int g, float h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  for (int k = 0; k < g; k++)
    for (int l = 0; l < g; l++) {
      const int m = clamp(i * g - g / 2 + l, 0, c - 1);
      const int n = clamp(j * g - g / 2 + k, 0, d - 1);

      const float4 o = a[n * c + m];

      const int4 p = convert_int4(o * (1.0f / h) + 0.5f);

      b[4 * (i + e * (j + p.x * f)) + 0] += (float2)(o, 1.0f);
      b[4 * (i + e * (j + p.y * f)) + 1] += (float2)(o, 1.0f);
      b[4 * (i + e * (j + p.z * f)) + 2] += (float2)(o, 1.0f);
      b[4 * (i + e * (j + p.w * f)) + 3] += (float2)(o, 1.0f);

      barrier(2);
    }
}

__kernel void C(__global const float8* a, __global float8* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  for (int h = 0; h < e; h++) {
    const int i = max(f - 1, 0);
    const int j = min(f + 1, c - 1);

    float8 k = a[i + c * (g + h * d)] + 4.0f * a[f + c * (g + h * d)] + a[j + c * (g + h * d)];

    b[f + c * (g + h * d)] = k;
  }
}

__kernel void D(__global const float8* a, __global float8* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);

  for (int h = 0; h < e; h++) {
    const int i = max(g - 1, 0);
    const int j = min(g + 1, d - 1);

    float8 k = a[f + c * (i + h * d)] + 4.0f * a[f + c * (g + h * d)] + a[f + c * (j + h * d)];

    b[f + c * (g + h * d)] = k;
  }
}

__kernel void E(__global const float8* a, __global float2* b, __global float2* c, __global float2* d, __global float2* e, int f, int g, int h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  for (int k = 0; k < h; k++) {
    const int l = max(k - 1, 0);
    const int m = min(k + 1, h - 1);

    float8 n = a[i + f * (j + l * g)] + 4.0f * a[i + f * (j + k * g)] + a[i + f * (j + m * g)];

    b[i + f * (j + k * g)] = n.s01;
    c[i + f * (j + k * g)] = n.s23;
    d[i + f * (j + k * g)] = n.s45;
    e[i + f * (j + k * g)] = n.s67;
  }
}

__kernel void F(__global const float4* a, __global const float2* b, __global const float2* c, __global const float2* d, __global const float2* e, __global float4* f, int g, int h, int i, int j, int k, float l) {
  const int m = get_global_id(0);
  const int n = get_global_id(1);

  const float o = (float)(m) / k;
  const float p = (float)(n) / k;
  const float4 q = a[n * g + m] / l;

  float8 r;

  int s = (int)o;
  int t = (int)p;
  int4 u = convert_int4(q);

  int v = min(s + 1, h - 1);
  int w = min(t + 1, i - 1);
  int4 x = min(u + 1, j - 1);

  float y = o - s;
  float z = p - t;
  float4 aa = q - __clc_floor(q);

  r.s04 = mix(mix(mix(b[s + h * (t + u.x * i)], b[v + h * (t + u.x * i)], y), mix(b[s + h * (w + u.x * i)], b[v + h * (w + u.x * i)], y), z), mix(mix(b[s + h * (t + x.x * i)], b[v + h * (t + x.x * i)], y), mix(b[s + h * (w + x.x * i)], b[v + h * (w + x.x * i)], y), z), aa.x);

  r.s15 = mix(mix(mix(c[s + h * (t + u.y * i)], c[v + h * (t + u.y * i)], y), mix(c[s + h * (w + u.y * i)], c[v + h * (w + u.y * i)], y), z), mix(mix(c[s + h * (t + x.y * i)], c[v + h * (t + x.y * i)], y), mix(c[s + h * (w + x.y * i)], c[v + h * (w + x.y * i)], y), z), aa.y);

  r.s26 = mix(mix(mix(d[s + h * (t + u.z * i)], d[v + h * (t + u.z * i)], y), mix(d[s + h * (w + u.z * i)], d[v + h * (w + u.z * i)], y), z), mix(mix(d[s + h * (t + x.z * i)], d[v + h * (t + x.z * i)], y), mix(d[s + h * (w + x.z * i)], d[v + h * (w + x.z * i)], y), z), aa.z);

  r.s37 = mix(mix(mix(e[s + h * (t + u.w * i)], e[v + h * (t + u.w * i)], y), mix(e[s + h * (w + u.w * i)], e[v + h * (w + u.w * i)], y), z), mix(mix(e[s + h * (t + x.w * i)], e[v + h * (t + x.w * i)], y), mix(e[s + h * (w + x.w * i)], e[v + h * (w + x.w * i)], y), z), aa.w);

  f[n * g + m] = r.s0123 / r.s4567;
}