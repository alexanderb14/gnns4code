typedef float2 complex_f; complex_f A(complex_f a, complex_f b) {
  return (complex_f)(a.x + b.x, a.y + b.y);
}

complex_f B(complex_f a) {
  return (complex_f)(-a.x, -a.y);
}
complex_f C(complex_f a, complex_f b) {
  return (complex_f)((a.x * b.x) - (a.y * b.y), (a.y * b.x) + (a.x * b.y));
}

float D(complex_f a) {
  return sqrt((a.x * a.x) + (a.y * a.y));
}

complex_f E(float a) {
  return (complex_f)(cos(a), sin(a));
}

__kernel void F(__global complex_f* const a, __global complex_f* b, uint c, complex_f d, complex_f e, complex_f f, complex_f g) {
  uint const h = get_global_id(0);
  complex_f const i = a[h];

  uint const j = h & (~(1 << c));
  uint const k = h | (1 << c);

  uint const l = (((1 << c) & h) > 0) ? 1 : 0;

  if (l == 0) {
    b[h] = A(C(d, i), C(e, a[k]));
  } else {
    b[h] = A(C(g, i), C(f, a[j]));
  }
}

__kernel void G(__global complex_f* const a, __global complex_f* b, uint c, uint d, complex_f e, complex_f f, complex_f g, complex_f h) {
  uint const i = get_global_id(0);
  complex_f const j = a[i];

  uint const k = i & (~(1 << d));
  uint const l = i | (1 << d);

  uint const m = (((1 << d) & i) > 0) ? 1 : 0;
  uint const n = (((1 << c) & i) > 0) ? 1 : 0;

  if (n == 0) {
    b[i] = j;
  } else {
    if (m == 0) {
      b[i] = A(C(e, j), C(f, a[l]));
    } else {
      b[i] = A(C(h, j), C(g, a[k]));
    }
  }
}

__kernel void H(__global complex_f* const a, __global complex_f* b, uint c, uint d, uint e, complex_f f, complex_f g, complex_f h, complex_f i) {
  uint const j = get_global_id(0);
  complex_f const k = a[j];

  uint const l = j & (~(1 << e));
  uint const m = j | (1 << e);

  uint const n = (((1 << e) & j) > 0) ? 1 : 0;
  uint const o = (((1 << c) & j) > 0) ? 1 : 0;
  uint const p = (((1 << d) & j) > 0) ? 1 : 0;

  if (o == 0 || p == 0) {
    b[j] = k;
  } else {
    if (n == 0) {
      b[j] = A(C(f, k), C(g, a[m]));
    } else {
      b[j] = A(C(i, k), C(h, a[l]));
    }
  }
}

__kernel void I(__global complex_f* const a, __global complex_f* b, uint c, uint d) {
  uint const e = get_global_id(0);

  uint const f = 1 << c;
  uint const g = 1 << d;

  uint const h = ((e & f) >> c) << d;
  uint const i = ((e & g) >> d) << c;

  uint const j = (e & !f & !g) | i | h;

  b[j] = a[e];
}

uint J(uint a, uint b, uint c) {
  uint d = 1;
  while (b > 0) {
    if ((b & 1) == 1) {
      d = d * a % c;
    }
    b /= 2;
    a = a * a % c;
  }

  return d;
}

__kernel void K(__global complex_f* const a, __global complex_f* b, uint c, uint d, uint e, uint f) {
  uint g = f;
  uint h = f + e - 1;
  uint i = 0;
  uint j = f - 1;

  uint k = (1 << (h + 1)) - 1;
  uint l = ((1 << (1 + j - i)) - 1) << i;

  uint const m = get_global_id(0);

  uint n = (m & k) >> g;
  uint o = (J(c, n, d) << i) & l;
  uint p = m ^ o;

  if (p == m) {
    b[m] = a[m];
  } else {
    b[m] = a[p];
    b[p] = a[m];
  }

  b[p] = a[m];
}

__kernel void L(__global complex_f* const a, __global float* b) {
  uint const c = get_global_id(0);
  complex_f d = a[c];

  b[c] = D(C(d, d));
}

__kernel void M(__global complex_f* a, uint const b) {
  uint const c = get_global_id(0);
  if (c == b) {
    a[c] = (complex_f)(1, 0);
  } else {
    a[c] = (complex_f)(0, 0);
  }
}