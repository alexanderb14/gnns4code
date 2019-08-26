struct Tri {
  float4 a, b, c;
};

inline float4 A(float16 a, float4 b) {
  b.w = 1.0;
  float4 c = {dot(a.s0123, b), dot(a.s4567, b), dot(a.s89AB, b), dot(a.sCDEF, b)};
  return c;
}

kernel void B(uint a, float16 b, uint c, global int* d, global struct Tri* e) {
  uint f = get_global_id(0);
  if (f >= c) {
    return;
  }

  struct Tri g = e[f];
  g.a = A(b, g.a);
  g.b = A(b, g.b);
  g.c = A(b, g.c);

  for (int h = 0; h < a; h++) {
    d[h * c + f] = h;
    e[h * c + f] = g;
  }
}

kernel void C(constant uint* a, uint b, global int* c) {
  uint d = get_global_id(0);
  if (d >= b) {
    return;
  }

  int e = c[d];
  if (e != -1 && !a[e]) {
    c[d] = -2;
  }
}

kernel void D(uint a, constant int* b, uint c, global int* d) {
  uint e = get_global_id(0);
  if (e >= c) {
    return;
  }
  if (e == 0) {
    d[e] = 0;
    return;
  }
  uint f = e - 1;
  if (e < a) {
    if (b[f] > -1) {
      d[e] = 1;
    } else {
      d[e] = 0;
    }
  } else {
    d[e] = 0;
  }
}

kernel void E(uint a, uint b, global int* c, global int* d) {
  uint e = get_global_id(0);
  if (e >= b) {
    return;
  }
  int f = 1;
  for (int g = 0; g < a; g++) {
    f *= 2;
  }
  if (e >= f) {
    if (a % 2 == 0) {
      d[e] = c[e - f] + c[e];
    } else {
      c[e] = d[e - f] + d[e];
    }
  } else {
    if (a % 2 == 0) {
      d[e] = c[e];
    } else {
      c[e] = d[e];
    }
  }
}

kernel void F(uint a, constant struct Tri* b, constant int* c, constant int* d, uint e, global struct Tri* f, global int* g) {
  uint h = get_global_id(0);
  if (h >= a) {
    return;
  }

  if (c[h] != -1 && d[h] < e) {
    g[d[h]] = c[h];
    f[d[h]] = b[h];
  }
}

kernel void G(uint a, constant float4* b, constant int* c, constant int* d, uint e, global float4* f, global int* g) {
  uint h = get_global_id(0);
  if (h >= a) {
    return;
  }

  if (c[h] != -1 && d[h] < e) {
    g[d[h]] = c[h];
    f[d[h]] = b[h];
  }
}

kernel void H(

    uint a, constant float4* b,

    uint c, constant int* d, constant struct Tri* e,

    global int* f, global struct Tri* g,

    global int* h, global float4* i,

    float4 j) {
  uint k = get_global_id(0);
  if (k >= c) {
    return;
  }

  int l = d[k];
  float4 m = b[l];
  if (m.x == 0 && m.y == 0 && m.z == 0) {
    f[2 * k] = l;
    g[2 * k] = e[k];
    f[2 * k + 1] = -1;
    h[k] = -1;
    return;
  }
  float4 n = {mz, 0};

  float o = m.w + dot(n, j);
  float4 p = {0, 0, -o / nz, 0};

  struct Tri q = e[k];

  bool r, s, t, u;
  bool v = true;
  r = dot(n, q.a - p) < 0;
  s = dot(n, q.b - p) < 0;
  t = dot(n, q.c - p) < 0;

  float4 w = q.a;
  float4 x = q.b;
  float4 y = q.c;

  if (!r) {
    r = t;
    t = false;
    w = q.c;
    x = q.b;
    y = q.a;

    v = false;

    if (!r) {
      r = s;
      s = false;
      w = q.b;
      x = q.c;

      v = true;
    }
  } else if (!s) {
    s = t;
    t = false;

    w = q.a;
    x = q.c;
    y = q.b;

    v = false;
  }

  struct Tri z, aa;
  z = q;
  int ab = l;
  int ac = -1;
  int ad = -1;
  float4 ae, af;

  if (t) {
    ab = -1;
  } else if (!r) {
  } else if (!s) {
    float4 ag = normalize(w - x);
    ae = x + ag * -(dot(x, n) + o) / dot(ag, n);

    ag = normalize(w - y);
    af = y + ag * -(dot(y, n) + o) / dot(ag, n);

    z.a = aa.a = x;
    if (v) {
      z.b = af;
      z.c = ae;
      aa.b = y;
      aa.c = af;
    } else {
      z.b = ae;
      z.c = af;
      aa.b = af;
      aa.c = y;
    }

    ac = ad = l;
  } else {
    float4 ag = normalize(x - y);
    ae = y + ag * -(dot(y, n) + o) / dot(ag, n);

    ag = normalize(w - y);
    af = y + ag * -(dot(y, n) + o) / dot(ag, n);

    z.a = ae;
    if (v) {
      z.b = y;
      z.c = af;
    } else {
      z.b = af;
      z.c = y;
    }

    ad = l;
  }

  f[2 * k] = ab;
  g[2 * k] = z;
  f[2 * k + 1] = ac;
  g[2 * k + 1] = aa;

  h[k] = ad;
  if (v) {
    i[2 * k] = ae;
    i[2 * k + 1] = af;
  } else {
    i[2 * k] = af;
    i[2 * k + 1] = ae;
  }
}