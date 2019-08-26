uint4 A(int a) {
  const uint b = get_local_id(0);
  const uint c = get_global_id(0) / get_local_size(0);
  const uint d = get_local_size(0);

  uint2 e;
  e.x = a + b;
  e.y = e.x + d;

  uint2 f;
  f.x = b;
  f.y = b + d;

  fid B(__local int* a, __global const int* b, const uint4 c, const uint d) {
    const uint e = c.x;
    const uint f = c.y;

    const uint g = c.z;
    const uint h = c.w;

    const uint i = ((g) >> (4));
    const uint j = ((h) >> (4));

    a[g + i] = b[e];
    a[h + j] = b[f];
  }

  void C(__local int* a, __global const int* b, const uint4 c, const uint d) {
    const uint e = c.x;
    const uint f = c.y;

    const uint g = c.z;
    const uint h = c.w;

    const uint i = ((g) >> (4));
    const uint j = ((h) >> (4));

    a[g + i] = b[e];
    a[h + j] = (h < d) ? b[f] : 0;

    barrier(1);
  }

  void D(__global int* a, __local const int* b, const uint4 c, const uint d) {
    barrier(1);

    const uint e = c.x;
    const uint f = c.y;

    const uint g = c.z;
    const uint h = c.w;

    const uint i = ((g) >> (4));
    const uint j = ((h) >> (4));

    a[e] = b[g + i];
    a[f] = b[h + j];
  }

  void E(__global int* a, __local const int* b, const uint4 c, const uint d) {
    barrier(1);

    const uint e = c.x;
    const uint f = c.y;

    const uint g = c.z;
    const uint h = c.w;

    const uint i = ((g) >> (4));
    const uint j = ((h) >> (4));

    a[e] = b[g + i];
    if (h < d)
      a[f] = b[h + j];
  }

  void F(__local int* a, int b) {
    const uint c = get_local_id(0);
    const uint d = get_global_id(0) / get_local_size(0);
    const uint e = get_local_size(0);

    if (c == 0) {
      int f = (e << 1) - 1;
      f += ((f) >> (4));
      a[f] = 0;
    }
  }

  void G(__local int* a, __global int* b, int c) {
    const uint d = get_global_id(0) / get_local_size(0);
    const uint e = get_local_size(0);
    const uint f = get_local_id(0);

    if (f == 0) {
      int g = (e << 1) - 1;
      g += ((g) >> (4));
      b[c] = a[g];
      a[g] = 0;
    }
  }

  uint H(__local int* a) {
    const uint b = get_local_id(0);
    const uint c = get_local_size(0);
    const uint d = 2;
    uint e = 1;

    for (uint f = c; f > 0; f >>= 1) {
      barrier(1);

      if (b < f) {
        int g = mul24(mul24(d, e), b);

        uint h = g + e - 1;
        uint i = h + e;

        h += ((h) >> (4));
        i += ((i) >> (4));

        a[i] += a[h];
      }

      e *= d;
    }

    return e;
  }

  void I(__local int* a, uint b) {
    const uint c = get_local_id(0);
    const uint d = get_global_id(0) / get_local_size(0);
    const uint e = get_local_size(0);
    const uint f = 2;

    for (uint g = 1; g <= e; g *= f) {
      b >>= 1;

      barrier(1);

      if (c < g) {
        int h = mul24(mul24(f, b), c);

        uint i = h + b - 1;
        uint j = i + b;

        i += ((i) >> (4));
        j += ((j) >> (4));

        int k = a[i];
        a[i] = a[j];
        a[j] += k;
      }
    }
  }

  void J(__local int* a, int b) {
    const uint c = get_global_id(0) / get_local_size(0);

    int d = H(a);
    F(a, (b == 0) ? c : b);
    I(a, d);
  }

  void K(__global int* a, __local int* b, int c) {
    const uint d = get_global_id(0) / get_local_size(0);

    int e = H(b);
    G(b, a, (c == 0) ? d : c);
    I(b, e);
  }

  __kernel void L(__global int* a, __global const int* b, __local int* c, const uint d, const uint e, const uint f) {
    const uint g = get_global_id(0) / get_local_size(0);
    const uint h = get_local_size(0);

    uint i = (e == 0) ? mul24(g, (h << 1)) : e;
    uint4 j = A(i);

    B(c, b, j, f);
    J(c, d);
    D(a, c, j, f);
  }

  __kernel void M(__global int* a, __global const int* b, __global int* c, __local int* d, const uint e, const uint f, const uint g) {
    const uint h = get_global_id(0) / get_local_size(0);
    const uint i = get_local_size(0);

    uint j = (f == 0) ? mul24(h, (i << 1)) : f;
    uint4 k = A(j);

    B(d, b, k, g);
    K(c, d, e);
    D(a, d, k, g);
  }

  __kernel void N(__global int* a, __global const int* b, __global int* c, __local int* d, const uint e, const uint f, const uint g) {
    const uint h = get_local_id(0);
    const uint i = get_global_id(0) / get_local_size(0);
    const uint j = get_local_size(0);

    uint k = (f == 0) ? mul24(i, (j << 1)) : f;
    uint4 l = A(k);

    C(d, b, l, g);
    K(c, d, e);
    E(a, d, l, g);
  }

  __kernel void O(__global int* a, __global const int* b, __local int* c, const uint d, const uint e, const uint f) {
    const uint g = get_local_id(0);
    const uint h = get_global_id(0) / get_local_size(0);
    const uint i = get_local_size(0);

    uint j = (e == 0) ? mul24(h, (i << 1)) : e;
    uint4 k = A(j);

    C(c, b, k, f);
    J(c, d);
    E(a, c, k, f);
  }

  __kernel void P(__global int* a, __global int* b, __local int* c, const uint d, const uint e, const uint f) {
    const uint g = get_local_id(0);
    const uint h = get_global_id(0) / get_local_size(0);
    const uint i = get_local_size(0);

    if (g == 0)
      c[0] = b[h + d];

    barrier(1);

    uint j = mul24(h, (i << 1)) + e + g;

    a[j] += c[0];
    if ((g + i) < f)
      a[j + i] += c[0];
  }

  __kernel void Q(__global int* a, __global int* b, __global int* c, __global int* d, const uint e) {
    const uint f = get_global_id(0);

    if (e == 0 && f == 0)
      *d = 0;
    else if (f < e) {
      int g = b[f];
      uint h = c[f];
      if (g > -1) {
        a[h] = g;
        h++;
      }
      if (f == e - 1)
        *d = h;
    }
  }

  __kernel void R(__global int* a, __global int* b, __global int* c, __global int* d, const uint e) {
    const uint f = get_global_id(0);

    if (e == 0 && f == 0)
      *d = 0;
    else if (f < e) {
      int g = b[f];
      uint h = c[f];
      if (g > 0) {
        a[h] = f;
        h++;
      }
      if (f == e - 1)
        *d = h;
    }
  }

  __kernel void S(__global int* a, __global int* b, __global int* c, __global int* d, __global int* e, const uint f) {
    const uint g = get_global_id(0);

    if (f == 0 && g == 0)
      *e = 0;
    else if (g < f) {
      int h = b[g];
      int i = c[g];
      uint j = d[g];
      if (i > 0) {
        a[j] = h;
        j++;
      }
      if (g == f - 1)
        *e = j;
    }
  }