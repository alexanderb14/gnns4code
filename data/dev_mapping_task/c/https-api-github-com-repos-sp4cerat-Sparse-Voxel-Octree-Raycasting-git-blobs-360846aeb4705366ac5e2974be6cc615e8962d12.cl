__kernel void A(__global uint* a, uint b, uint c) {
  a[get_global_id(0) + b] = c;
}
__kernel void B(__global uint* a, uint b, __global uint* c, uint d) {
  a[b + get_global_id(0)] = c[d + get_global_id(0)];
}
inline uint C(uint a) {
  a = (a & 0x55) + (a >> 1 & 0x55);
  a = (a & 0x33) + (a >> 2 & 0x33);
  a = (a + (a >> 4)) & 0x0f;
  return a;
}

inline uint D(__global uint* a, uint const b, uint const c, uint* d, uint e, uint f,

              uint g) {
  uint h = b >> 9;
  uint i = e;

  if (b & 256) {
    if (!(c & 256)) {
      (*d) = h << 6;
      h = h ^ h;
    }
    h += (*d);
    i = C(b & ((f << 1) - 1));

    if (g == 2) {
      return ((a[h + (i >> 2)] >> ((i & 3) << 3)) & 255) + 256 + (i << 9);
    }
  }
  return a[h + i];
}

inline uint E(__global uint* a, uint const b, uint const c, uint const d, uint* e, uint f, uint g

              ) {
  uint h = b >> 9;
  uint i = 8;

  if (f == 1) {
    h = (c >> 9) & 15;
    uint j = (d >> 9) + (*e);
    i = 0 + C(d & 255);
    for (int k = 1; k < h; ++k) {
      i += C((a[j + (k >> 2)] >> ((k & 3) << 3)) & 255);
    }
    i += C(c & ((g << 1) - 1));

    return a[j + (i >> 2)] >> ((i & 3) << 3);
  }

  if (b & 256) {
    if (!(c & 256)) {
      (*e) = h << 6;
      h = h ^ h;
    }
    i = (*e);

    if (f == 2) {
      uint j = (c >> 9) + (*e);
      i = 1 + C(c & 255);
      for (int k = 1; k < h; ++k) {
        i += C((a[j + (k >> 2)] >> ((k & 3) << 3)) & 255);
      }
      return a[j + (i >> 2)] >> ((i & 3) << 3);
    }
  }
  return a[h + i];
}
struct BVHNode {
  uint childs[2];
  float p[12];
};
struct BVHChild {
  float3 min, max;
  float4 m0;
  float4 m1;
  float4 m2;
  float4 m3;
  uint octreeroot;
};

__kernel void F(__global uint* a, __global float* b, __global uint* c, int d, int e, int f)

{
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  if (g >= d / 16)
    return;
  if (h >= e / 16)
    return;

  int i = 0;

  int j = g * 16;
  int k = h * 16;
  int l = j + k * d;
  int m = min(d - j, 16) / 2;
  int n = min(e - k, 16) / 2;

  for (int o = 0; o < n; ++o)
    for (int p = 0; p < m; ++p) {
      int q = l + p * 2 + o * 2 * d;
      int r = 0;
      if (a[q] == 0xffffff00)
        r++;
      if (a[q + 1] == 0xffffff00)
        r++;
      if (a[q + 1 + d] == 0xffffff00)
        r++;
      if (a[q + d] == 0xffffff00)
        r++;
      if (r >= 4)
        i += 4;
    }
  c[g + h * (d / 16)] = i;
}

__kernel void G(__global uint* a, __global float* b, __global uint* c, int d, int e, int f) {
  const int g = get_global_id(0);

  if (g > 0)
    return;

  int h = 0;
  int i = (d / 16) * (e / 16);

  for (int j = 0; j < i; ++j) {
    int k = c[j];
    c[j + i] = h;
    h += k;
  }
  c[0] = h;
}

__kernel void H(__global uint* a, __global float* b, __global uint* c, int d, int e, int f)

{
  const int g = get_global_id(0);
  const int h = get_global_id(1);
  if (g >= d / 16)
    return;
  if (h >= e / 16)
    return;

  int i = (d / 16) * (e / 16);
  int j = 0;
  int k = g * 16;
  int l = h * 16;

  int m = k + l * d;
  int n = c[g + h * (d / 16) + i] + i * 2;
  int o = min(d - k, 16) / 2;
  int p = min(e - l, 16) / 2;

  for (int q = 0; q < p; ++q)
    for (int r = 0; r < o; ++r) {
      int s = 0, t = m + r * 2 + q * 2 * d, u = k + r * 2 + ((q * 2 + l) << 16);
      int v = u;

      if (a[t] == 0xffffff00)
        s++;
      if (a[t + 1] == 0xffffff00)
        s++;
      if (a[t + 1 + d] == 0xffffff00)
        s++;
      if (a[t + d] == 0xffffff00)
        s++;

      if (s >= 4) {
        c[n] = u;
        n++;
        c[n] = u + 1;
        n++;
        c[n] = u + 1 + (1 << 16);
        n++;
        c[n] = u + (1 << 16);
        n++;
      }
    }
}

__kernel void I(__global uint* a, __global float* b, __global int* c, __global int* d, __global float* e, int f, int g, int h) {
  const int i = get_local_id(0), j = get_local_id(1);
  const int k = get_local_size(0), l = get_local_size(1);
  const int m = get_global_id(0), n = get_global_id(1);
  if (m >= f - 4 || n >= g - 4 || m < 3 || n < 3)
    return;

  uint o = n * f + m;

  uint p = a[o];
  if (p == 0xffffff00)
    return;

  float q = b[o * 4 + 3];
  float r = q;
  uint s = p;

  int t, u;

  int v = 0;
  int w = 0;

  for (int x = -1 + v; x < 1 + v; ++x)
    for (int y = -1 + w; y < 1 + w; ++y) {
      uint z = o + y * f + x;
      float aa = b[z * 4 + 3];
      if (aa < r) {
        t = x;
        u = y;
        r = aa;
      }
    }
  int ab = c[o];
  int ac = d[o];

  int ad = o + u * f + t;
  int ae = c[ad];
  int af = d[ad];

  if (q <= r)
    return;

  if (__clc_fabs(r - q) > min(q, r) * (0.00625 * 1.0) * 4.0)

    if (abs(ae - ab) > 0 || abs(af - ac) > 0)

    {
      a[o] = 0xffffff00;
    }
}

__kernel void J(__global uint* a, __global float* b, int c, int d, int e

                ) {
  const int f = get_local_id(0), g = get_local_id(1);
  const int h = get_local_size(0), i = get_local_size(1);
  const int j = get_global_id(0), k = get_global_id(1);
  if (j >= c - 1 || k >= d - 1 || j <= 1 || k <= 1)
    return;

  int l = k * c + j;
  uint m = a[l];
  if (m != 0xffffff00)
    return;

  int n = a[l + 1];
  int o = a[l - 1];
  int p = a[l + c];
  int q = a[l - c];

  if (n != 0xffffff00)
    if (o != 0xffffff00)
      if (p != 0xffffff00)
        if (q != 0xffffff00) {
          a[l] = (n & 3) + ((((n & 0xfc) + (o & 0xfc) + (p & 0xfc) + (q & 0xfc)) >> 2) & 0xfc);
          return;
        }

  if (n != 0xffffff00)
    if (o != 0xffffff00) {
      a[l] = (n & 3) + ((((n & 0xfc) + (o & 0xfc)) >> 1) & 0xfc);
      return;
    }

  if (p != 0xffffff00)
    if (q != 0xffffff00) {
      a[l] = (p & 3) + ((((p & 0xfc) + (q & 0xfc)) >> 1) & 0xfc);
      return;
    }

  for (int r = 0; r < 4; ++r) {
    int s = l + (r & 1) + ((r >> 1) & 1) * c;
    m = a[s];
    if (m != 0xffffff00)
      break;
  }

  if (m == 0xffffff00)
    for (int r = -2; r < 3; ++r)
      for (int t = -2; t < 3; ++t) {
        int s = l + r + t * c;
        if (m != 0xffffff00)
          break;
        m = a[s];
      }

  a[l] = m;
}

__kernel void K(__global uint* a, __global float* b, __global int* c, __global int* d, __global int* e, int f, int g, int h, int i, float4 j, float4 k, float4 l, float4 m

                ) {
  const int n = get_local_id(0), o = get_local_id(1);
  const int p = get_local_size(0), q = get_local_size(1);
  const int r = get_global_id(0), s = get_global_id(1);
  if (r >= f || s >= g)
    return;

  int t = o * p + n;

  int u = s * f + r;

  u += i;
  uint v = u;
  uint w = a[u];
  if (w == 0xffffff00)
    return;

  if (0)
    if (w > 100 * 256 * 256)
      if (r > 0)
        if (s > 0) {
          for (int x = 0; x < 4; ++x) {
            int y = 0, z = 0;

            if (x == 0) {
              y = 1;
            }
            if (x == 1) {
              z = 1;
            }
            if (x == 2) {
              y = -1;
            }
            if (x == 3) {
              z = -1;
            }
            int aa = y + z * f;
            uint ab = a[u + aa];

            if (ab < 100 * 256 * 256) {
              return;

              {
                a[u] = 0xffffff00;
                return;
              }
            }
          }
        }

  float3 ac;

  ac.x = b[u * 4 + 0];

  ac.y = b[u * 4 + 1];
  ac.z = b[u * 4 + 2];
  float ad = b[u * 4 + 3];
  u -= i;

  float3 ae = ac.xyz - j.xyz;
  float3 af;
  af.x = dot(ae, k.xyz);
  af.y = dot(ae, l.xyz);
  af.z = dot(ae, m.xyz);

  if (af.z < 0.05) {
    a[v] = 0xffffff00;
    return;
  }

  float3 ag;
  ag.x = (af.x * convert_float(g) + 0.0) / af.z + convert_float(f) / 2 - 0.0;
  ag.y = (af.y * convert_float(g) + 0.0) / af.z + convert_float(g) / 2 - 0.0;
  ag.z = af.z;
  int2 ah;
  ah.x = ag.x;
  ah.y = ag.y;

  if (ah.x >= f - 1) {
    a[v] = 0xffffff00;
    return;
  }
  if (ah.x < 0) {
    a[v] = 0xffffff00;
    return;
  }
  if (ah.y >= g - 1) {
    a[v] = 0xffffff00;
    return;
  }
  if (ah.y < 0) {
    a[v] = 0xffffff00;
    return;
  }

  u = ah.y * f + ah.x;
  int ai = af.z * 1000;
  ai <<= 8;
  int aj = ai + (w & 255);

  if ((a[u] & 0xffffff00) <= ai)
    return;
  if (atom_min(&a[u], aj) < aj)
    return;

  if (a[u] != aj)
    return;

  b[u * 4 + 0] = ac.x;
  b[u * 4 + 1] = ac.y;
  b[u * 4 + 2] = ac.z;
  b[u * 4 + 3] = af.z;
}

__kernel void L(__global uint* a, __global float* b, __global uint* c, __global struct BVHNode* d, __global struct BVHChild* e, __global uint* f, __global uint* g, uint h, int i, int j, int k, int l, float4 m, float4 n, float4 o, float4 p,

                float4 q, float4 r, float4 s, float4 t, float u, float v) {
  const int w = get_local_id(0), x = get_local_id(1);
  const int y = get_local_size(0), z = get_local_size(1);

  const int aa = get_global_id(0);
  if (aa >= l)
    return;

  int ab = (i / 16) * (j / 16);
  uint ac = g[aa + ab * 2];

  int ad = ac & 0xffff;
  int ae = ac >> 16;

  if (ad >= i || ae >= j)
    return;

  __local uint af[16000 / 4];
  int ag = w + x * y;
  uint ah = (ag * (11 - 1)) - 1;

  float3 ai;
  ai.x = convert_float(ad - i / 2 + 0.5) * u / convert_float(j);
  ai.y = convert_float(ae - j / 2 + 0.5) * v / convert_float(j);
  ai.z = 1;

  float3 aj;
  aj.x = dot(ai, r.xyz);
  aj.y = dot(ai, s.xyz);
  aj.z = dot(ai, t.xyz);

  float ak = 0, al = 0;
  uint am = 0xffff0002;
  float3 an;

  float3 ao = q.xyz * 16.0f;

  int ap, aq, ar, as;
  float3 at, au, av, aw;
  int3 ax, ay;
  int az = 1.0, ba, bb, bc, bd, be;
  uint bf, bg, bh, bi;
  float bj = i * 1 * 2;
  const int bk = (1 << (11 + 1));
  ap = 0, aq = 0, ar = 0;
  as = 11;
  float bl = __clc_pow(2.0f, -20.0f);
  if (__clc_fabs(aj.x) < bl)
    aj.x = sign(aj.x) * bl;
  if (__clc_fabs(aj.y) < bl)
    aj.y = sign(aj.y) * bl;
  if (__clc_fabs(aj.z) < bl)
    aj.z = sign(aj.z) * bl;
  if (aj.x < 0) {
    ap = 1;
    ao.x = (1 << (11 + 1)) - ao.x;
    aj.x = -aj.x;
  }
  if (aj.y < 0) {
    aq = 1;
    ao.y = (1 << (11 + 1)) - ao.y;
    aj.y = -aj.y;
  }
  if (aj.z < 0) {
    ar = 1;
    ao.z = (1 << (11 + 1)) - ao.z;
    aj.z = -aj.z;
  }
  at.x = 1;
  at.y = aj.y / aj.x;
  at.z = aj.z / aj.x;
  au.x = aj.x / aj.y;
  au.y = 1;
  au.z = aj.z / aj.y;
  av.x = aj.x / aj.z;
  av.y = aj.y / aj.z;
  av.z = 1;
  aw.x = length(at);
  aw.y = length(au);
  aw.z = length(av);
  float3 bm = ao;
  ax = convert_int3(ao);
  bf = h;
  bg = h;
  bh = 0;
  ba = 0;
  bc = 0;
  be = ap | (aq << 1) | (ar << 2);
  ay = ax;
  do {
    int3 bn = ax >> as;
    int3 bo = bn & 1;
    int bp = (bo.x | (bo.y << 1) | (bo.z << 2)) ^ be;
    bi = bf & (1 << bp);
    if (bi) {
      uint bq = bf;
      bf = D(c, bf, bg, &bh, bp, bi, as);
      bg = bq;
      if (as <= az)
        break;
      as--;
      af[ah + as] = bf;
      continue;
    }
    float3 br = convert_float3((bn + 1) << as) - ao;
    ay = convert_int3(ao);
    float3 bs = br * aw;
    float3 bt = at * br.x;
    if (bs.y < bs.x) {
      bs.x = bs.y;
      bt = au * br.y;
    }
    if (bs.z < bs.x) {
      bs.x = bs.z;
      bt = av * br.z;
    }
    ao += bt;
    ax = convert_int3(ao);
    al += bs.x;
    bb = ay.x ^ ax.x;
    bc = ay.y ^ ax.y;
    bd = ay.z ^ ax.z;
    ba = bb ^ bc ^ bd;
    int bu = log2(convert_float(ba & ((1 << 11) - 1)));
    if (al > 400000)
      break;
    if (bu < as)
      continue;
    as = bu + 1;
    bf = af[ah + as];
    bg = af[ah + as + 1];
    if (as == 11)
      bg = bf = h;
    if (al > bj) {
      bj *= 2;
      ++az;
    }
  } while (!(bc & (2 * ((1 << 11) - 1) + 2)));
  if (ap) {
    ao.x = (1 << (11 + 1)) - ao.x;
    aj.x = -aj.x;
  };
  if (aq) {
    ao.y = (1 << (11 + 1)) - ao.y;
    aj.y = -aj.y;
  };
  if (ar) {
    ao.z = (1 << (11 + 1)) - ao.z;
    aj.z = -aj.z;
  };
  ;

  {
    am = E(c, bf, bg, af[ah + as + 1], &bh, as, bi);

    an = ao / 16.0f;
  }
  int bv = ae * i + ad;
  for (int bw = 0; bw < 1; ++bw) {
    a[bv] = 0xff000000 + am;
    b[bv * 4 + 0] = an.x;
    b[bv * 4 + 1] = an.y;
    b[bv * 4 + 2] = an.z;
    bv += i * j;
  }
}

__kernel void M(__global uint* a, __global float* b, __global uint* c, uint d, int e, int f, int g, int h, int i, float4 j, float4 k, float4 l, float4 m,

                float4 n, float4 o, float4 p, float4 q, float r, float s) {
  const int t = get_local_id(0), u = get_local_id(1);
  const int v = get_local_size(0), w = get_local_size(1);

  int x = get_global_id(0), y = get_global_id(1);
  int z = x * 2, aa = y * 2;

  z += h;
  aa += i;

  if (z >= e || aa >= f)
    return;

  {
    uint ab = 0;

    for (int ac = 0; ac < 4; ++ac) {
      int ad = (aa + (ac >> 1)) * e + z + (ac & 1);
      ab = a[ad];
      if (ab == 0xffffff00) {
        z += ac & 1;
        aa += ac >> 1;
        break;
      }
    }
    if (ab != 0xffffff00) {
      z += ((g >> 2) & 1);
      aa += ((g >> 3) & 1);
    }
  }

  __local uint ae[16000 / 4];
  int af = t + u * v;
  uint ag = (af * (11 - 1)) - 1;

  float3 ah;
  ah.x = convert_float(z - e / 2 + 0.5) * r / convert_float(f);
  ah.y = convert_float(aa - f / 2 + 0.5) * s / convert_float(f);
  ah.z = 1;

  float3 ai;
  ai.x = dot(ah, o.xyz);
  ai.y = dot(ah, p.xyz);
  ai.z = dot(ah, q.xyz);

  float aj = 0, ak = 0;

  uint ab = 0xff0000f2;
  float3 al;

  float3 am = n.xyz * 16.0f;

  int an, ao, ap, aq;
  float3 ar, as, at, au;
  int3 av, aw;
  int ax = 1.0, ay, az, ba, bb, bc;
  uint bd, be, bf, bg;
  float bh = e * 1 * 2;
  const int bi = (1 << (11 + 1));
  an = 0, ao = 0, ap = 0;
  aq = 11;
  float bj = __clc_pow(2.0f, -20.0f);
  if (__clc_fabs(ai.x) < bj)
    ai.x = sign(ai.x) * bj;
  if (__clc_fabs(ai.y) < bj)
    ai.y = sign(ai.y) * bj;
  if (__clc_fabs(ai.z) < bj)
    ai.z = sign(ai.z) * bj;
  if (ai.x < 0) {
    an = 1;
    am.x = (1 << (11 + 1)) - am.x;
    ai.x = -ai.x;
  }
  if (ai.y < 0) {
    ao = 1;
    am.y = (1 << (11 + 1)) - am.y;
    ai.y = -ai.y;
  }
  if (ai.z < 0) {
    ap = 1;
    am.z = (1 << (11 + 1)) - am.z;
    ai.z = -ai.z;
  }
  ar.x = 1;
  ar.y = ai.y / ai.x;
  ar.z = ai.z / ai.x;
  as.x = ai.x / ai.y;
  as.y = 1;
  as.z = ai.z / ai.y;
  at.x = ai.x / ai.z;
  at.y = ai.y / ai.z;
  at.z = 1;
  au.x = length(ar);
  au.y = length(as);
  au.z = length(at);
  float3 bk = am;
  av = convert_int3(am);
  bd = d;
  be = d;
  bf = 0;
  ay = 0;
  ba = 0;
  bc = an | (ao << 1) | (ap << 2);
  aw = av;
  do {
    int3 bl = av >> aq;
    int3 bm = bl & 1;
    int bn = (bm.x | (bm.y << 1) | (bm.z << 2)) ^ bc;
    bg = bd & (1 << bn);
    if (bg) {
      uint bo = bd;
      bd = D(c, bd, be, &bf, bn, bg, aq);
      be = bo;
      if (aq <= ax)
        break;
      aq--;
      ae[ag + aq] = bd;
      continue;
    }
    float3 bp = convert_float3((bl + 1) << aq) - am;
    aw = convert_int3(am);
    float3 bq = bp * au;
    float3 br = ar * bp.x;
    if (bq.y < bq.x) {
      bq.x = bq.y;
      br = as * bp.y;
    }
    if (bq.z < bq.x) {
      bq.x = bq.z;
      br = at * bp.z;
    }
    am += br;
    av = convert_int3(am);
    ak += bq.x;
    az = aw.x ^ av.x;
    ba = aw.y ^ av.y;
    bb = aw.z ^ av.z;
    ay = az ^ ba ^ bb;
    int bs = log2(convert_float(ay & ((1 << 11) - 1)));
    if (ak > 400000)
      break;
    if (bs < aq)
      continue;
    aq = bs + 1;
    bd = ae[ag + aq];
    be = ae[ag + aq + 1];
    if (aq == 11)
      be = bd = d;
    if (ak > bh) {
      bh *= 2;
      ++ax;
    }
  } while (!(ba & (2 * ((1 << 11) - 1) + 2)));
  if (an) {
    am.x = (1 << (11 + 1)) - am.x;
    ai.x = -ai.x;
  };
  if (ao) {
    am.y = (1 << (11 + 1)) - am.y;
    ai.y = -ai.y;
  };
  if (ap) {
    am.z = (1 << (11 + 1)) - am.z;
    ai.z = -ai.z;
  };
  ;

  {
    ab = E(c, bd, be, ae[ag + aq + 1], &bf, aq, bg);

    aj = ak;
    al = am / 16.0f;
  }

  int bt = aa * e + z;

  for (int ac = 0; ac < 1; ++ac) {
    a[bt] = 0xff000000 + ab;
    b[bt * 4 + 0] = al.x;
    b[bt * 4 + 1] = al.y;
    b[bt * 4 + 2] = al.z;
    bt += e * f;
  }
  return;

  if (a[aa * e + z] == 0xffffff00) {
    for (int ac = 0; ac < 4; ++ac) {
      a[bt] = ab;
      b[bt * 4 + 0] = al.x;
      b[bt * 4 + 1] = al.y;
      b[bt * 4 + 2] = al.z;
      bt += e * f;
    }
  } else {
    for (int ac = 0; ac < 4; ++ac) {
      float3 bu;
      bu.x = b[bt * 4 + 0];
      bu.y = b[bt * 4 + 1];
      bu.z = b[bt * 4 + 2];
      if (length(bu - al) > 3) {
        a[bt] = ab;
        b[bt * 4 + 0] = al.x;
        b[bt * 4 + 1] = al.y;
        b[bt * 4 + 2] = al.z;
      }
      bt += e * f;
    }
  }
}

__kernel void N(__global uint* a, __global float* b, __global uint* c, uint d, int e, int f, int g, int h, int i, float4 j, float4 k, float4 l, float4 m,

                float4 n, float4 o, float4 p, float4 q, float r, float s) {
  const int t = get_local_id(0), u = get_local_id(1);
  const int v = get_local_size(0), w = get_local_size(1);

  int x = get_global_id(0), y = get_global_id(1);
  int z = x, aa = y;

  z += h;
  aa += i;

  if (z >= e || aa >= f)
    return;

  __local uint ab[16000 / 4];
  int ac = t + u * v;
  uint ad = (ac * (11 - 1)) - 1;

  float3 ae;
  ae.x = convert_float(z - e / 2 + 0.5) * r / convert_float(f);
  ae.y = convert_float(aa - f / 2 + 0.5) * s / convert_float(f);
  ae.z = 1;

  float3 af;
  af.x = dot(ae, o.xyz);
  af.y = dot(ae, p.xyz);
  af.z = dot(ae, q.xyz);

  float ag = 0, ah = 0;

  uint ai = 0xff0000f2;
  float3 aj;

  float3 ak = n.xyz * 16.0f;

  int al, am, an, ao;
  float3 ap, aq, ar, as;
  int3 at, au;
  int av = 1.0, aw, ax, ay, az, ba;
  uint bb, bc, bd, be;
  float bf = e * 1 * 2;
  const int bg = (1 << (11 + 1));
  al = 0, am = 0, an = 0;
  ao = 11;
  float bh = __clc_pow(2.0f, -20.0f);
  if (__clc_fabs(af.x) < bh)
    af.x = sign(af.x) * bh;
  if (__clc_fabs(af.y) < bh)
    af.y = sign(af.y) * bh;
  if (__clc_fabs(af.z) < bh)
    af.z = sign(af.z) * bh;
  if (af.x < 0) {
    al = 1;
    ak.x = (1 << (11 + 1)) - ak.x;
    af.x = -af.x;
  }
  if (af.y < 0) {
    am = 1;
    ak.y = (1 << (11 + 1)) - ak.y;
    af.y = -af.y;
  }
  if (af.z < 0) {
    an = 1;
    ak.z = (1 << (11 + 1)) - ak.z;
    af.z = -af.z;
  }
  ap.x = 1;
  ap.y = af.y / af.x;
  ap.z = af.z / af.x;
  aq.x = af.x / af.y;
  aq.y = 1;
  aq.z = af.z / af.y;
  ar.x = af.x / af.z;
  ar.y = af.y / af.z;
  ar.z = 1;
  as.x = length(ap);
  as.y = length(aq);
  as.z = length(ar);
  float3 bi = ak;
  at = convert_int3(ak);
  bb = d;
  bc = d;
  bd = 0;
  aw = 0;
  ay = 0;
  ba = al | (am << 1) | (an << 2);
  au = at;
  do {
    int3 bj = at >> ao;
    int3 bk = bj & 1;
    int bl = (bk.x | (bk.y << 1) | (bk.z << 2)) ^ ba;
    be = bb & (1 << bl);
    if (be) {
      uint bm = bb;
      bb = D(c, bb, bc, &bd, bl, be, ao);
      bc = bm;
      if (ao <= av)
        break;
      ao--;
      ab[ad + ao] = bb;
      continue;
    }
    float3 bn = convert_float3((bj + 1) << ao) - ak;
    au = convert_int3(ak);
    float3 bo = bn * as;
    float3 bp = ap * bn.x;
    if (bo.y < bo.x) {
      bo.x = bo.y;
      bp = aq * bn.y;
    }
    if (bo.z < bo.x) {
      bo.x = bo.z;
      bp = ar * bn.z;
    }
    ak += bp;
    at = convert_int3(ak);
    ah += bo.x;
    ax = au.x ^ at.x;
    ay = au.y ^ at.y;
    az = au.z ^ at.z;
    aw = ax ^ ay ^ az;
    int bq = log2(convert_float(aw & ((1 << 11) - 1)));
    if (ah > 400000)
      break;
    if (bq < ao)
      continue;
    ao = bq + 1;
    bb = ab[ad + ao];
    bc = ab[ad + ao + 1];
    if (ao == 11)
      bc = bb = d;
    if (ah > bf) {
      bf *= 2;
      ++av;
    }
  } while (!(ay & (2 * ((1 << 11) - 1) + 2)));
  if (al) {
    ak.x = (1 << (11 + 1)) - ak.x;
    af.x = -af.x;
  };
  if (am) {
    ak.y = (1 << (11 + 1)) - ak.y;
    af.y = -af.y;
  };
  if (an) {
    ak.z = (1 << (11 + 1)) - ak.z;
    af.z = -af.z;
  };
  ;

  {
    ai = E(c, bb, bc, ab[ad + ao + 1], &bd, ao, be);

    ag = ah;
    aj = ak / 16.0f;
  }

  int br = aa * e + z;

  for (int bs = 1; bs < 2; ++bs) {
    a[br] = 0xff000000 + ai;
    b[br * 4 + 0] = aj.x;
    b[br * 4 + 1] = aj.y;
    b[br * 4 + 2] = aj.z;
    br += e * f;
  }
  return;
}

__kernel void O(__global uint* a, __global uint* b, int c, int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  if (e >= c)
    return;
  if (f >= d)
    return;

  int g = e + f * c;
  int h = a[g];

  float3 i[4] = {{1.0, 1.0, 1.0}, {1.0, 0.7, 0.3}, {1.5, 0.8, 0.1}, {0.2, 0.8, 0.2}};

  int j = h & 3;
  float3 k = i[j];
  float l = convert_float((h & (255 - 7)));
  int m = l * k.x;
  if (m > 255)
    m = 255;
  int n = l * k.y;
  if (n > 255)
    n = 255;
  int o = l * k.z;
  if (o > 255)
    o = 255;
  b[g] = o + n * 256 + m * 65536;
}