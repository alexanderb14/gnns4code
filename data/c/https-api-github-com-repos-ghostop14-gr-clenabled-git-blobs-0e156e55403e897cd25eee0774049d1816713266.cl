struct ComplexStruct {
  float real;
  float imag;
};

typedef struct ComplexStruct SComplex;

__kernel void A(__global SComplex* restrict a, __global SComplex* restrict b, __global SComplex* restrict c) {
  size_t d = get_global_id(0);
  float e = a[d].real;
  float f = a[d].imag;
  float g = b[d].real;
  float h = b[d].imag;
  c[d].real = (e * g) - (f * h);
  c[d].imag = (e * h) + (f * g);
}