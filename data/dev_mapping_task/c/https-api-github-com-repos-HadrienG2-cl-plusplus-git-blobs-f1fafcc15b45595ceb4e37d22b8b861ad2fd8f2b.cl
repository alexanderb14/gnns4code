typedef double MatrixElement; __kernel void A(__global const MatrixElement* restrict const a, __global MatrixElement* restrict const b) {
  const unsigned int c = get_global_id(0);
  const unsigned int d = get_global_id(1);
  const size_t e = d * get_global_size(0) + c;

  const unsigned int f = d;
  const unsigned int g = c;
  const size_t h = g * get_global_size(0) + f;

  b[h] = a[e];
}

__kernel void B(__global const MatrixElement* restrict const a, __local MatrixElement* restrict const b, __global MatrixElement* restrict const c) {
  const unsigned int d = get_global_id(0);
  const unsigned int e = get_global_id(1);
  const size_t f = e * get_global_size(0) + d;

  const unsigned int g = get_local_id(1);
  const unsigned int h = get_local_id(0);
  const unsigned int i = h * get_local_size(0) + g;

  b[i] = a[f];
  barrier(1);

  const unsigned int j = get_local_id(0);
  const unsigned int k = get_local_id(1);
  const unsigned int l = k * get_local_size(0) + j;

  const unsigned int m = get_group_id(1) * get_local_size(0);
  const unsigned int n = get_group_id(0) * get_local_size(1);

  const unsigned int o = m + j;
  const unsigned int p = n + k;
  const size_t q = p * get_global_size(0) + o;

  c[q] = b[l];
}