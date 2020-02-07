struct Grid {
  float4 size;
  float4 min;
  float4 max;
  float4 bnd_min;
  float4 bnd_max;

  float4 res;
  float4 delta;
  float4 inv_delta;

  int nb_cells;
};

inline uint A(uint a) {
  uint b = a;
  b = (b * 0x10001) & 0xFF0000FF;
  b = (b * 0x00101) & 0x0F00F00F;
  b = (b * 0x00011) & 0xC30C30C3;
  b = (b * 0x00005) & 0x49249249;
  return (b);
}

int4 B(float4 a, __constant struct Grid* b) {
  float4 c;
  c.x = (a.x - b->min.x) * b->inv_delta.x;
  c.y = (a.y - b->min.y) * b->inv_delta.y;
  c.z = (a.z - b->min.z) * b->inv_delta.z;
  c.w = (a.w - b->min.w) * b->inv_delta.w;

  int4 d;
  d.x = (int)c.x;
  d.y = (int)c.y;
  d.z = (int)c.z;

  d.w = 0;
  return d;
}

float4 C(int4 a, __constant struct Grid* b) {
  float4 c;
  c.x = b->min.x + a.x * b->delta.x;
  c.y = b->min.x + a.y * b->delta.y;
  c.z = b->min.z + a.z * b->delta.z;
  c.w = 0.f;
  return c;
}

int D(int4 a, float4 b, bool c) {
  int d;
  int e;
  int f;

  if (c) {
    int g = (int)__clc_floor(b.x);
    int h = (int)__clc_floor(b.y);
    int i = (int)__clc_floor(b.z);
    d = a.x % g;
    e = a.y % h;
    f = a.z % i;
    if (d < 0)
      d += g;
    if (e < 0)
      e += h;
    if (f < 0)
      f += i;
  } else {
    d = a.x;
    e = a.y;
    f = a.z;
  }
  return (f * b.y + e) * b.x + d;
}

int E(int4 a, __constant struct Grid* b) {
  int4 c;
  c.x = A(a.x);
  c.y = A(a.y);
  c.z = A(a.z);
  return c.x | c.y << 1 | c.z << 2;
}
__kernel void F(

    int a, __global float4* b, __global int* c, __constant struct Grid* d, int e, float f, int g, __global float4* h, __global int4* i

    ) {
  uint j = get_global_id(0);
  if (j >= a)
    return;
  if (j != e)
    return;

  float4 k = b[j];

  int4 l = B(k, d);
  l = l - 1;
  int4 m = B(k, d);
  m = m + 1;

  int n = E(l, d);
  int o = E(m, d);

  if (n < 0 || n >= d->nb_cells)
    n = 0;
  if (o < 0 || o >= d->nb_cells)
    o = d->nb_cells - 1;

  int p = 0;

  int q = j;
  float4 r;
  int s;
  float4 t;
  float u;
  do {
    q++;
    if (q >= a)
      break;
    r = b[q];
    s = E(B(r, d), d);

    t = r - k;
    t.w = 0.f;
    u = length(t);

    if (u < f) {
      if (p < g) {
        c[p] = q;
        p++;
      }
    }
    i[q].x = s;
    h[q].x = u;
  } while (s <= o);
  c[298] = p;

  q = j;
  do {
    q--;

    if (q < 0)
      break;
    r = b[q];
    s = E(B(r, d), d);

    t = r - k;
    t.w = 0.f;
    u = length(t);

    if (u < f) {
      if (p < g) {
        c[p] = q;
        p++;
      }
    }
  } while (s >= n);
  c[299] = g;
}