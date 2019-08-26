inline float A(const float4 a, const float4 b, const float4 c, const float4 d, const float4 e, const float f) {
  float4 g = d - c;
  float4 h = e - c;
  float i, j, k, l;

  float4 m = cross(b, h);
  i = dot(g, m);

  if (i > -f && i < f)
    return 99999.0;

  j = 1.0f / i;
  float4 n = a - c;
  k = j * dot(n, m);

  if (k < 0.0f || k > 1.0f)
    return 99999.0;

  float4 o = cross(n, g);
  l = j * dot(b, o);

  if (l < 0.0f || k + l > 1.0f)
    return 99999.0;

  j = j * dot(h, o);

  if (j > f)
    return j;

  else

    return 99999.0;
}

inline float4 B(float4 a, float4 b, float4 c, float4 d) {
  float4 e;
  e.x = b.x;
  e.y = c.x;
  e.z = d.x;
  e.w = 0;
  float4 f;
  f.x = b.y;
  f.y = c.y;
  f.z = d.y;
  f.w = 0;
  float4 g;
  g.x = b.z;
  g.y = c.z;
  g.z = d.z;
  g.w = 0;

  float4 h;
  h.x = dot(a, e);
  h.y = dot(a, f);
  h.z = dot(a, g);
  h.w = 0;

  return normalize(h);
}

inline uchar C(float4 a, float4 b) {
  unsigned char c = 0;

  if (a.x > a.y) {
    if (a.x > a.z) {
      if (b.y < a.x)
        c |= 2;
      if (b.z < a.x)
        c |= 1;
      return c;
    }
  } else {
    if (a.y > a.z) {
      if (b.x < a.y)
        c |= 4;
      if (b.z < a.y)
        c |= 1;
      return c;
    }
  }

  if (b.x < a.z)
    c |= 4;
  if (b.y < a.z)
    c |= 2;
  return c;
}

inline uchar D(float a, unsigned char b, float c, unsigned char d, float e, unsigned char f) {
  if (a < c) {
    if (a < e)
      return b;
  } else {
    if (c < e)
      return d;
  }
  return f;
}

inline bool E(unsigned char a, unsigned char b) {
  return ((a >> b) & 1);
}

typedef struct {
  float4 t0stack[1024];
  float4 t1stack[1024];
  int cstack[1024];
  unsigned int ostack[1024];
} CastStack;

inline uint F(CastStack* a, int b, float4* c, float4* d, int* e) {
  (*c) = (*a).t0stack[b];
  (*d) = (*a).t1stack[b];
  (*e) = (*a).cstack[b];

  return (*a).ostack[b];
}

inline void G(CastStack* a, int b, float4 c, float4 d, int e, unsigned int f) {
  (*a).t0stack[b] = c;
  (*a).t1stack[b] = d;
  (*a).cstack[b] = e;
  (*a).ostack[b] = f;
}

__constant unsigned char Ga[] = {
    0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
    1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7, 4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 0,
};
inline unsigned char H(unsigned char a) {
  return Ga[a];
}
__kernel void I(__global const float4* a, __global const uint* b, __global const uint* c, __global const float4* d, __global float* e, const float4 f, const float4 g, const float h, const uint i, const uint j, const uint k)

{
  const uint l = get_global_id(0) + (k * 4096);
  const uint m = (uint)(l / i);

  if (m > j)
    return;

  const float4 n = a[m * 3];
  const float4 o = a[m * 3 + 1];
  const float4 p = a[m * 3 + 2];
  const float4 q = (n + o + p) / 3.0f;
  const float4 r = normalize(cross(o - n, p - n) * (-1.0f));
  const float4 s = normalize(n - p);
  const float4 t = normalize(cross(s, r));

  float4 u = B(d[l % i], s, r, t);

  float v = 99999.0;
  unsigned char w = 0;

  if (__clc_fabs(u.x) < h)
    u.x = u.x < 0.0 ? -h : h;
  if (__clc_fabs(u.y) < h)
    u.y = u.y < 0.0 ? -h : h;
  if (__clc_fabs(u.z) < h)
    u.z = u.z < 0.0 ? -h : h;

  float x = 1.0f / __clc_fabs(u.x);
  float y = 1.0f / __clc_fabs(u.y);
  float z = 1.0f / __clc_fabs(u.z);

  float4 aa, ab;
  aa.w = 0;
  ab.w = 0;

  if (u.x < 0.0) {
    aa.x = (g.x - q.x) * -x;
    ab.x = (f.x - q.x) * -x;
    w |= 4;
  } else {
    aa.x = (f.x - q.x) * x;
    ab.x = (g.x - q.x) * x;
  }
  if (u.y < 0.0) {
    aa.y = (g.y - q.y) * -y;
    ab.y = (f.y - q.y) * -y;
    w |= 2;
  } else {
    aa.y = (f.y - q.y) * y;
    ab.y = (g.y - q.y) * y;
  }
  if (u.z < 0.0) {
    aa.z = (g.z - q.z) * -z;
    ab.z = (f.z - q.z) * -z;
    w |= 1;
  } else {
    aa.z = (f.z - q.z) * z;
    ab.z = (g.z - q.z) * z;
  }

  if (max(max(aa.x, aa.y), aa.z) < min(min(ab.x, ab.y), ab.z)) {
    float4 ac;
    int ad = -1;
    CastStack ae;
    int af = 0;
    unsigned int ag = b[0];
    unsigned char ah = (ag & 0xFF);
    unsigned int ai;
    unsigned int aj = 0;
    unsigned int ak = 0;
    unsigned char al = 0;
    float am = 99999.0;
    float an = 0.0f;
    float4 n, o, p;
    float4 ao;
    unsigned char ap;
    while (af < 1024) {
      if (ad == 8) {
        if (af > 0) {
          af--;
          ag = F(&ae, af, &aa, &ab, &ad);
          ah = (ag & 0xFF);
          continue;
        } else
          break;
      }

      else if (ad == -1) {
        if ((ab.x < 0.0) || (ab.y < 0.0) || (ab.z < 0.0)) {
          if (af > 0) {
            af--;
            ag = F(&ae, af, &aa, &ab, &ad);
            ah = (ag & 0xFF);
            continue;
          } else
            break;
        }

        if (ah == 0) {
          ai = ag >> 8;
          aj = c[ai];
          for (ak = 1; ak <= aj; ak++) {
            {
              n = a[c[ai + ak] * 3 + 0];
              o = a[c[ai + ak] * 3 + 1];
              p = a[c[ai + ak] * 3 + 2];

              am = A(q, u, n, o, p, h);
              if ((am < 99999.0) && (am > h)) {
                ao = normalize(cross(o - n, p - n));
                an = acos(dot(u, ao) / length(u));
                an = an * (180.0f / (float)3.14);
                if ((an < 90.0f) && (am < v))
                  v = am;
              }
            }
          }
          if (v < (99999.0 - 1.0f))
            break;

          af--;
          ag = F(&ae, af, &aa, &ab, &ad);
          ah = (ag & 0xFF);
          aj = 0;
          continue;
        }
        ac = (aa + ab) * 0.5f;
        ad = C(aa, ac);
      } else
        ac = (aa + ab) * 0.5f;

      switch (ad) {
        case 0:
          if (E(ah, w)) {
            ad = D(ac.x, 4, ac.y, 2, ac.z, 1);
            G(&ae, af, aa, ab, ad, ag);
            ab = ac;

            ad = -1;
            ah = ah << (8 - (w));
            ah = ah >> (8 - (w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ac.x, 4, ac.y, 2, ac.z, 1);
            af--;
          }
          break;
        case 1:
          if (E(ah, 1 ^ w)) {
            ad = D(ac.x, 5, ac.y, 3, ab.z, 8);
            G(&ae, af, aa, ab, ad, ag);
            aa.z = ac.z;
            ab.x = ac.x;
            ab.y = ac.y;

            ad = -1;
            ah = ah << (8 - (1 ^ w));
            ah = ah >> (8 - (1 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ac.x, 5, ac.y, 3, ab.z, 8);
            af--;
          }
          break;
        case 2:
          if (E(ah, 2 ^ w)) {
            ad = D(ac.x, 6, ab.y, 8, ac.z, 3);
            G(&ae, af, aa, ab, ad, ag);
            aa.y = ac.y;
            ab.x = ac.x;
            ab.z = ac.z;

            ad = -1;
            ah = ah << (8 - (2 ^ w));
            ah = ah >> (8 - (2 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ac.x, 6, ab.y, 8, ac.z, 3);
            af--;
          }
          break;
        case 3:
          if (E(ah, 3 ^ w)) {
            ad = D(ac.x, 7, ab.y, 8, ab.z, 8);
            G(&ae, af, aa, ab, ad, ag);
            aa.y = ac.y;
            aa.z = ac.z;
            ab.x = ac.x;

            ad = -1;
            ah = ah << (8 - (3 ^ w));
            ah = ah >> (8 - (3 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ac.x, 7, ab.y, 8, ab.z, 8);
            af--;
          }
          break;
        case 4:
          if (E(ah, 4 ^ w)) {
            ad = D(ab.x, 8, ac.y, 6, ac.z, 5);
            G(&ae, af, aa, ab, ad, ag);
            aa.x = ac.x;
            ab.y = ac.y;
            ab.z = ac.z;

            ad = -1;
            ah = ah << (8 - (4 ^ w));
            ah = ah >> (8 - (4 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ab.x, 8, ac.y, 6, ac.z, 5);
            af--;
          }
          break;
        case 5:
          if (E(ah, 5 ^ w)) {
            ad = D(ab.x, 8, ac.y, 7, ab.z, 8);
            G(&ae, af, aa, ab, ad, ag);
            aa.x = ac.x;
            aa.z = ac.z;
            ab.y = ac.y;

            ad = -1;
            ah = ah << (8 - (5 ^ w));
            ah = ah >> (8 - (5 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ab.x, 8, ac.y, 7, ab.z, 8);
            af--;
          }
          break;
        case 6:
          if (E(ah, 6 ^ w)) {
            ad = D(ab.x, 8, ab.y, 8, ac.z, 7);
            G(&ae, af, aa, ab, ad, ag);
            aa.x = ac.x;
            aa.y = ac.y;
            ab.z = ac.z;

            ad = -1;
            ah = ah << (8 - (6 ^ w));
            ah = ah >> (8 - (6 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = D(ab.x, 8, ab.y, 8, ac.z, 7);
            af--;
          }
          break;
        case 7:
          if (E(ah, 7 ^ w)) {
            ad = 8;
            G(&ae, af, aa, ab, ad, ag);
            aa.x = ac.x;
            aa.y = ac.y;
            aa.z = ac.z;

            ad = -1;
            ah = ah << (8 - (7 ^ w));
            ah = ah >> (8 - (7 ^ w));
            ap = H(ah);

            ag = b[(ag >> 8) + ap];
            ah = (ag & 0xFF);
          } else {
            ad = 8;
            af--;
          }
          break;
      }

      af++;
    }
  }

  e[l] = v;
}