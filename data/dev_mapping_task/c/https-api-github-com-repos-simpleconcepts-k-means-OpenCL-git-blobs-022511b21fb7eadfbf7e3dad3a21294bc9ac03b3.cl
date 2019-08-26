inline unsigned int A(unsigned int* a, unsigned int* b) {
  (*a) = 36969 * ((*a) & 65535) + ((*a) >> 16);
  (*b) = 18000 * ((*b) & 65535) + ((*b) >> 16);
  return ((*a) << 16) + (*b);
}

inline unsigned int B(unsigned int a, unsigned int b, unsigned int c) {
  return (a >> b) | (a << (c - b));
}

__kernel void C(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = get_global_id(0);

  if (e >= d) {
    return;
  }

  c[e] = a[e] + b[e];

  barrier(1);

  unsigned int f = B((unsigned int)e, 4, 32), g = (unsigned int)e;
  c[e] = A(&f, &g) % 0xFF;
}