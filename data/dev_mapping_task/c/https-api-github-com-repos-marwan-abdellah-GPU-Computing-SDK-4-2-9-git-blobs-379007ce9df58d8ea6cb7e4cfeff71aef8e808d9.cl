float4 A(unsigned int a) {
  float4 b;
  b.x = a & 0xff;
  b.y = (a >> 8) & 0xff;
  b.z = (a >> 16) & 0xff;
  b.w = (a >> 24) & 0xff;
  return b;
}

unsigned int B(float4 a, float b) {
  unsigned int c = 0U;
  c |= 0x000000FF & (unsigned int)(a.x * b);
  c |= 0x0000FF00 & (((unsigned int)(a.y * b)) << 8);
  c |= 0x00FF0000 & (((unsigned int)(a.z * b)) << 16);
  c |= 0xFF000000 & (((unsigned int)(a.w * b)) << 24);
  return c;
}
__kernel void C(__global unsigned int* a, __global unsigned int* b, unsigned int c, unsigned int d, int e, float f) {
  size_t g = get_global_id(0);
  a = &a[g];
  b = &b[g];

  float4 h;
  h = A(a[0]) * (float4)(e);
  for (int i = 0; i < e + 1; i++) {
    h += A(a[i * c]);
  }
  b[0] = B(h, f);
  for (int i = 1; i < e + 1; i++) {
    h += A(a[(i + e) * c]);
    h -= A(a[0]);
    b[i * c] = B(h, f);
  }

  for (int i = e + 1; i < d - e; i++) {
    h += A(a[(i + e) * c]);
    h -= A(a[((i - e) * c) - c]);
    b[i * c] = B(h, f);
  }

  for (int i = d - e; i < d; i++) {
    h += A(a[(d - 1) * c]);
    h -= A(a[((i - e) * c) - c]);
    b[i * c] = B(h, f);
  }
}