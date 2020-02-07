void A(unsigned char* a, unsigned int b, unsigned char* c, unsigned int d, unsigned int e) {
  for (unsigned int f = 0; f < e; ++f) {
    c[d + f] = a[b + f];
  }
}

void B(__global unsigned char* a, unsigned int b, unsigned char* c, unsigned int d, unsigned int e) {
  for (unsigned int f = 0; f < e; ++f) {
    c[d + f] = a[b + f];
  }
}

void C(unsigned char* a, unsigned int b, __global unsigned char* c, unsigned int d, unsigned int e) {
  for (unsigned int f = 0; f < e; ++f) {
    c[d + f] = a[b + f];
  }
}

void D(__global unsigned char* a, unsigned int b, __global unsigned char* c, unsigned int d, unsigned int e) {
  for (unsigned int f = 0; f < e; ++f) {
    c[d + f] = a[b + f];
  }
}

unsigned int E(unsigned char* a, unsigned int b) {
  return a[b] | (a[b + 1] << 8) | (a[b + 2] << 16) | (a[b + 3] << 24);
}

void F(unsigned char* a, unsigned int b, unsigned int c) {
  a[b] = c & 0x0ff;
  a[b + 1] = (c >> 8) & 0x0ff;
  a[b + 2] = (c >> 16) & 0x0ff;
  a[b + 3] = (c >> 24) & 0x0ff;
}

unsigned long G(unsigned char* a, unsigned int b) {
  return a[b] | ((unsigned long)a[b + 1] << 8) | ((unsigned long)a[b + 2] << 16) | ((unsigned long)a[b + 3] << 24) | ((unsigned long)a[b + 4] << 32) | ((unsigned long)a[b + 5] << 40) | ((unsigned long)a[b + 6] << 48) | ((unsigned long)a[b + 7] << 56);
}

void H(unsigned char* a, unsigned int b, unsigned long c) {
  a[b] = c & 0x0ff;
  a[b + 1] = (c >> 8) & 0x0ff;
  a[b + 2] = (c >> 16) & 0x0ff;
  a[b + 3] = (c >> 24) & 0x0ff;
  a[b + 4] = (c >> 32) & 0x0ff;
  a[b + 5] = (c >> 40) & 0x0ff;
  a[b + 6] = (c >> 48) & 0x0ff;
  a[b + 7] = (c >> 56) & 0x0ff;
}

unsigned long I(__global unsigned char* a, unsigned int b) {
  return (a[b] << 24) | (a[b + 1] << 16) | (a[b + 2] << 8) | a[b + 3];
}

void J(__global unsigned char* a, unsigned int b, unsigned long c) {
  a[b] = (c >> 24) & 0x0ff;
  a[b + 1] = (c >> 16) & 0x0ff;
  a[b + 2] = (c >> 8) & 0x0ff;
  a[b + 3] = c & 0x0ff;
}

unsigned long K(unsigned char* a, unsigned int b) {
  return ((unsigned long)a[b] << 56) | ((unsigned long)a[b + 1] << 48) | ((unsigned long)a[b + 2] << 40) | ((unsigned long)a[b + 3] << 32) | ((unsigned long)a[b + 4] << 24) | ((unsigned long)a[b + 5] << 16) | ((unsigned long)a[b + 6] << 8) | a[b + 7];
}

void L(unsigned char* a, unsigned int b, unsigned long c) {
  a[b] = (c >> 56) & 0x0ff;
  a[b + 1] = (c >> 48) & 0x0ff;
  a[b + 2] = (c >> 40) & 0x0ff;
  a[b + 3] = (c >> 32) & 0x0ff;
  a[b + 4] = (c >> 24) & 0x0ff;
  a[b + 5] = (c >> 16) & 0x0ff;
  a[b + 6] = (c >> 8) & 0x0ff;
  a[b + 7] = c & 0x0ff;
}

void M(__global unsigned char* a, unsigned int b, unsigned long c) {
  a[b] = (c >> 56) & 0x0ff;
  a[b + 1] = (c >> 48) & 0x0ff;
  a[b + 2] = (c >> 40) & 0x0ff;
  a[b + 3] = (c >> 32) & 0x0ff;
  a[b + 4] = (c >> 24) & 0x0ff;
  a[b + 5] = (c >> 16) & 0x0ff;
  a[b + 6] = (c >> 8) & 0x0ff;
  a[b + 7] = c & 0x0ff;
}