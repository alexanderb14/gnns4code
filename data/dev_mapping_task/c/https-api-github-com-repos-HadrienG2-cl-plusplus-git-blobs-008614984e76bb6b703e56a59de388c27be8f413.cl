typedef double MatrixElement; __kernel void A(__global const MatrixElement* restrict const a, __global const MatrixElement* restrict const b, __global MatrixElement* restrict const c) {
  const unsigned int d = get_global_id(0);
  const unsigned int e = get_global_id(1);
  const unsigned int f = get_global_size(0);
  const size_t g = e * f + d;

  const unsigned int h = e;
  const unsigned int i = d;
  MatrixElement j = 0.0;
  for (unsigned int k = 0; k < f; ++k) {
    const size_t l = h * f + k;
    const size_t m = k * f + i;
    j += a[l] * b[m];
  }

  c[g] = j;
}

__kernel void B(__global const MatrixElement* restrict const a, __global const MatrixElement* restrict const b, __global MatrixElement* restrict const c) {
  const unsigned int d = get_global_id(0);
  const unsigned int e = get_global_id(1);
  const unsigned int f = get_global_size(0);
  const size_t g = e * f + d;

  const unsigned int h = e;
  MatrixElement i = 0.0;
  for (unsigned int j = 0; j < f; ++j) {
    const size_t k = h * f + j;
    i += a[k] * b[k];
  }

  c[g] = i;
}