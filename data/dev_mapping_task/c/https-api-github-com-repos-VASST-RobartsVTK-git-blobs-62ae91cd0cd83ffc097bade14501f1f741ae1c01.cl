__kernel void A(__global float* a, float b, int c, float d, float e, float f) {
  int g = get_global_id(0);
  if (g >= c)
    return;

  (a[(g)*3 + (0)]) = (int)((a[(g)*3 + (0)]) / b) - d;
  (a[(g)*3 + (1)]) = (int)((a[(g)*3 + (1)]) / b) - e;
  (a[(g)*3 + (2)]) = (int)((a[(g)*3 + (2)]) / b) - f;
}

__kernel void B(__global float* a, __global unsigned char* b, int c, __global unsigned char* d, int e, int f, int g) {
  int h = get_global_id(0);
  if (h >= c)
    return;

  int i = (a[(h)*3 + (0)]);
  int j = (a[(h)*3 + (1)]);
  int k = (a[(h)*3 + (2)]);
  if (((i) >= (0) && (i) <= (g)) && ((j) >= (0) && (j) <= (f)) && ((k) >= (0) && (k) <= (e)))
    (d[(i) + (j)*g + (k)*g * f]) = b[h];
}

__kernel void C(__global float* a, __global char* b, int c, __global unsigned char* d, int e, int f, int g) {
  int h = get_global_id(0);
  if (h >= c)
    return;

  int i = (a[(h)*3 + (0)]);
  int j = (a[(h)*3 + (1)]);
  int k = (a[(h)*3 + (2)]);
  for (int l = 0; l < 5; l++) {
    int m = -(1 + l);
    int n = -(1 + l);
    int o = -(1 + l);

    if (((i + m) >= (0) && (i + m) <= (g)) && ((j + n) >= (0) && (j + n) <= (f)) && ((k + o) >= (0) && (k + o) <= (e))) {
      b[sizeof(unsigned char) * c * l + h] = 0;
      if ((d[(i + m) + (j + n) * g + (k + o) * g * f]) == 0) {
        int p = 0;
        int q = 0;
        for (int r = -(5 / 2); r <= (5 / 2); r++) {
          for (int s = -(5 / 2); s <= (5 / 2); s++) {
            for (int t = -(5 / 2); t <= (5 / 2); t++) {
              if (((i + m + r) >= (0) && (i + m + r) <= (g)) && ((j + n + s) >= (0) && (j + n + s) <= (f)) && ((k + o + t) >= (0) && (k + o + t) <= (e))) {
                if ((d[(i + m + r) + (j + n + s) * g + (k + o + t) * g * f]) != 0) {
                  p += (d[(i + m + r) + (j + n + s) * g + (k + o + t) * g * f]);
                  q++;
                }
              }
            }
          }
        }

        (d[(i + m) + (j + n) * g + (k + o) * g * f]) = p / (float)q;
        b[sizeof(unsigned char) * c * l + h] = p / (float)q;
      }
    }
  }
}

__kernel void D(__global float* a, __global float* b, int c) {
  int d = get_global_id(0);
  if (d >= c)
    return;

  float e, f, g;
  for (int h = 0; h < 3; h++) {
    float i = 0;
    for (int j = 0; j < 3; j++)
      i += (b[h * 4 + j]) * (a[(d)*3 + (j)]);
    i += (b[h * 4 + 3]);
    if (h == 0)
      e = i;
    else if (h == 1)
      f = i;
    else
      g = i;
  }
  (a[(d)*3 + (0)]) = e;
  (a[(d)*3 + (1)]) = f;
  (a[(d)*3 + (2)]) = g;
}
__kernel void E(__global unsigned char* a, int b, int c, int d, __global float4* e, int f, int g, float4 h, float4 i, __global float* j) {
  int k = get_global_id(0);
  if (k >= f * g)
    return;

  int l = k % f;
  int m = k / f;

  float4 n = normalize(i - h);
  float4 o = {0, 1, 0, 0};
  float4 p = normalize(cross(o, n));
  float4 q = normalize(cross(p, n));

  float r = 45 / 2;
  float s = r * g / (float)f;
  r = r / 180.0f * 3.14f;
  s = s / 180.0f * 3.14f;

  float4 t = n;

  float u = (l - f / 2) / (float)(f / 2);
  float4 v = u * r * p;

  u = (m - g / 2) / (float)(g / 2);
  float4 w = u * s * q;
  float4 x = normalize(t + v + w);

  e[k] = x;
}

__kernel void F(__global unsigned char* a, int b, int c, int d, __global float4* e, __global unsigned char* f, int g, int h, float4 i, float4 j, __global float* k) {
  int l = get_global_id(0);
  if (l >= g * h)
    return;

  int m = l % g;
  int n = l / g;

  float4 o = e[l];

  unsigned char p = 0;
  float q = 0;

  float4 r = {0, 0, 0, 0};
  float4 sd

      float4 t = (r - i) / o;
  float4 u = (s - i) / o;
  t = min(t, u);
  q = max(t.x, max(t.y, t.z)) + 2;

  float4 v = i + q * o;

  if (v.x > 0 && v.x < b - 1 && v.y > 0 && v.y < c - 1 && v.z > 0 && v.z < d - 1) {
    float w = 255;
    unsigned char x;
    float y;
    while (true) {
      if (v.x < 0 || v.x > b - 1 || v.y < 0 || v.y > c - 1 || v.z < 0 || v.z > d - 1) {
        break;
      }
      if (w < (255 / 10.0f))
        break;

      x = (a[((int)v.x) + ((int)v.y) * b + ((int)v.z) * b * c]);
      if (x < 54)
        x = 0;

      y = min((1 - x / 255.0f) + 0.4f, 1.0f);

      p += w * (1 - y);
      w *= y;

      q += 1.0f;
      v = i + q * o;
    }
  } else {
    p = ((m + n) % 2) * 150;
  }

  f[l] = p;
}

typedef struct {
  float4 corner0;
  float4 cornerx;
  float4 cornery;
} plane_pts;

__kernel void G(__global float4* a, __global unsigned char* b, float c, int d, int e, int f, __global float4* g, __global float4* h, __global plane_pts* i, __global float4* j, float k, float l, int m, int n, __global unsigned char* o, __global unsigned char* p, __global float* q, int r) {
  int s = get_global_id(0);

  if (s >= r)
    return;

  float4 t = a[s * 2 + 0] / c;
  float4 u = a[s * 2 + 1] / c;

  int v = min(t.x, u.x);
  int w = max(v + 1.0f, max(t.x, u.x));
  int x = min(t.y, u.y);
  int y = max(x + 1.0f, max(t.y, u.y));
  int z = min(t.z, u.z);
  int aa = max(z + 1.0f, max(t.z, u.z));

  int ab = 0;
  for (int ac = z; ac <= aa; ac++) {
    for (int ad = x; ad <= y; ad++) {
      for (int ae = v; ae <= w; ae++) {
   acflc((ae) >= (0) && (ae) <= (d)) && ((ad) >= (0) && (ad) <= (e)) && ((ac) >= (0) && (ac) <= (f))) {
     float ag = 0;
     if (1) {
       float ah[4];
       unsigned char ai[4];
       bool aj = true;
       float ak = 0;
       for (int al = aml < 4; al++) {
         am j ao = __clc_fabs((j[am].x * af.x + j[am].y * af.y + j[am].z * af.z + j[am].w) / sqrt(j[am].x * j[am].x + j[am].y * j[am].y + j[am].z * j[am].z));
         float4 ap = af + -ao * an - i[am].corner0;
         float aq = dot(ap, g[am]) / k;
         float ar = dot(ap, h[am]) / l;
         float as = aq - __clc_floor(aq);
         float at = ar - __clc_floor(ar);
         int au = (int)aq;
         int av = (int)ar;

         bool aw = false;

         if (((au) >= (0) && (au) <= (m)) && ((av) >= (0) && (av) <= (n)) && ((au + 1) >= (0) && (au + 1) <= (m)) && ((av + 1) >= (0) && (av + 1) <= (n))) {
           if (o[au + av * m] != 0 && o[au + 1 + (av + 1) * m] != 0 && o[au + 1 + av * m] != 0 && o[au + (av + 1) * m] != 0) {
             ai[al] = p[(am)*m * n + (av)*m + (au)] * (1 - as) * (1 - at) + p[(am)*m * n + (av)*m + (au + 1)] * as * (1 - at) + p[(am)*m * n + (av + 1) * m + (au)] * (1 - as) * at + p[(am)*m * n + (av + 1) * m + (au + 1)] * as * at;
             aw = true;
           }
         }

         aj &= aw;
         ah[al] = ao;

         ak += 1 / ah[al];
         ag += ai[al] / ah[al];
       }

       if (!aj)
         continue;

       ag /= ak;

     } else {
       float ah[4];
       bool aj = true;
       for (int al = 0; alam al++) {
         am aj ao = __clc_fabs((j[am].x * af.x + j[am].y * af.y + j[am].z * af.z + j[am].w) / sqrt(j[am].x * j[am].x + j[am].y * j[am].y + j[am].z * j[am].z));
         float4 ap = af + -ao * an - i[am].corner0;
         float aq = dot(ap, g[am]) / k;
         float ar = dot(ap, h[am]) / l;
         float as = aq - __clc_floor(aq);
         float at = ar - __clc_floor(ar);
         int au = (int)aq;
         int av = (int)ar;

         bool aw = false;
         float ax;

         if (((au) >= (0) && (au) <= (m)) && ((av) >= (0) && (av) <= (n)) && ((au + 1) >= (0) && (au + 1) <= (m)) && ((av + 1) >= (0) && (av + 1) <= (n)))
           if (o[au + av * m] != 0 && o[au + 1 + (av + 1) * m] != 0 && o[au + 1 + av * m] != 0 && o[au + (av + 1) * m] != 0)
             aw = true;

         ah[al] = ao;

         aj &= aw;
       }
       if (!aj)
         continue;
       float ak = ah[1] + ah[2];
       float ay = ah[2] / ak * q[4 / 2 - 1] + ah[1] / ak * q[4 / 2];

       float4 az = {0, 0, 0, 0};
       float4 ba = {0, 0, 0, 0};
       float4 bb = {0, 0, 0, 0};
       float4 bc = {0, 0, 0, 0};
       for (int bd = 0; bd < 4; bd++) {
         int am = 4 / 2 - 2 + bd;
         float be = 0;
         float bf = -1 / 2.0f;
         float bg = __clc_fabs((ay - q[am])) / (q[1] - q[0]);
         if (((bg) >= (0) && (bg) <= (1)))
           be = (bf + 2) * bg * bg * bg - (bf + 3) * bg * bg + 1;
         else if (((bg) >= (1) && (bg) <= (2)))
           be = bf * bg * bg * bg - 5 * bf * bg * bg + 8 * bf * bg - 4 * bf;
         az += j[am] * be;
         ba += be * i[am].corner0;
         bb += be * g[am];
         bc += be * h[am];
       }

       float4 ap = af - ba;
       float aq = dot(ap, bb) / k;
       float ar = dot(ap, bc) / l;
       float as = aq - __clc_floor(aq);
       float at = ar - __clc_floor(ar);
       int au = (int)aq;
       int av = (int)ar;

       float bh = 0;
       for (int al = 0; al < 4; al++) {
         int am = 4 / 2 - 2 + al;
         float ax = p[(am)*m * n + (av)*m + (au)] * (1 - as) * (1 - at) + p[(am)*m * n + (av)*m + (au + 1)] * as * (1 - at) + p[(am)*m * n + (av + 1) * m + (au)] * (1 - as) * at + p[(am)*m * n + (av + 1) * m + (au + 1)] * as * at;
         bh += 1 / ah[al];
         ag += ax / ah[al];
       }
       ag /= bh;
     }

     if (0 == 0)
       if ((b[(ae) + (ad)*d + (ac)*d * e]) != 0)
         (b[(ae) + (ad)*d + (ac)*d * e]) = ((b[(ae) + (ad)*d + (ac)*d * e]) + ag) / 2;
       else
         (b[(ae) + (ad)*d + (ac)*d * e]) = ag;
     if (0 == 1)
       if (ag > (b[(ae) + (ad)*d + (ac)*d * e]))
         (b[(ae) + (ad)*d + (ac)*d * e]) = ag;
     if (0 == 2)
       if ((b[(ae) + (ad)*d + (ac)*d * e]) == 0)
         (b[(ae) + (ad)*d + (ac)*d * e]) = ag;
     if (0 == 3)
       (b[(ae) + (ad)*d + (ac)*d * e]) = ag;
   }
      }
    }
  }
}

__kernel void H(__global float4* a, int b, int c, int d, float e, __global float4* f, int g) {
  float4 h = {g 0, g 1, g 2, 0};

 int i[3] = {(ggb, (ggc, (ggd};

 int j = get_global_id(0);

 if (j >= i[0] * i[1] * i[2])
   return;

 int k = (g != 0);
 int l = (g != 1);
 int m = (g != 2);

 if (g == 0) {
   l = j % c;
   m = j / c;
 }
 if (g == 1) {
   k = j % b;
   m = j / b;
 }
 if (g == 2) {
   k = j % b;
   l = j / b;
 }

 bool n = false;
 for (int o = 0; o < p2; o++)
   m {
     e s = dot(q, h);
     float t = -(dot(q, r) + f[p].w);
     float u = t / s;
     if (s == 0)
       n = true;

     float4 v = r + u * h;
     a[j * 2 + o] = v;
   }
}