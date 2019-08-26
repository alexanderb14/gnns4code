typedef struct { int n, offset_dA1, lda1, offset_dA2, lda2; } magmagpu_dswap_params_t;

__kernel void A(__global double* a, __global double* b, magmagpu_dswap_params_t c) {
  unsigned int d = get_local_id(0) + ((get_local_size(0)) * (get_group_id(0)));
  unsigned int e = ((d) * (c.lda1));
  unsigned int f = ((d) * (c.lda2));
  if (d < c.n) {
    __global double* g = a + c.offset_dA1 + e;
    __global double* h = b + c.offset_dA2 + f;
    double i = *g;
    *g = *h;
    *h = i;
  }
}