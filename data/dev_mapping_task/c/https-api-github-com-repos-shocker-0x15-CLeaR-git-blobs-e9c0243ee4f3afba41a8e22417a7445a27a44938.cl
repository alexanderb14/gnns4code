void A(volatile global float* a, float b); void B(volatile local float* a, float b); void C(volatile local float* a, float b); void A(volatile global float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(*a + b, uint);
  while ((e = atomic_cmpxchg((volatile global uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(__builtin_astype(c, float) + b, uint);
  }
}

void B(volatile local float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(fmin(*a, b), uint);
  while ((e = atomic_cmpxchg((volatile local uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(fmin(__builtin_astype(c, float), b), uint);
  }
}

void C(volatile local float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(fmax(*a, b), uint);
  while ((e = atomic_cmpxchg((volatile local uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(fmax(__builtin_astype(c, float), b), uint);
  }
}