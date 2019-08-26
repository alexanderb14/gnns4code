typedef double fp_t; struct Stopwatch {
  fp_t conv;

  fp_t step;

  fp_t file;

  fp_t soln;
};
void A(const fp_t a, const fp_t b, const int c, fp_t** d, const int e);

void B(const fp_t a, const fp_t b, fp_t** c, const int d);

void C(const fp_t a, const fp_t b, fp_t** c, const int d);
void D(const fp_t a, const fp_t b, fp_t** c, const int d);
void E(fp_t** const a, fp_t** b, fp_t** const c, const int d, const int e, const int f);

void F(fp_t** a, fp_t** b, fp_t** c, const int d, const int e, const int f, const fp_t g, const fp_t h);

fp_t G(const fp_t a, const fp_t b, const fp_t c, const fp_t d);

fp_t H(const fp_t a, const fp_t b, const fp_t c, const fp_t d);
fp_t I(const fp_t a, const fp_t b, const fp_t c, const fp_t d, const fp_t e, const fp_t f);
void J(const fp_t a, const fp_t b, const fp_t c, fp_t* d);
void K(fp_t** a, fp_t** b, const int c, const int d, const fp_t e, const fp_t f, const int g, const fp_t h, const fp_t i, fp_t* j);
__kernel void L(__global fp_t* a, __global fp_t* b, __global fp_t* c, const int d, const int e, const int f, const fp_t g, const fp_t h) {
  int i, j, k;

  i = get_global_id(0);
  k = get_global_id(1);
  j = k * d + i;

  if (k < e && i < d) {
    b[j] = a[j] + h * g * c[j];
  }

  barrier(2);
}