uint A(uint* a, uint b, uint c) {
  return (*a) = (b * (*a) + c);
}

__kernel void B(const int a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_size(0);

  uint f = b[d];
  for (int g = 0; g < a; ++g) {
    c[d + g * e] = (float)A(&f, 1664525, 1013904223UL) / 0xffffffff;
  }
}

uint C(uint* a, __global uint* b, uint c, uint d) {
  return (*b) = (*a) = (c * (*a) + d) + (*b);
}

__kernel void D(const int a, __global float* b, const int c, __global uint* d, __global float* e) {
  int f = get_global_id(0);
  int g = get_global_size(0);

  uint h = b[f];
  for (int i = 0; i < c; ++i) {
    d[f + i * g] = A(&h, 1664525, 1013904223UL);
  }

  int j = 0;
  for (int i = 0; i < a; ++i) {
    e[f + i * g] = (float)C(&h, &d[j], 1664525, 1013904223UL) / 0xffffffff;
    j = (j + 1) % c;
  }
}

uint E(uint* a, uint b, uint c, uint d, uint e) {
  uint f = ((((*a) << b) ^ (*a)) >> c);
  return (*a) = ((((*a) & e) << d) ^ f);
}

__kernel void F(const int a, __global float2* b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_size(0);

  uint f = b[d].x;
  uint g = b[d].y;
  for (int h = 0; h < a; ++h) {
    c[d + h * e] = (float)(E(&f, 13, 19, 12, 4294967294UL) ^ E(&g, 2, 25, 4, 4294967288UL)) / 0xffffffff;
  }
}

float G(uint* a, uint* b, uint* c, uint* d) {
  return 2.3283064365387e-10 * (E(a, 13, 19, 12, 4294967294UL) ^ E(b, 2, 25, 4, 4294967288UL) ^ E(c, 3, 11, 17, 4294967280UL) ^ A(d, 1664525, 1013904223UL));
}

__kernel void H(const int a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_size(0);

  uint f = b[d * 4 + 0];
  uint g = b[d * 4 + 1];
  uint h = b[d * 4 + 2];
  uint i = b[d * 4 + 3];

  for (int j = 0; j < a; ++j) {
    c[d + j * e] = (float)G(&f, &g, &h, &i);
  }
}

float I(float* a, float b) {
  float c = 1.0 - (*a) - 0.0000000001;
  if (b < c) {
    (*a) += b;
  } else {
    float d = b, e;
    do {
      e = d;
      d *= b;
    } while (d >= c);
    (*a) += e + d - 1.0;
  }
  return (*a);
}

void J(ulong a, int b, float* c, float* d) {
  float e = (*c) = 1.0 / b;
  (*d) = 0.0;
  while (a > 0) {
    (*d) += e * (float)(a % b);
    a /= b;
    e *= (*c);
  }
}

__kernel void K(const int a, const int b, __global float* c) {
  int d = get_global_id(0);
  int e = get_global_size(0);

  float f = 0.0;
  float g = 0.0;
  J(d * a, b, &f, &g);

  for (int h = 0; h < a; ++h) {
    c[d + h * e] = I(&g, f);
  }
}

__kernel void L(const int a, __global float* b, const int c, __global int* d) {
  int e = get_local_id(0);
  int f = get_global_size(0);

  for (int g = 0; g < c; ++g) {
    d[e + g * f] = 0;
  }

  for (int g = 0; g < a; ++g) {
    int h = __clc_floor(b[e + g * f] / (1.0 / c));
    d[e + h * f] += 1;
  }
}

__kernel void M(const int a, __global float4* b, __global float* c) {
  int d = get_global_id(0);

  uint e = b[d].x;
  uint f = b[d].y;
  uint g = b[d].z;
  uint h = b[d].w;

  float i = 1.0f / a;
  float j = 0.0f;
  for (int k = 0; k < a; ++k) {
    float l = (float)G(&e, &f, &g, &h);
    j += sin(l * 1.57796327f) * i * 1.57796327f;
  }

  c[d] = j;
}