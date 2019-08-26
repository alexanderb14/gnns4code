__kernel void A(__global uint* a, __global uint* b, __global uint* c, int d, int e, float4 f, float4 g, float4 h) {
  const int i = get_local_id(0);
  const int j = get_local_id(1);
  const int k = get_local_size(0);
  const int l = get_local_size(1);
  const int m = get_global_id(0);
  const int n = get_global_id(1);

  float o = f.w / 1000;

  for (int p = -10; p < 10; ++p)
    for (int q = 0; q < 10; ++q) {
      int r = p * 1024 * 2;
      int s = (((p ^ q) * 24352) & 1023);
      int t = q * 1024 * 2;

      float4 u, v;
      u.x = r + 512;
      u.y = s + 512;
      u.z = t + 512;
      u.w = 1;
      v.x = dot(u, f);
      v.y = dot(u, g);
      v.z = dot(u, h);

      if (v.z < -600)
        continue;

      int w = v.x * d / v.z + d / 2;
      if (w >= d * 2)
        continue;
      if (w < -d)
        continue;

      int x = v.y * d / v.z + e / 2;
      if (x >= e * 2)
        continue;
      if (x < -e)
        continue;

      int y = log2((v.z / 2) / d);

      if (y < 0)
        y = 0;
      if (y >= 9)
        continue;

      int z = c[y];
      int aa = c[z];
      z++;

      for (int ab = 0; ab < aa; ++ab) {
        int ac = (c[z] << y) + r;
        z++;
        int ad = (c[z] << y) + s;
        z++;
        int ae = (c[z] << y) + t;
        z++;
        int af = c[z];
        z++;
        int ag = z + m;
        int ah = z + af;
        z += af;

        int ai = 0;
        int aj = 0;

        while (ag < ah) {
          ai = c[ag];

          ag += 8192;

          float4 u;
          u.x = ac + ((ai & 0xff) << y);
          u.y = ad + (((ai >> 8) & 0xff) << y);
          u.z = ae + (((ai >> 16) & 0xff) << y);
          u.w = 1;
          float4 v;
          v.z = dot(u, h);
          if (v.z < 1)
            continue;
          if (v.z > 65000)
            continue;

          v.x = dot(u, f);
          int w = v.x * d / v.z + d / 2;
          if (w >= d)
            continue;
          if (w < 0)
            continue;

          v.y = dot(u, g);
          int x = v.y * d / v.z + e / 2;
          if (x >= e)
            continue;
          if (x < 0)
            continue;

          int ak = v.z;
          int al = x * d + w;
          ak <<= 8;

          if ((a[al] & 0xffff00) <= ak)
            continue;

          int am = ((ai >> 24) & 0xff);

          atom_min(&a[al], ak + am);
        }
      }
    }
}
__kernel void B(__global uint* a, __global uint* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  if (f >= (c >> e))
    return;
  if (g >= (d >> e))
    return;

  int h = f * 2 + g * 2 * c + (c >> (e));

  if (e == 0)
    h -= c;

  int i = h + (d / 2) * c;
  int j = f + g * c + (c >> (e + 1));
  int k = j + (d / 2) * c;

  int l, m, n, o;

  if (e > 0) {
    l = b[h];
    m = b[h + 1];
    n = b[h + c];
    o = b[h + 1 + c];
  } else {
    l = a[h];
    m = a[h + 1];
    n = a[h + c];
    o = a[h + 1 + c];
  }

  int p = 0;

  if (e == 0) {
    int q = 0, r = 0;
    if (m < l) {
      l = m;
      q = 1;
      r = 0;
    }
    if (n < l) {
      l = n;
      q = 0;
      r = 1;
    }
    if (o < l) {
      l = o;
      q = 1;
      r = 1;
    }
    q += f * 2;
    r += g * 2;
    int s = (l > 712 * 512) ? 1200 : 800;
    int t = (c * s / ((l & 0xffff00) + 2));
    if (t > 255)
      t = 255;
    p = (q << 8) + (r << 20) + t;
  } else {
    int u = 0;
    if (m < l) {
      l = m;
      u = 1;
    }
    if (n < l) {
      l = n;
      u = c;
    }
    if (o < l) {
      l = o;
      u = 1 + c;
    }

    p = b[i + u];
  }
  b[j] = l;
  b[k] = p;
}

__kernel void C(__global uint* a, __global uint* b, int c, int d, int e) {
  const int f = get_global_id(0);
  const int g = get_global_id(1);
  if (f >= (c >> 1))
    return;
  if (f >= (c >> e))
    return;
  if (g >= (d >> e))
    return;

  int h = c >> e;
  int i = d >> e;

  int j = (d / 2) * c;

  int k = (f / 2) + (g / 2) * c + (c >> (e + 1));

  int l = k + j;

  int m = f + g * c + (c >> e);

  if (e == 0)
    m -= c;

  int n = m + j;

  int o, p, q, r, s;

  if (e == 0) {
    p = f;
    q = g;
    r = a[m];
    int t = (r > 512 * 512) ? 1200 : 800;
    s = (c * t / ((r & 0xffff00) + 2));
  } else {
    o = b[n];
    p = (o >> 8) & 4095;
    q = o >> 20;
    r = b[m];
    s = o & 255;
  }

  int u = f << e;
  int v = g << e;
  if (e > 0) {
    u += 1 << (e - 1);
    v += 1 << (e - 1);
  }

  int w = 0xffffff;

  float x = 0;
  float y = 0;
  float z = 0;
  float aa = 0;
  float ab = 0;
  float ac = 0;
  int ad = 0;

  for (int ae = -2; ae < 3; ++ae)
    if (ae + f / 2 >= 0)
      if (ae + f / 2 < h)
        for (int af = -2; af < 3; ++af)
          if (af + g / 2 >= 0)
            if (af + g / 2 < i) {
              int ag = ae + af * c;
              int ah = b[l + ag];
              int ai = (ah >> 8) & 4095;
              int aj = ah >> 20;
              int ak = b[k + ag];
              int al = ah & 255;

              float am = sqrt(convert_float((ai - u) * (ai - u) + (aj - v) * (aj - v)));

              if (al > am)
                if ((ak & 0xffff00) < w) {
                  w = ak & 0xffff00;
                  ad = ak & 3;
                }
            }

  for (int ae = -2; ae < 3; ++ae)
    if (ae + f / 2 >= 0)
      if (ae + f / 2 < h)
        for (int af = -2; af < 3; ++af)
          if (af + g / 2 >= 0)
            if (af + g / 2 < i) {
              int ag = ae + af * c;
              int ah = b[l + ag];
              int ai = (ah >> 8) & 4095;
              int aj = ah >> 20;
              int ak = b[k + ag];
              int al = ah & 255;

              float am = sqrt(convert_float((ai - u) * (ai - u) + (aj - v) * (aj - v)));

              if (aa == 255)
                aa = (ak & 0xff);

              if (al > am)
                if (abs((ak & 0xffff00) - w) < (4 * 256)) {
                  float an = al;
                  float ao = (__clc_fabs(am - an));
                  ;
                  ao *= ao;
                  ao += abs((ak & 0xffff00) - w) / 256;
                  ao += 1 / ao;
                  x += ao * convert_float(ai);
                  y += ao * convert_float(aj);
                  z += ao * convert_float(ak & 0xffff00);
                  ab += ao * convert_float(al);
                  aa += ao * convert_float(ak & 255);
                  ac += ao;
                }
            }
  if (ac > 0) {
    z /= ac;
    x /= ac;
    y /= ac;
    aa /= ac;
    ab /= ac;
    ac = 1;

    if (abs((r & 0xffff00) - (convert_int(z) & 0xffff00)) < (4 * 256)) {
      float ao = 1;
      x += ao * convert_float(p);
      y += ao * convert_float(q);
      z += ao * convert_float(r & 0xffff00);
      aa += ao * convert_float(r & 0xff);
      ad = r & 3;
      ab += ao * convert_float(s);
      ac += ao;
    }
    z /= ac;
    x /= ac;
    y /= ac;
    aa /= ac;
    ab /= ac;

    r = (convert_int(z) & 0xffff00) + (convert_int(aa) & 0xfc) + (ad & 3);
    o = convert_int(ab) + (convert_int(x) << 8) + (convert_int(y) << 20);
  }

  if (e == 0) {
    a[m] = r;

  } else {
    b[m] = r;
    b[n] = o;
  }
}

__kernel void D(__global uint* a, int b, int c) {
  const int d = get_global_id(0);
  const int e = get_global_id(1);
  if (d >= b)
    return;
  if (e >= c)
    return;

  if (d >= b * 3 / 4) {
    return;
  }

  int f = d + e * b;
  int g = a[f];

  float3 h[4] = {{0.8, 1.0, 0.3}, {1.0, 0.7, 0.3}, {1.5, 0.8, 0.1}, {0.2, 0.8, 0.2}};

  int i = g & 3;
  float3 j = h[i];
  float k = convert_float((g & (255 - 7)));
  int l = k * j.x;
  if (l > 255)
    l = 255;
  int m = k * j.y;
  if (m > 255)
    m = 255;
  int n = k * j.z;
  if (n > 255)
    n = 255;
  a[f] = n + m * 256 + l * 65536;

  if ((g & 0xffff00) == 0xffff00)
    a[f] = 0x0088cc;
}