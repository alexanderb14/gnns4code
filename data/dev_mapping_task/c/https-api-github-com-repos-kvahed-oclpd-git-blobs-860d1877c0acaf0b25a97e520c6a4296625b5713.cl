__constant float Ga = 42.57748f; __constant float Gb = 6.283185307179586476925286766559005768394338798750211641949889185f; __kernel void A(__global float* a) {
  a[get_global_id(0)] = 0.;
}

void B(const float* a, float* b, float* c) {
  float d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z[3];

  d = sqrt(a[0] * a[0] + a[1] * a[1] + a[2] * a[2]);

  if (d) {
    e = .5 * d;
    f = cos(e);
    g = sin(e) / d;
    h = f;
    i = -a[2] * g;
    j = a[1] * g;
    k = -a[0] * g;

    l = h * h;
    m = i * i;
    n = 2. * h * i;
    o = j * j;
    p = k * k;
    q = 2. * j * k;
    r = 2. * h * k;
    s = 2. * i * j;
    t = 2. * h * j;
    u = 2. * i * k;
    v = o - p;
    w = o + p;
    x = l - m;
    y = l + m;

    c[0] = x - v;
    c[1] = -n - q;
    c[2] = -t + u;
    c[3] = n - q;
    c[4] = x + v;
    c[5] = -s - r;
    c[6] = t + u;
    c[7] = r - s;
    c[8] = y - w;

    z[0] = c[0] * b[0] + c[3] * b[1] + c[6] * b[2];
    z[1] = c[1] * b[0] + c[4] * b[1] + c[7] * b[2];
    z[2] = c[2] * b[0] + c[5] * b[1] + c[8] * b[2];

    b[0] = z[0];
    b[1] = z[1];
    b[2] = z[2];
  }
}

__kernel void C(const __global float* a, const __global float* b, const __global float* c, const __global float* d, const __global float* e, const __global float* f, const __global float* g, const unsigned h, const unsigned i, const unsigned j, const float k, __global float* l) {
  unsigned m = get_global_id(0);
  unsigned n = m * 3;
  float o[3];
  float p[3];
  float q[8][2];
  float r[9];
  float s[3];

  float t = Ga * Gb * k;
  float u = 1.0e-3 * k * Gb;
  float v[2];
    float w[3] = {c[n*en,c[n1]*en1],c[n2]*en2]};

    o[0] = 0.0;
    o[1] = 0.0;

    p[0] = f[n] * g[m];
    p[1] = f[n + 1] * g[m];
    p[2] = f[n + 2] * g[m];

    if (p[0] + p[1] + p[2] > 0.0) {
      unsigned x, y, z;

      for (y = 0; y < i; ++y) {
        unsigned aa = 2 * (m + y * h);
        q[y][0] = a[aa];
        q[y][1] = a[1 + aa];
      }

      for (x = 0, z = (j - 1 - x) * 3; x < j; ++x) {
        v[0] = p[0];
        v[1] = p[1];

        o[2] = -t * (-b[z] * w[0] + -b[1 + z] * w[1] + -b[2 + z] * w[2] - x * u * d[m]);
        z -= 3;

        B(o, p, r);

        v[0] += p[0];
        v[1] += p[1];

        unsigned ab = (j - 1 - x) + m * j * i;
        for (y = 0; y < i; ++y) {
          unsigned ac = 2 * (ab + y * j);
          l[ac] = v[0] * q[y][0] + v[1] * q[y][1];
          l[ac + 1] = v[0] * q[y][0] + v[1] * q[y][1];
        }
      }
    }
}

__kernel void D(const __global float* a, const __global float* b, const unsigned c, const unsigned d, const unsigned e, __global float* f) {
  unsigned g = get_global_id(0);
  unsigned h = 2 * c * d;
  f[g] = 0.;
  for (unsigned i = 0; i < e * h; i += h)
    f[g] += a[i + g];
  f[g] *= b[g % d];
  return;
}

__kernel void E(__global const float* a, const unsigned b, const unsigned c, __global float* d) {
  unsigned e = get_global_id(0), f = e + e, g = f + 1, h = 2 * c, i, j;

  d[e] = 0.;
  for (unsigned k = 0; k < h * b; k += h) {
    j = f + k;
    i = g + k;
    d[e] += a[j] * a[j] + a[i] * a[i];
  }
  d[e] = 1.0 / d[e];
}

__kernel void F(const __global float* a, const __global float* b, const __global float* c, const __global float* d, const __global float* e, const __global float* f, const __global float* g, const unsigned h, const unsigned i, const unsigned j, const float k, __global float* l) {
  unsigned m = get_global_id(0);
  int n = 3 * m;

  float o[3] = {0., 0., 1.};
  o[0] = g[n];
  o[1] = g[n + 1];
  o[2] = g[n + 2];

  if (o[0] + o[1] + o[2] > 0.0) {
    float p[3];
    float q[8][2];
    float r[9];
    float s[3];
    float t[3] = {d[n*fn,d[n1]*fn1],d[n2]*fn2]};

    float u = Ga * Gb * k;
    float v = 1.0e-3 * k * Gb;

    unsigned w, x, y;

    for (x = 0; x < i; ++x) {
      int z = 2 * (m + x * h);
      q[x][0] = a[z];
      q[x][1] = a[z + 1];
    }

    for (w = 0, y = 0; w < j; ++w) {
      float aa = 0., ab = 0.;

      for (x = 0; x < i; x++) {
        unsigned ac = 2 * (w + x * j);
        aa += c[ac] * q[x][0] - c[ac + 1] * q[x][1];
        ab += c[ac] * q[x][1] + c[ac + 1] * q[x][0];
      }

      p[0] = -v * ab;
      p[1] = v * aa;
      p[2] = -u * (b[y++] * t[0] + b[y++] * t[1] + b[y++] * t[2] - w * v * e[m]);

      B(p, o, r);
    }

    l[n] = o[0];
    l[n + 1] = o[1];
    l[n + 2] = o[2];
  } else {
    l[n] = 0.;
    l[n + 1] = 0.;
    l[n + 2] = 0.;
  }
}