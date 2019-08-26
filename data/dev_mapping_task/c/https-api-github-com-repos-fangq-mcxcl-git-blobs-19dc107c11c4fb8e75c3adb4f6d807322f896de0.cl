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
  int voidtime;
  int srctype;
  float4 srcparam1;
  float4 srcparam2;
  uint maxvoidstep;
  uint issaveexit;
  uint issaveref;
  uint maxgate;
  uint threadphoton;
  uint debuglevel;
} MCXParam __attribute__((aligned(32)));

typedef ulong RandType;

float A(__private RandType a[2]) {
  union {
    ulong i;
    float f[2];
    uint u[2];
  } b;
  const ulong c = a[1];
  b.i = a[0];
  a[0] = c;
  b.i ^= b.i << 23;
  a[1] = b.i ^ c ^ (b.i >> 18) ^ (c >> 5);
  b.i = a[1] + c;
  b.u[0] = 0x3F800000U | (b.u[0] >> 9);

  return b.f[0] - 1.0f;
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

float H(__private RandType a[2]);

float H(__private RandType a[2]) {
  return -log(D(a) + 0x1.0p-23f);
}
void I(__local float* a, __constant MCXParam* b);
float J(float a, int b);
float K(float4* a, float4* b, float4* c, int* d);
void L(float4* a, float b, float c, float d, float e);
void M(float4* a, float b, float c, int d);
float N(float4* a, float b, float c, int d);
int O(float4* a, float4* b, float4* c, __global const uint* d, __constant float4* e, __constant MCXParam* f);

int P(float4* a, float4* b, float4* c, float4* d, uint* e, __global float* f, uint* g, float* h, float* i, uint j, __local float* k, float* l, float* m, __global float* n, __global uint* o, __private RandType p[2], __constant float4* q, __global const uint* r, __global float* s, __constant float4* t, __constant MCXParam* u, int v, int w, int x, __local int* y, volatile __global uint* z);
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
float N(float4* a, float b, float c, int d) {
  float e = __clc_fabs((d == 0) ? a[0].x : (d == 1 ? a[0].y : a[0].z));
  float f = b * b;
  float g = c * c;
  float h = 1.f - f / g * (1.f - e * e);
  if (h > 0.f) {
    float i, j, k;
    i = f * e * e + g * h;
    h = sqrt(h);
    j = 2.f * b * c * e * h;
    k = (i - j) / (i + j);
    i = g * e * e + f * h * h;
    k = (k + (i - j) / (i + j)) * 0.5f;
    return k;
  } else {
    return 1.f;
  }
}
int O(float4* a, float4* b, float4* c, __global const uint* d, __constant float4* e, __constant MCXParam* f) {
  int g = 1, h;
  while (1) {
    if (!(any(isless(a[0].xyz, (float3)(0.f))) || any(isgreaterequal(a[0].xyz, (f->maxidx.xyz))))) {
      h = ((int)(__clc_floor(a[0].z)) * f->dimlen.y + (int)(__clc_floor(a[0].y)) * f->dimlen.x + (int)(__clc_floor(a[0].x)));
      if (d[h] & 0x0000FFFF) {
        ;
        float4 i;
        int j;
        a[0].xyz -= b[0].xyz;
        c[0].y -= f->minaccumtime;
        h = ((int)(__clc_floor(a[0].z)) * f->dimlen.y + (int)(__clc_floor(a[0].y)) * f->dimlen.x + (int)(__clc_floor(a[0].x)));

        g = 0;
        while ((any(isless(a[0].xyz, (float3)(0.f))) || any(isgreaterequal(a[0].xyz, (f->maxidx.xyz)))) || !(d[h] & 0x0000FFFF)) {
          c[0].y += f->minaccumtime * K(a, b, &i, &j);
          a[0] = (float4)(a[0].w);
          h = ((int)(__clc_floor(a[0].z)) * f->dimlen.y + (int)(__clc_floor(a[0].y)) * f->dimlen.x + (int)(__clc_floor(a[0].x)));
          ;

          if (g++ > 3) {
            ;
            break;
          }
        }
        c[0].y = (f->voidtime) ? c[0].y : 0.f;

        if (e[d[h] & 0x0000FFFF].w != e[0].w) {
          a[0].w *= 1.f - N(b, e[0].w, e[d[h] & 0x0000FFFF].w, j);
          ;
          if (a[0].w > 0x1.0p-23f) {
            M(b, e[0].w, e[d[h] & 0x0000FFFF].w, j);
            ;
          }
        }
        return h;
      }
    }
    if (((a[0].x < 0.f) && (b[0].x <= 0.f)) || ((a[0].x >= f->maxidx.x) && (b[0].x >= 0.f)) || ((a[0].y < 0.f) && (b[0].y <= 0.f)) || ((a[0].y >= f->maxidx.y) && (b[0].y >= 0.f)) || ((a[0].z < 0.f) && (b[0].z <= 0.f)) || ((a[0].z >= f->maxidx.z) && (b[0].z >= 0.f)))
      return -1;
    a[0] = (float4)(a[0].x + b[0].x, a[0].y + b[0].y, a[0].z + b[0].z, a[0].w);
    ;
    c[0].y += f->minaccumtime;
    if ((uint)g++ > f->maxvoidstep)
      return -1;
  }
}
int P(float4* a, float4* b, float4* c, float4* d, uint* e, __global float* f, uint* g, float* h, float* i, uint j, __local float* k, float* l, float* m, __global float* n, __global uint* o, __private RandType p[2], __constant float4* q, __global const uint* r, __global float* s, __constant float4* t, __constant MCXParam* u, int v, int w, int x, __local int* y, volatile __global uint* z) {
  *h = 1.f;
  *i = -1.f;
  *d = (float4)(us.x, us.y, us.z, 0);

  if (a[0].w >= 0.f) {
    *l += a[0].w;
    if (u->issaveref && *g == 0 && *e != 0xFFFFFFFF) {
      int aa = (((int)u->maxgate - 1) < ((int)(__clc_floor((c[0].y - u->twin0) * u->Rtstep))) ? ((int)u->maxgate - 1) : ((int)(__clc_floor((c[0].y - u->twin0) * u->Rtstep))));

      f[*e + aa * u->dimlen.z] += -a[0].w;
    }
  }

  if (c[0].w >= (w + (v < x)))
    return 1;
  do {
    a[0] = u->ps;
    b[0] = u->c0;
    c[0] = (float4)(0.f, 0.f, uinaccumtime, c[0].w);
    *e = u->idx1dorig;
    *g = u->mediaidorig;
    if (*i < 0.f && u->c0.w != 0.f) {
      float ab = (u->c0.w > 0.f) - (u->c0.w < 0.f);
      d[0].x += u->c0.w * b[0].x;
      d[0].y += u->c0.w * b[0].y;
      d[0].z += u->c0.w * b[0].z;
      b[0].x = ab * (d[0].x - a[0].x);
      b[0].y = ab * (d[0].y - a[0].y);
      b[0].z = ab * (d[0].z - a[0].z);
      ab = (1.f / sqrt(b[0].x * b[0].x + b[0].y * b[0].y + b[0].z * b[0].z));
      b[0].x *= ab;
      b[0].y *= ab;
      b[0].z *= ab;
    }
    if ((*g & 0x0000FFFF) == 0) {
      int ac = O(a, b, c, r, q, u);
      if (ac >= 0) {
        *e = ac;
        *g = r[*e];
      }
    }
    *h += 1.f;

    if (*h > u->maxvoidstep)
      return -1;
  } while ((*g & 0x0000FFFF) == 0 || a[0].w <= u->minenergy);

  c[0].w += 1.f;
  d[0] = (q[*g & 0x0000FFFF]);
  *m += a[0].w;
  *h = a[0].w;
  b[0].w = 0x1.0p-23f;
  *i = 0.f;

  if ((u->debuglevel & 4) && ((int)(c[0].w) & 1) && (v == 0 || v == (int)(get_global_size(0) - 1) || v == (int)(get_global_size(0) >> 1))) {
    z[0]++;
  }
  return 0;
}

__kernel void Q(const int a, const int b, __global const uint* c, __global float* d, __global float* e, __global uint* f, __global float* g, __constant float4* h, __global float* i, __constant float4* j, volatile __global uint* k, __global uint* l, __local float* m, __constant MCXParam* n) {
  int o = get_global_id(0);

  float4 p = {0.f, 0.f, 0.f, -1.f};
  float4 q = n->c0;
  float4 r = {0.f, 0.f, 0.f, 0.f};
  float s = e[o << 1];
  float t = e[(o << 1) + 1];

  uint u, v;

  uint w = n->mediaidorig, x = 0, y = 0;
  float z, aa;
  float ab;
  int ac = 0;

  RandType ad[2];
  float4 ae;

  __local float* af = m + get_local_id(0) * n->maxmedia;
  __local int ag[1];
  F(ad, f, o);

  if (P(&p, &q, &r, &ae, &u, d, &w, &z, &aa, 0, af, &s, &t, g, l, ad, h, c, i, j, n, o, a, b, ag, k)) {
    f[o] = 9999;
    return;
  }

  while (r.w <= a + (o < b)) {
    ;

    if (r.x <= 0.f) {
      r.x = H(ad);

      ;

      if (q.w != 0x1.0p-23f) {
        float ah, ai, aj, ak, al;
        float am = 6.28318530717959f * D(ad);
        (ah) = sincos((am), &(ai));
        ;

        if (ae.z > 0x1.0p-23f) {
          am = (1.f - ae.z * ae.z) / (1.f - ae.z + 2.f * ae.z * D(ad));
          am *= am;
          am = (1.f + ae.z * ae.z - am) / (2.f * ae.z);

          am = max(-1.f, min(1.f, am));

          aj = acos(am);
          ak = sin(aj);
          al = am;
        } else {
          aj = acos(2.f * D(ad) - 1.f);
          (al) = sincos((aj), &(ak));
        };
        L(&q, ak, al, ai, ah);
        q.w += 1.f;
      }
      q.w = (int)q.w;
    }

    ab = ae.w;
    ae = (h[w & 0x0000FFFF]);

    float4 an;
    r.z = K(&p, &q, &an, &ac);
    float ao = r.z * ae.y;
    ao = fmin(ao, r.x);
    r.z = ((ao) / (ae.y));

    ;

    p.xyz = (ao == r.x) ? p.xyz + (float3)(r.z) * q.xyz : an.xyz;

    p.w *= exp(-ae.x * r.z);
    r.x -= ao;
    r.y += r.z * ae.w * n->oneoverc0;

    ;

    x = w | y;
    v = u;
    u = ((int)__clc_floor(p.z) * n->dimlen.y + (int)__clc_floor(p.y) * n->dimlen.x + (int)__clc_floor(p.x));
    ;

    if (any(isless(p.xyz, (float3)(0.f))) || any(isgreaterequal(p.xyz, (n->maxidx.xyz)))) {
      w = 0;
      u = 0xFFFFFFFF;
    } else {
      w = c[u];
      y = w & 0xFFFF0000;
      w &= 0x0000FFFF;
    }

    ;

    if (u != v && v > 0 && x) {
      ;

      if (n->save2pt && r.y >= n->twin0 && r.y < n->twin1) {
        ;

        d[v + (int)(__clc_floor((r.y - n->twin0) * n->Rtstep)) * n->dimlen.z] += z - p.w;
      }
      z = p.w;
    }

    if ((w == 0 && (!n->doreflect || (n->doreflect && ab == h[w & 0x0000FFFF].w))) || r.y > n->twin1) {
      ;
      if (P(&p, &q, &r, &ae, &u, d, &w, &z, &aa, (x & 0xFFFF0000), af, &s, &t, g, l, ad, h, c, i, j, n, o, a, b, ag, k)) {
        break;
      }
      y = w & 0xFFFF0000;
      w &= 0x0000FFFF;
      continue;
    }
  }
  e[o << 1] = s;
  e[(o << 1) + 1] = t;
}