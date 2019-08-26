enum { GRAPE5 = 0, FOURTH, SIXTH, EIGHT };
struct devForce {
  float x, y, z, w;
};

typedef float2 DS;

typedef struct DS4 { DS x, y, z, w; } DS4;
typedef struct DS2 { DS x, y; } DS2;

__inline DS A(double a) {
  DS b;
  b.x = (float)a;
  b.y = (float)(a - b.x);
  return b;
}

__inline double B(DS a) {
  double b;
  b = (double)((double)a.x + (double)a.y);
  return b;
}

__inline DS C(DS a, DS b) {
  float c = a.x + b.x;
  float d = c - a.x;
  float e = ((b.x - d) + (a.x - (c - d))) + a.y + b.y;

  DS f;
  f.x = d = c + e;
  f.y = e - (d - c);
  return f;
}

__inline DS D(DS a, float b) {
  float c = a.x + b;
  float d = c - a.x;
  float e = ((b - d) + (a.x - (c - d))) + a.y;

  DS f;
  f.x = d = c + e;
  f.y = e - (d - c);
  return f;
}
__kernel void E(int a, double b, int c, __global double2* d, __global double4* e, __global double4* f, __global double4* g, __global double4* h, __global double4* i, __global double4* j, __global double4* k, __global double4* l, __global double4* m) {
  const uint n = get_group_id(1) * get_num_groups(0) + get_group_id(0);
  const uint o = get_local_id(0);
  const uint p = n * get_local_size(0) + o;

  if (c == GRAPE5)
    return;

  if (p < a) {
    double q = b - d[p].x;
    double r = (1. / 2.) * q;
    double s = (1. / 3.) * q;
    double t = (1. / 4.) * q;
    double u = (1. / 5.) * q;

    if (c <= FOURTH) {
      t = 0;
      u = 0;
    }

    double4 v = f[p];
    double4 w = h[p];
    double4 x = i[p];
    double4 y = j[p];

    double4 z = (double4)(0, 0, 0, 0);
    double4 aa = (double4)(0, 0, 0, 0);

    if (c >= SIXTH) {
      z = l[p];
      aa = m[p];
    }

    v.x += q * (w.x + r * (x.x + s * (y.x + t * (z.x + u * (aa.x)))));
    v.y += q * (w.y + r * (x.y + s * (y.y + t * (z.y + u * (aa.y)))));
    v.z += q * (w.z + r * (x.z + s * (y.z + t * (z.z + u * (aa.z)))));
    e[p] = v;

    w.x += q * (x.x + r * (y.x + s * (z.x + t * (aa.x))));
    w.y += q * (x.y + r * (y.y + s * (z.y + t * (aa.y))));
    w.z += q * (x.z + r * (y.z + s * (z.z + t * (aa.z))));
    g[p] = w;

    if (c >= SIXTH) {
      x.x += q * (y.x + r * (z.x + s * (aa.x)));
      x.y += q * (y.y + r * (z.y + s * (aa.y)));
      x.z += q * (y.z + r * (z.z + s * (aa.z)));
      k[p] = x;
    }
  }
}

__kernel void F(const int a, const int b, const int c, const int d, __global double4* e, __global float2* f, __global int* g) {
  const uint h = get_group_id(1) * get_num_groups(0) + get_group_id(0);
  const uint i = get_local_id(0);
  const uint j = h * get_local_size(0) + i;

  if (j >= a)
    return;

  f[j] = (float2){-1, 10e10f};
  g[j] = 0;

  double4 k = (double4){0, 0, 0, 0};
  e[j] = k;

  if (d >= FOURTH)
    e[j + a] = k;

  if (d >= SIXTH)
    e[j + a * 2] = k;

  if (j == a - 1) {
    g[16384] = 0;
  }
}

__kernel void G(int a, int b, __global double4* c, __global double4* d, __global int* e, __global double2* f, __global double4* g, __global double4* h, __global double4* i, __global double4* j, __global double4* k, __global int* l, __global double2* m, __global double4* n, __global double4* o, __global double4* p, __global int* q, __global double4* r, __global double4* s, __global double4* t, __global double4* u, __global double4* v) {
  const uint w = get_group_id(1) * get_num_groups(0) + get_group_id(0);
  const uint x = get_local_id(0);
  const uint y = w * get_local_size(0) + x;

  if (y < a) {
    c[e[y]] = d[y];
    g[e[y]] = d[y];

    if (b >= FOURTH) {
      f[e[y]] = m[y];
      g[e[y]] = d[y];

      h[e[y]] = n[y];
      i[e[y]] = n[y];

      j[e[y]] = o[y];
      k[e[y]] = p[y];

      l[e[y]] = q[y];
    }

    if (b >= SIXTH) {
      r[e[y]] = o[y];
      s[e[y]] = u[y];
      t[e[y]] = v[y];
    }
  }
}