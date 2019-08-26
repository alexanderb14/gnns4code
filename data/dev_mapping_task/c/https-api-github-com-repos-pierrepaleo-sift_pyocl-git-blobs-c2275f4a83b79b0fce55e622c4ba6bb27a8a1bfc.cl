typedef float4 keypoint; __kernel void A(__global float* a, __global float* b, __global float* c, int d, int e) {
  int f = (int)get_global_id(1);
  int g = (int)get_global_id(0);

  if (f < e && g < d) {
    float h, i;
    int j = f * d + g;

    if (g == 0)
      h = 2.0f * (a[j + 1] - a[j]);
    else if (g == d - 1)
      h = 2.0f * (a[j] - a[j - 1]);
    else
      h = a[j + 1] - a[j - 1];
    if (f == 0)
      i = 2.0f * (a[j] - a[j + d]);
    else if (f == e - 1)
      i = 2.0f * (a[j - d] - a[j]);
    else
      i = a[j - d] - a[j + d];

    b[j] = sqrt((h * h + i * i));
    c[j] = atan2(-i, h);
  }
}
__kernel void B(__global float* a, __global keypoint* b, int c, float d, int e, float f, float g, __global int* h, int i, int j, int k, int l) {
  int m = (int)get_global_id(1);
  int n = (int)get_global_id(0);

  if ((m < l - c) && (n < k - c) && (m >= c) && (n >= c)) {
    int o = (j - 1) * (k * l);
    int p = j * (k * l);
    int q = (j + 1) * (k * l);

    float r = 0.0f;
    float s = a[p + n + k * m];

    if (__clc_fabs(s) > (0.8 * d)) {
      int t, u, v;
      int w = 0, x = 0;
      if (s > 0.0)
        w = 1;
      else
        x = 1;
      for (u = m - 1; u <= m + 1; u++) {
        for (t = n - 1; t <= n + 1; t++) {
          v = u * k + t;
          if (w == 1)
            if (a[o + v] > s || a[p + v] > s || a[q + v] > s)
              w = 0;
          if (x == 1)
            if (a[o + v] < s || a[p + v] < s || a[q + v] < s)
              x = 0;
        }
      }

      if (w == 1 || x == 1)
        r = s;
      v = m * k + n;

      float y = a[p + (m - 1) * k + n] - 2.0 * a[p + v] + a[p + (m + 1) * k + n], z = a[p + v - 1] - 2.0 * a[p + v] + a[p + v + 1], aa = ((a[p + (m + 1) * k + n + 1] - a[p + (m + 1) * k + n - 1]) - (a[p + (m - 1) * k + n + 1] - a[p + (m - 1) * k + n - 1])) / 4.0;

      float ab = y * z - aa * aa, ac = y + z;

      float ad = (e <= 1 ? f : g);

      if (ab < ad * ac * ac)
        r = 0.0f;

      if (r != 0.0f) {
        int ae = atomic_add(h, 1);
        keypoint af = 0.0;
        af.s0 = s;
        af.s1 = (float)m;
        af.s2 = (float)n;
        af.s3 = (float)j;
        if (ae < i)
          b[ae] = af;
      }
    }
  }
}
__kernel void C(__global float* a, __global keypoint* b, int c, int d, float e, float f, int g, int h) {
  int i = (int)get_global_id(0);

  if ((i >= c) && (i < d)) {
    keypoint j = b[i];
    int k = (int)j.s1;
    int l = (int)j.s2;
    int m = (int)j.s3;
    if (k != -1) {
      int n = (m - 1) * (g * h);
      int o = m * (g * h);
      int p = (m + 1) * (g * h);

      float q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap;
      int aq = k * g + l;
      int ar = 1, as = 5;
      int at = k, au = l;

      while (ar == 1) {
        k = at, l = au;
        aq = at * g + au;

        q = (a[p + aq] - a[n + aq]) / 2.0f;
        r = (a[o + (at + 1) * g + au] - a[o + (at - 1) * g + au]) / 2.0f;
        s = (a[o + aq + 1] - a[o + aq - 1]) / 2.0f;

        t = a[n + aq] - 2.0f * a[o + aq] + a[p + aq];
        u = a[o + (at - 1) * g + au] - 2.0f * a[o + aq] + a[o + (at + 1) * g + au];
        v = a[o + aq - 1] - 2.0f * a[o + aq] + a[o + aq + 1];

        w = ((a[p + (at + 1) * g + au] - a[p + (at - 1) * g + au]) - (a[n + (at + 1) * g + au] - a[n + (at - 1) * g + au])) / 4.0f;

        x = ((a[p + aq + 1] - a[p + aq - 1]) - (a[n + aq + 1] - a[n + aq - 1])) / 4.0f;

        y = ((a[o + (at + 1) * g + au + 1] - a[o + (at + 1) * g + au - 1]) - (a[o + (at - 1) * g + au + 1] - a[o + (at - 1) * g + au - 1])) / 4.0f;

        z = w;
        aa = x;
        ab = y;

        ao = -(x * u * aa) + w * y * aa + x * z * ab - t * y * ab - w * z * v + t * u * v;

        ac = u * v - y * ab;
        af = x * ab - w * v;
        ag = w * y - x * u;
        ai = y * aa - z * v;
        ad = t * v - x * aa;
        ah = x * z - t * y;
        aj = z * ab - u * aa;
        ak = w * aa - t * ab;
        ae = t * u - w * z;

        al = -(q * ac + r * af + s * ag) / ao;
        am = -(q * ai + r * ad + s * ah) / ao;
        an = -(q * aj + r * ak + s * ae) / ao;

        ap = a[o + aq] + 0.5f * (al * q + am * r + an * s);

        if (am > 0.6f && at < h - 3)
          at++;
        else if (am < -0.6f && at > 3)
          at--;
        if (an > 0.6f && au < g - 3)
          au++;
        else if (an < -0.6f && au > 3)
          au--;

        if (as > 0 && (at != k || au != l))
          as--;
        else
          ar = 0;
      }

      keypoint av = 0.0f;
      if (__clc_fabs(al) <= 1.5f && __clc_fabs(am) <= 1.5f && __clc_fabs(an) <= 1.5f && __clc_fabs(ap) >= e) {
        av.s0 = ap;
        av.s1 = k + am;
        av.s2 = l + an;
        av.s3 = f * __clc_pow(2.0f, (((float)m) + al) / 3.0f);
      } else {
        av.s0 = -1.0f;
        av.s1 = -1.0f;
        av.s2 = -1.0f;
        av.s3 = -1.0f;
      }

      b[i] = av;
    }
  }
}