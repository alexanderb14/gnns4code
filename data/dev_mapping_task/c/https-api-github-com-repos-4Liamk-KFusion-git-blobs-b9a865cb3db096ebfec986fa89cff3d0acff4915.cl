double A(double4 a, double4 b) {
  return a.x * b.x + a.y * b.y + a.z * b.z;
}

double4 B(double4 a, double4 b, double4 c, double4 d, double e, double f) {
  double g = -100 * f;
  double h = 0;
  double i = 1;
  while (__clc_fabs(g - h) > .00000001) {
    double j = (g + h) / 2;
    double4 k = (a + b * j) - (c + d * j);
    k *= k;
    double l = sqrt(k.x + k.y + k.z);
    l = l - e;
    if (l < 0)
      h = j;
    else
      g = j;
  }
  return (a + b * g);
}

__kernel void C(__global double4* a, __global double4* b, __global double4* c, const char d, const double e) {
  __local double4 f[16];
  __local double4 g[16];
  __local double4 h[16];

  event_t i[3];

  i[0] = async_work_group_copy(f, a, d, 0);
  i[1] = async_work_group_copy(g, b, d, 0);
  i[2] = async_work_group_copy(h, c, d, 0);

  int j = get_local_id(0);

  double4 k = a[j];
  double4 l = b[j];
  double4 m = c[j];
  if (k.w == 1) {
    wait_group_events(3, i);
    for (int n = 0; n < d; n++) {
      if (n != j) {
        double4 o = (k - f[n]);
        double4 p = o * o;
        double q = sqrt(p.x + p.y + p.z);
        if (q < m.y + h[n].y) {
          o = k - f[n];

          double4 r = o / q;

          double4 s = A(l, -r) * -r;
          double4 t = A(g[n], r) * r;

          double4 u = s - l;
          double4 v = t - g[n];

          k = B(k, l, f[n], g[n], m.y + h[n].y, e);
          l = (u + t) * m.z + l * (1 - m.z);
        }
      }
    }
    k.w = 1;
  } else {
    l = 0;
  }
  b[j] = l;
  a[j] = k;
}

__kernel void D(__global double4* a, __global double4* b, const char c) {
  int d = get_local_id(0);
  double4 e = a[d];
  __local double4 f[6];
  event_t g = async_work_group_copy(f, b, c, 0);
  if (e.w == 1) {
    wait_group_events(1, &g);
    for (int h = 0; h < c; h++) {
      double4 i = (e - f[h]) * (e - f[h]);
      double j = sqrt(i.x + i.y + i.z);
      if (j < f[h].w) {
        e = f[h];
        e.w = 0;
      }
    }
  }
  a[d] = e;
}

__kernel void E(__global double4* a, __global double4* b, __global double4* c, __global double4* d) {
  int e = get_local_id(0);
  double4 f = a[e];
  double4 g = c[e];
  double4 h = b[e];
  if (f.w == 1) {
    if (f.y - g.y <= 0 || f.y + g.y >= d[0].y) {
      h *= g.z;
      h.y *= -1;
      if (f.y - g.y < 0)
        f.y = 0 + (1.01 * g.y);
      else if (f.y + g.y > d[0].y)
        f.y = d[0].y - (1.01 * g.y);
    } else if (f.x - g.y <= 0 || f.x + g.y >= d[0].x) {
      h *= g.z;
      h.x *= -1;
      if (f.x - g.y < 0)
        f.x = 0 + (1.01 * g.y);
      else if (f.x + g.y > d[0].x)
        f.x = d[0].x - (1.01 * g.y);
    }
    f.w = 1;
  } else {
    h = 0;
  }
  b[e] = h;
  a[e] = f;
}

__kernel void F(__global double4* a, __global double4* b, __global double4* c, __global double4* d, const double e) {
  int f = get_local_id(0);
  double4 g = a[f];
  double4 h = c[f];
  double4 i = b[f];
  if (g.w == 1) {
    double j = sqrt(A(i, i));
    if (j > 0) {
      double4 k = i / j;
      j -= (h.w * 9.81) * e;
      if (j < 0)
        j = 0;
      if (j > 10)
        j = 10;
      i = k * j;
      g += i * e;

    } else {
      i = 0;
    }
    g.w = 1;
  }
  a[f] = g;
  b[f] = i;
}

__kernel void G(__global double4* a, __global double4* b, const double c, const double d) {
  int e = get_local_id(0);

 double4 f = {-cos(c14/180.0)),-sin(c14/180.0)),0,0};

 f *= d;

 if (e == 0)
   a[e] += (f / b[e].x);
}