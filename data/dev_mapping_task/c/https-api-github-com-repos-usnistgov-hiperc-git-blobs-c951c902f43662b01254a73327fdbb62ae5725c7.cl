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
__kernel void L(__global fp_t* a, const int b, const int c, const int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);

  if (e < 1 + d / 2 && f < c / 2) {
    a[b * f + e] = 1.;
  }

  if (e >= b - 1 - d / 2 && e < b && f >= c / 2 && f < c) {
    a[b * f + e] = 1.;
  }

  barrier(2);

  for (int g = 0; g < d / 2; g++) {
    const int h = d / 2 - g;
    const int i = b - 1 - d / 2 + g;
    const int j = d / 2 - g;
    const int k = c - 1 - d / 2 + g;

    if (h - 1 == e && f < c) {
      a[b * f + h - 1] = a[b * f + h];
    }
    if (i + 1 == e && f < c) {
      a[b * f + i + 1] = a[b * f + i];
    }
    if (j - 1 == f && e < b) {
      a[b * (j - 1) + e] = a[b * j + e];
    }
    if (k + 1 == f && e < b) {
      a[b * (k + 1) + e] = a[b * k + e];
    }

    barrier(2);
  }
}