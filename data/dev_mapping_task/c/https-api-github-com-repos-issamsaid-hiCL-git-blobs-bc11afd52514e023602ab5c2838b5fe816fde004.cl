kernel void A(global float4* a, global float4* b, constant float* c, constant float* d, constant float* e, int f, int g, int h, int i, int j, int k) {
  int l = get_global_id(0);
  int m = get_global_id(1);
  int n;
  float4 o, p, q;
  f = f >> 2;

  float4 r, s, t, u;
  float4 v, w, x, y;
  float4 z;
  float aa = c[0] + d[0] + e[0];

  if ((l < f) && (m < g)) {
    y = 0.;
    x = a[(2 + f) * ((2 * j + g) * (-4 + k) + m + j) + l + 1];
    w = a[(2 + f) * ((2 * j + g) * (-3 + k) + m + j) + l + 1];
    v = a[(2 + f) * ((2 * j + g) * (-2 + k) + m + j) + l + 1];
    z = a[(2 + f) * ((2 * j + g) * (-1 + k) + m + j) + l + 1];
    r = a[(2 + f) * ((2 * j + g) * (0 + k) + m + j) + l + 1];
    s = a[(2 + f) * ((2 * j + g) * (1 + k) + m + j) + l + 1];
    t = a[(2 + f) * ((2 * j + g) * (2 + k) + m + j) + l + 1];
    u = a[(2 + f) * ((2 * j + g) * (3 + k) + m + j) + l + 1];

    for (n = 0; n < h; ++n) {
      y = x;
      x = w;
      w = v;
      v = z;
      z = r;
      r = s;
      s = t;
      t = u;
      u = a[(2 + f) * ((2 * j + g) * (n + k + k) + m + j) + l + 1];

      q = a[(2 + f) * ((2 * j + g) * (n + k) + m + j) + l + 1 + 1];
      p = a[(2 + f) * ((2 * j + g) * (n + k) + m + j) + l - 1 + 1];

      o = aa * z;
            o += c[1] * ( (float4)(zq.x) +
                              (float4)(p.w, z);
            o += c[2] * ( (float4)(q.xy) +
                              (float4)(p.zw, z;
            o += c[3] * ( (float4)qzxyz) +
                              (float4)(p.yzw, z
            o += c[4] * ( q + p );

            o += d[1] * ( a[(2+f)*((2*j+g)*(n+k) + m+1 +j) + l+1] +
                              a[(2+f)*((2*j+g)*(n+k) + m-1 +j) + l+1] );
            o += d[2] * ( a[(2+f)*((2*j+g)*(n+k) + m+2 +j) + l+1] +
                              a[(2+f)*((2*j+g)*(n+k) + m-2 +j) + l+1] );
            o += d[3] * ( a[(2+f)*((2*j+g)*(n+k) + m+3 +j) + l+1] +
                              a[(2+f)*((2*j+g)*(n+k) + m-3 +j) + l+1] );
            o += d[4] * ( a[(2+f)*((2*j+g)*(n+k) + m+4 +j) + l+1] +
                              a[(2+f)*((2*j+g)*(n+k) + m-4 +j) + l+1] );

            o += e[1] * ( r + v );
            o += e[2] * ( s + w );
            o += e[3] * ( t + x );
            o += e[4] * ( u + y );

            b[(2+f)*((2*j+g)*(n+k) + m+j) + l+1] = z + o;
    }
  }
}