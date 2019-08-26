typedef struct {
  int first;
  float second;
} _pair_int_float_t;

inline bool A(_pair_int_float_t a, _pair_int_float_t b) {
  return a.first < b.first;
}

__kernel void B(__local _pair_int_float_t* a, uint b, __global _pair_int_float_t* c) {
  for (uint d = 0; d < b; d++) {
    a[d] = c[d];
  }
  for (uint d = 1; d < b; d++) {
    const _pair_int_float_t e = a[d];
    uint f = d;
    while (f > 0 && A(e, a[f - 1])) {
      a[f] = a[f - 1];
      f--;
    }
    a[f] = e;
  }
  for (uint d = 0; d < b; d++) {
    c[d] = a[d];
  }
}