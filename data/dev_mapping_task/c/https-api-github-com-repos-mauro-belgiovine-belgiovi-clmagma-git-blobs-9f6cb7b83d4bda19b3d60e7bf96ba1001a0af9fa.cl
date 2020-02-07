typedef double2 magmaDoubleComplex; typedef struct { int n, offset_dA1, lda1, offset_dA2, lda2; } magmagpu_zswap_params_t;

__kernel void A(__global magmaDoubleComplex* a, __global magmaDoubleComplex* b, magmagpu_zswap_params_t c) {
  unsigned int d = get_local_id(0) + ((get_local_size(0)) * (get_group_id(0)));
  unsigned int e = ((d) * (c.lda1));
  unsigned int f = ((d) * (c.lda2));
  if (d < c.n) {
    __global magmaDoubleComplex* g = a + c.offset_dA1 + e;
    __global magmaDoubleComplex* h = b + c.offset_dA2 + f;
    magmaDoubleComplex i = *g;
    *g = *h;
    *h = i;
  }
}