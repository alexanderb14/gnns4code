typedef struct Vector {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
} Vector;

typedef struct Image {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
} Image;

typedef struct Tensor3D {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
  int stride_z;
} Tensor3D;

typedef struct Tensor4D {
  __global uchar* ptr;
  int offset_first_element_in_bytes;
  int stride_x;
  int stride_y;
  int stride_z;
  int stride_w;
} Tensor4D;
Vector inline A(__global uchar* a, uint b, uint c, uint d) {
  Vector e = {.ptr = a.offset_first_element_in_bytc;
  e.ptr += e.offset_first_element_in_bytes + get_global_id(0) * d;
  return e;
}
Image inline B(__global uchar* a, uint b, uint c, uint d, uint e, uint f) {
  Image g = {.ptr = a.offset_first_element_in_bytc.stride_y = e g.ptr += g.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f;
  return g;
}
Image inline C(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h) {
  Image i = {.ptr = a.offset_first_element_in_bytc.stride_y = e i.ptr += i.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + get_global_id(2) * h;
  return i;
}
Tensor3D inline D(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h) {
  Tensor3D i = {.ptr = a.offset_first_element_in_bytc.stride_y = e.stride_z = g i.ptr += i.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + get_global_id(2) * h;
  return i;
}

Tensor4D inline E(__global uchar* a, uint b, uint c, uint d, uint e, uint f, uint g, uint h, uint i, uint j, uint k) {
  Tensor4D l = {
    .ptr = a.offset_first_element_in_bytc.stride_y = e.stride_z = g.stride_w = i

                                                                                   l.ptr += l.offset_first_element_in_bytes + get_global_id(0) * d + get_global_id(1) * f + (get_global_id(2) % k) * h + (get_global_id(2) / k) * j;
  return l;
}

__global inline const uchar* F(const Vector* a, int b) {
  return a->ptr + b * a->stride_x;
}

__global inline uchar* G(const Image* a, int b, int c) {
  return a->ptr + b * a->stride_x + c * a->stride_y;
}
__global inline const uchar* H(const Tensor3D* a, int b, int c, int d) {
  return a->ptr + b * a->stride_x + c * a->stride_y + d * a->stride_z;
}
__global inline const uchar* I(const Tensor4D* a, int b, int c, int d, int e) {
  return a->ptr + b * a->stride_x + c * a->stride_y + d * a->stride_z + e * a->stride_w;
}
typedef struct Coordinates2D {
  int x;
  int y;
} Coordinates2D;

typedef struct Keypoint {
  int x;
  int y;
  float strength;
  float scale;
  float orientation;
  int tracking_status;
  float error;
} Keypoint;

typedef struct DetectionWindow {
  ushort x;
  ushort y;
  ushort width;
  ushort height;
  ushort idx_class;
  float score;
} DetectionWindow;
typedef struct InternalKeypoint {
  float x;
  float y;
  float tracking_status;
  float dummy;
} InternalKeypoint;
__kernel void J(__global float4* a, __global float4* b, const float c) {
  int d = get_global_id(0);

  float4 e = a[d];
  float4 f = b[d];

  e.xy *= (float2)(2.0f);
  f.xy *= (float2)(2.0f);

  a[d] = e;
  b[d] = f;
}
__kernel void K(__global Keypoint* a, __global InternalKeypoint* b, __global InternalKeypoint* c, const float d) {
  int e = get_global_id(0);

  Keypoint f = a[e];

  InternalKeypoint g;
  g.x = f.x * d;
  g.y = f.y * d;
  g.tracking_status = 1.f;

  b[e] = g;
  c[e] = g;
}
__kernel void L(__global Keypoint* a, __global Keypoint* b, __global InternalKeypoint* c, __global InternalKeypoint* d, const float e) {
  int f = get_global_id(0);

  Keypoint g = a[f];
  Keypoint h = b[f];
  InternalKeypoint i;
  InternalKeypoint j;

  i.x = g.x * e;
  i.y = g.y * e;
  i.tracking_status = 1.f;

  j.x = h.x * e;
  j.y = h.y * e;
  j.tracking_status = h.tracking_status;

  c[f] = i;
  d[f] = j;
}

__kernel void M(__global InternalKeypoint* a, __global Keypoint* b) {
  int c = get_global_id(0);

  InternalKeypoint d = a[c];

  Keypoint e;
  e.x = __clc_round(d.x);
  e.y = __clc_round(d.y);
  e.strength = 0.f;
  e.scale = 0.f;
  e.orientation = 0.f;
  e.tracking_status = d.tracking_status;
  e.error = 0.f;

  b[c] = e;
}
void __kernel N(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global uchar* g, uint h, uint i, uint j, uint k, uint l, __global uchar* m, uint n, uint o, uint p, uint q, uint r, __global float4* s, __global float4* t, __global float4* u, __global short4* v, const int w, const int x, const int y, const float3 z, const float aa, const int ab) {
  int ac = get_global_id(0);

  Image ad = B(a, f, b, 0, d, 0);
  Image ae = B(g, l, h, 0, j, 0);
  Image af = B(m, r, n, 0, p, 0);

  float2 ag = s[ac].xy - (float2)y;

  float2 ah = __clc_floor(ag);

  if (any(ah < z.zz) || any(ah >= z.xy)) {
    if (ab == 1) {
      t[ac].s2 = 0.0f;
    }

    u[ac].s3 = 0.0f;

    return;
  }

  float2 ai = ag - ah;

  float4 aj;
  aj.s3 = ai.x * ai.y;
  aj.s0 = aj.s3 + 1.0f - ai.x - ai.y;
  aj.s12 = ai - (float2)aj.s3;

  float4 ak;
  ak = __clc_round(aj * (float4)((float)(1 << (14))));
  ak.s3 = ((float)(1 << (14))) - ak.s0 - ak.s1 - ak.s2;

  int4 al = (int4)0;

  int am = ac * x;

  for (ushort an = 0; an < w; ++an) {
    int ao = ah.y + an;
    for (ushort ap = 0; ap < w; ++ap) {
      int aq = ah.x + ap;
      float4 ar;

      ar = convert_float4((uchar4)(vloao vloao));

      float4 as;

      as.s0 = dot(ar, ak) * (1.0f / (float)(1 << ((14) - 5)));

            ar = convert_float4((short4)(vload2(0, (__globao                                       vload2(0, (__globao));


            as.s1 = dot(ar, aj);


            ar = convert_float4((short4)(vload2(0, (__globao                                       vload2(0, (__globao));


            as.s2 = dot(ar, aj);


            int4 at = convert_int4(__clc_round(as));


            al.s0 += (int)(at.s1 * at.s1);
            al.s1 += (int)(at.s1 * at.s2);
            al.s2 += (int)(at.s2 * at.s2);


            v[am + ap] = convert_short4(at);
    }
    am += w;
  }

  float4 au = convert_float4(al) * (float4)(1.0f / (float)(1 << 20));

  au.s3 = (float)(au.s2 + au.s0 - sqrt(pown(au.s0 - au.s2, 2) + 4.0f * au.s1 * au.s1)) * aa;

  u[ac] = au;
}
void __kernel O(__global uchar* a, uint b, uint c, uint d, uint e, uint f, __global float4* g, __global float4* h, __global short4* i, const int j, const int k, const int l, const int m, const float n, const float3 o, const float p, const int q, const int r) {
  int s = get_global_id(0);
  Image t = B(a, f, b, 0, d, 0);

  float4 u = h[s];

  float v = u.s0 * u.s2 - u.s1 * u.s1;

  if (u.s3 < 1.0e-04f || v < 1.0e-07f) {
    if (q == 1) {
      g[s].s2 = 0;
    }

    return;
  }

  v = 1.0 / v;

  float2 w = g[s].xy - (float)l;

  float2 x = g[s].xy;

  float2 y = (float2)0.0f;

  int z = 0;
  while (z < m) {
    float2 aa = __clc_floor(w);

    if (any(aa < o.zz) || any(aa >= o.xy)) {
      if (q == 1) {
        g[s].s2 = 0.0f;
      } else {
        g[s].xy = x;
      }

      return;
    }

    float2 ab = w - aa;

    float4 ac;
    ac.s3 = ab.x * ab.y;
    ac.s0 = ac.s3 + 1.0f - ab.x - ab.y;
    ac.s12 = ab - (float2)ac.s3;
    ac = __clc_round(ac * (float4)((float)(1 << (14))));
    ac.s3 = ((float)(1 << (14))) - ac.s0 - ac.s1 - ac.s2;

    int2 ad = 0;

    int ae = s * k;

    for (int af = 0; af < j; ++af) {
      for (int ag = 0; ag < j; ++ag) {
        int4 ah = convert_int4(i[ae]);

                float4 ai = convert_float4((uchar4)afloaa                                                   afloaa))));

                int aj = (int)__clc_round(dot(ai, ac) * (1.0f / (float)(1 << ((14) - 5))));

                int ak = (int)(aj - ah.s0);

                ad += (ak * ah.s12);

                ae++;
      }
    }

    float2 al = convert_float2(ad) * (float2)(1.0f / (float)(1 << 20));

    float2 am;

    am.x = (float)((u.s1 * al.y - u.s2 * al.x) * v);
    am.y = (float)((u.s1 * al.x - u.s0 * al.y) * v);

    w += am;

    x = w + (float2)l;

    if (r == 1) {
      float an = dot(am, am);

      if (an <= n) {
        g[s].xy = x;

        return;
      }
    }

    if (z > 0 && all(__clc_fabs(am + y) < (float2)0.01f)) {
      x -= am * (float2)0.5f;

      g[s].xy = x;

      return;
    }

    y = am;

    z++;
  }

  g[s].xy = x;
}