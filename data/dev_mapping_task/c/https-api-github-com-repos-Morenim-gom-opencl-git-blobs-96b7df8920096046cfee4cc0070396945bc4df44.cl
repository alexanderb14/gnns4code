uint A(uint a, int b) {
  return (a << b) | (a >> (32 - b));
}

uint B(uint4* a) {
  uint4 b = *a;
  b.yw = (uintb)(A 25) ^ b.b, A 24) ^ b.x);
  b.xz -= b.yw;
  b.yw = (uintb)(A 20) ^ b.b, A 16) ^ b.x);
  b.xz -= b.yw;
  *a = b;
  return b.y;
}

uint C(uint4* a, int b, int c) {
  return b + (uint)((ulong)(B(a) * (ulong)(c - b + 1)) >> 32);
}

float D(uint4* a) {
  return B(a) * (1.0f / 4294967296.0f);
}

uint4 E(ulong a) {
  uint4 b = (uint4)(a 32, a0xffffffffu, 2654435769u, 1367130551u);

  for (int c = 0; c < 20; ++c)
    B(&b);

  return b;
}