__kernel void A(__global const float* __restrict__ a, int b, __global float* __restrict__ c, int d, __global float* __restrict__ e, unsigned int f, unsigned int g, __global float* __restrict__ h) {
  unsigned int i = get_group_id(0);
  unsigned int j = get_local_id(0);

  size_t k = g * sizeof(float) * b;

  __global char* l = (__global char*)a;

  l += k * i;
  __global char* m = l - k;
  if (i == 0) {
    m = l;
  }

  __global char* n = l;
  __global char* o = l + k;

  if (i == f - 1) {
    o = l;
  }

  __global float* p = (__global float*)m;
  __global float* q = (__global float*)n;
  __global float* r = (__global float*)o;

  __local float s[256 + 2];
  __local float t[256 + 2];
  __local float u[256 + 2];

  __local float* v = s + 1;
  __local float* w = t + 1;
  __local float* x = u + 1;

  unsigned int y = min((int)128, (int)d);

  unsigned int z = j / 4U;
  unsigned int aa = (j % 4U) * 8;

  float ab = h[9 * (0 + aa) + (0 * 3) + 0];
  ;
  float ac = h[9 * (0 + aa) + (0 * 3) + 1];
  ;
  float ad = h[9 * (0 + aa) + (0 * 3) + 2];
  ;
  float ae = h[9 * (0 + aa) + (1 * 3) + 0];
  ;
  float af = h[9 * (0 + aa) + (1 * 3) + 1];
  ;
  float ag = h[9 * (0 + aa) + (1 * 3) + 2];
  ;
  float ah = h[9 * (0 + aa) + (2 * 3) + 0];
  ;
  float ai = h[9 * (0 + aa) + (2 * 3) + 1];
  ;
  float aj = h[9 * (0 + aa) + (2 * 3) + 2];
  ;
  float ak = h[9 * (1 + aa) + (0 * 3) + 0];
  ;
  float al = h[9 * (1 + aa) + (0 * 3) + 1];
  ;
  float am = h[9 * (1 + aa) + (0 * 3) + 2];
  ;
  float an = h[9 * (1 + aa) + (1 * 3) + 0];
  ;
  float ao = h[9 * (1 + aa) + (1 * 3) + 1];
  ;
  float ap = h[9 * (1 + aa) + (1 * 3) + 2];
  ;
  float aq = h[9 * (1 + aa) + (2 * 3) + 0];
  ;
  float ar = h[9 * (1 + aa) + (2 * 3) + 1];
  ;
  float as = h[9 * (1 + aa) + (2 * 3) + 2];
  ;
  float at = h[9 * (2 + aa) + (0 * 3) + 0];
  ;
  float au = h[9 * (2 + aa) + (0 * 3) + 1];
  ;
  float av = h[9 * (2 + aa) + (0 * 3) + 2];
  ;
  float aw = h[9 * (2 + aa) + (1 * 3) + 0];
  ;
  float ax = h[9 * (2 + aa) + (1 * 3) + 1];
  ;
  float ay = h[9 * (2 + aa) + (1 * 3) + 2];
  ;
  float az = h[9 * (2 + aa) + (2 * 3) + 0];
  ;
  float ba = h[9 * (2 + aa) + (2 * 3) + 1];
  ;
  float bb = h[9 * (2 + aa) + (2 * 3) + 2];
  ;
  float bc = h[9 * (3 + aa) + (0 * 3) + 0];
  ;
  float bd = h[9 * (3 + aa) + (0 * 3) + 1];
  ;
  float be = h[9 * (3 + aa) + (0 * 3) + 2];
  ;
  float bf = h[9 * (3 + aa) + (1 * 3) + 0];
  ;
  float bg = h[9 * (3 + aa) + (1 * 3) + 1];
  ;
  float bh = h[9 * (3 + aa) + (1 * 3) + 2];
  ;
  float bi = h[9 * (3 + aa) + (2 * 3) + 0];
  ;
  float bj = h[9 * (3 + aa) + (2 * 3) + 1];
  ;
  float bk = h[9 * (3 + aa) + (2 * 3) + 2];
  ;
  float bl = h[9 * (4 + aa) + (0 * 3) + 0];
  ;
  float bm = h[9 * (4 + aa) + (0 * 3) + 1];
  ;
  float bn = h[9 * (4 + aa) + (0 * 3) + 2];
  ;
  float bo = h[9 * (4 + aa) + (1 * 3) + 0];
  ;
  float bp = h[9 * (4 + aa) + (1 * 3) + 1];
  ;
  float bq = h[9 * (4 + aa) + (1 * 3) + 2];
  ;
  float br = h[9 * (4 + aa) + (2 * 3) + 0];
  ;
  float bs = h[9 * (4 + aa) + (2 * 3) + 1];
  ;
  float bt = h[9 * (4 + aa) + (2 * 3) + 2];
  ;
  float bu = h[9 * (5 + aa) + (0 * 3) + 0];
  ;
  float bv = h[9 * (5 + aa) + (0 * 3) + 1];
  ;
  float bw = h[9 * (5 + aa) + (0 * 3) + 2];
  ;
  float bx = h[9 * (5 + aa) + (1 * 3) + 0];
  ;
  float by = h[9 * (5 + aa) + (1 * 3) + 1];
  ;
  float bz = h[9 * (5 + aa) + (1 * 3) + 2];
  ;
  float ca = h[9 * (5 + aa) + (2 * 3) + 0];
  ;
  float cb = h[9 * (5 + aa) + (2 * 3) + 1];
  ;
  float cc = h[9 * (5 + aa) + (2 * 3) + 2];
  ;
  float cd = h[9 * (6 + aa) + (0 * 3) + 0];
  ;
  float ce = h[9 * (6 + aa) + (0 * 3) + 1];
  ;
  float cf = h[9 * (6 + aa) + (0 * 3) + 2];
  ;
  float cg = h[9 * (6 + aa) + (1 * 3) + 0];
  ;
  float ch = h[9 * (6 + aa) + (1 * 3) + 1];
  ;
  float ci = h[9 * (6 + aa) + (1 * 3) + 2];
  ;
  float cj = h[9 * (6 + aa) + (2 * 3) + 0];
  ;
  float ck = h[9 * (6 + aa) + (2 * 3) + 1];
  ;
  float cl = h[9 * (6 + aa) + (2 * 3) + 2];
  ;
  float cm = h[9 * (7 + aa) + (0 * 3) + 0];
  ;
  float cn = h[9 * (7 + aa) + (0 * 3) + 1];
  ;
  float co = h[9 * (7 + aa) + (0 * 3) + 2];
  ;
  float cp = h[9 * (7 + aa) + (1 * 3) + 0];
  ;
  float cq = h[9 * (7 + aa) + (1 * 3) + 1];
  ;
  float cr = h[9 * (7 + aa) + (1 * 3) + 2];
  ;
  float cs = h[9 * (7 + aa) + (2 * 3) + 0];
  ;
  float ct = h[9 * (7 + aa) + (2 * 3) + 1];
  ;
  float cu = h[9 * (7 + aa) + (2 * 3) + 2];
  ;
  ;

  for (int cv = 0; cv < g; cv += 256) {
    barrier(1);
    {
      int cw = cv + j;

      if (cw < g) {
        v[j] = p[cv + j];
        w[j] = q[cv + j];
        x[j] = r[cv + j];
      }

      if (j == 0) {
        if (cw == 0) {
          v[-1] = p[0];
          w[-1] = q[0];
          x[-1] = r[0];
        } else {
          v[-1] = p[cw - 1];
          w[-1] = q[cw - 1];
          x[-1] = r[cw - 1];
        }
      }

      if (cw == g - 1) {
        v[j + 1] = p[cw];
        w[j + 1] = q[cw];
        x[j + 1] = r[cw];
      }

      if ((j == 255) && (cw < g - 1)) {
        v[256] = p[cw + 1];
        w[256] = q[cw + 1];
        x[256] = r[cw + 1];
      }
    }
    barrier(1);

    for (int cx = 0; cx < 4; cx++) {
      {
        int cy = cx * 64 + z;

        int cw = cv + cy;
        if (cw < g) {
          float cz = 0;
          ;
          float da = 0;
          ;
          float db = 0;
          ;
          float dc = 0;
          ;
          float dd = 0;
          ;
          float de = 0;
          ;
          float df = 0;
          ;
          float dg = 0;
          ;
          ;
          cz += v[cy + 0 - 1] * ab;
          ;
          cz += v[cy + 1 - 1] * ac;
          ;
          cz += v[cy + 2 - 1] * ad;
          ;
          cz += w[cy + 0 - 1] * ae;
          ;
          cz += w[cy + 1 - 1] * af;
          ;
          cz += w[cy + 2 - 1] * ag;
          ;
          cz += x[cy + 0 - 1] * ah;
          ;
          cz += x[cy + 1 - 1] * ai;
          ;
          cz += x[cy + 2 - 1] * aj;
          ;
          da += v[cy + 0 - 1] * ak;
          ;
          da += v[cy + 1 - 1] * al;
          ;
          da += v[cy + 2 - 1] * am;
          ;
          da += w[cy + 0 - 1] * an;
          ;
          da += w[cy + 1 - 1] * ao;
          ;
          da += w[cy + 2 - 1] * ap;
          ;
          da += x[cy + 0 - 1] * aq;
          ;
          da += x[cy + 1 - 1] * ar;
          ;
          da += x[cy + 2 - 1] * as;
          ;
          db += v[cy + 0 - 1] * at;
          ;
          db += v[cy + 1 - 1] * au;
          ;
          db += v[cy + 2 - 1] * av;
          ;
          db += w[cy + 0 - 1] * aw;
          ;
          db += w[cy + 1 - 1] * ax;
          ;
          db += w[cy + 2 - 1] * ay;
          ;
          db += x[cy + 0 - 1] * az;
          ;
          db += x[cy + 1 - 1] * ba;
          ;
          db += x[cy + 2 - 1] * bb;
          ;
          dc += v[cy + 0 - 1] * bc;
          ;
          dc += v[cy + 1 - 1] * bd;
          ;
          dc += v[cy + 2 - 1] * be;
          ;
          dc += w[cy + 0 - 1] * bf;
          ;
          dc += w[cy + 1 - 1] * bg;
          ;
          dc += w[cy + 2 - 1] * bh;
          ;
          dc += x[cy + 0 - 1] * bi;
          ;
          dc += x[cy + 1 - 1] * bj;
          ;
          dc += x[cy + 2 - 1] * bk;
          ;
          dd += v[cy + 0 - 1] * bl;
          ;
          dd += v[cy + 1 - 1] * bm;
          ;
          dd += v[cy + 2 - 1] * bn;
          ;
          dd += w[cy + 0 - 1] * bo;
          ;
          dd += w[cy + 1 - 1] * bp;
          ;
          dd += w[cy + 2 - 1] * bq;
          ;
          dd += x[cy + 0 - 1] * br;
          ;
          dd += x[cy + 1 - 1] * bs;
          ;
          dd += x[cy + 2 - 1] * bt;
          ;
          de += v[cy + 0 - 1] * bu;
          ;
          de += v[cy + 1 - 1] * bv;
          ;
          de += v[cy + 2 - 1] * bw;
          ;
          de += w[cy + 0 - 1] * bx;
          ;
          de += w[cy + 1 - 1] * by;
          ;
          de += w[cy + 2 - 1] * bz;
          ;
          de += x[cy + 0 - 1] * ca;
          ;
          de += x[cy + 1 - 1] * cb;
          ;
          de += x[cy + 2 - 1] * cc;
          ;
          df += v[cy + 0 - 1] * cd;
          ;
          df += v[cy + 1 - 1] * ce;
          ;
          df += v[cy + 2 - 1] * cf;
          ;
          df += w[cy + 0 - 1] * cg;
          ;
          df += w[cy + 1 - 1] * ch;
          ;
          df += w[cy + 2 - 1] * ci;
          ;
          df += x[cy + 0 - 1] * cj;
          ;
          df += x[cy + 1 - 1] * ck;
          ;
          df += x[cy + 2 - 1] * cl;
          ;
          dg += v[cy + 0 - 1] * cm;
          ;
          dg += v[cy + 1 - 1] * cn;
          ;
          dg += v[cy + 2 - 1] * co;
          ;
          dg += w[cy + 0 - 1] * cp;
          ;
          dg += w[cy + 1 - 1] * cq;
          ;
          dg += w[cy + 2 - 1] * cr;
          ;
          dg += x[cy + 0 - 1] * cs;
          ;
          dg += x[cy + 1 - 1] * ct;
          ;
          dg += x[cy + 2 - 1] * cu;
          ;
          ;
          __global float* dh = c + (i * g + cw) * 32;
          {
            float di = cz;
            int dj = aa + 0;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = da;
            int dj = aa + 1;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = db;
            int dj = aa + 2;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = dc;
            int dj = aa + 3;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = dd;
            int dj = aa + 4;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = de;
            int dj = aa + 5;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = df;
            int dj = aa + 6;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          {
            float di = dg;
            int dj = aa + 7;
            float dk = e[dj];
            di += dk;
            float dl = max(di, 0.0f);
            float dm = min(di, 0.0f);
            di = dm * 0.1f + dl;
            dh[dj] = di;
          };
          ;
        }
      }
    }
  }
}

__kernel void B(__global const float* __restrict__ a, int b, __global float* __restrict__ c, int d, __global float* __restrict__ e, unsigned int f, unsigned int g, __global float* __restrict__ h) {
  unsigned int i = get_group_id(0) * 1;
  __local float j[128];

  for (int k = 0; k < 1; k++) {
    int l = i + k;
    unsigned int m = get_local_id(0);

    size_t n = g * sizeof(float) * b;

    __global char* o = (__global char*)a;

    o += n * l;
    __global char* p = o - n;
    if (l == 0) {
      p = o;
    }

    __global char* q = o;
    __global char* r = o + n;

    if (l == f - 1) {
      r = q;
    }

    __global float* s = (__global float*)p;
    __global float* t = (__global float*)q;
    __global float* u = (__global float*)r;

    float v = e[0];

    float w;
    float x;
    float y;

    float z;
    float aa;
    float ab;

    float ac;
    float ad;
    float ae;

    float af = h[m * 9 + 0];
    float ag = h[m * 9 + 1];
    float ah = h[m * 9 + 2];
    float ai = h[m * 9 + 3];
    float aj = h[m * 9 + 4];
    float ak = h[m * 9 + 5];
    float al = h[m * 9 + 6];
    float am = h[m * 9 + 7];
    float an = h[m * 9 + 8];

    __global float* ao = s - 128 + m;
    __global float* ap = s + m;
    __global float* aq = s + 128 + m;

    __global float* ar = t - 128 + m;
    __global float* as = t + m;
    __global float* at = t + 128 + m;

    __global float* au = u - 128 + m;
    __global float* av = u + m;
    __global float* aw = u + 128 + m;

    x = ap[0];
    y = ap[0];

    aa = as[0];
    ab = as[0];

    ad = av[0];
    ae = av[0];
    for (int ax = 0; ax < g - 1; ax++) {
      {
        float ay = 0;
        {
          int az = m;
          float ba = w;
          float bb = z;
          float bc = ac;
          w = x;
          x = y;
          y = ba;
          z = aa;
          aa = ab;
          ab = bb;
          ac = ad;
          ad = ae;
          ae = bc;
          if (0) {
            y = x;
            ab = aa;
            ae = ad;
          } else {
            y = aq[ax * 128];
            ab = at[ax * 128];
            ae = aw[ax * 128];
          }
          ay = mad(af, w, ay);
          ay = mad(ai, z, ay);
          ay = mad(al, ac, ay);
          ay = mad(ag, x, ay);
          ay = mad(aj, aa, ay);
          ay = mad(am, ad, ay);
          ay = mad(ah, y, ay);
          ay = mad(ak, ab, ay);
          ay = mad(an, ae, ay);
        }
        barrier(1);
        j[m] = ay;
        barrier(1);
        if (m < 64) {
          j[m] += j[m + 64];
        }
        barrier(1);
        if (m < 32) {
          j[m] += j[m + 32];
        }
        barrier(1);
        if (m == 0) {
          float ay = 0;
          for (int az = 0; az < 32; az++) {
            ay += j[az];
          }
          float bd = ay;
          __global float* be = c + (l * g + ax);
          bd += v;
          float bf = max(bd, 0.0f);
          float bg = min(bd, 0.0f);
          bd = bg * 0.1f + bf;
          be[0] = bd;
        }
      };
    }
    {
      int ax = g - 1;
      {
        float ay = 0;
        {
          int az = m;
          float ba = w;
          float bb = z;
          float bc = ac;
          w = x;
          x = y;
          y = ba;
          z = aa;
          aa = ab;
          ab = bb;
          ac = ad;
          ad = ae;
          ae = bc;
          if (1) {
            y = x;
            ab = aa;
            ae = ad;
          } else {
            y = aq[ax * 128];
            ab = at[ax * 128];
            ae = aw[ax * 128];
          }
          ay = mad(af, w, ay);
          ay = mad(ai, z, ay);
          ay = mad(al, ac, ay);
          ay = mad(ag, x, ay);
          ay = mad(aj, aa, ay);
          ay = mad(am, ad, ay);
          ay = mad(ah, y, ay);
          ay = mad(ak, ab, ay);
          ay = mad(an, ae, ay);
        }
        barrier(1);
        j[m] = ay;
        barrier(1);
        if (m < 64) {
          j[m] += j[m + 64];
        }
        barrier(1);
        if (m < 32) {
          j[m] += j[m + 32];
        }
        barrier(1);
        if (m == 0) {
          float ay = 0;
          for (int az = 0; az < 32; az++) {
            ay += j[az];
          }
          float bd = ay;
          __global float* be = c + (l * g + ax);
          bd += v;
          float bf = max(bd, 0.0f);
          float bg = min(bd, 0.0f);
          bd = bg * 0.1f + bf;
          be[0] = bd;
        }
      };
    }
  }
}

__kernel void C(__global const float* __restrict__ a, __global float* __restrict__ b, __global float* __restrict__ c, unsigned int d, unsigned int e, __global float* __restrict__ f) {
  int g = 3;
  int h = 32;

  unsigned int i = get_group_id(0);
  unsigned int j = get_local_id(0);

  size_t k = e * g;

  __global const float* l = a;
  l += k * i;
  __global const float* m = l - k;
  if (i == 0) {
    m = l;
  }
  __global const float* n = l;

  __global const float* o = l + k;
  if (i == d - 1) {
    o = n;
  }

  __global const float* p = m;
  __global const float* q = n;
  __global const float* r = o;

  __local float s[(64 + 2) * 3];
  __local float t[(64 + 2) * 3];
  __local float u[(64 + 2) * 3];
  __local float v[192];

  __local float* w = s + 3;
  __local float* x = t + 3;
  __local float* y = u + 3;

  unsigned int z = j / 32U;
  unsigned int aa = j % 32U;

  float ab = f[9 * h * z + aa + 0 * h];
  ;
  float ac = f[9 * h * z + aa + 1 * h];
  ;
  float ad = f[9 * h * z + aa + 2 * h];
  ;
  float ae = f[9 * h * z + aa + 3 * h];
  ;
  float af = f[9 * h * z + aa + 4 * h];
  ;
  float ag = f[9 * h * z + aa + 5 * h];
  ;
  float ah = f[9 * h * z + aa + 6 * h];
  ;
  float ai = f[9 * h * z + aa + 7 * h];
  ;
  float aj = f[9 * h * z + aa + 8 * h];
  ;
  ;

  for (int ak = 0; ak < e; ak += 64) {
    int al = min((int)e - ak, 64);
    int am = al * 3;

    if (j < am) {
      int an = ak * 3 + j;

      w[j] = p[an];
      x[j] = q[an];
      y[j] = r[an];

      if (j < 3) {
        if (an <= 2) {
          w[-3 + (int)j] = p[j];
          x[-3 + (int)j] = q[j];
          y[-3 + (int)j] = r[j];
        } else {
          w[-3 + (int)j] = p[-3 + (int)an];
          x[-3 + (int)j] = q[-3 + (int)an];
          y[-3 + (int)j] = r[-3 + (int)an];
        }
      }

      if (an >= e * 3 - 3) {
        w[j + 3] = p[an];
        x[j + 3] = q[an];
        y[j + 3] = r[an];
      } else if (j >= 189) {
        w[j + 3] = p[an + 3];
        x[j + 3] = q[an + 3];
        y[j + 3] = r[an + 3];
      }
    }
    barrier(1);

    for (int ao = 0; ao < al; ao++) {
      int an = ak + ao;

      if (j < 96) {
        float ap = 0;

        ap = mad(ab, w[(ao - 1) * 3 + (int)z], ap);
        ap = mad(ac, w[(ao)*3 + (int)z], ap);
        ap = mad(ad, w[(ao + 1) * 3 + (int)z], ap);

        ap = mad(ae, x[(ao - 1) * 3 + (int)z], ap);
        ap = mad(af, x[(ao)*3 + (int)z], ap);
        ap = mad(ag, x[(ao + 1) * 3 + (int)z], ap);

        ap = mad(ah, y[(ao - 1) * 3 + (int)z], ap);
        ap = mad(ai, y[(ao)*3 + (int)z], ap);
        ap = mad(aj, y[(ao + 1) * 3 + (int)z], ap);

        v[j] = ap;
      }

      barrier(1);

      if (j < 32) {
        int aq = j;
        float ar = 0;
        __global float* as = b + (i * e + an) * h;

        ar += v[32 * 0 + j];
        ar += v[32 * 1 + j];
        ar += v[32 * 2 + j];

        float at = c[aq];
        ar += at;
        float au = max(ar, 0.0f);
        float av = min(ar, 0.0f);
        ar = av * 0.1f + au;

        as[aq] = ar;
      }

      barrier(1);
    }
  }
}

__kernel __attribute__((reqd_work_group_size(128, 1, 1))) void D(__global const float* __restrict__ a, __global float* __restrict__ b, __global float* __restrict__ c, unsigned int d, unsigned int e, __global float* __restrict__ f) {
  int g = 128;
  int h = 3;

  unsigned int i = get_group_id(0);
  unsigned int j = get_local_id(0);
  int k = get_local_id(0);

  size_t l = e * g;

  __global const float* m = a;
  m += l * i;
  __global const float* n = m - l;
  if (i == 0) {
    n = m;
  }
  __global const float* o = m;

  __global const float* p = m + l;
  if (i == d - 1) {
    p = o;
  }

  __global const float* q = n;
  __global const float* r = o;
  __global const float* s = p;

  float t, u, v;
  float w, x, y;
  float z, aa, ab;

  __local float ac[3][128];
  int ad = j;
  float ae = 0;

  int af = j / 32U;
  int ag = j % 32U;

  int ah = j / 16U;
  int ai = j % 16U;

  int aj = j / 8U;
  int ak = j % 8U;

  if (j < 3) {
    ae = c[j];
  }

  float al = f[9 * 0 * g + 0 * g + ad];
  float am = f[9 * 1 * g + 0 * g + ad];
  float an = f[9 * 2 * g + 0 * g + ad];
  ;
  float ao = f[9 * 0 * g + 1 * g + ad];
  float ap = f[9 * 1 * g + 1 * g + ad];
  float aq = f[9 * 2 * g + 1 * g + ad];
  ;
  float ar = f[9 * 0 * g + 2 * g + ad];
  float as = f[9 * 1 * g + 2 * g + ad];
  float at = f[9 * 2 * g + 2 * g + ad];
  ;
  float au = f[9 * 0 * g + 3 * g + ad];
  float av = f[9 * 1 * g + 3 * g + ad];
  float aw = f[9 * 2 * g + 3 * g + ad];
  ;
  float ax = f[9 * 0 * g + 4 * g + ad];
  float ay = f[9 * 1 * g + 4 * g + ad];
  float az = f[9 * 2 * g + 4 * g + ad];
  ;
  float ba = f[9 * 0 * g + 5 * g + ad];
  float bb = f[9 * 1 * g + 5 * g + ad];
  float bc = f[9 * 2 * g + 5 * g + ad];
  ;
  float bd = f[9 * 0 * g + 6 * g + ad];
  float be = f[9 * 1 * g + 6 * g + ad];
  float bf = f[9 * 2 * g + 6 * g + ad];
  ;
  float bg = f[9 * 0 * g + 7 * g + ad];
  float bh = f[9 * 1 * g + 7 * g + ad];
  float bi = f[9 * 2 * g + 7 * g + ad];
  ;
  float bj = f[9 * 0 * g + 8 * g + ad];
  float bk = f[9 * 1 * g + 8 * g + ad];
  float bl = f[9 * 2 * g + 8 * g + ad];
  ;
  ;

  u = v = q[j];
  x = y = r[j];
  aa = ab = s[j];

  __global char* bm = (__global char*)(q + j + g);
  __global char* bn = (__global char*)(r + j + g);
  __global char* bo = (__global char*)(s + j + g);

  int bp = 0;

  for (int bq = 0; bq < e; bq++) {
    t = u;
    u = v;

    w = x;
    x = y;

    z = aa;
    aa = ab;

    if (bq == e - 1) {
    } else {
      v = *(__global float*)(bm + bp);
      y = *(__global float*)(bn + bp);
      ab = *(__global float*)(bo + bp);
    }
    bp += g * sizeof(float);
    {
      float br = 0;
      br = mad(al, t, br);
      br = mad(ao, u, br);
      br = mad(ar, v, br);
      br = mad(au, w, br);
      br = mad(ax, x, br);
      br = mad(ba, y, br);
      br = mad(bd, z, br);
      br = mad(bg, aa, br);
      br = mad(bj, ab, br);
      barrier(1);
      ac[0][j] = br;
      barrier(1);
      if (j < 64) {
        ac[0][j] += ac[0][j + 64];
      }
      barrier(1);
    };
    {
      float br = 0;
      br = mad(am, t, br);
      br = mad(ap, u, br);
      br = mad(as, v, br);
      br = mad(av, w, br);
      br = mad(ay, x, br);
      br = mad(bb, y, br);
      br = mad(be, z, br);
      br = mad(bh, aa, br);
      br = mad(bk, ab, br);
      barrier(1);
      ac[1][j] = br;
      barrier(1);
      if (j < 64) {
        ac[1][j] += ac[1][j + 64];
      }
      barrier(1);
    };
    {
      float br = 0;
      br = mad(an, t, br);
      br = mad(aq, u, br);
      br = mad(at, v, br);
      br = mad(aw, w, br);
      br = mad(az, x, br);
      br = mad(bc, y, br);
      br = mad(bf, z, br);
      br = mad(bi, aa, br);
      br = mad(bl, ab, br);
      barrier(1);
      ac[2][j] = br;
      barrier(1);
      if (j < 64) {
        ac[2][j] += ac[2][j + 64];
      }
      barrier(1);
    };

    barrier(1);
    if (j < 32 * 3) {
      ac[af][ag] += ac[af][ag + 32];
    }
    barrier(1);
    if (j < 16 * 3) {
      ac[ah][ai] += ac[ah][ai + 16];
    }
    barrier(1);

    if (j < 3) {
      float br = 0;
      for (int bs = 0; bs < 16; bs++) {
        br += ac[j][bs];
      }

      float bt = br;
      __global float* bu = b + (i * e + bq) * h;
      bt += ae;
      float bv = max(bt, 0.0f);
      float bw = min(bt, 0.0f);
      bt = bw * 0.1f + bv;
      bu[j] = bt;
    }
  }
}

__kernel void E(__global const float* __restrict__ a, unsigned int b, __global float* __restrict__ c, unsigned int d, __global float* __restrict__ e, unsigned int f, unsigned int g, __global float* __restrict__ h) {
  __global const unsigned char* i = (__global unsigned char*)a;
  __global const unsigned char* j = (__global unsigned char*)h;
  __global const unsigned char* k = (__global unsigned char*)e;
  __global unsigned char* l = (__global unsigned char*)c;

  unsigned int m = 32;
  unsigned int n = 32;

  int o = d / m;
  int p = b / n;

  for (int q = 0; q < 3; q++) {
    bool r = q == 2;
    bool s = q == 0;
  }
}

__kernel void F(__global const float* __restrict__ a, int b, __global float* __restrict__ c, int d, __global float* __restrict__ e, unsigned int f, unsigned int g, __global float* __restrict__ h) {
  unsigned int i = get_group_id(0);
  unsigned int j = get_local_id(0);

  __local float2 k[(128 / 2) * (8 + 2) * 3];
  __local float* l = (__local float*)k;

  __global const float* __restrict__ m = a;
  size_t n = g * sizeof(float) * b;

  __global char* o = (__global char*)a;

  o += n * i;
  __global char* p = o - n;
  if (i == 0) {
    p = o;
  }

  __global char* q = o;
  __global char* r = o + n;

  if (i == f - 1) {
    r = o;
  }

  __global float* s = (__global float*)p;
  __global float* t = (__global float*)q;
  __global float* u = (__global float*)r;

  __local float* v = l;
  l += b * (8 + 2);
  __local float* w = l;
  l += b * (8 + 2);
  __local float* x = l;
  l += b * (8 + 2);

  __local float* y = v + b;
  __local float* z = w + b;
  __local float* aa = x + b;

  unsigned int ab = min((int)128, (int)d);

  for (int ac = 0; ac < g; ac += 8) {
    barrier(1);

    if (j < b) {
      int ad;

      for (ad = 0; ad < 8; ad++) {
        int ae = ac + ad;

        if (ae == g) {
          break;
        }

        y[ad * b + j] = s[ae * b + j];
        z[ad * b + j] = t[ae * b + j];
        aa[ad * b + j] = u[ae * b + j];
      }

      {
        int ae = ac + ad;
        if (ae == g) {
          y[ad * (int)b + j] = s[(ae - 1) * (int)b + j];
          z[ad * (int)b + j] = t[(ae - 1) * (int)b + j];
          aa[ad * (int)b + j] = u[(ae - 1) * (int)b + j];
        } else {
          y[ad * (int)b + j] = s[ae * (int)b + j];
          z[ad * (int)b + j] = t[ae * (int)b + j];
          aa[ad * (int)b + j] = u[ae * (int)b + j];
        }
      }

      {
        int ae = ac - 1;
        if (ae == -1) {
          y[-1 * (int)b + (int)j] = s[j];
          z[-1 * (int)b + (int)j] = t[j];
          aa[-1 * (int)b + (int)j] = u[j];
        } else {
          y[-1 * (int)b + (int)j] = s[ae * (int)b + j];
          z[-1 * (int)b + (int)j] = t[ae * (int)b + j];
          aa[-1 * (int)b + (int)j] = u[ae * (int)b + j];
        }
      }
    }

    barrier(1);

    int af = g - ac;
    int ag = 128 * 4;

    if (af >= 8) {
      {
        int ad = 0;

        __local char* ah = (__local char*)&y[b * (0 - 1)];
        ;
        __local char* ai = (__local char*)&y[b * (1 - 1)];
        ;
        __local char* aj = (__local char*)&y[b * (2 - 1)];
        ;
        __local char* ak = (__local char*)&y[b * (3 - 1)];
        ;
        __local char* al = (__local char*)&y[b * (4 - 1)];
        ;
        __local char* am = (__local char*)&y[b * (5 - 1)];
        ;
        __local char* an = (__local char*)&y[b * (6 - 1)];
        ;
        __local char* ao = (__local char*)&y[b * (7 - 1)];
        ;
        __local char* ap = (__local char*)&y[b * (8 - 1)];
        ;
        __local char* aq = (__local char*)&y[b * (9 - 1)];
        ;
        __local char* ar = (__local char*)&z[b * (0 - 1)];
        ;
        __local char* as = (__local char*)&z[b * (1 - 1)];
        ;
        __local char* at = (__local char*)&z[b * (2 - 1)];
        ;
        __local char* au = (__local char*)&z[b * (3 - 1)];
        ;
        __local char* av = (__local char*)&z[b * (4 - 1)];
        ;
        __local char* aw = (__local char*)&z[b * (5 - 1)];
        ;
        __local char* ax = (__local char*)&z[b * (6 - 1)];
        ;
        __local char* ay = (__local char*)&z[b * (7 - 1)];
        ;
        __local char* az = (__local char*)&z[b * (8 - 1)];
        ;
        __local char* ba = (__local char*)&z[b * (9 - 1)];
        ;
        __local char* bb = (__local char*)&aa[b * (0 - 1)];
        ;
        __local char* bc = (__local char*)&aa[b * (1 - 1)];
        ;
        __local char* bd = (__local char*)&aa[b * (2 - 1)];
        ;
        __local char* be = (__local char*)&aa[b * (3 - 1)];
        ;
        __local char* bf = (__local char*)&aa[b * (4 - 1)];
        ;
        __local char* bg = (__local char*)&aa[b * (5 - 1)];
        ;
        __local char* bh = (__local char*)&aa[b * (6 - 1)];
        ;
        __local char* bi = (__local char*)&aa[b * (7 - 1)];
        ;
        __local char* bj = (__local char*)&aa[b * (8 - 1)];
        ;
        __local char* bk = (__local char*)&aa[b * (9 - 1)];
        ;
        ;

        float bl = 0;
        float bm = 0;
        float bn = 0;
        float bo = 0;

        float bp = 0;
        float bq = 0;
        float br = 0;
        float bs = 0;

        {
          __global float* bt = h + j;
          int bu = b * 4;

          for (int bv = 0; bv < bu; bv += 4) {
            float2 bw = *(__local float2*)(ah + bv);
            ;
            float2 bx = *(__local float2*)(ai + bv);
            ;
            float2 by = *(__local float2*)(aj + bv);
            ;
            float2 bz = *(__local float2*)(ak + bv);
            ;
            float2 ca = *(__local float2*)(al + bv);
            ;
            float2 cb = *(__local float2*)(am + bv);
            ;
            float2 cc = *(__local float2*)(an + bv);
            ;
            float2 cd = *(__local float2*)(ao + bv);
            ;
            float2 ce = *(__local float2*)(ap + bv);
            ;
            float2 cf = *(__local float2*)(aq + bv);
            ;
            float2 cg = *(__local float2*)(ar + bv);
            ;
            float2 ch = *(__local float2*)(as + bv);
            ;
            float2 ci = *(__local float2*)(at + bv);
            ;
            float2 cj = *(__local float2*)(au + bv);
            ;
            float2 ck = *(__local float2*)(av + bv);
            ;
            float2 cl = *(__local float2*)(aw + bv);
            ;
            float2 cm = *(__local float2*)(ax + bv);
            ;
            float2 cn = *(__local float2*)(ay + bv);
            ;
            float2 co = *(__local float2*)(az + bv);
            ;
            float2 cp = *(__local float2*)(ba + bv);
            ;
            float2 cq = *(__local float2*)(bb + bv);
            ;
            float2 cr = *(__local float2*)(bc + bv);
            ;
            float2 cs = *(__local float2*)(bd + bv);
            ;
            float2 ct = *(__local float2*)(be + bv);
            ;
            float2 cu = *(__local float2*)(bf + bv);
            ;
            float2 cv = *(__local float2*)(bg + bv);
            ;
            float2 cw = *(__local float2*)(bh + bv);
            ;
            float2 cx = *(__local float2*)(bi + bv);
            ;
            float2 cy = *(__local float2*)(bj + bv);
            ;
            float2 cz = *(__local float2*)(bk + bv);
            ;
            ;

            {
              float da = bw.x;
              ;
              float db = bx.x;
              ;
              float dc = by.x;
              ;
              float dd = bz.x;
              ;
              float de = ca.x;
              ;
              float df = cb.x;
              ;
              float dg = cc.x;
              ;
              float dh = cd.x;
              ;
              float di = ce.x;
              ;
              float dj = cf.x;
              ;
              float dk = cg.x;
              ;
              float dl = ch.x;
              ;
              float dm = ci.x;
              ;
              float dn = cj.x;
              ;
              float dp = ck.x;
              ;
              float dq = cl.x;
              ;
              float dr = cm.x;
              ;
              float ds = cn.x;
              ;
              float dt = co.x;
              ;
              float du = cp.x;
              ;
              float dv = cq.x;
              ;
              float dw = cr.x;
              ;
              float dx = cs.x;
              ;
              float dy = ct.x;
              ;
              float dz = cu.x;
              ;
              float ea = cv.x;
              ;
              float eb = cw.x;
              ;
              float ec = cx.x;
              ;
              float ed = cy.x;
              ;
              float ee = cz.x;
              ;
              ;

              __global char* ef = ((__global char*)bt + (bv * 128) * 9);
              float eg = *(__global float*)(ef + 0 * ag);
              ;
              float eh = *(__global float*)(ef + 1 * ag);
              ;
              float ei = *(__global float*)(ef + 2 * ag);
              ;
              float ej = *(__global float*)(ef + 3 * ag);
              ;
              float ek = *(__global float*)(ef + 4 * ag);
              ;
              float el = *(__global float*)(ef + 5 * ag);
              ;
              float em = *(__global float*)(ef + 6 * ag);
              ;
              float en = *(__global float*)(ef + 7 * ag);
              ;
              float eo = *(__global float*)(ef + 8 * ag);
              ;
              ;
              {
                bl = mad(eg, da, bl);
                bm = mad(eg, db, bm);
                bn = mad(eg, dc, bn);
                bo = mad(eg, dd, bo);
                bp = mad(eg, de, bp);
                bq = mad(eg, df, bq);
                br = mad(eg, dg, br);
                bs = mad(eg, dh, bs);
                ;
                bl = mad(eh, db, bl);
                bm = mad(eh, dc, bm);
                bn = mad(eh, dd, bn);
                bo = mad(eh, de, bo);
                bp = mad(eh, df, bp);
                bq = mad(eh, dg, bq);
                br = mad(eh, dh, br);
                bs = mad(eh, di, bs);
                ;
                bl = mad(ei, dc, bl);
                bm = mad(ei, dd, bm);
                bn = mad(ei, de, bn);
                bo = mad(ei, df, bo);
                bp = mad(ei, dg, bp);
                bq = mad(ei, dh, bq);
                br = mad(ei, di, br);
                bs = mad(ei, dj, bs);
                ;

                bl = mad(ej, dk, bl);
                bm = mad(ej, dl, bm);
                bn = mad(ej, dm, bn);
                bo = mad(ej, dn, bo);
                bp = mad(ej, dp, bp);
                bq = mad(ej, dq, bq);
                br = mad(ej, dr, br);
                bs = mad(ej, ds, bs);
                ;
                bl = mad(ek, dl, bl);
                bm = mad(ek, dm, bm);
                bn = mad(ek, dn, bn);
                bo = mad(ek, dp, bo);
                bp = mad(ek, dq, bp);
                bq = mad(ek, dr, bq);
                br = mad(ek, ds, br);
                bs = mad(ek, dt, bs);
                ;
                bl = mad(el, dm, bl);
                bm = mad(el, dn, bm);
                bn = mad(el, dp, bn);
                bo = mad(el, dq, bo);
                bp = mad(el, dr, bp);
                bq = mad(el, ds, bq);
                br = mad(el, dt, br);
                bs = mad(el, du, bs);
                ;

                bl = mad(em, dv, bl);
                bm = mad(em, dw, bm);
                bn = mad(em, dx, bn);
                bo = mad(em, dy, bo);
                bp = mad(em, dz, bp);
                bq = mad(em, ea, bq);
                br = mad(em, eb, br);
                bs = mad(em, ec, bs);
                ;
                bl = mad(en, dw, bl);
                bm = mad(en, dx, bm);
                bn = mad(en, dy, bn);
                bo = mad(en, dz, bo);
                bp = mad(en, ea, bp);
                bq = mad(en, eb, bq);
                br = mad(en, ec, br);
                bs = mad(en, ed, bs);
                ;
                bl = mad(eo, dx, bl);
                bm = mad(eo, dy, bm);
                bn = mad(eo, dz, bn);
                bo = mad(eo, ea, bo);
                bp = mad(eo, eb, bp);
                bq = mad(eo, ec, bq);
                br = mad(eo, ed, br);
                bs = mad(eo, ee, bs);
                ;
              }
            }

            bv += 4;
            {
              float da = bw.y;
              ;
              float db = bx.y;
              ;
              float dc = by.y;
              ;
              float dd = bz.y;
              ;
              float de = ca.y;
              ;
              float df = cb.y;
              ;
              float dg = cc.y;
              ;
              float dh = cd.y;
              ;
              float di = ce.y;
              ;
              float dj = cf.y;
              ;
              float dk = cg.y;
              ;
              float dl = ch.y;
              ;
              float dm = ci.y;
              ;
              float dn = cj.y;
              ;
              float dp = ck.y;
              ;
              float dq = cl.y;
              ;
              float dr = cm.y;
              ;
              float ds = cn.y;
              ;
              float dt = co.y;
              ;
              float du = cp.y;
              ;
              float dv = cq.y;
              ;
              float dw = cr.y;
              ;
              float dx = cs.y;
              ;
              float dy = ct.y;
              ;
              float dz = cu.y;
              ;
              float ea = cv.y;
              ;
              float eb = cw.y;
              ;
              float ec = cx.y;
              ;
              float ed = cy.y;
              ;
              float ee = cz.y;
              ;
              ;

              __global char* ef = ((__global char*)bt + (bv * 128) * 9);
              float eg = *(__global float*)(ef + 0 * ag);
              ;
              float eh = *(__global float*)(ef + 1 * ag);
              ;
              float ei = *(__global float*)(ef + 2 * ag);
              ;
              float ej = *(__global float*)(ef + 3 * ag);
              ;
              float ek = *(__global float*)(ef + 4 * ag);
              ;
              float el = *(__global float*)(ef + 5 * ag);
              ;
              float em = *(__global float*)(ef + 6 * ag);
              ;
              float en = *(__global float*)(ef + 7 * ag);
              ;
              float eo = *(__global float*)(ef + 8 * ag);
              ;
              ;

              {
                bl = mad(eg, da, bl);
                bm = mad(eg, db, bm);
                bn = mad(eg, dc, bn);
                bo = mad(eg, dd, bo);
                bp = mad(eg, de, bp);
                bq = mad(eg, df, bq);
                br = mad(eg, dg, br);
                bs = mad(eg, dh, bs);
                ;
                bl = mad(eh, db, bl);
                bm = mad(eh, dc, bm);
                bn = mad(eh, dd, bn);
                bo = mad(eh, de, bo);
                bp = mad(eh, df, bp);
                bq = mad(eh, dg, bq);
                br = mad(eh, dh, br);
                bs = mad(eh, di, bs);
                ;
                bl = mad(ei, dc, bl);
                bm = mad(ei, dd, bm);
                bn = mad(ei, de, bn);
                bo = mad(ei, df, bo);
                bp = mad(ei, dg, bp);
                bq = mad(ei, dh, bq);
                br = mad(ei, di, br);
                bs = mad(ei, dj, bs);
                ;

                bl = mad(ej, dk, bl);
                bm = mad(ej, dl, bm);
                bn = mad(ej, dm, bn);
                bo = mad(ej, dn, bo);
                bp = mad(ej, dp, bp);
                bq = mad(ej, dq, bq);
                br = mad(ej, dr, br);
                bs = mad(ej, ds, bs);
                ;
                bl = mad(ek, dl, bl);
                bm = mad(ek, dm, bm);
                bn = mad(ek, dn, bn);
                bo = mad(ek, dp, bo);
                bp = mad(ek, dq, bp);
                bq = mad(ek, dr, bq);
                br = mad(ek, ds, br);
                bs = mad(ek, dt, bs);
                ;
                bl = mad(el, dm, bl);
                bm = mad(el, dn, bm);
                bn = mad(el, dp, bn);
                bo = mad(el, dq, bo);
                bp = mad(el, dr, bp);
                bq = mad(el, ds, bq);
                br = mad(el, dt, br);
                bs = mad(el, du, bs);
                ;

                bl = mad(em, dv, bl);
                bm = mad(em, dw, bm);
                bn = mad(em, dx, bn);
                bo = mad(em, dy, bo);
                bp = mad(em, dz, bp);
                bq = mad(em, ea, bq);
                br = mad(em, eb, br);
                bs = mad(em, ec, bs);
                ;
                bl = mad(en, dw, bl);
                bm = mad(en, dx, bm);
                bn = mad(en, dy, bn);
                bo = mad(en, dz, bo);
                bp = mad(en, ea, bp);
                bq = mad(en, eb, bq);
                br = mad(en, ec, br);
                bs = mad(en, ed, bs);
                ;
                bl = mad(eo, dx, bl);
                bm = mad(eo, dy, bm);
                bn = mad(eo, dz, bn);
                bo = mad(eo, ea, bo);
                bp = mad(eo, eb, bp);
                bq = mad(eo, ec, bq);
                br = mad(eo, ed, br);
                bs = mad(eo, ee, bs);
                ;
              }
            }
          }
          {
            __global float* ep = c + (i * g + (ac + 0)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bl;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 1)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bm;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 2)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bn;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 3)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bo;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 4)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bp;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 5)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bq;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 6)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = br;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          {
            __global float* ep = c + (i * g + (ac + 7)) * d;
            {
              int eq = j;
              float er = e[eq];
              float es = bs;
              es += er;
              float et = max(es, 0.0f);
              float eu = min(es, 0.0f);
              es = eu * 0.1f + et;
              ep[eq] = es;
            }
          };
          ;
        }
      }
    } else {
      for (int ad = 0; ad < 8; ad++) {
        __local char* ah = (__local char*)&y[-b + ad * (int)b];
        __local char* ai = (__local char*)&y[+ad * (int)b];
        __local char* aj = (__local char*)&y[+b * 1 + ad * (int)b];

        __local char* ar = (__local char*)&z[-b + ad * (int)b];
        __local char* as = (__local char*)&z[+ad * (int)b];
        __local char* at = (__local char*)&z[+b * 1 + ad * (int)b];

        __local char* bb = (__local char*)&aa[-b + ad * (int)b];
        __local char* bc = (__local char*)&aa[+ad * (int)b];
        __local char* bd = (__local char*)&aa[+b * 1 + ad * (int)b];

        float bl = 0;

        {
          int ae = ac + ad;

          if (ae == g) {
            break;
          }

          __global float* bt = h + j;
          int bu = b * 4;

          for (int bv = 0; bv < bu; bv += 4) {
            float da, db, dc;
            float dk, dl, dm;
            float dv, dw, dx;

            float2 bw, bx, by;
            float2 cg, ch, ci;
            float2 cq, cr, cs;

            bw = *(__local float2*)(ah + bv);
            cg = *(__local float2*)(ar + bv);
            cq = *(__local float2*)(bb + bv);

            bx = *(__local float2*)(ai + bv);
            ch = *(__local float2*)(as + bv);
            cr = *(__local float2*)(bc + bv);

            by = *(__local float2*)(aj + bv);
            ci = *(__local float2*)(at + bv);
            cs = *(__local float2*)(bd + bv);

            {
              da = bw.x;
              dk = cg.x;
              dv = cq.x;

              db = bx.x;
              dl = ch.x;
              dw = cr.x;

              dc = by.x;
              dm = ci.x;
              dx = cs.x;

              __global char* ef = ((__global char*)bt + (bv * 128) * 9);

              {
                bl = mad(*(__global float*)(ef + 0 * ag), da, bl);
                bl = mad(*(__global float*)(ef + 1 * ag), db, bl);
                bl = mad(*(__global float*)(ef + 2 * ag), dc, bl);

                bl = mad(*(__global float*)(ef + 3 * ag), dk, bl);
                bl = mad(*(__global float*)(ef + 4 * ag), dl, bl);
                bl = mad(*(__global float*)(ef + 5 * ag), dm, bl);

                bl = mad(*(__global float*)(ef + 6 * ag), dv, bl);
                bl = mad(*(__global float*)(ef + 7 * ag), dw, bl);
                bl = mad(*(__global float*)(ef + 8 * ag), dx, bl);
              }
            }

            bv += 4;
            {
              da = bw.y;
              dk = cg.y;
              dv = cq.y;

              db = bx.y;
              dl = ch.y;
              dw = cr.y;

              dc = by.y;
              dm = ci.y;
              dx = cs.y;

              __global char* ef = ((__global char*)bt + (bv * 128) * 9);

              {
                bl += *(__global float*)(ef + 0 * ag) * da;
                bl += *(__global float*)(ef + 1 * ag) * db;
                bl += *(__global float*)(ef + 2 * ag) * dc;

                bl += *(__global float*)(ef + 3 * ag) * dk;
                bl += *(__global float*)(ef + 4 * ag) * dl;
                bl += *(__global float*)(ef + 5 * ag) * dm;

                bl += *(__global float*)(ef + 6 * ag) * dv;
                bl += *(__global float*)(ef + 7 * ag) * dw;
                bl += *(__global float*)(ef + 8 * ag) * dx;
              }
            }
          }

          __global float* ep = c + (i * g + ae) * d;

          {
            int eq = j;
            float er = e[eq];
            float es = bl;
            es += er;

            float et = max(es, 0.0f);
            float eu = min(es, 0.0f);

            es = eu * 0.1f + et;

            ep[eq] = es;
          }
        }
      }
    }
  }
}