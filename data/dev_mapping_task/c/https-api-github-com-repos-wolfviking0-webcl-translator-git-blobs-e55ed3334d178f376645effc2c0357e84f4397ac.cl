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

  float4 e = a[d] - b * (1.0f / 16.0f);

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

void E(__global const uint* a, __local float4* b, __local float4* c, __local int* d, __local float* e) {
  const int f = get_group_id(0);
  const int g = get_local_id(0);

  float4 h;

  if (g < 16) {
    uint i = a[(f)*16 + g];

    b[g].x = ((i >> 0) & 0xFF) * (1.0f / 255.0f);
    b[g].y = ((i >> 8) & 0xFF) * (1.0f / 255.0f);
    b[g].z = ((i >> 16) & 0xFF) * (1.0f / 255.0f);

    B(b, c);
    float4 j = C(b, c[g], e);

    e[g] = b[g].x * j.x + b[g].y * j.y + b[g].z * j.z;

    D(e, d);

    h = b[g];

    b[d[g]] = h;
  }
}

float4 F(float4 a, ushort* b) {
  ushort c = __clc_round(clamp(a.x, 0.0f, 1.0f) * 31.0f);
  ushort d = __clc_round(clamp(a.y, 0.0f, 1.0f) * 63.0f);
  ushort e = __clc_round(clamp(a.z, 0.0f, 1.0f) * 31.0f);

  *b = ((c << 11) | (d << 5) | e);
  a.x = c * 0.03227752766457f;
  a.y = d * 0.01583151765563f;
  a.z = e * 0.03227752766457f;
  return a;
}

float G(__local const float4* a, uint b, ushort* c, ushort* d, float4 e) {
  const float f[4] = {9.0f, 0.0f, 6.0f, 3.0f};
  const int g[4] = {0x090000, 0x000900, 0x040102, 0x010402};

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
  float4 o = 9.0f * e - h;

  const float p = 1.0f / (l * m - n * n);

  float4 q = (h * m - o * n) * p;
  float4 r = (o * l - h * n) * p;

  q = F(q, c);
  r = F(r, d);

  float4 s = q * q * l + r * r * m + 2.0f * (q * r * n - q * h - r * o);

  return (1.0f / 9.0f) * (s.x + s.y + s.z);
}

float H(__local const float4* a, uint b, ushort* c, ushort* d, float4 e) {
  const int f[4] = {0x040000, 0x000400, 0x040101, 0x010401};
  const float g[4] = {4.0f, 0.0f, 2.0f, 2.0f};

  float4 h = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  int i = 0;

  for (int j = 0; j < 16; j++) {
    const uint k = b >> (2 * j);

    h += g[k & 3] * a[j];
    i += f[k & 3];
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

  return (1.0f / 4.0f) * (s.x + s.y + s.z);
}

uint4 I(__local const float4* a, __global const unsigned int* b, __local float* c, float4 d, __local uint* e) {
  const int f = get_local_id(0);

  uint g;
  uint h;
  uint i;
  uint j;

  float k = 0x1.fffffep127f;

  for (int l = 0; l < 16; l++) {
    int m = f + 64 * l;
    if (m >= 992)
      break;

    ushort n, o;
    uint p = b[m];
    if (m < 160)
      e[m] = p;

    float q = G(a, p, &n, &o, d);

    if (q < k) {
      k = q;
      i = p;
      g = n;
      h = o;
    }
  }

  if (g < h) {
    j = h;
    h = g;
    g = j;

    i ^= 0x55555555;
  }

  for (int l = 0; l < 3; l++) {
    int m = f + 64 * l;
    if (m >= 160)
      break;

    ushort n, o;
    uint p = e[m];
    float q = H(a, p, &n, &o, d);

    if (q < k) {
      k = q;
      i = p;
      g = n;
      h = o;

      if (g > h) {
        j = h;
        h = g;
        g = j;

        i ^= (~i >> 1) & 0x55555555;
      }
    }
  }

  c[f] = k;

  uint4 r = irn r;
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

void K(uint a, uint b, uint c, __local int* d, __global uint2* e) {
  const int f = get_group_id(0);

  if (a == b) {
    c = 0;
  }

  uint g = 0;
  for (int h = 0; h < 16; h++) {
    int i = d[h];
    g |= ((c >> (2 * i)) & 3) << (2 * h);
  }

  e[f].x = (b << 16) | a;

  e[f].y = g;
}

__kernel void L(__global const uint* a, __global const uint* b, __global uint2* c, __local float4* d, __local float4* e, __local int* f, __local float* g, __local uint* h, __local int* i) {
  const int j = get_local_id(0);

  E(b, d, e, i, g);

  barrier(1);

  uint4 k = I(d, a, g, e[0], h);

  const int l = J(g, f);

  barrier(1);

  if (j == l) {
    K(k.x, k.y, k.z, i, c);
  }
}