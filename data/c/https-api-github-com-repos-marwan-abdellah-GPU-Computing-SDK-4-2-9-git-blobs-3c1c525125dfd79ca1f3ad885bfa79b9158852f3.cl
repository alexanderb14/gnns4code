float4 A(__local float* a) {
  float4 b = (float4)(1.0f, 1.0f, 1.0f, 0.0f);
  for (int c = 0; c < 8; c++) {
    float d = b.x * a[0] + b.y * a[1] + b.z * a[2];
    float e = b.x * a[1] + b.y * a[3] + b.z * a[4];
    float f = b.x * a[2] + b.y * a[4] + b.z * a[5];
    float g = max(max(d, e), f);
    float h = 1.0f / g;

    b.x = d * h;
    b.y = e * h;
    b.z = f * h;
  }

  return b;
}

void B(__local const float4* a, __local float4* b) {
  const int c = get_local_id(0);

  b[c] = a[c];
  b[c] += b[c ^ 8];
  b[c] += b[c ^ 4];
  b[c] += b[c ^ 2];
  b[c] += b[c ^ 1];
}

float4 C(__local const float4* a, float4 b, __local float* c) {
  const int d = get_local_id(0);

  float4 e = a[d] - b * 0.0625f;

  c[6 * d + 0] = e.x * e.x;
  c[6 * d + 1] = e.x * e.y;
  c[6 * d + 2] = e.x * e.z;
  c[6 * d + 3] = e.y * e.y;
  c[6 * d + 4] = e.y * e.z;
  c[6 * d + 5] = e.z * e.z;

  for (int f = 8; f > 0; f >>= 1) {
    if (d < f) {
      c[6 * d + 0] += c[6 * (d + f) + 0];
      c[6 * d + 1] += c[6 * (d + f) + 1];
      c[6 * d + 2] += c[6 * (d + f) + 2];
      c[6 * d + 3] += c[6 * (d + f) + 3];
      c[6 * d + 4] += c[6 * (d + f) + 4];
      c[6 * d + 5] += c[6 * (d + f) + 5];
    }
  }

  return A(c);
}

void D(__local const float* a, __local int* b) {
  const int c = get_local_id(0);

  int d = 0;

  for (int e = 0; e < 16; e++) {
    d += (a[e] < a[c]);
  }

  b[c] = d;

  for (int e = 0; e < 15; e++) {
    if (c > e && b[c] == b[e])
      ++b[c];
  }
}

void E(__global const uint* a, __local float4* b, __local float4* c, __local int* d, __local float* e, int f) {
  const int g = get_group_id(0) + f;
  const int h = get_local_id(0);

  float4 i;

  if (h < 16) {
    uint j = a[(g)*16 + h];

    b[h].x = ((j >> 0) & 0xFF) * 0.003921568627f;
    b[h].y = ((j >> 8) & 0xFF) * 0.003921568627f;
    b[h].z = ((j >> 16) & 0xFF) * 0.003921568627f;

    B(b, c);
    float4 k = C(b, c[h], e);

    e[h] = b[h].x * k.x + b[h].y * k.y + b[h].z * k.z;

    D(e, d);

    i = b[h];

    b[d[h]] = i;
  }
}

float4 F(float4 a, ushort* b) {
  ushort c = __clc_rint(clamp(a.x, 0.0f, 1.0f) * 31.0f);
  ushort d = __clc_rint(clamp(a.y, 0.0f, 1.0f) * 63.0f);
  ushort e = __clc_rint(clamp(a.z, 0.0f, 1.0f) * 31.0f);

  *b = ((c << 11) | (d << 5) | e);
  a.x = c * 0.03227752766457f;
  a.y = d * 0.01583151765563f;
  a.z = e * 0.03227752766457f;
  return a;
}

float G(__local const float4* a, uint b, ushort* c, ushort* d, float4 e, __constant float* f, __constant int* g, float h) {
  float4 i = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  int j = 0;

  for (int k = 0; k < 16; k++) {
    const uint l = b >> (2 * k);

    i += f[l & 3] * a[k];
    j += g[l & 3];
  }

  float m = (j >> 16);
  float n = ((j >> 8) & 0xff);
  float o = ((j >> 0) & 0xff);
  float4 p = h * e - i;

  const float q = 1.0f / (m * n - o * o);

  float4 r = (i * n - p * o) * q;
  float4 s = (p * m - i * o) * q;

  r = F(r, c);
  s = F(s, d);

  float4 t = r * r * m + s * s * n + 2.0f * (r * s * o - r * i - s * p);

  return (1.0f / h) * (t.x + t.y + t.z);
}

float H(__local const float4* a, uint b, ushort* c, ushort* d, float4 e, __constant float* f, __constant int* g) {
  float4 h = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  int i = 0;

  for (int j = 0; j < 16; j++) {
    const uint k = b >> (2 * j);

    h += f[k & 3] * a[j];
    i += g[k & 3];
  }

  float l = (i >> 16);
  float m = ((i >> 8) & 0xff);
  float n = ((i >> 0) & 0xff);
  float4 o = 4.0f * e - h;

  const float p = 1.0f / (l * m - n * n);

  float4 q = (h * m - o * n) * p;
  float4 r = (o * l - h * n) * p;

  q = F(q, c);
  r = F(r, d);

  float4 s = q * q * l + r * r * m + 2.0f * (q * r * n - q * h - r * o);

  return (0.25f) * (s.x + s.y + s.z);
}

uint4 I(__local const float4* a, __global const unsigned int* b, __local float* c, float4 d, __local uint* e, __constant float* f, __constant int* g, __constant float* h, __constant int* i) {
  const int j = get_local_id(0);

  uint k;
  uint l;
  uint m;
  uint n;

  float o = 0x1.fffffep127f;

  for (int p = 0; p < 16; p++) {
    int q = j + 64 * p;
    if (q >= 992)
      break;

    ushort r, s;
    uint t = b[q];
    if (q < 160)
      e[q] = t;

    float u = G(a, t, &r, &s, d, f, g, 9.0f);
    if (u < o) {
      o = u;
      m = t;
      k = r;
      l = s;
    }
  }

  if (k < l) {
    n = l;
    l = k;
    k = n;

    m ^= 0x55555555;
  }

  for (int p = 0; p < 3; p++) {
    int q = j + 64 * p;
    if (q >= 160)
      break;

    ushort r, s;
    uint t = e[q];
    float u = G(a, t, &r, &s, d, h, i, 4.0f);
    if (u < o) {
      o = u;
      m = t;
      k = r;
      l = s;

      if (k > l) {
        n = l;
        l = k;
        k = n;

        m ^= (~m >> 1) & 0x55555555;
      }
    }
  }

  c[j] = o;

  uint4 v = mrn v;
}

int J(__local float* a, __local int* b) {
  const int c = get_local_id(0);

  b[c] = c;

  for (int d = 64 / 2; d > 32; d >>= 1) {
    barrier(1);

    if (c < d) {
      float e = a[c];
      float f = a[c + d];

      if (f < e) {
        a[c] = f;
        b[c] = b[c + d];
      }
    }
  }

  barrier(1);

  if (c < 32) {
    if (a[c + 32] < a[c]) {
      a[c] = a[c + 32];
      b[c] = b[c + 32];
    }
    if (a[c + 16] < a[c]) {
      a[c] = a[c + 16];
      b[c] = b[c + 16];
    }
    if (a[c + 8] < a[c]) {
      a[c] = a[c + 8];
      b[c] = b[c + 8];
    }
    if (a[c + 4] < a[c]) {
      a[c] = a[c + 4];
      b[c] = b[c + 4];
    }
    if (a[c + 2] < a[c]) {
      a[c] = a[c + 2];
      b[c] = b[c + 2];
    }
    if (a[c + 1] < a[c]) {
      a[c] = a[c + 1];
      b[c] = b[c + 1];
    }
  }

  barrier(1);

  return b[0];
}

void K(uint a, uint b, uint c, __local int* d, __global uint2* e, int f) {
  const int g = get_group_id(0) + f;

  if (a == b) {
    c = 0;
  }

  uint h = 0;
  for (int i = 0; i < 16; i++) {
    int j = d[i];
    h |= ((c >> (2 * j)) & 3) << (2 * i);
  }

  e[g].x = (b << 16) | a;

  e[g].y = h;
}

__kernel void L(__global const uint* a, __global const uint* b, __global uint2* c, __constant float* d, __constant int* e, __constant float* f, __constant int* g, int h) {
  __local float4 i[16];
  __local float4 j[16];
  __local int k[64];
  __local float l[16 * 6];
  __local uint m[160];
  __local int n[16];

  const int o = get_local_id(0);

  E(b, i, j, n, l, h);

  barrier(1);

  uint4 p = I(i, a, l, j[0], m, d, e, f, g);

  const int q = J(l, k);

  barrier(1);

  if (o == q) {
    K(p.x, p.y, p.z, n, c, h);
  }
}