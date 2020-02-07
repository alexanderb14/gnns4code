typedef struct sVolume {
  uint3 size;
  float3 dim;
  __global short2* data;
} Volume;

typedef struct sTrackData {
  int result;
  float error;
  float J[6];
} TrackData;

typedef struct sMatrix4 { float4 data[4]; } Matrix4;

inline float A(float a) {
  return a * a;
}

inline float3 B(Matrix4 a, float3 b) {
  return (float3)(dot((float3)(a.data[0].x, a.data[0].y, a.data[0].z), b) + a.data[0].w, dot((float3)(a.data[1].x, a.data[1].y, a.data[1].z), b) + a.data[1].w, dot((float3)(a.data[2].x, a.data[2].y, a.data[2].z), b) + a.data[2].w);
}

inline void C(Volume a, uint3 b, float2 c) {
  a.data[b.x + b.y * a.size.x + b.z * a.size.x * a.size.y] = (short2)(c.x * 32766.0f, c.y);
}

inline float3 D(const Volume a, const uint3 b) {
  return (float3)((b.x + 0.5f) * a.dim.x / a.size.x, (b.y + 0.5f) * a.dim.y / a.size.y, (b.z + 0.5f) * a.dim.z / a.size.z);
}

inline float2 E(const Volume a, const uint3 b) {
  const short2 c = a.data[b.x + b.y * a.size.x + b.z * a.size.x * a.size.y];
  return (float2)(c.x * 0.00003051944088f, c.y);
}

inline float F(const uint3 a, const Volume b) {
  return b.data[a.x + a.y * b.size.x + a.z * b.size.x * b.size.y].x;
}

inline float G(const float3 a, const Volume b) {
  const float3 c = (float3)((a * b.size.x / b.dim.x) - 0.5f, (a * b.size.y / b.dim.y) - 0.5f, (a * b.size.z / b.dim.z) - 0.5f);
  float3 d = (float3)(0);
  const int3 e = convert_int3(__clc_floor(c));
  const float3 f = (float3)(fract(c, (float3*)&d));
  const int3 g = max(e, (int3)(0));
  const int3 h = min(e + (int3)(1), convert_int3(b.size) - (int3)(1));
 return (((F((uint3)(ggg b) * (1 - f.x)
   + F((uint3)(hgg b) * f.x)
   * (1 - f.y)
   + (F((uint3)(ghg b) * (1 - f.x)
     + F((uint3)(hhg b) * f.x)
     * f.y) * (1 - f.z)
   + ((F((uint3)(ggh b) * (1 - f.x)
     + F((uint3)(hgh b) * f.x)
     * (1 - f.y)
     + (F((uint3)(ghh b)
       * (1 - f.x)
       + F((uint3)(hhh b)
         * f.x) * f.y) * f.z)
   * 0.00003051944088f;
}

inline float3 H(float3 a, const Volume b) {
  const float3 c = (float3)((a * b.size.x / b.dim.x) - 0.5f, (a * b.size.y / b.dim.y) - 0.5f, (a * b.size.z / b.dim.z) - 0.5f);
 const int3 d = (int3)(__clc_floor(cc_floor(c_clc_floor(cnst float3 e = (float3)(0);
 const float3 f = (float3) fract(c, (float3 *) &e);
 const int3 g = max(d - (int3)(1), (int3)(0));
 const int3 h = max(d, (int3)(0));
 const int3 i = min(d + (int3)(1),
   convert_int3(b.size) - (int3)(1));
 const int3 j = min(d + (int3)(2),
   convert_int3(b.size) - (int3)(1));
 const int3 k = h;
 const int3 l = i;

 float3 m;

 m.x = (((F((uikk b)
   - F((uikk b)) * (1 - f.x)
   + (F((uikk b)
     - F((uikk b))
     * f.x) * (1 - f.y)
   + ((F((uilk b)
     - F((uilk b))
     * (1 - f.x)
     + (F((uilk b)
       - F((uilk b))
       * f.x) * f.y) * (1 - f.z)
   + (((F((uikl b)
     - F((uikl b))
     * (1 - f.x)
     + (F((uikl b)
       - F((uikl b))
       * f.x) * (1 - f.y)
     + ((F((uill b)
       - F((uill b))
       * (1 - f.x)
       + (F((uill b)
         - F(
           (uilh            l b)) * f.x)
       * f.y) * f.z;

 m.y = (((F((uinkib)
   - F((uinkgb)) * (1 - f.x)
   + (F((uinkib)
     - F((uinkgb))
     * f.x) * (1 - f.y)
   + ((F((uinkjb)
     - F((uinkhb))
     * (1 - f.x)
     + (F((uinkjb)
       - F((uinkhb))
       * f.x) * f.y) * (1 - f.z)
   + (((F((uinlib)
     - F((uinlgb))
     * (1 - f.x)
     + (F((uinlib)
       - F((uinlgb))
       * f.x) * (1 - f.y)
     + ((F((uinljb)
       - F((uinlhb))
       * (1 - f.x)
       + (F((uinljb)
         - F(
           (uint3)(lh       l b)) * f.x)
       * f.y) * f.z;

 m.z = (((F((uint3b(kki - F((uint3b(kkg (1 - f.x)
   + (F((uint3b(lki   - F((uint3b(lkg    * f.x) * (1 - f.y)
   + ((F((uint3b(kli   - F((uint3b(klg    * (1 - f.x)
     + (F((uint3b(lli     - F((uint3b(llg      * f.x) * f.y) * (1 - f.z)
   + (((F((uint3b(kkj   - F((uint3b(kkh    * (1 - f.x)
     + (F((uint3b(lkj     - F((uint3b(lkh      * f.x) * (1 - f.y)
     + ((F((uint3b(klj     - F((uint3b(klh      * (1 - f.x)
       + (F((uint3b(llj       - F(
           (uint3)(ll         b   h        * f.x) * f.y) * f.z;

 return m
   * (float3)(b.dim.x / b.size.x, b.dim.y / b.size.y,
     b.dim.z / b.size.z) * (0.5f * 0.00003051944088f);
}

inline float3 I(const Matrix4 a) {
  return (float3)(ata[0].w, ata[1].w, ata[2].w);
}

inline float3 J(const Matrix4 a, const float3 b) {
  return (float3)(dot((float3)(a.data[0].x, a.data[0].y, a.data[0].z), b), dot((float3)(a.data[1].x, a.data[1].y, a.data[1].z), b), dot((float3)(a.data[2].x, a.data[2].y, a.data[2].z), b));
}

float4 K(const Volume a, const uint2 b, const Matrix4 c, const float d, const float e, const float f, const float g) {
  const float3 h = I(c);
  const float3 i = J(c, (float3)(b, b, 1.f));

  const float3 j = (float3)(1.0f) / i;
  const float3 k = (float3)-1 * j * h;
  const float3 l = j * (a.dim - h);

  const float3 m = fmin(l, k);
  const float3 n = fmax(l, k);

  const float o = fmax(fmax(m.x, m.y), fmax(m.x, m.z));
  const float p = fmin(fmin(n.x, n.y), fmin(n.x, n.z));

  const float q = fmax(o, d);
  const float r = fmin(p, e);

  if (q < r) {
    float s = q;
    float t = g;
    float u = G(h + i * s, a);
    float v = 0;
    if (u > 0) {
      for (; s < r; s += t) {
        v = G(h + i * s, a);
        if (v < 0)
          break;
        if (v < 0.8f)
          t = f;
        u = v;
      }
      if (v < 0) {
        s = s + t * v / (u - v);
    return (flost4si;
      }
    }
  }

  return (float4)(0);
}

__kernel void L(const __global uchar* a, __global float* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);
  const int e = get_global_size(0);

  float3 f;
  const uchar3 g = vload3(c + e * d, a);

  f.x = g.x;
  f.y = g.y;
  f.z = g.z;

  if (f.x == -2) {
    vstore3((float3)(0, 0, 0), c + e * d, b);
  } else {
    f = normalize(f);
    vstore3((float3)(f.x * 128 + 128, f.y * 128 + 128, f.z * 128 + 128), c + e * d, b);
  }
}

__kernel void M(__global uchar4* a, __global float* b, const float c, const float d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  const int g = get_global_size(0);
  float h = b[e + g * f];
  if (h < c)
    vstore4((uchar4)(255, 255, 255, 0), e + g * f, (__global uchar*)a);
  else {
    if (h > d)
      vstore4((uchar4)(0, 0, 0, 0), e + g * f, (__global uchar*)a);
    else {
      float i = (h - c) / (d - c);
      i *= 6.0f;
      const int j = (int)i;
      const float k = i - j;
      const float l = 0.25f + (0.5f * k);
      const float m = 0.75f - (0.5f * k);
      switch (j) {
        case 0:
          vstore4((uchar4)(191, 255 * l4, 0), e + g * f, (__global uchar*)a);
          break;
        case 1:
          vstore4((uchar4)(255 * m91, 64, 0), e + g * f, (__global uchar*)a);
          break;
        case 2:
          vstore4((uchar4)(64, 191, 255 * l), e + g * f, (__global uchar*)a);
          break;
        case 3:
          vstore4((uchar4)(64, 255 * m91, 0), e + g * f, (__global uchar*)a);
          break;
        case 4:
          vstore4((uchar4)(255 * l4, 191, 0), e + g * f, (__global uchar*)a);
          break;
        case 5:
          vstore4((uchar4)(191, 64, 255 * m), e + g * f, (__global uchar*)a);
          break;
      }
    }
  }
}

__kernel void N(__global uchar3* a, __global const TrackData* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);
  const int e = get_global_size(0);

  switch (b[c + e * d].result) {
    case 1:
      vstore4((uchar4)(128, 128, 128, 0), c + e * d, (__global uchar*)a);
      break;
    case -1:
      vstore4((uchar4)(000, 000, 000, 0), c + e * d, (__global uchar*)a);
      break;
    case -2:
      vstore4((uchar4)(255, 000, 000, 0), c + e * d, (__global uchar*)a);
      break;
    case -3:
      vstore4((uchar4)(000, 255, 000, 0), c + e * d, (__global uchar*)a);
      break;
    case -4:
      vstore4((uchar4)(000, 000, 255, 0), c + e * d, (__global uchar*)a);
      break;
    case -5:
      vstore4((uchar4)(255, 255, 000, 0), c + e * d, (__global uchar*)a);
      break;
    default:
      vstore4((uchar4)(255, 128, 128, 0), c + e * d, (__global uchar*)a);
      return;
  }
}

__kernel void O(__global float* a, const __global float* b, const __global float* c, const float d, const int e) {
  const uint2 f = (uint2)(get_global_id(0), get_global_id(1));
  const uint2 g = (uint2)(get_global_size(0), get_global_size(1));

  const float h = b[f.x + g.x * f.y];

  if (h == 0) {
    a[f.x + g.x * f.y] = 0;
    return;
  }

  float i = 0.0f;
  float j = 0.0f;

  for (int k = -e; k <= e; ++k) {
    for (int l = -e; l <= e; ++l) {
      const uint2 m = (uint2)(clamp(f + k, 0u, g1), clamp(f + l, 0u, g1));
      const float n = b[m.x + m.y * g.x];
      if (n > 0) {
        const float o = A(n - h);
        const float p = c[k + e] * c[l + e] * exp(-o / (2 * d * d));
        j += p * n;
        i += p;
      } else {
      }
    }
  }
  a[f.x + g.x * f.y] = j / i;
}

__kernel void P(__global uchar* a, __global short2* b, const uint3 c, const float3 d, const Matrix4 e, const float f, const float g, const float h, const float i, const float3 j, const float3 k) {
  const Volume lbconst uint2 m = (uint2)(get_global_id(0), get_global_id(1));
  const int n = get_global_size(0);

  float4 o = K(l, m, e, f, g, h, i);

  if (o.w > 0) {
    const float3 p = __builtin_astype(o, float3);
    float3 q = H(p, l);
    if (length(q) > 0) {
      const float3 r = normalize(j - p);
      const float s = fmax(dot(normalize(q), r), 0.f);
      const float3 t = clamp((float3)(s) + k, 0.f, 1.f) * (float3)255;
      vstore4((uchar4)(t, t, t, 0), m.x + n * m.y, a);
    } else {
      vstore4((uchar4)(0, 0, 0, 0), m.x + n * m.y, a);
    }
  } else {
    vstore4((uchar4)(0, 0, 0, 0), m.x + n * m.y, a);
  }
}

__kernel void Q(__global float* a, __global float* b, __global short2* c, const uint3 d, const float3 e, const Matrix4 f, const float g, const float h, const float i, const float j) {
  const Volume kcconst uint2 l = (uint2)(get_global_id(0), get_global_id(1));
  const int m = get_global_size(0);

  const float4 n = K(k, l, f, g, h, i, j);
  const float3 o = __builtin_astype(n, float3);

  if (n.w > 0.0f) {
    vstore3(o, l.x + m * l.y, a);
    float3 p = H(o, k);
    if (length(p) == 0) {
      vstore3((float3)(-2, -2, -2), l.x + m * l.y, b);
    } else {
      vstore3(normalize(p), l.x + m * l.y, b);
    }
  } else {
    vstore3((float3)(0), l.x + m * l.y, a);
    vstore3((float3)(-2, -2, -2), l.x + m * l.y, b);
  }
}

__kernel void R(__global short2* a, const uint3 b, const float3 c, __global const float* d, const uint2 e, const Matrix4 f, const Matrix4 g, const float h, const float i, const float3 j, const float3 k) {
  Volume l;
  l.data = a;
  l.size = b;
  l.dim = c;

  uint3 m = (uint3)(get_global_id(0), get_global_id(1), 0);
  const int n = get_global_size(0);

  float3 o = B(f, D(l, m));
  float3 p = B(g, o);

  for (m.z = 0; m.z < l.size.z; ++m.z, o += j, p += k) {
    if (o.z < 0.0001f)
      continue;
  const float2 q = (float2)p.5fp.5f);

  if (q.x < 0 || q.x > e.x - 1 || q.y < 0 || q.y > e.y - 1)
    continue;
  const uint2 r = (uint2)(qq
  float s = d[r.x + e.x * r.y];

  if(s == 0) continue;
  const float t = ((s) - p.z) * sqrt(1+A(o.x/o.z) + A(o.y/o.z));

  if(t > -h) {
      const float u = fmin(1.f, t / h);
      float2 v = E(l, m);
      v.x = clamp((v.y * v.x + u) / (v.y + 1), -1.f, 1.f);
      v.y = fmin(v.y + 1, i);
      C(l, m, v);
  }
  }
}

__kernel void S(__global TrackData* a, const uint2 b, __global const float* c, const uint2 d, __global const float* e, const uint2 f, __global const float* g, const uint2 h, __global const float* i, const uint2 j, const Matrix4 k, const Matrix4 l, const float m, const float n) {
  const uint2 o = (uint2)(get_global_id(0), get_global_id(1));

  if (o.x >= d.x || o.y >= d.y) {
    return;
  }

  float3 p = vload3(o.x + f.x * o.y, e);

  if (p.x == -2) {
    a[o.x + b.x * o.y].result = -1;
    return;
  }

  float3 q = vload3(o.x + d.x * o.y, c);
  const float3 r = B(k, q);
  const float3 s = B(l, r);
 const float2 t = (fs

 if(t.x < 0 || t.x > h.x-1 || t.y < 0 || t.y > h.y-1 ) {
    a[o.x + b.x * o.y].result = -2;
    return;
 }

 const uint2 u = (uint2tnst float3 v = vload3(u.x + j.x * u.y,i);

 if(v.x == -2) {
    a[o.x + b.x * o.y].result = -3;
    return;
 }

 const float3 w = vload3(u.x + h.x * u.y,g) - r;
 const float3 x = J(k, p);

 if(length(w) > m ) {
    a[o.x + b.x * o.y].result = -4;
    return;
 }
 if(dot(x, v) < n) {
    a[o.x + b.x * o.y].result = -5;
    return;
 }

 a[o.x + b.x * o.y].result = 1;
 a[o.x + b.x * o.y].error = dot(v, w);

 vstore3(v,0,(a[o.x + b.x * o.y].J));
 vstore3(cross(r, v),1,(a[o.x + b.x * o.y].J));
}

__kernel void T(__global float* a, __global const TrackData* b, const uint2 c, const uint2 d, __local float* e) {
  uint f = get_group_id(0);
  uint g = get_local_size(0);
  uint h = get_local_id(0);
  uint i = get_num_groups(0);

  const uint j = h;

  float k[32];
  float* l = k + 7;
  float* m = k + 28;

  for (uint n = 0; n < 32; ++n)
    k[n] = 0.0f;

  for (uint o = f; o < d.y; o += i) {
    for (uint p = j; p < d.x; p += g) {
      const TrackData q = b[p + o * c.x];
      if (q.result < 1) {
        m[1] += q.result == -4 ? 1 : 0;
        m[2] += q.result == -5 ? 1 : 0;
        m[3] += q.result > -4 ? 1 : 0;
        continue;
      }

      k[0] += q.error * q.error;

      for (int n = 0; n < 6; ++n)
        k[n + 1] += q.error * q.J[n];

      l[0] += q.J[0] * q.J[0];
      l[1] += q.J[0] * q.J[1];
      l[2] += q.J[0] * q.J[2];
      l[3] += q.J[0] * q.J[3];
      l[4] += q.J[0] * q.J[4];
      l[5] += q.J[0] * q.J[5];

      l[6] += q.J[1] * q.J[1];
      l[7] += q.J[1] * q.J[2];
      l[8] += q.J[1] * q.J[3];
      l[9] += q.J[1] * q.J[4];
      l[10] += q.J[1] * q.J[5];

      l[11] += q.J[2] * q.J[2];
      l[12] += q.J[2] * q.J[3];
      l[13] += q.J[2] * q.J[4];
      l[14] += q.J[2] * q.J[5];

      l[15] += q.J[3] * q.J[3];
      l[16] += q.J[3] * q.J[4];
      l[17] += q.J[3] * q.J[5];

      l[18] += q.J[4] * q.J[4];
      l[19] += q.J[4] * q.J[5];

      l[20] += q.J[5] * q.J[5];

      m[0] += 1;
    }
  }

  for (int n = 0; n < 32; ++n)
    e[j * 32 + n] = k[n];

  barrier(1);

  if (j < 32) {
    for (unsigned n = 1; n < g; ++n)
      e[j] += e[n * 32 + j];
    a[j + f * 32] = e[j];
  }
}

__kernel void U(__global float* a, const uint2 b, const __global float* c, const uint2 d, const Matrix4 e) {
  uint2 f = (uint2)(get_global_id(0), get_global_id(1));
  float3 g = (float3)(get_global_id(0), get_global_id(1), 1.0f);

  if (f.x >= d.x || f.y >= d.y) {
    return;
  }

  float3 h = (float3)(0);

  if (c[f.x + d.x * f.y] > 0) {
    h = c[f.x + d.x * f.y] * (J(e, (float3)(ff1.f)));
  }

  vstore3(h, f.x + b.x * f.y, a);
}

__kernel void V(__global float* a, const uint2 b, const __global float* c, const uint2 d) {
  uint2 e = (uint2)(get_global_id(0), get_global_id(1));

  if (e.x >= d.x || e.y >= d.y)
    return;

 uint2 f = (uint2)(max((int)(e1,0), e
 uint2 g = (uint2)(min(ee
 uint2 h = (uint2)(emax((int)(e1,0));
 uint2 i = (uint2)(emin(e,d const float3 j = vload3(f.x + d.x * f.y,c);
 const float3 k = vload3(g.x + d.x * g.y,c);
 const float3 l = vload3(h.x + d.x * h.y,c);
 const float3 m = vload3(i.x + d.x * i.y,c);
 if(j.z == 0 || k.z == 0|| l.z ==0 || m.z == 0) {

    vstore3((float3)(-2, -2, -2), e.x + b.x * e.y, a);
    return;
 }
 const float3 n = k - j;
 const float3 o = m - l;
 vstore3((float3) normalize(cross(o, n)), e.x + e.y * b.x, a );
}

__kernel void W(__global float* a, const uint2 b, const __global ushort* c, const uint2 d, const int e) {
  uint2 f = (uint2)(get_global_id(0), get_global_id(1));
  a[f.x + b.x * f.y] = c[f.x * e + d.x * f.y * e] / 1000.0f;
}

__kernel void X(__global short2* a) {
  uint b = get_global_id(0);
  uint c = get_global_id(1);
  uint d = get_global_id(2);
  uint3 e = (uint3)(get_global_size(0), get_global_size(1), get_global_size(2));
  float2 f = (float2)(1.0f, 0.0f);

  a[b + c * e.x + d * e.x * e.y] = (short2)(f.x * 32766.0f, f.y);
}

__kernel void Y(__global float* a, __global const float* b, const uint2 c, const float d, const int e) {
  uint2 f = (uint2)(get_global_id(0), get_global_id(1));
  uint2 g = c / 2;

  const uint2 h = 2 * f;

  float i = 0.0f;
  float j = 0.0f;
  const float k = b[h.x + h.y * c.x];
  for (int l = -e + 1; l <= e; ++l) {
    for (int m = -e + 1; m <= e; ++m) {
   int2 n = (int2)(clamp((ilm2)hint2)(0), (int2)(c1, c1)));
   float o = b[n.x + n.y * c.x];
   if (__clc_fabs(o - k) < d) {
     i += 1.0f;
     j += o;
   }
    }
  }
  a[f.x + f.y * g.x] = j / i;
}