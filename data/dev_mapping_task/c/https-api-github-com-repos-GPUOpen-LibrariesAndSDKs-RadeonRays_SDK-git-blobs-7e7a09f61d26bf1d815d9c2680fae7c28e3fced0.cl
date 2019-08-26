typedef struct _Ray {
  float4 o;

  float4 d;

  int2 extra;

  float2 padding;
} Ray;

typedef struct _Camera {
  float3 forward;
  float3 up;
  float3 p;

  float2 zcap;
} Camera;

typedef struct _Intersection {
  int shapeid;

  int primid;

  int padding0;
  int padding1;

  float4 uvwt;
} Intersection;

float4 A(__global const float* a, __global const int* b, int c, __global const float4* d) {
    float4 e = (float4)(c* 3],
                        c* 3 + 1],
                        c* 3 + 2], 0.f);

    float4 f = (float4)(c 1] * 3],
                        c 1] * 3 + 1],
                        c 1] * 3 + 2], 0.f);

    float4 g = (float4)(c 2] * 3],
                        c 2] * 3 + 1],
                        c 2] * 3 + 2], 0.f);
    return e * (1 - d->x - d->y) + f * d->x + g * d->y;
}

__kernel void B(__global Ray* a, __global const Camera* b, int c, int d) {
  int2 e;
  e.x = get_global_id(0);
  e.y = get_global_id(1);

  if (e.x < c && e.y < d) {
    const float f = 2.f / (float)c;
    const float g = 2.f / (float)d;
    float h = -1.f + f * (float)e.x;
    float i = g * (float)e.y;
    float j = b->zcap.x;

    int k = e.y * c + e.x;
    a[k].o.xyz = b->p;
    a[k].d.x = h - b->p.x;
    a[k].d.y = i - b->p.y;
    a[k].d.z = j - b->p.z;
    a[k].o.w = b->zcap.y;

    a[k].extra.x = 0xFFFFFFFF;
    a[k].extra.y = 0xFFFFFFFF;
  }
}

__kernel void C(__global Ray* a,

                __global float* b, __global float* c, __global int* d, __global float* e, __global int* f,

                __global Intersection* g,

                float4 h,

                int i, int j) {
  int2 k;
  k.x = get_global_id(0);
  k.y = get_global_id(1);

  if (k.x < i && k.y < j) {
    int l = k.y * i + k.x;
    int m = g[l].shapeid;
    int n = g[l].primid;

    if (m == -1 || n == -1) {
      return;
    }

    int o = f[m];
    float4 p = A(b + o * 3, d + o, n, &g[l].uvwt);
    float4 q = A(c + o * 3, d + o, n, &g[l].uvwt);
    q = normalize(q);

    float4 r = h - p;
    a[l].d = normalize(r);
    a[l].o = p + q * 0.001f;
    a[l].o.w = length(r);

    a[l].extra.x = 0xFFFFFFFF;
    a[l].extra.y = 0xFFFFFFFF;
  }
}

__kernel void D(__global float* a, __global float* b, __global int* c, __global float* d, __global int* e,

                __global Intersection* f, __global const int* g,

                float4 h, int i, int j, __global unsigned char* k) {
  int2 l;
  l.x = get_global_id(0);
  l.y = get_global_id(1);

  if (l.x < i && l.y < j) {
    int m = l.y * i + l.x;
    int n = f[m].shapeid;
    int o = f[m].primid;

    if (n != -1 && o != -1 && g[m] == -1) {
      int p = e[n];

      float4 q = A(a + p * 3, c + p, o, &f[m].uvwt);
      float4 r = A(b + p * 3, c + p, o, &f[m].uvwt);
      r = normalize(r);

      int s = p + o * 3;
      float4 t = (float4s s s1.f);

      float4 u = (float4)(0.f, 0.f, 0.f, 0.f);
      float4 v = normalize(h - q);
      float w = dot(r, v);
      if (w > 0)
        u += w * t;

      k[m * 4] = u.x * 255;
      k[m * 4 + 1] = u.y * 255;
      k[m * 4 + 2] = u.z * 255;
      k[m * 4 + 3] = 255;
    }
  }
}