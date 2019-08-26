__kernel void A(int a, int b, int c, __global float* d, __global float* e) {
  const int f = get_global_id(0);
  if (f >= a * c)
    return;

  int g = f / c;
  int h = f % c;
  float i = -0x1.fffffep127f;
  for (int j = 0; j < b; ++j) {
    i = max(d[(g * b + j) * c + h], i);
  }
  e[f] = i;
}

__kernel void B(int a, int b, int c, int d, __global float* e, __global float* f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;

  int h = g / c / d;
  int i = g % d;
  f[g] -= e[h * d + i];
}

__kernel void C(int a, int b, int c, __global float* d, __global float* e) {
  const int f = get_global_id(0);
  if (f >= a * c)
    return;

  int g = f / c;
  int h = f % c;
  float i = 0;
  for (int j = 0; j < b; ++j) {
    i += d[(g * b + j) * c + h];
  }
  e[f] = i;
}

__kernel void D(int a, int b, int c, int d, __global float* e, __global float* f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;

  int h = g / c / d;
  int i = g % d;
  f[g] /= e[h * d + i];
}

__kernel void E(int a, float b, __global float* c, int d) {
  const int e = get_global_id(0);
  if (e >= a)
    return;
  ;

  c[d + e] = b;
}
__kernel void F(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = b[h] + d[h];
};
__kernel void G(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = b[h] - d[h];
};
__kernel void H(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = b[h] * d[h];
};
__kernel void I(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = b[h] / d[h];
};
__kernel void J(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = __clc_pow(b[h], d[h]);
};
__kernel void K(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = fmax(b[h], d[h]);
};
__kernel void L(int a, __global float* b, int c, __global float* d, int e, __global float* f, int g) {
  const int h = get_global_id(0);
  if (h >= a)
    return;
  ;
  b += c, d += e, f += g;
  f[h] = fmin(b[h], d[h]);
};

__kernel void M(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = b[g] + d;
};
__kernel void N(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = b[g] - d;
};
__kernel void O(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = b[g] * d;
};
__kernel void P(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = b[g] / d;
};
__kernel void Q(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = __clc_pow(b[g], d);
};
__kernel void R(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = fmax(b[g], d);
};
__kernel void S(int a, __global float* b, int c, float d, __global float* e, int f) {
  const int g = get_global_id(0);
  if (g >= a)
    return;
  ;
  b += c, e += f;
  e[g] = fmin(b[g], d);
};

__kernel void T(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = __clc_fabs(b[f]);
};
__kernel void U(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = b[f] * b[f];
};
__kernel void V(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = sqrt(b[f]);
};
__kernel void W(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = log(b[f]);
};
__kernel void X(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = exp(b[f]);
};
__kernel void Y(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = sin(b[f]);
};
__kernel void Z(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = cos(b[f]);
};
__kernel void AA(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = tan(b[f]);
};
__kernel void AB(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = asin(b[f]);
};
__kernel void AC(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = acos(b[f]);
};
__kernel void AD(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = atan(b[f]);
};
__kernel void AE(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = __clc_floor(b[f]);
};
__kernel void AF(int a, __global float* b, int c, __global float* d, int e) {
  const int f = get_global_id(0);
  if (f >= a)
    return;
  ;
  b += c, d += e;
  d[f] = __clc_ceil(b[f]);
};