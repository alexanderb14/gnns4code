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

    int k = b[e];
    int l = b[f];

    a[g + i] = k > -1 ? 1 : 0;
    a[h + j] = l > -1 ? 1 : 0;
  }

  void D(__local int* a, __global const int* b, const uint4 c, const uint d) {
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

  void E(__local int* a, __global const int* b, const uint4 c, const uint d) {
    const uint e = c.x;
    const uint f = c.y;

    const uint g = c.z;
    const uint h = c.w;

    const uint i = ((g) >> (4));
    const uint j = ((h) >> (4));

    int k = b[e];

    a[g + i] = k > -1 ? 1 : 0;
    if (h < d) {
      int l = b[f];
      a[h + j] = l > -1 ? 1 : 0;
    } else
      a[h + j] = 0;

    barrier(1);
  }

  void F(__global int* a, __local const int* b, const uint4 c, const uint d) {
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

  void G(__global int* a, __local const int* b, const uint4 c, const uint d) {
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

  void H(__global int* a, __local const int* b, const uint4 c, const uint d) {
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

  void I(__global int* a, __local const int* b, const uint4 c, const uint d) {
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

  void J(__local int* a, int b) {
    const uint c = get_local_id(0);
    const uint d = get_global_id(0) / get_local_size(0);
    const uint e = get_local_size(0);

    if (c == 0) {
      int f = (e << 1) - 1;
      f += ((f) >> (4));
      a[f] = 0;
    }
  }

  void K(__local int* a, __global int* b, int c) {
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

  uint L(__local int* a) {
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

  void M(__local int* a, uint b) {
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

  void N(__local int* a, int b) {
    const uint c = get_global_id(0) / get_local_size(0);

    int d = L(a);
    J(a, (b == 0) ? c : b);
    M(a, d);
  }

  void O(__global int* a, __local int* b, int c) {
    const uint d = get_global_id(0) / get_local_size(0);

    int e = L(b);
    K(b, a, (c == 0) ? d : c);
    M(b, e);
  }

  __kernel void P(__global int* a, __global const int* b, __local int* c, const uint d, const uint e, const uint f, const uint g) {
    const uint h = get_global_id(0) / get_local_size(0);
    const uint i = get_local_size(0);

    uint j = (e == 0) ? mul24(h, (i << 1)) : e;
    j += g;
    uint4 k = A(j);

    C(c, b, k, f);
    N(c, d);
    G(a, c, k, f);
  }

  __kernel void Q(__global int* a, __global const int* b, __local int* c, const uint d, const uint e, const uint f, const uint g) {
    const uint h = get_global_id(0) / get_local_size(0);
    const uint i = get_local_size(0);

    uint j = (e == 0) ? mul24(h, (i << 1)) : e;
    j += g;
    uint4 k = A(j);

    B(c, b, k, f);
    N(c, d);
    F(a, c, k, f);
  }

  __kernel void R(__global int* a, __global const int* b, __global int* c, __local int* d, const uint e, const uint f, const uint g, const uint h) {
    const uint i = get_global_id(0) / get_local_size(0);
    const uint j = get_local_size(0);

    uint k = (f == 0) ? mul24(i, (j << 1)) : f;
    k += h;
    uint4 l = A(k);

    C(d, b, l, g);
    O(c, d, e);
    G(a, d, l, g);
  }

  __kernel void S(__global int* a, __global const int* b, __global int* c, __local int* d, const uint e, const uint f, const uint g, const uint h) {
    const uint i = get_global_id(0) / get_local_size(0);
    const uint j = get_local_size(0);

    uint k = (f == 0) ? mul24(i, (j << 1)) : f;
    k += h;
    uint4 l = A(k);

    B(d, b, l, g);
    O(c, d, e);
    F(a, d, l, g);
  }

  __kernel void T(__global int* a, __global const int* b, __global int* c, __local int* d, const uint e, const uint f, const uint g, const uint h) {
    const uint i = get_local_id(0);
    const uint j = get_global_id(0) / get_local_size(0);
    const uint k = get_local_size(0);

    uint l = (f == 0) ? mul24(j, (k << 1)) : f;
    l += h;
    uint4 m = A(l);

    E(d, b, m, g);
    O(c, d, e);
    I(a, d, m, g);
  }

  __kernel void U(__global int* a, __global const int* b, __global int* c, __local int* d, const uint e, const uint f, const uint g, const uint h) {
    const uint i = get_local_id(0);
    const uint j = get_global_id(0) / get_local_size(0);
    const uint k = get_local_size(0);

    uint l = (f == 0) ? mul24(j, (k << 1)) : f;
    l += h;
    uint4 m = A(l);

    D(d, b, m, g);
    O(c, d, e);
    H(a, d, m, g);
  }

  __kernel void V(__global int* a, __global const int* b, __local int* c, const uint d, const uint e, const uint f, const uint g) {
    const uint h = get_local_id(0);
    const uint i = get_global_id(0) / get_local_size(0);
    const uint j = get_local_size(0);

    uint k = (e == 0) ? mul24(i, (j << 1)) : e;
    k += g;
    uint4 l = A(k);

    E(c, b, l, f);
    N(c, d);
    I(a, c, l, f);
  }

  __kernel void W(__global int* a, __global const int* b, __local int* c, const uint d, const uint e, const uint f, const uint g) {
    const uint h = get_local_id(0);
    const uint i = get_global_id(0) / get_local_size(0);
    const uint j = get_local_size(0);

    uint k = (e == 0) ? mul24(i, (j << 1)) : e;
    k += g;
    uint4 l = A(k);

    D(c, b, l, f);
    N(c, d);
    H(a, c, l, f);
  }

  __kernel void X(__global int* a, __global int* b, __local int* c, const uint d, const uint e, const uint f, const uint g) {
    const uint h = get_local_id(0);
    const uint i = get_global_id(0) / get_local_size(0);
    const uint j = get_local_size(0);

    if (h == 0)
      c[0] = b[i + d];

    barrier(1);

    uint k = mul24(i, (j << 1)) + e + h + g;

    a[k] += c[0];
    if ((h + j) < f)
      a[k + j] += c[0];
  }

  __kernel void Y(__global int* a, __global int* b, __global int* c, __global int* d, __global uint* e, const uint f) {
    const uint g = get_global_id(0);
    const uint h = get_global_id(1);

    int i = e[h] * 2;

    if (i == 0 && g == 0)
      c[h] = 0;

    if (g < i) {
      const uint j = h * f;

      int k = a[j + g];
      uint l = d[j + g];
      if (k > -1) {
        b[j + l] = k;
        l++;
      }
      if (g == i - 1)
        c[h] = l;
    }
  }

  __kernel void Z(__global int* a, __global int* b, __global int* c, __global int* d, __global uint* e, const uint f) {
    const uint g = get_global_id(0);
    const uint h = get_global_id(1);

    int i = e[h];

    if (i == 0 && g == 0)
      c[h] = 0;

    if (g < i) {
      const uint j = h * f;

      int k = a[j + g];
      uint l = d[j + g];
      if (k > -1) {
        b[j + l] = k;
        l++;
      }
      if (g == i - 1)
        c[h] = l;
    }
  }