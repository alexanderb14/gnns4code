typedef double2 magmaDoubleComplex; typedef struct {
  int n, lda, j0;
  short ipiv[32];
} zlaswp_params_t;

typedef struct {
  int n, lda, j0, npivots;
  short ipiv[32];
} zlaswp_params_t2;

__kernel void A(__global magmaDoubleComplex* a, int b, zlaswp_params_t2 c) {
  unsigned int d = get_local_id(0) + ((get_local_size(0)) * (get_group_id(0)));

  if (d < c.n) {
    int e = c.lda;
    __global magmaDoubleComplex* f = a + b + d + e * c.j0;

    for (int g = 0; g < c.npivots; g++) {
      int h = c.ipiv[g];
      __global magmaDoubleComplex* i = f + g * e;
      __global magmaDoubleComplex* j = f + h * e;
      magmaDoubleComplex k = *i;
      *i = *j;
      *j = k;
    }
  }
}