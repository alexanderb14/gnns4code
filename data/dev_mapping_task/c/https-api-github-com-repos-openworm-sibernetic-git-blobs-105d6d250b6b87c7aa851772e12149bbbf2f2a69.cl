__kernel void A(__global float2* a, uint b) {
  int c = get_global_id(0);
  if (c >= b)
    return;
  __global float4* d = (__global float4*)a;
  int e = (c * 32) >> 1;
  float4 f = (float4)(-1.0f, -1.0f, -1.0f, -1.0f);
  int g, h, i, j;

  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
  d[e++] = f;
}

int B(int4 a, uint b, uint c, uint d) {
  int e = a.x + a.y * b + a.z * b * c;
  return e;
}

int4 C(float4 a, float b, float c, float d, float e) {
  int4 f;
  f.x = (int)(a.x * e);
  f.y = (int)(a.y * e);
  f.z = (int)(a.z * e);
  return f;
}
__kernel void D(__global float4* a, uint b, uint c, uint d, float e, float f, float g, float h, __global uint2* i, uint j) {
  int k = get_global_id(0);
  if (k >= j)
    return;
  float4 l = a[k];
  int4 m = C(l, f, g, h, e);
  int n = B(m, b, c, d) & 0xffff;
  uint2 o;
  o.x = n;
  o.y = k;
  i[k] = o;
}
__kernel void E(__global uint2* a, __global uint* b, __global float4* c, __global float4* d, __global float4* e, __global float4* f, uint g) {
  int h = get_global_id(0);
  if (h >= g)
    return;
  uint2 i = a[h];
  int j = i.y;
  int k = i.x;
  float4 l = c[j];
  l.w = (float)k;
  float4 m = d[j];
  f[h] = m;
  e[h] = l;
  b[j] = h;
}

__kernel void F(__global uint2* a, uint b, __global uint* c, uint d) {
  int e = get_global_id(0);
  if (e > b) {
    return;
  }
  if (e == b) {
    c[e] = d;
    return;
  }
  if (e == 0) {
    c[e] = 0;
    return;
  }

  int f = 0;
  int g = d - 1;
  bool h = false;
  int i = -1;
  while (!h) {
    if (f > g) {
      h = true;
      i = -1;
      continue;
    }
    int j = ((g - f) >> 1) + f;
    uint2 k = a[j - 1];
    uint2 l = a[j];
    int m = l.x;
    bool n = (m > e);
    g = n ? j - 1 : g;
    bool o = (m < e);
    f = o ? j + 1 : f;
    bool p = !(n || o);

    bool q = (j == 0 && p);
    int r = q ? -1 : k.x;
    h = p && (q || r < m);
    i = h ? j : i;
    g = (p && !h) ? j - 1 : g;
  }
  c[e] = i;
}
int G(float* a) {
  int b;
  float c = -1.f;
  for (int d = 0; d < 32; d++) {
    if (a[d] > c) {
      c = a[d];
      b = d;
    }
  }
  return b;
}

int H(int a, __global uint* b, float4 c, int d, __global float4* e, __global float2* f, int* g, float* h, int i, int* j) {
  int k = b[a];
  int l = b[a + 1];
  int m = l - k;
  int n = 0;
  float o;
  int p;
  int q = i;
  while (n < m) {
    p = k + n;
    if (d != p) {
      float4 r = c - e[p];
      o = r.x * r.x + r.y * r.y + r.z * r.z;
      if (o <= h[q]) {
        h[q] = o;
        g[q] = p;
        if (*j < 32 - 1) {
          (*j)++;
          q = *j;
        } else {
          q = G(h);
        }
      }
    }
    n++;
  }
  return q;
}

int I(int a, int b, int c, int d, uint e, uint f, uint g, uint h) {
  int i = b;
  int j = c * e;
  int k = d * e * f;
  int l = a + i + j + k;
  l = l < 0 ? l + h : l;
  l = l >= h ? l - h : l;
  return l;
}

__kernel void J(__global uint* a, __global float4* b, uint c, uint d, uint e, uint f, float g, float h, float i, float j, float k, float l, float m, __global float2* n, uint o) {
  int p = get_global_id(0);
  if (p >= o)
    return;
  __global uint* q = a;
  float4 r = b[p];
  int s = (int)r.w & 0xffff;
  int t[8];
  float u = g * g;
  float v[32];
  int w[32];
  int x = 0;
  for (int y = 0; y < 32; y++) {
    v[y] = u;
    w[y] = -1;
  }

  t[0] = s;

  float4 z;
  float4 aa = (float4)(m .0f);
  z = r - aa;

  int4 ab = C(r, k, l, m, i);
  float4 ac;
  ac.x = ab.x * h;
  ac.y = ab.y * h;
  ac.z = ab.z * h;

  int4 ad;
  ad = ((z - ac) < g);

  int4 ae;
  int4 af = (int4)(1, 1, 1, 1);
  ae = af + 2 * ad;

  t[1] = I(s, ae.x, 0, 0, d, e, f, c);
  t[2] = I(s, 0, ae.y, 0, d, e, f, c);
  t[3] = I(s, 0, 0, ae.z, d, e, f, c);
  t[4] = I(s, ae.x, ae.y, 0, d, e, f, c);
  t[5] = I(s, ae.x, 0, ae.z, d, e, f, c);
  t[6] = I(s, 0, ae.y, ae.z, d, e, f, c);
  t[7] = I(s, ae.x, ae.y, ae.z, d, e, f, c);

  int ag = 0;

  ag = H(t[0], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[1], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[2], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[3], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[4], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[5], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[6], q, r, p, b, n, w, v, ag, &x);

  ag = H(t[7], q, r, p, b, n, w, v, ag, &x);

  for (int ah = 0; ah < 32; ah++) {
    float2 ai;
    ai.x = w[ah];
    if (w[ah] >= 0) {
      ai.y = sqrt(v[ah]) * j;
    } else {
      ai.y = -1.f;
    }
    n[p * 32 + ah] = ai;
  }
}

__kernel void K(__global float2* a, float b, float c, __global float* d, __global uint* e, uint f) {
  int g = get_global_id(0);
  if (g >= f)
    return;
  g = e[g];
  int h = g * 32;
  int i = 0;
  float j = 0.0f;
  float k;
  float l = c * c * c;
  int m = 0;

  do {
    if (a[h + i].x != -1) {
      k = a[h + i].y;
      k *= k;
      if (k < c) {
        j += (c - k) * (c - k) * (c - k);

        m++;
      }
    }

  } while (++i < 32);
  if (j < l)
    j = l;
  j *= b;
  d[g] = j;
}
__kernel void L(__global float2* a, __global float* b, __global float* c, __global float4* d, __global float4* e, __global float4* f, __global uint* g, float h, float i, float j, float k, float l, float m, float n, __global float4* o, __global uint2* p, uint q, float r

                ) {
  int s = get_global_id(0);
  if (s >= q)
    return;
  s = g[s];
  int t = p[s].y;
  if ((int)(o[t].w) == 3) {
    f[s] = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
    f[q + s] = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
    c[s] = 0.f;
    return;
  }
  int u = s * 32;
  float v = j * j;

  float4 w;
  float2 x;
  float y, z;
  int aa = 0;
  int ab;
  float4 ac = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float4 ad, ae;
  float af, ag;
  float4 ah = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float ai;

  int aj;

  do {
    if ((ab = a[u + aa].x) != -1) {
      y = a[u + aa].y;
      z = y * y;
      if (y < j) {
        af = b[s];
        ag = b[ab];
        ad = e[s];
        ae = e[ab];
        aj = p[ab].y;
        ai = (float)((int)(o[aj].w) != 3);

        if ((((o[t].w > 2.05f) && (o[t].w < 2.25f)) && ((o[aj].w > 2.25f) && (o[aj].w < 2.35f))) || (((o[t].w > 2.25f) && (o[t].w < 2.35f)) && ((o[aj].w > 2.05f) && (o[aj].w < 2.25f)))) {
          ac += 0 * 1.0e-7f * (e[ab] * ai - e[s]) * (j - y) / 1000;

          if (((o[t].w > 2.25f) && (o[t].w < 2.35f))) {
            o[t].w = 2.32f;
          }
        } else if (((o[t].w > 2.05f) && (o[t].w < 2.25f)) && ((int)(o[aj].w == 3))) {
          ac += 0 * 1.0e-7f * (e[ab] * ai - e[s]) * (j - y) / 1000;
        } else {
          ac += 2.5e-4f * (e[ab] * ai - e[s]) * (j - y) / 1000;
        }
        { ac += 1.0e-4f * (e[ab] * ai - e[s]) * (j - y) / 1000; }
        float ak = (v - z) * (v - z) * (v - z);
        ah += -1.7e-09f * h * ak * (d[s] - d[ab]);
      }
    }
  } while (++aa < 32);

  ah.w = 0.f;
  ah /= r;
  ac *= i / 1000.0f;

  w = ac;
  w += n;
  w += ah;
  f[s] = w;

  f[q + s] = (float4)(0.0f, 0.0f, 0.0f, 0.0f);

  c[s] = 0.f;
}

__kernel void M(__global float2* a, __global float4* b, __global float4* c, __global float4* d, __global uint* e, __global uint2* f, float g, float h, float i, int j, __global float4* k, int l, int m, __global float* n, __global float4* o, float p) {
  int q = get_global_id(0);

  if (q >= j) {
    return;
  }
  int r = 0;
  float4 s = o[q];
  int t = e[q];
  int u = q * 32;
  float v, w, x, y;
  float4 z;

  float aa;
  float4 ab;
  int ac, ad, ae;
  int af;
  int ag, ah;
  ad = f[t].y;
  do {
    if ((ac = (int)k[u + r].x) != -1) {
      ac = e[ac];
      ae = f[ac].y;
      v = k[u + r].y;
      z = (b[t] - b[ac]) * i;
      z.w = 0.0f;
      w = sqrt(dot(z, z));
      x = w - v;
      if (w != 0.f) {
        {
          if (((o[ad].w > 2.05f) && (o[ad].w < 2.25f)) && ((o[ae].w > 2.05f) && (o[ae].w < 2.25f))) {
            if ((o[ad].w > 2.05f) && (o[ad].w < 2.15f))
              ag = (int)((o[ad].w - 2.1f) * 10000.f) - 100;
            else
              ag = (int)((o[ad].w - 2.2f) * 10000.f) - 100;

            if ((o[ae].w > 2.05f) && (o[ae].w < 2.15f))
              ah = (int)((o[ad].w - 2.1f) * 10000.f) - 100;
            else
              ah = (int)((o[ad].w - 2.2f) * 10000.f) - 100;

            if ((ag != ah) && (ag < -80) && (ah < -80))
              d[t] += -(z / w) * x * p * 0.4f;
            else
              d[t] += -(z / w) * x * p;
          } else {
            d[t] += -(z / w) * x * p * 0.5f;
          }
        }

        for (af = 0; af < m; af++) {
          if ((int)(k[u + r].z) == (af + 1)) {
            if (n[af] > 0.f) {
              if ((ag != ah) && (((ag < -80) && (ah < -80)) || ((ag > 80) && (ah > 80))))
                d[t] += -(z / w) * n[af] * (900.0f) * 0.4f * 1.0e-13f / h;
              else
                d[t] += -(z / w) * n[af] * (900.0f) * 1.0e-13f / h;
            }
          }
        }
      }
    } else
      break;
  } while (++r < 32);
  return;
}

void N(int a, float b, __global float2* c, __global uint* d, __global uint2* e, __global float4* f, __global float4* g, float4* h, bool i, float4* j, uint k) {
  int l = a * 32;
  int m;
  int n, o = 0;
  float4 p = (float4)(0.f, 0.f, 0.f, 0.f);
  float4 q;
  float r, s = 0.f, t = 0.f;
  float4 u;
  float v, w;

  do {
    if ((m = c[l + o].x) != -1) {
      n = e[m].y;
      if ((int)f[n].w == 3) {
        w = ((*h).x - f[n].x) * ((*h).x - f[n].x);
        w += ((*h).y - f[n].y) * ((*h).y - f[n].y);
        w += ((*h).z - f[n].z) * ((*h).z - f[n].z);
        w = sqrt(w);
        r = max(0.f, (b - w) / b);
        q = g[n];
        p += q * r;
        s += r;
        t += r * (b - w);
      }
    }
  } while (++o < 32);

  v = dot(p, p);
  if (v != 0) {
    v = sqrt(v);
    u = ((p / v) * t) / s;
    (*h).x += u.x;
    (*h).y += u.y;
    (*h).z += u.z;
    if (i) {
      float x = 0.99f;
      float y = p.x * (*j).x + p.y * (*j).y + p.z * (*j).z;
      if (y < 0) {
        (*j).x -= p.x * y;
        (*j).y -= p.y * y;
        (*j).z -= p.z * y;
        (*j) = (*j) * x;
      }
    }
  }
}

__kernel void O(__global float4* a, __global float4* b, __global float4* c, __global uint2* d, __global uint* e, float f, float g, float h, float i, float j, __global float4* k, __global float4* l, float m, __global float2* n, uint o) {
  int p = get_global_id(0);
  if (p >= o)
    return;
  p = e[p];
  int q = d[p].y;
  float4 r = b[p];
  if ((int)(k[q].w) == 3) {
    b[o + p] = r;
    return;
  }

  float4 s = a[o * 2 + q];
  s.w = 0.f;
  float4 t = a[p];
  t.w = 0.f;
  float4 u = c[p];
  float4 v = a[o + p];

  float4 w = u + j * t;
  float x = j * i;
  float4 y = r + x * w;

  N(p, m, n, e, d, k, l, &y, false, &w, o);
  b[o + p] = y;
}

__kernel void P(__global float2* a, __global uint* b, float c, float d, float e, float f, __global float4* g, __global float* h, __global float* i, uint j) {
  int k = get_global_id(0);
  if (k >= j)
    return;
  k = b[k];
  int l = k * 32;
  int m = 0;
  float n = 0.0f;
  float o = 0.0f;
  float4 p;
  float q;
  float r = d * d;
  float s = d * f;
  float t = s * s;
  float u = t * t * t;
  float v = f * f;
  v = v * v * v;
  int w;
  do {
    if ((w = a[l + m].x) != -1) {
      p = g[j + k] - g[j + w];
      q = (p.x * p.x + p.y * p.y + p.z * p.z);
      if (q < r) {
        o += (r - q) * (r - q) * (r - q);
      }
      if (q == 0.0f) {
      }
    }
  } while (++m < 32);
  n = o * v;
  if (n < u) {
    n = u;
  }
  n *= c;
  i[j + k] = n;
}

__kernel void Q(__global uint* a, float b, __global float* c, __global float* d, float e, uint f) {
  int g = get_global_id(0);
  if (g >= f)
    return;
  g = a[g];
  int h = g * 32;
  int i = 0;
  float j;
  float k;

  j = d[f + g] - b;
  k = j * e;
  if (k < 0.0f)
    k = 0.0f;
  c[g] += k;
}

__kernel void R(__global float2* a, __global float* b, __global float* c, __global float4* d, __global float4* e, __global uint* f, float g, float h, float i, float j, float k, __global float4* l, float m, __global float4* n, __global uint2* o, uint p) {
  int q = get_global_id(0);
  if (q >= p)
    return;
  q = f[q];
  int r = o[q].y;
  if ((int)(n[r].w) == 3) {
    l[p + q] = 0.f;
    return;
  }
  int s = q * 32;
  float t = i * j;
  float u = b[q];
  float v = c[p + q];
  float4 w = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  int x = 0;
  float4 y;
  float z, aa;
  float4 ab;
  int ac;
  float ad;
  int ae = 0;
  int af = 0;
  do {
    if ((ac = a[s + x].x) != -1) {
      z = a[s + x].y;
      if (z < t) {
        ad = -(t - z) * (t - z) * 0.5f * (b[q] + b[ac]) / c[p + ac];

        ab = (d[q] - d[ac]) * j;
        ab.w = 0.0f;

        if (z < 0.5f * (t / 2)) {
          ad = -(t * 0.25f - z) * (t * 0.25f - z) * 0.5f * (m * g) / c[p + ac];
          ab = (d[q] - d[ac]) * j;
          ab.w = 0.0f;
        }

        if (z == 0.0f) {
        }
        w += ad * ab / z;
        ae++;
      }

      af++;
    }

  } while (++x < 32);

  w *= h / c[p + q];

  l[p + q] = w;
}

__kernel void S(__global float4* a, __global float4* b, __global float4* c, int d) {
  int e = get_global_id(0);
  if (e >= d)
    return;

  a[d + e] = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  b[d + e] = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
}

float T(float4 a, float4 b, float4 c) {
  return a.x * b.y * c.z + a.y * b.z * c.x + a.z * b.x * c.y - a.z * b.y * c.x - a.x * b.z * c.y - a.y * b.x * c.z;
}

float4 U(float4 a, float4 b, float4 c, float4 d) {
  float4 e = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float f;

  float g = b.x * ((c.y - b.y) * (d.z - b.z) - (c.z - b.z) * (d.y - b.y)) + b.y * ((c.z - b.z) * (d.x - b.x) - (c.x - b.x) * (d.z - b.z)) + b.z * ((c.x - b.x) * (d.y - b.y) - (c.y - b.y) * (d.x - b.x));
  float h = a.x * (c.x - b.x) + a.y * (c.y - b.y) + a.z * (c.z - b.z);
  float i = a.x * (d.x - b.x) + a.y * (d.y - b.y) + a.z * (d.z - b.z);
  float j = (c.y - b.y) * (d.z - b.z) - (c.z - b.z) * (d.y - b.y);
  float k = c.x - b.x;
  float l = d.x - b.x;
  float m = (c.z - b.z) * (d.x - b.x) - (c.x - b.x) * (d.z - b.z);
  float n = c.y - b.y;
  float o = d.y - b.y;
  float p = (c.x - b.x) * (d.y - b.y) - (c.y - b.y) * (d.x - b.x);
  float q = c.z - b.z;
  float r = d.z - b.z;
  float4 s = (float4l0f);
  float4 t = (float4o0f);
  float4 u = (float4r0f);
  float4 v = (float4)(ghi0 .0f);
  f = T(s, t, u);
  if (f != 0.0f) {
    e.x = T(v, t, u) / f;
    e.y = T(s, v, u) / f;
    e.z = T(s, t, v) / f;
  } else {
    e.w = -1;
  }
  return e;
}
float V(float4 a, float4 b, float4 c) {
  float4 d = b - a;
  float4 e = c - a;

  float4 f = (float4)(d.y * e.z - d.z * e.y, d.z * e.x - d.x * e.z, d.x * e.y - d.y * e.x, 0.0f);
  return sqrt(f.x * f.x + f.y * f.y + f.z * f.z) / 2.f;
}

__kernel void W(__global float4* a, __global float4* b, __global float4* c, __global uint2* d, __global uint* e, __global float2* f, __global int* g, __global int* h, int i, int j, float k) {
  int l = get_global_id(0);
  if (l >= i)
    return;
  l = e[l];
  int m = d[l].y;
  int n;

  float4 o = a[l];
  if ((int)(a[m].w) == 3)
    return;
  if ((int)(a[m].w) != 1)
    return;

  int p, q = l * 32;
  int r;
  int s, t, u;
  int v, w, x;
  float4 y, z, aa;
  float4 ab;
  float4 ac;
  float ad;
  float4 ae;
  float4 af = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float4 ag[32];
  float ah;
  float ai[32];
  int aj[32];
  int ak = 0;
  int al = 0;
  for (s = 0; s < 32; s++) {
    ag[s] = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  }

  for (int am = 0; am < 32; am++) {
    if ((p = f[q + am].x) != -1) {
      n = d[p].y;

      if ((int)(a[n].w) == 2) {
        al = 0;
        ae = a[m] - a[n];
        ae.z = 0.0f;
        ah = sqrt(dot(ae, ae));

        for (int an = 0; an < 7; an++) {
          if ((r = g[n * 7 + an]) > -1) {
            s = h[r * 3 + 0];
            t = h[r * 3 + 1];
            u = h[r * 3 + 2];
            y = a[s];
            z = a[t];
            aa = a[u];
            ab = U(a[m], y, z, aa);
            if (ab.w == -1.0f) {
              return;
            }

            ac = a[m] - ab;
            ad = sqrt(ac.x * ac.x + ac.y * ac.y + ac.z * ac.z);
            if (ad > 0.0f) {
              ac /= ad;
              ag[ak] += ac;
              al++;
            } else {
              return;
            }

          } else
            break;
        }
        if (al > 0) {
          ag[ak] /= (float)al;
          ai[ak] = ah;
          aj[ak] = n;
          ak++;
        }
      }
    } else
      break;
  }
  if (ak > 0) {
    int am = 0;
    float4 ao = (float4)(0.f, 0.f, 0.f, 0.f);
    float4 ap;
    float aq, ar = 0.f, as = 0.f;
    float4 at;
    float4 au = (float4)(0.f, 0.f, 0.f, 0.f);
    float av, aw;
    int ax;

    do {
      ax = aj[am];
      aw = ai[am];
      aq = max(0.0f, (k - aw) / k);
      ap = ag[am];
      ao += ap * aq;
      ar += aq;
      as += aq * (k - aw);
      au += b[i + ax];
    } while (++am < ak);
    ao.w = 0.0f;
    av = dot(ao, ao);
    if (av != 0.0f) {
      av = sqrt(av);
      at = 1.0f * ((ao / (float)av) * as) / (float)ar;
      a[i + m].x += at.x;
      a[i + m].y += at.y;
      a[i + m].z += at.z;
      au += b[i + m];
      au /= (float)(ak + 1);
    }
  }
}

__kernel void X(__global float4* a, __global float4* b, __global uint2* c, __global uint* d, int e) {
  int f = get_global_id(0);
  if (f >= e)
    return;

  f = d[f];

  int g = c[f].y;
  int h;
  float4 i = a[f];
  float j;
  if ((int)(a[g].w) == 3)
    return;

  a[g] += a[e + g];
}

__kernel void Y(__global float4* a, __global float4* b, __global float4* c, __global uint2* d, __global uint* e, float f, float g, float h, float i, float j, float k, float l, float m, float n, float o, float p, __global float4* q, __global float4* r, __global float* s, float t, __global float2* u, uint v, int w, int x) {
  int y = get_global_id(0);
  if (y >= v)
    return;
  y = e[y];
  int z = d[y].y;
  if ((int)(q[z].w) == 3) {
    return;
  }

  if (w == 0) {
    a[v * 2 + z] = a[y] + a[v + y];
    return;
  }
  float4 aa = a[v * 2 + z];
  aa.w = 0.f;
  float4 ab = c[y];
  float ac = q[z].w;
  if (x == 2) {
    float4 ad = a[y] + a[v + y];
    ad.w = 0.f;
    float4 ae = b[y];
    float4 af = ab + (ad)*j;
    float4 ag = ae + (af)*j * i;

    float ac = q[z].w;
    N(y, t, u, e, d, q, r, &ag, true, &af, v);

    r[z] = af;
    q[z] = ag;
    q[z].w = ac;

    a[v * 2 + z] = ad;
    return;
  }
  if (x == 0) {
    float4 ae = b[y];
    float4 ag = ae + (ab * j + aa * j * j / 2.f) * i;
    b[y] = ag;
    b[y].w = ac;

  } else if (x == 1) {
    float4 ag = b[y];
    float4 ad = a[y] + a[v + y];
    ad.w = 0.f;
    float4 af = ab + (aa + ad) * j / 2.f;

    N(y, t, u, e, d, q, r, &ag, true, &af, v);
    r[z] = af;
    a[v * 2 + z] = ad;

    q[z] = ag;
    q[z].w = ac;
  }
  return;
}