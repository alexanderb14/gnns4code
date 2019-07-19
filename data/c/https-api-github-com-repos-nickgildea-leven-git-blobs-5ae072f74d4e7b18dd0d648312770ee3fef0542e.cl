uint A(const uint a, const uint b) {
  const uint c = 0xcc9e2d51;
  const uint d = 0x1b873593;
  const uint e = 15;
  const uint f = 13;
  const uint g = 5;
  const uint h = 0xe6546b64;

  uint i = a;
  i *= c;
  i = (i << e) | (i >> (32 - e));
  i *= d;

  i ^= a;
  i = ((i << f) | (i >> (32 - f))) * g + h;

  i ^= (i >> 16);
  i *= 0x85ebca6b;
  i ^= (i >> 13);
  i *= 0xc2b2ae35;
  i ^= (i >> 16);

  return i;
}

uint B(const uint a, const uint b, const uint c) {
  uint d = A(a, b);
  return d % c;
}

kernel void C(global int* a, global int* b, const int c, const int d) {
  const int e = get_global_id(0);
  const int f = a[e];
  const uint g = B(f, d, c);

  b[g] = e;
}

kernel void D(global int* a, global int* b, const int c, const int d) {
  const int e = get_global_id(0);
  const int f = a[e];
  const uint g = B(f, d, c);

  b[g] = f;
}

kernel void E(global int* a, global int* b, global int* c, global int* d) {
  const int e = get_global_id(0);
  const int f = a[e];
  if (f != -1) {
    c[e] = 1;
    d[e] = b[f];
  } else {
    c[e] = 0;
    d[e] = -1;
  }
}

kernel void F(global int* a, global int* b, global int* c, global int* d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = a[g];
  const uint i = B(h, f, e);
  if (b[i] != h) {
    c[g] = 1;
    d[g] = h;
  } else {
    c[g] = 0;
    d[g] = -1;
  }
}