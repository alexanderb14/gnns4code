inline void A(volatile __global float* a, const float b) {
  union {
    unsigned int intVal;
    float floatVal;
  } c;
  union {
    unsigned int intVal;
    float floatVal;
  } d;
  do {
    d.floatVal = *a;
    c.floatVal = d.floatVal + b;
  } while (atomic_cmpxchg((volatile __global unsigned int*)a, d.intVal, c.intVal) != d.intVal);
}

__kernel void B(__global float* a, __global unsigned int* b, __global float* c) {
  unsigned int d = get_global_id(0);

  float e = a[d];

  unsigned int f = b[d];

  A((c + f), e);
}