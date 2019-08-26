struct ComplexStruct {
  float real;
  float imag;
};

typedef struct ComplexStruct SComplex;

__kernel void A(__global SComplex* restrict a, __global SComplex* restrict b) {
  size_t c = get_global_id(0);
  b[c].real = cos((double)a[c].real);
  b[c].imag = sin((double)a[c].imag);
}