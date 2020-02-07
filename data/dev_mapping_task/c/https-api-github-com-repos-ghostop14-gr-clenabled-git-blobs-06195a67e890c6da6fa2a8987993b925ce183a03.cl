__kernel void A(__global const float* restrict a, __global const float* restrict b, __global float* restrict c) {
  __local float d[2 * 128 + 8192];
  __local float e[128];
  a += get_group_id(0) * 8192;
  b += get_group_id(0) * 128;
  c += get_group_id(0) * (8192 + 128);

  d[get_local_id(0)] = a[get_local_id(0)];
  if (get_local_id(0) < 128)
    e[get_local_id(0)] = b[get_local_id(0)];
  barrier(1);

  float f = 0.0f;
  for (int g = 0; g < 128; g++) {
    f += e[128 - 1 - g] * d[get_local_id(0) + g];
  }
  c[get_local_id(0)] = f;
}

struct ComplexStruct {
  float real;
  float imag;
};

typedef struct ComplexStruct SComplex;

__kernel void B(__global const SComplex* restrict a, __global const float* restrict b, __global SComplex* restrict c) {
  __local SComplex d[2 * 128 + 8192];
  __local float e[128];
  d[get_local_id(0)].real = a[get_local_id(0)].real;
  d[get_local_id(0)].imag = a[get_local_id(0)].imag;

  if (get_local_id(0) < 128)
    e[get_local_id(0)] = b[get_local_id(0)];

  barrier(1);

  SComplex f;
  f.real = 0.0f;
  f.imag = 0.0f;

  for (int g = 0; g < 128; g++) {
    f.real += e[128 - 1 - g] * d[get_local_id(0) + g].real;
    f.imag += e[128 - 1 - g] * d[get_local_id(0) + g].imag;
  }

  c[get_local_id(0)].real = f.real;
  c[get_local_id(0)].imag = f.imag;
}