typedef struct __attribute__((packed)) {
  int a;
  int b;
  float c;
} UDD;

inline bool A(UDD a, UDD b) {
  return a.a < b.a;
}

__kernel void B(__local UDD* a, uint b, __global UDD* c) {
  for (uint d = 0; d < b; d++) {
    a[d] = c[d];
  }
  for (uint d = 1; d < b; d++) {
    const UDD e = a[d];
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