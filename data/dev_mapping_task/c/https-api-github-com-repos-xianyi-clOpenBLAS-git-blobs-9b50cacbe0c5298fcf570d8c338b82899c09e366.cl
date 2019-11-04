__attribute__((reqd_work_group_size(16, 16, 1))) __kernel void A(unsigned int a, unsigned int b, unsigned int c, float d, __global float* e, __global float* f, __global float* g) {
  float h[8][4] = {{(float)0}};
  float i[8];
  float j[4];

  __local float k[2064];
  __local float l[1040];

  uint m = get_group_id(0);
  uint n = get_group_id(1);
  uint o = get_local_id(0);
  uint p = get_local_id(1);

  uint q = 16 * p + o;
  uint r = q % 32;
  uint s = q / 32;

  e += (m * 128 + r) + s * a;
  f += (n * 64 + r) + s * b;

  for (unsigned int t = 0; t < c; t += 16) {
    __local float* u = k + s * 129 + r;
    __local float* v = l + s * 65 + r;

    barrier(1);

    (u + 0)[0] = e[0 * a + 0];
    (u + 32)[0] = e[0 * a + 32];
    (u + 64)[0] = e[0 * a + 64];
    (u + 96)[0] = e[0 * a + 96];
    (u + 1032)[0] = e[8 * a + 0];
    (u + 1064)[0] = e[8 * a + 32];
    (u + 1096)[0] = e[8 * a + 64];
    (u + 1128)[0] = e[8 * a + 96];
    (v + 0)[0] = f[0 * b + 0];
    (v + 32)[0] = f[0 * b + 32];
    (v + 520)[0] = f[8 * b + 0];
    (v + 552)[0] = f[8 * b + 32];

    barrier(1);

    uint w = 1 * o;
    uint x = 1 * p;
    for (unsigned int y = 0; y < 16; y += 1) {
      for (unsigned int z = 0; z < 8; z++) {
        i[z * 1 + 0] = k[w + z * 16 + 0 + 0 * 129];
      }

      for (unsigned int aa = 0; aa < 4; aa++) {
        j[aa * 1 + 0] = l[x + aa * 16 + 0 + 0 * 65];
      }
      w += 129;
      x += 65;

      h[0][0] = __clc_fma(i[0], j[0], h[0][0]);
      h[1][0] = __clc_fma(i[1], j[0], h[1][0]);
      h[2][0] = __clc_fma(i[2], j[0], h[2][0]);
      h[3][0] = __clc_fma(i[3], j[0], h[3][0]);
      h[4][0] = __clc_fma(i[4], j[0], h[4][0]);
      h[5][0] = __clc_fma(i[5], j[0], h[5][0]);
      h[6][0] = __clc_fma(i[6], j[0], h[6][0]);
      h[7][0] = __clc_fma(i[7], j[0], h[7][0]);
      h[0][1] = __clc_fma(i[0], j[1], h[0][1]);
      h[1][1] = __clc_fma(i[1], j[1], h[1][1]);
      h[2][1] = __clc_fma(i[2], j[1], h[2][1]);
      h[3][1] = __clc_fma(i[3], j[1], h[3][1]);
      h[4][1] = __clc_fma(i[4], j[1], h[4][1]);
      h[5][1] = __clc_fma(i[5], j[1], h[5][1]);
      h[6][1] = __clc_fma(i[6], j[1], h[6][1]);
      h[7][1] = __clc_fma(i[7], j[1], h[7][1]);
      h[0][2] = __clc_fma(i[0], j[2], h[0][2]);
      h[1][2] = __clc_fma(i[1], j[2], h[1][2]);
      h[2][2] = __clc_fma(i[2], j[2], h[2][2]);
      h[3][2] = __clc_fma(i[3], j[2], h[3][2]);
      h[4][2] = __clc_fma(i[4], j[2], h[4][2]);
      h[5][2] = __clc_fma(i[5], j[2], h[5][2]);
      h[6][2] = __clc_fma(i[6], j[2], h[6][2]);
      h[7][2] = __clc_fma(i[7], j[2], h[7][2]);
      h[0][3] = __clc_fma(i[0], j[3], h[0][3]);
      h[1][3] = __clc_fma(i[1], j[3], h[1][3]);
      h[2][3] = __clc_fma(i[2], j[3], h[2][3]);
      h[3][3] = __clc_fma(i[3], j[3], h[3][3]);
      h[4][3] = __clc_fma(i[4], j[3], h[4][3]);
      h[5][3] = __clc_fma(i[5], j[3], h[5][3]);
      h[6][3] = __clc_fma(i[6], j[3], h[6][3]);
      h[7][3] = __clc_fma(i[7], j[3], h[7][3]);
    }
    e += 16 * a;
    f += 16 * b;
  }
  g += m * 128;
  g += o;
  g += n * 64 * a;
  g += p * a;

  g[0 * a] = h[0][0] * d;
  g[16 * a] = h[0][1] * d;
  g[32 * a] = h[0][2] * d;
  g[48 * a] = h[0][3] * d;
  g += 16;
  g[0 * a] = h[1][0] * d;
  g[16 * a] = h[1][1] * d;
  g[32 * a] = h[1][2] * d;
  g[48 * a] = h[1][3] * d;
  g += 16;
  g[0 * a] = h[2][0] * d;
  g[16 * a] = h[2][1] * d;
  g[32 * a] = h[2][2] * d;
  g[48 * a] = h[2][3] * d;
  g += 16;
  g[0 * a] = h[3][0] * d;
  g[16 * a] = h[3][1] * d;
  g[32 * a] = h[3][2] * d;
  g[48 * a] = h[3][3] * d;
  g += 16;
  g[0 * a] = h[4][0] * d;
  g[16 * a] = h[4][1] * d;
  g[32 * a] = h[4][2] * d;
  g[48 * a] = h[4][3] * d;
  g += 16;
  g[0 * a] = h[5][0] * d;
  g[16 * a] = h[5][1] * d;
  g[32 * a] = h[5][2] * d;
  g[48 * a] = h[5][3] * d;
  g += 16;
  g[0 * a] = h[6][0] * d;
  g[16 * a] = h[6][1] * d;
  g[32 * a] = h[6][2] * d;
  g[48 * a] = h[6][3] * d;
  g += 16;
  g[0 * a] = h[7][0] * d;
  g[16 * a] = h[7][1] * d;
  g[32 * a] = h[7][2] * d;
  g[48 * a] = h[7][3] * d;
  g += 16;
}

__attribute__((reqd_work_group_size(8, 8, 1))) __kernel void B(unsigned int a, unsigned int b, unsigned int c, double d, __global double* e, __global double* f, __global double* g) {
  double h[4][4] = {{(double)0}};
  double i[4][4];
  double j[4][4];

  __local double k[264];
  __local double l[264];

  uint m = get_group_id(0);
  uint n = get_group_id(1);
  uint o = get_local_id(0);
  uint p = get_local_id(1);

  uint q = 8 * p + o;
  uint r = q % 8;
  uint s = q / 8;

  e += (m * 32 + r) + s * a;
  f += (n * 32 + r) + s * b;

  for (unsigned int t = 0; t < c; t += 8) {
    __local double* u = k + s * 33 + r;
    __local double* v = l + s * 33 + r;

    barrier(1);

    (u + 0)[0] = e[0];
    (u + 8)[0] = e[8];
    (u + 16)[0] = e[16];
    (u + 24)[0] = e[24];
    (v + 0)[0] = f[0];
    (v + 8)[0] = f[8];
    (v + 16)[0] = f[16];
    (v + 24)[0] = f[24];

    barrier(1);

    uint w = 1 * o;
    uint x = 1 * p;
    for (unsigned int y = 0; y < 8; y += 4) {
      for (unsigned int z = 0; z < 4; z++) {
        for (unsigned int aa = 0; aa < 4; aa++) {
          i[z][aa * 1 + 0] = k[w + aa * 8 + 0 + z * 33];
        }
      }

      for (unsigned int z = 0; z < 4; z++) {
        for (unsigned int ab = 0; ab < 4; ab++) {
          j[z][ab * 1 + 0] = l[x + ab * 8 + 0 + z * 33];
        }
      }
      w += 132;
      x += 132;

      for (unsigned int z = 0; z < 4; z++) {
        h[0][0] = __clc_fma(i[z][0], j[z][0], h[0][0]);
        h[1][0] = __clc_fma(i[z][1], j[z][0], h[1][0]);
        h[2][0] = __clc_fma(i[z][2], j[z][0], h[2][0]);
        h[3][0] = __clc_fma(i[z][3], j[z][0], h[3][0]);

        h[0][1] = __clc_fma(i[z][0], j[z][1], h[0][1]);
        h[1][1] = __clc_fma(i[z][1], j[z][1], h[1][1]);
        h[2][1] = __clc_fma(i[z][2], j[z][1], h[2][1]);
        h[3][1] = __clc_fma(i[z][3], j[z][1], h[3][1]);

        h[0][2] = __clc_fma(i[z][0], j[z][2], h[0][2]);
        h[1][2] = __clc_fma(i[z][1], j[z][2], h[1][2]);
        h[2][2] = __clc_fma(i[z][2], j[z][2], h[2][2]);
        h[3][2] = __clc_fma(i[z][3], j[z][2], h[3][2]);

        h[0][3] = __clc_fma(i[z][0], j[z][3], h[0][3]);
        h[1][3] = __clc_fma(i[z][1], j[z][3], h[1][3]);
        h[2][3] = __clc_fma(i[z][2], j[z][3], h[2][3]);
        h[3][3] = __clc_fma(i[z][3], j[z][3], h[3][3]);
      }
    }
    e += 8 * a;
    f += 8 * b;
  }
  g += m * 32;
  g += o;
  g += n * 32 * a;
  g += p * a;

  g[0 * a] = h[0][0] * d;
  g[8 * a] = h[0][1] * d;
  g[16 * a] = h[0][2] * d;
  g[24 * a] = h[0][3] * d;
  g += 8;

  g[0 * a] = h[1][0] * d;
  g[8 * a] = h[1][1] * d;
  g[16 * a] = h[1][2] * d;
  g[24 * a] = h[1][3] * d;
  g += 8;

  g[0 * a] = h[2][0] * d;
  g[8 * a] = h[2][1] * d;
  g[16 * a] = h[2][2] * d;
  g[24 * a] = h[2][3] * d;
  g += 8;

  g[0 * a] = h[3][0] * d;
  g[8 * a] = h[3][1] * d;
  g[16 * a] = h[3][2] * d;
  g[24 * a] = h[3][3] * d;
  g += 8;
}