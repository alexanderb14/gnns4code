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
__kernel void L(__global fp_t* a, __global fp_t* b, __constant fp_t* c, __local fp_t* d, const int e, const int f, const int g) {
  const int h = get_local_size(0);
  const int i = get_local_size(1);
  const int j = i;

  const int k = h - g + 1;
  const int l = i - g + 1;

  const int m = get_local_id(0);
  const int n = get_local_id(1);

  const int o = get_group_id(0) * k + m;
  const int p = get_group_id(1) * l + n;

  const int q = o - g / 2;
  const int r = p - g / 2;

  if (q >= 0 && q < e && r >= 0 && r < f) {
    d[j * n + m] = a[e * r + q];
  }

  barrier(1);

  if (m < k && n < l) {
    fp_t s = 0.;
    for (int t = 0; t < g; t++) {
      for (int u = 0; u < g; u++) {
        s += c[g * t + u] * d[j * (n + t) + m + u];
      }
    }

    if (p < f && o < e) {
      b[e * p + o] = s;
    }
  }

  barrier(2);
}