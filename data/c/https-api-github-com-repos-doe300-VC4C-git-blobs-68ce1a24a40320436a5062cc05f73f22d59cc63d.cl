__kernel void A(const __global float* a, const __global float* b, unsigned int c, unsigned int d, unsigned int e, __global float* f, const __global float* g, __global float* h, __global float* i, const __global float* j, const __global float* k) {
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n = get_global_size(1);
  int o = e * l;

  unsigned int p, q, r;
  float s, t;
  float u, v, w;
  float x, y;
  float z;
  float aa, ab, ac;
  float ad = 0.;
  float ae = 0.;

  for (int af = 0; af < e; af += n) {
    p = af + m;
    if (p < e) {
      r = o + p;
      s = j[r];
      t = k[r];
      x = g[r];
      y = 0.;
      z = 0.;
      ad = 0.;
      ae = 0.;

      for (int ag = 0; ag < c; ag++) {
        q = d * ag + r;
        u = a[q] - s;
        v = u * t;
        w = b[q];
        z += w;
        y = mad(v, w, y);
        aa = x * w;
        ad += aa;
        ae = mad(aa, v, ae);
      }
      y /= (float)c;

      for (int ag = 0; ag < c; ag++) {
        q = d * ag + r;
        u = a[q] - s;
        v = u * t;
        aa = mad(v, ae, ad);
        ab = mad((float)c, ad, -aa);
        ac = t / ((float)c);
        f[q] = ac * ab;
      }

      i[r] = z;
      h[r] = y;
    }
  }
}

__kernel void B(const __global float* a, const __global float* b, unsigned int c, unsigned int d, unsigned int e, __global float* f, const __global float* g, __global float* h, __global float* i, double j) {
  int k = get_global_id(0);
  int l = get_global_id(1);
  int m = get_global_size(1);
  int n = e * k;

  unsigned int o, p, q;
  float r, s;
  float t, u;
  float v, w;
  float x;
  float y, z, aa;
  float ab, ac;
  float ad = 0.;
  float ae = 0.;

  for (int af = 0; af < e; af += m) {
    r = 0.;
    o = l + af;

    if (o < e) {
      q = n + o;
      for (int ag = 0; ag < c; ag++) {
        p = d * ag + q;
        r += a[p];
      }
      r /= (float)c;

      ab = 0.;
      ac = 0.;

      for (int ag = 0; ag < c; ag++) {
        p = d * ag + q;
        ab = a[p] - r;
        ac = mad(ab, ab, ac);
      }
      ac /= (float)c;

      s = (1.f / sqrt(__clc_fabs(ac + j)));

      v = g[q];
      w = 0.;
      x = 0.;
      ad = 0.;
      ae = 0.;

      for (int ag = 0; ag < c; ag++) {
        p = d * ag + q;
        ab = a[p] - r;
        t = ab * s;
        u = b[p];
        x += u;
        w = mad(t, u, w);
        y = v * u;
        ad += y;
        ae = mad(y, t, ae);
      }
      w /= (float)c;

      for (int ag = 0; ag < c; ag++) {
        p = d * ag + q;
        ab = a[p] - r;
        t = ab * s;
        y = mad(t, ae, ad);
        z = mad((float)c, ad, -y);
        aa = s / ((float)c);
        f[p] = aa * z;
      }

      i[q] = x;
      h[q] = w;
    }
  }
}