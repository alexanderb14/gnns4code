struct ComplexStruct {
  float real;
  float imag;
};

typedef struct ComplexStruct SComplex;

__kernel void A(__global SComplex* restrict a, __global SComplex* restrict b) {
  size_t c = get_global_id(0);
  b[c].real = a[c].real * 3.0;
  b[c].imag = a[c].imag * 3.0;
}