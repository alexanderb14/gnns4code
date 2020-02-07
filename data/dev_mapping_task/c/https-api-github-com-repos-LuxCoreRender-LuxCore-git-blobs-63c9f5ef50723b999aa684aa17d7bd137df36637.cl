void A(__global float* a, const float b) {
  union {
    float f;
    uint i;
  } c;
  union {
    float f;
    uint i;
  } d;

  do {
    c.f = *a;
    d.f = c.f + b;
  } while (atomic_cmpxchg((__global uint*)a, c.i, d.i) != c.i);
}

bool B(__global float* a, const float b) {
  union {
    float f;
    uint i;
  } c;
  union {
    float f;
    uint i;
  } d;

  do {
    c.f = *a;
    if (b >= c.f)
      return false;
    else
      d.f = b;
  } while (atomic_cmpxchg((__global uint*)a, c.i, d.i) != c.i);

  return true;
}

uint C(__global uint* a, const uint b, const uint c) {
  uint d, e;

  do {
    d = *a;
    e = (d + b) % c;
  } while (atomic_cmpxchg((__global uint*)a, d, e) != d);

  return d;
}