typedef struct KernelParams {
  float4 ps, c0;
  float4 maxidx;
  uint4 dimlen, cp0, cp1;
  uint2 cachebox;
  float minstep;
  float twin0, twin1, tmax;
  float oneoverc0;
  uint isrowmajor, save2pt, doreflect, dorefint, savedet;
  float Rtstep;
  float minenergy;
  float skipradius2;
  float minaccumtime;
  uint maxdetphoton;
  uint maxmedia;
  uint detnum;
  uint idx1dorig;
  uint mediaidorig;
  uint blockphoton;
  uint blockextra;
} MCXParam __attribute__((aligned(32)));

typedef ulong RandType;

float A(__private RandType a[2]) {
  union {
    double d;
    ulong i;
  } b;
  const ulong c = a[1];
  b.i = a[0];
  a[0] = c;
  b.i ^= b.i << 23;
  a[1] = b.i ^ c ^ (b.i >> 18) ^ (c >> 5);
  b.i = a[1] + c;
  b.i = (b.i >> 12) | 0x3FF0000000000000ul;

  return (float)b.d - 1.0f;
}

void B(__private RandType a[2], __private RandType b[2]) {
  b[0] = a[0];
  b[1] = a[1];
}

void C(__private RandType a[2]) {
}

float D(__private RandType a[2]) {
  return A(a);
}

void E(__global uint* a, RandType b[2]) {
  b[0] = (ulong)a[0] << 32 | a[1];
  b[1] = (ulong)a[2] << 32 | a[3];
}

void F(__private RandType a[2], __global uint* b, int c) {
  E((b + c * 4), a);
}
void G(__private RandType a[2], __global uint* b, uint c, float d) {
}

float H(__private RandType a[2]) {
  return -log(D(a) + 0x1.0p-23f);
}
void I(__local float* a, __constant MCXParam* b) {
  uint c;
  for (c = 0; c < b->maxmedia; c++)
    a[c] = 0.f;
}
float J(float a, int b) {
  union {
    float f;
    uint i;
  } c;
  c.f = a + 1000.f;
  c.i += b ^ (c.i & 0x80000000U);
  return c.f - 1000.f;
}

float K(float4* a, float4* b, float4* c, int* d) {
  float e;

  c[0] = __clc_fabs(__clc_floor(a[0]) - convert_float4(isgreater(b[0], ((float4)(0.f)))) - a[0]);
  c[0] = __clc_fabs(((c[0] + (float4)0x1.0p-23f) / (b[0])));

  e = fmin(fmin(c[0].x, c[0].y), c[0].z);
  (*d) = (e == c[0].x ? 0 : (e == c[0].y ? 1 : 2));

  c[0] = a[0] + (float4)(e)*b[0];

  (*d == 0) ? (c[0].x = J(convert_float_rte(c[0].x), (b[0].x > 0.f) - (b[0].x < 0.f))) : ((*d == 1) ? (c[0].y = J(convert_float_rte(c[0].y), (b[0].y > 0.f) - (b[0].y < 0.f))) : (c[0].z = J(convert_float_rte(c[0].z), (b[0].z > 0.f) - (b[0].z < 0.f))));

  return e;
}
void L(float4* a, float b, float c, float d, float e) {
  if (a[0].z > -1.f + 0x1.0p-23f && a[0].z < 1.f - 0x1.0p-23f) {
    float f = 1.f - a[0].z * a[0].z;
    float g = b * (1.f / sqrt(f));
    *((float4*)a) = (float4)(a[0].x * a[0].z * ea[0].y * d a[0].x * c a[0].y * a[0].z * ea[0].x * d a[0].y * c ea[0].z * c a[0].w);
  } else {
    a[0] = (fa[0].z > a.fc.w);
  }
  a[0].xyz = a[0].xyz * (1.f / sqrt(a[0].x * a[0].x + a[0].y * a[0].y + a[0].z * a[0].z));
  ;
}

void M(float4* a, float b, float c, int d) {
  float e = b / c;
  a[0].xyz *= e;

  (d == 0) ? (a[0].x = sqrt(1.f - a[0].y * a[0].y - a[0].z * a[0].z) * ((a[0].x > 0.f) - (a[0].x < 0.f))) : ((d == 1) ? (a[0].y = sqrt(1.f - a[0].x * a[0].x - a[0].z * a[0].z) * ((a[0].y > 0.f) - (a[0].y < 0.f))) : (a[0].z = sqrt(1.f - a[0].x * a[0].x - a[0].y * a[0].y) * ((a[0].z > 0.f) - (a[0].z < 0.f))));
}

int N(float4* a, float4* b, float4* c, float4* d, uint* e, uint* f, float* g, uint h, __local float* i, float* j, float* k, __global float* l, __global uint* m, __constant float4* n, __constant float4* o, __constant MCXParam* p, int q, int r, int s, __local int* t) {
  if (a[0].w >= 0.f) {
    *j += a[0].w;
    a[0].w = 0.f;
  }

  if (c[0].w >= (r + (q < s)))
    return 1;

  a[0] = p->ps;
  b[0] = p->c0;
  c[0] = (float4)(0.f, 0.f, pinaccumtime, c[0].w + 1);
  *e = p->idx1dorig;
  *f = p->mediaidorig;
  d[0] = (n[*f & 0x7F]);
  *k += a[0].w;
  *g = a[0].w;
  return 0;
}

__kernel void O(const int a, const int b, __global const uint* c, __global float* d, __global float* e, __global uint* f, __global float* g, __constant float4* h, __constant float4* i, __global uint* j, __global uint* k, __local float* l, __constant MCXParam* m) {
  int n = get_global_id(0);

  float4 o = {0.f, 0.f, 0.f, -1.f};
  float4 p = m->c0;
  float4 q = {0.f, 0.f, 0.f, 0.f};
  float r = 0.f;
  float s = 0.f;

  uint t, u;

  uint v = m->mediaidorig, w = 0, x = 0;
  float y;
  float z;
  int aa = 0;

  RandType ab[2];
  float4 ac;

  __local float* ad = l + get_local_id(0) * m->maxmedia;
  __local int ae[1];
  F(ab, f, n);

  if (N(&o, &p, &q, &ac, &t, &v, &y, 0, ad, &r, &s, g, k, h, i, m, n, a, b, ae)) {
    f[n] = 9999;
    return;
  }

  while (q.w <= a + (n < b)) {
    ;

    if (q.x <= 0.f) {
      q.x = H(ab);

      ;

      if (o.w < 1.f) {
        float af, ag, ah, ai, aj;
        float ak = 6.28318530717959f * D(ab);
        (af) = sincos((ak), &(ag));
        ;

        if (ac.z > 0x1.0p-23f) {
          ak = (1.f - ac.z * ac.z) / (1.f - ac.z + 2.f * ac.z * D(ab));
          ak *= ak;
          ak = (1.f + ac.z * ac.z - ak) / (2.f * ac.z);

          ak = max(-1.f, min(1.f, ak));

          ah = acos(ak);
          ai = sin(ah);
          aj = ak;
        } else {
          ah = acos(2.f * D(ab) - 1.f);
          (aj) = sincos((ah), &(ai));
        };
        L(&p, ai, aj, ag, af);
        p.w += 1.f;
      }
    }

    z = ac.w;
    ac = (h[v & 0x7F]);

    float4 al;
    q.z = K(&o, &p, &al, &aa);
    float am = q.z * ac.y;
    am = fmin(am, q.x);
    q.z = ((am) / (ac.y));

    ;

    o.xyz = (am == q.x) ? o.xyz + (float3)(q.z) * p.xyz : al.xyz;

    o.w *= exp(-ac.x * q.z);
    q.x -= am;
    q.y += q.z * ac.w * m->oneoverc0;

    ;

    w = v | x;
    u = t;
    t = ((int)__clc_floor(o.z) * m->dimlen.y + (int)__clc_floor(o.y) * m->dimlen.x + (int)__clc_floor(o.x));
    ;

    if (any(isless(o.xyz, (float3)(0.f))) || any(isgreaterequal(o.xyz, (m->maxidx.xyz)))) {
      v = 0;
    } else {
      v = c[t];
      x = v & 0x80;
      v &= 0x7F;
    }

    ;

    if (t != u && u > 0 && w) {
      ;

      if (m->save2pt && q.y >= m->twin0 && q.y < m->twin1) {
        ;

        d[u + (int)(__clc_floor((q.y - m->twin0) * m->Rtstep)) * m->dimlen.z] += y - o.w;
      }
      y = o.w;
    }

    if ((v == 0 && (!m->doreflect || (m->doreflect && z == h[v & 0x7F].w))) || q.y > m->twin1) {
      ;
      if (N(&o, &p, &q, &ac, &t, &v, &y, (w & 0x80), ad, &r, &s, g, k, h, i, m, n, a, b, ae)) {
        break;
      }
      x = v & 0x80;
      v &= 0x7F;
      continue;
    }
  }
  e[n << 1] = r + o.w;
  e[(n << 1) + 1] = s;
}