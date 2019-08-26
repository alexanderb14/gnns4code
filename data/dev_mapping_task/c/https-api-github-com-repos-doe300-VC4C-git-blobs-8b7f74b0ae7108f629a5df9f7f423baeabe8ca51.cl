enum r123_enum_threefry32x2 { R_32x2_0_0 = 13, R_32x2_1_0 = 15, R_32x2_2_0 = 26, R_32x2_3_0 = 6, R_32x2_4_0 = 17, R_32x2_5_0 = 29, R_32x2_6_0 = 16, R_32x2_7_0 = 24 };

uint A(uint a, uint b) {
  return (a << (b & 31)) | (a >> ((32 - b) & 31));
}

struct r123array2x32 {
  uint v[2];
};

typedef struct r123array2x32 threefry2x32_ctr_t;
typedef struct r123array2x32 threefry2x32_key_t;

threefry2x32_ctr_t B(unsigned int a, threefry2x32_ctr_t b, threefry2x32_key_t c) {
  threefry2x32_ctr_t d;
  uint e[3];
  uint f;
  e[2] = 0x1BD11BDA;
  for (f = 0; f < 2; f++) {
    e[f] = c.v[f];
    d.v[f] = b.v[f];
    e[2] ^= c.v[f];
  }
  d.v[0] += e[0];
  d.v[1] += e[1];
  if (a > 0) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 1) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 2) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 3) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 1;
  }
  if (a > 4) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 5) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 6) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 7) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 2;
  }
  if (a > 8) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 9) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 10) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 11) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 3;
  }
  if (a > 12) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 13) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 14) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 15) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 4;
  }
  if (a > 16) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 17) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 18) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 19) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 5;
  }
  if (a > 20) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 21) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 22) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 23) {
    d.v[0] += e[0];
    d.v[1] += e[1];
    d.v[1] += 6;
  }
  if (a > 24) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_0_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 25) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_1_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 26) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_2_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_3_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 27) {
    d.v[0] += e[1];
    d.v[1] += e[2];
    d.v[1] += 7;
  }
  if (a > 28) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_4_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 29) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_5_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 30) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_6_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += d.v[1];
    d.v[1] = A(d.v[1], R_32x2_7_0);
    d.v[1] ^= d.v[0];
  }
  if (a > 31) {
    d.v[0] += e[2];
    d.v[1] += e[0];
    d.v[1] += 8;
  }
  return d;
}

__kernel void C(__global uint* a, __global uint* b, const uint c) {
  threefry2x32_ctr_t d;
  threefry2x32_key_t e;
  const uint f = get_global_id(0);
  d.v[0] = a[2 * (c + f)];
  d.v[1] = a[2 * (c + f) + 1];
  e.v[0] = b[2 * (c + f)];
  e.v[1] = b[2 * (c + f) + 1];
  d = B(20, d, e);
  a[2 * (c + f)] = d.v[0];
  a[2 * (c + f) + 1] = d.v[1];
}