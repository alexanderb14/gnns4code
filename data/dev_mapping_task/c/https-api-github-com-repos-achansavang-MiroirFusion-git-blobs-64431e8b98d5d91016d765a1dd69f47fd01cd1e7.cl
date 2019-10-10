struct TsdfParams {
  float resolution[3];
  float volume[3];
  float mu;
};
bool A(float3 a) {
  return isnan(a.x) || isnan(a.y) || isnan(a.z);
}

bool B(float4 a) {
  return isnan(a.x) || isnan(a.y) || isnan(a.z) || isnan(a.w);
}

bool C(float2 a) {
  return isnan(a.x) || isnan(a.y);
}

void D(float a, float b, __global short2* c, int d) {
 short2 e = {convert_short(a convert_float(32766)), convert_short(b66};
 c[d] = e;
}

float2 E(short2 a) {
 float2 b = {convert_float(a / convert_float(32766), convert_float(a+convert_float(32766)};
 return b;
}

float4 F(float4 a[4], float4 b) {
  float4 c = {a[0].x * b.x + a[1].x * b.y + a[2].x * b.z + a[3].x * b.w, a[0].y * b.x + a[1].y * b.y + a[2].y * b.z + a[3].y * b.w, a[0].z * b.x + a[1].z * b.y + a[2].z * b.z + a[3].z * b.w, a[0].w * b.x + a[1].w * b.y + a[2].w * b.z + a[3].w * b.w};
  return c;
}

float3 G(float4 a[4], float3 b) {
  float3 c = {a[0].x * b.x + a[1].x * b.y + a[2].x * b.z + a[3].x * 1.0f, a[0].y * b.x + a[1].y * b.y + a[2].y * b.z + a[3].y * 1.0f, a[0].z * b.x + a[1].z * b.y + a[2].z * b.z + a[3].z * 1.0f};
  return c;
}

float4 H(float a, float b, float c, float3 d) {
 float4 e = {(af) *bf) *cf) * df };
 return e;
}

bool I(float3 a) {
  return a.x == 0 && a.y == 0 && a.z == 0;
}
void J(int a, int b, int c, __global const float4* d, __global const float2* e, __global const float3* f, __global const float3* g, __global const float3* h, __local float* i, __local float* j) {
  float2 k = e[a];
  float3 l = g[a];
  float3 m = h[a];
  bool n = true;

  n = !C(k) && !A(l) && !A(m);

  int o = n ? (c * convert_int(k.y) + convert_int(k.x)) : 0;
  float3 p = f[o];

  n = n && !A(p) && !I(p);

  if (n) {
    p = G(q, p);

    float3 r = cross(m, p);
    float s[6] = {r.x, r.y, r.z, m m m};

    int t = 0;
    for (int u = 0; u < 6; u++) {
      for (int v = u; v < 6; v++)
        i[b * 21 + (t++)] = s[u] * s[v];
    }

    float w = dot(m, l - p);

    for (int u = 0; u < 6; u++)
      j[b * 6 + u] = s[u] * w;
  } else {
    for (int t = 0; t < 21; t++)
      i[b * 21 + t] = 0.0f;
    for (int u = 0; u < 6; u++)
      j[b * 6 + u] = 0.0f;
  }
}

void K(int a, int b, __local float* c, __local float* d, __global float* e, __global float* f, int g, int h) {
  int i = 1;

  for (int j = h >> 1; j > 0; j >>= 1) {
    barrier(1);

    if (a < j) {
      int k = i * (2 * a + 1) - 1;
      int l = i * (2 * a + 2) - 1;

      for (int m = 0; m < 21; m++)
        c[l * 21 + m] += c[k * 21 + m];
      for (int m = 0; m < 6; m++)
        d[l * 6 + m] += d[k * 6 + m];
    }
    i *= 2;
  }

  barrier(1);

  if (a == 0) {
    int n = b / g;

    for (int m = 0; m < 21; m++)
      e[n * 21 + m] = c[(h - 1) * 21 + m];
    for (int m = 0; m < 6; m++)
      f[n * 6 + m] = d[(h - 1) * 6 + m];
  }
}

__kernel void L(__global int* a, __global float* b, __global float* c, __global float* d, __global float* e) {
  __local float f[2 * 64 * 21];
  __local float g[2 * 64 * 6];

  const int h = get_local_id(0);
  const int i = get_global_id(0);

  if (i < ((*a) / 2)) {
    for (int j = 0; j < 21; j++) {
      f[2 * h * 21 + j] = b[(i * 2) * 21 + j];
      f[(2 * h + 1) * 21 + j] = b[(i * 2 + 1) * 21 + j];
    }

    for (int j = 0; j < 6; j++) {
      g[2 * h * 6 + j] = c[(i * 2) * 6 + j];
      g[(2 * h + 1) * 6 + j] = c[(i * 2 + 1) * 6 + j];
    }
  } else {
    for (int j = 0; j < 21; j++) {
      f[2 * h * 21 + j] = 0.0f;
      f[(2 * h + 1) * 21 + j] = 0.0f;
    }

    for (int j = 0; j < 6; j++) {
      g[2 * h * 6 + j] = 0.0f;
      g[(2 * h + 1) * 6 + j] = 0.0f;
    }
  }

  barrier(1);

  K(h, i, f, g, d, e, 64, 64 * 2);
}

__kernel void M(__global const int* a, __global const float4* b, __global const float2* c, __global const float3* d,

                __global const float3* e, __global const float3* f, __global float* g, __global float* h) {
  __local float i[2 * 64 * 21];
  __local float j[2 * 64 * 6];
  const int k = get_local_id(0);
  const int l = get_global_id(0);

  int m = *a;

  J(l * 2, 2 * k, m, b, c, d, e, f, i, j);
  J(l * 2 + 1, 2 * k + 1, m, b, c, d, e, f, i, j);

  K(k, l, i, j, g, h, 64, 64 * 2);
}