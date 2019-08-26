uint A() {
  return get_global_size(0) * get_global_size(1);
}

uint B() {
  return get_global_id(1) * get_global_size(0) + get_global_id(0);
}

int C(const __global char* a, uint b) {
  const uint c = A() * b + B();
  return (int)(a[c]);
}

int D(const __global char* a, uint b) {
  return C(a, b);
}

int E(const __global char* a, uint b) {
  return C(a, 2 + 2 * b);
}

int F(const __global char* a, uint b) {
  return C(a, 2 + 2 * b + 1);
}

int4 G(int4 a) {
  int4 b;
  int c = a.x - (a.z / 2);
  b.y = a.z + c;
  b.z = (c - a.y) / 2;
  b.x = b.z + a.y;
  return b;
}

ushort H(const __global char* a, uint b) {
  int c = D(a, b);
  int d = E(a, b);
  int e = F(a, b);

  int4 f = G((int4)(c, d e 0));

  ushort g = 0;
  g |= (f.x << 11);
  g |= (f.y << 5);
  g |= f.z;

  return g;
}

__kernel void I(const __global int* a, const __constant uint* b, const __global char* c, const __global int* d, __global ushort* e) {
  const uint f = A() * 6 * get_global_id(2);

  ushort g = H(c + f, 0);
  ushort h = H(c + f, 1);

  __global ushort* i = e + get_global_id(2) * A() * 4;
  i[4 * B() + 0] = g;
  i[4 * B() + 1] = h;

  const __global int* j = a + b[4 * get_global_id(2) + 2] / 4;
  const uint k = d[get_global_id(2) * A() + B()];
  *((__global uint*)(i) + 2 * B() + 1) = j[k];
}

__kernel void J(const __global uint* a, const __constant uint* b, const __global char* c, const __global int* d, __global uchar* e) {
  const uint f = A() * 6 * get_global_id(2);

  int4 g[4];

  g[0].x = D(c + f, 0);
  g[0].y = E(c + f, 0);
  g[0].z = F(c + f, 0);
  g[0] = G(g[0]);

  g[1].x = D(c + f, 1);
  g[1].y = E(c + f, 1);
  g[1].z = F(c + f, 1);
  g[1] = G(g[1]);

  g[0].x = (g[0].x << 3) | (g[0].x >> 2);
  g[0].y = (g[0].y << 2) | (g[0].y >> 4);
  g[0].z = (g[0].z << 3) | (g[0].z >> 2);

  g[1].x = (g[1].x << 3) | (g[1].x >> 2);
  g[1].y = (g[1].y << 2) | (g[1].y >> 4);
  g[1].z = (g[1].z << 3) | (g[1].z >> 2);

  g[2] = (2 * g[0] + g[1]) / 3;
  g[3] = (g[0] + 2 * g[1]) / 3;

  const uint h = d[get_global_id(2) * A() + B()];
  uint i = (a + b[4 * get_global_id(2) + 2] / 4)[h];

  __global uchar* j = e + A() * 3 * 16 * get_global_id(2);
  for (int k = 0; k < 16; ++k) {
    int4 l = g[i & 3];

    uint m = 4 * get_global_id(0) + (k % 4);
    uint n = 4 * get_global_id(1) + (k / 4);

    uint o = 3 * (4 * get_global_size(0) * n + m);
    j[o + 0] = l.x;
    j[o + 1] = l.y;
    j[o + 2] = l.z;

    i >>= 2;
  }
}