__kernel void A(__global float* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  float f = 0.0;
  for (unsigned int g = 0; g < c / e; g++) {
    for (unsigned int h = 0; h < c; h++) {
      f += a[g * c + h];
    }
  }
  b[d] = f;
}

__kernel void B(__global float* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  float f = 0.0;
  for (unsigned int g = 0; g < c / e; g++) {
    for (unsigned int h = 0; h < c; h++) {
      f += a[h * c + g];
    }
  }
  b[d] = f;
}

__kernel void C(__global float* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  const unsigned int f = 64;
  const unsigned int g = 4096;
  unsigned int h = c / f;
  float i = 0.0;
  for (unsigned int j = 0; j < h / e; j++) {
    for (unsigned int k = 0; k < h; k++) {
      for (unsigned int l = 0; l < f; l++) {
        for (unsigned int m = 0; m < f; m++) {
          i += a[j * f * c + k * f + m + c * l];
        }
      }
    }
  }
  b[d] = i;
}

__kernel void D(__global float4* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  float4 f = (float4)(0.0);
  for (unsigned int g = 0; g < c * c / 4 / e; g++) {
    float4 h = a[g];
    f.s0 += h.s0;
    f.s1 += h.s1;
    f.s2 += h.s2;
    f.s3 += h.s3;
  }
  b[d] = f.s0 + f.s1 + f.s2 + f.s3;
}

__kernel void E(__global float8* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  float8 f = (float8)(0.0);
  for (unsigned int g = 0; g < c * c / 8 / e; g++) {
    float8 h = a[g];
    f.s0 += h.s0;
    f.s1 += h.s1;
    f.s2 += h.s2;
    f.s3 += h.s3;
    f.s4 += h.s4;
    f.s5 += h.s5;
    f.s6 += h.s6;
    f.s7 += h.s7;
  }
  b[d] = f.s0 + f.s1 + f.s2 + f.s3 + f.s4 + f.s5 + f.s6 + f.s7;
}

__kernel void F(__global float16* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  float16 f = (float16)(0.0);
  for (unsigned int g = 0; g < c * c / 16 / e; g++) {
    float16 h = a[g];
    f.s0 += h.s0;
    f.s1 += h.s1;
    f.s2 += h.s2;
    f.s3 += h.s3;
    f.s4 += h.s4;
    f.s5 += h.s5;
    f.s6 += h.s6;
    f.s7 += h.s7;
    f.s8 += h.s8;
    f.s9 += h.s9;
    f.sA += h.sA;
    f.sB += h.sB;
    f.sC += h.sC;
    f.sD += h.sD;
    f.sE += h.sE;
    f.sF += h.sF;
  }
  b[d] = f.s0 + f.s1 + f.s2 + f.s3 + f.s4 + f.s5 + f.s6 + f.s7 + f.s8 + f.s9 + f.sA + f.sB + f.sC + f.sD + f.sE + f.sF;
}

__kernel void G(__global float16* a, __global float* b, const unsigned int c) {
  unsigned int d = get_group_id(0);
  unsigned int e = get_num_groups(0);
  const unsigned int f = 64 / 16;
  const unsigned int g = 64;
  const unsigned int h = 4096 / 16;
  unsigned int i = c / 16;
  unsigned int j = i * c / e;
  unsigned int k = i / f;
  float16 l = (float16)(0.0);

  for (unsigned int m = 0; m < k / e; m++) {
    for (unsigned int n = 0; n < k; n++) {
      for (unsigned int o = 0; o < g; o++) {
        for (unsigned int p = 0; p < f; p++) {
          unsigned int q = m * g * i + n * f + p + i * o;
          float16 r = a[q + d * j];
          l.s0 += r.s0;
          l.s1 += r.s1;
          l.s2 += r.s2;
          l.s3 += r.s3;
          l.s4 += r.s4;
          l.s5 += r.s5;
          l.s6 += r.s6;
          l.s7 += r.s7;
          l.s8 += r.s8;
          l.s9 += r.s9;
          l.sA += r.sA;
          l.sB += r.sB;
          l.sC += r.sC;
          l.sD += r.sD;
          l.sE += r.sE;
          l.sF += r.sF;
        }
      }
    }
  }
  b[d] = l.s0 + l.s1 + l.s2 + l.s3 + l.s4 + l.s5 + l.s6 + l.s7 + l.s8 + l.s9 + l.sA + l.sB + l.sC + l.sD + l.sE + l.sF;
}

__kernel void H(__global float8* a, __global float* b, const unsigned int c) {
  const int d = 16;
  unsigned int e = get_num_groups(0);
  unsigned int f = c * c / 8 / d / e;
  unsigned int g = get_group_id(0);
  unsigned int h = get_local_id(0);
  __local float i[16];
  float8 j = (float8)(0.0);
  for (unsigned int k = f * h; k < f * (h + 1); k++) {
    float8 l = a[k + g * f];
    j.s0 += l.s0;
    j.s1 += l.s1;
    j.s2 += l.s2;
    j.s3 += l.s3;
    j.s4 += l.s4;
    j.s5 += l.s5;
    j.s6 += l.s6;
    j.s7 += l.s7;
  }
  i[h] = j.s0 + j.s1 + j.s2 + j.s3 + j.s4 + j.s5 + j.s6 + j.s7;
  barrier(1);
  b[g] = i[0] + i[1] + i[2] + i[3] + i[4] + i[5] + i[6] + i[7] + i[8] + i[9] + i[10] + i[11] + i[12] + i[13] + i[14] + i[15];
}

__kernel void I(__global float16* a, __global float* b, const unsigned int c) {
  const int d = 16;
  const int e = get_num_groups(0);
  unsigned int f = c * c / 16 / d / e;
  unsigned int g = get_group_id(0);
  unsigned int h = get_local_id(0);
  __local float i[16];
  float16 j = (float16)(0.0);
  for (unsigned int k = f * h; k < f * (h + 1); k++) {
    float16 l = a[k + g * f];
    j.s0 += l.s0;
    j.s1 += l.s1;
    j.s2 += l.s2;
    j.s3 += l.s3;
    j.s4 += l.s4;
    j.s5 += l.s5;
    j.s6 += l.s6;
    j.s7 += l.s7;
    j.s8 += l.s8;
    j.s9 += l.s9;
    j.sA += l.sA;
    j.sB += l.sB;
    j.sC += l.sC;
    j.sD += l.sD;
    j.sE += l.sE;
    j.sF += l.sF;
  }
  i[h] = j.s0 + j.s1 + j.s2 + j.s3 + j.s4 + j.s5 + j.s6 + j.s7 + j.s8 + j.s9 + j.sA + j.sB + j.sC + j.sD + j.sE + j.sF;
  barrier(1);
  b[g] = i[0] + i[1] + i[2] + i[3] + i[4] + i[5] + i[6] + i[7] + i[8] + i[9] + i[10] + i[11] + i[12] + i[13] + i[14] + i[15];
}

__kernel void J(__global float16* a, __global float* b, const unsigned int c) {
  const int d = 32;
  const int e = get_num_groups(0);
  unsigned int f = c * c / 16 / d / e;
  unsigned int g = get_group_id(0);
  unsigned int h = get_local_id(0);
  __local float i[32];
  float16 j = (float16)(0.0);
  for (unsigned int k = f * h; k < f * (h + 1); k++) {
    float16 l = a[k + g * f];
    j.s0 += l.s0;
    j.s1 += l.s1;
    j.s2 += l.s2;
    j.s3 += l.s3;
    j.s4 += l.s4;
    j.s5 += l.s5;
    j.s6 += l.s6;
    j.s7 += l.s7;
    j.s8 += l.s8;
    j.s9 += l.s9;
    j.sA += l.sA;
    j.sB += l.sB;
    j.sC += l.sC;
    j.sD += l.sD;
    j.sE += l.sE;
    j.sF += l.sF;
  }
  i[h] = j.s0 + j.s1 + j.s2 + j.s3 + j.s4 + j.s5 + j.s6 + j.s7 + j.s8 + j.s9 + j.sA + j.sB + j.sC + j.sD + j.sE + j.sF;
  barrier(1);
  b[g] = 0.0;
  for (int m = 0; m < 32; m++) {
    b[g] += i[m];
  }
}

__kernel void K(__global float16* a, __global float* b, const unsigned int c) {
  const int d = 16;
  const int e = get_num_groups(0);
  unsigned int f = c * c / 16 / d / e;
  unsigned int g = get_group_id(0);
  unsigned int h = get_local_id(0);
  __local float i[16];
  float16 j = (float16)(0.0);
  for (unsigned int k = f * h; k < f * (h + 1); k++) {
    float16 l = a[k + g * f];
    j.s0 += l.s0;
    j.s1 += l.s1;
    j.s2 += l.s2;
    j.s3 += l.s3;
    j.s4 += l.s4;
    j.s5 += l.s5;
    j.s6 += l.s6;
    j.s7 += l.s7;
    j.s8 += l.s8;
    j.s9 += l.s9;
    j.sA += l.sA;
    j.sB += l.sB;
    j.sC += l.sC;
    j.sD += l.sD;
    j.sE += l.sE;
    j.sF += l.sF;
  }
  i[h] = j.s0 + j.s1 + j.s2 + j.s3 + j.s4 + j.s5 + j.s6 + j.s7 + j.s8 + j.s9 + j.sA + j.sB + j.sC + j.sD + j.sE + j.sF;
  barrier(1);
  b[g] = i[0] + i[1] + i[2] + i[3] + i[4] + i[5] + i[6] + i[7] + i[8] + i[9] + i[10] + i[11] + i[12] + i[13] + i[14] + i[15];
}

__kernel void L(__global float16* a, __global float* b, const unsigned int c) {
  const int d = 64;
  const int e = get_num_groups(0);
  unsigned int f = c * c / 16 / d / e;
  unsigned int g = get_group_id(0);
  unsigned int h = get_local_id(0);
  __local float i[64];
  float16 j = (float16)(0.0);
  for (unsigned int k = f * h; k < f * (h + 1); k++) {
    float16 l = a[k + g * f];
    j.s0 += l.s0;
    j.s1 += l.s1;
    j.s2 += l.s2;
    j.s3 += l.s3;
    j.s4 += l.s4;
    j.s5 += l.s5;
    j.s6 += l.s6;
    j.s7 += l.s7;
    j.s8 += l.s8;
    j.s9 += l.s9;
    j.sA += l.sA;
    j.sB += l.sB;
    j.sC += l.sC;
    j.sD += l.sD;
    j.sE += l.sE;
    j.sF += l.sF;
  }
  i[h] = j.s0 + j.s1 + j.s2 + j.s3 + j.s4 + j.s5 + j.s6 + j.s7 + j.s8 + j.s9 + j.sA + j.sB + j.sC + j.sD + j.sE + j.sF;
  barrier(1);
  b[g] = 0.0;
  for (int m = 0; m < d; m++) {
    b[g] += i[m];
  }
}

__kernel void M(__global float16* a, __global float* b, const unsigned int c) {
  const int d = 16;
  unsigned int e = get_num_groups(0);
  unsigned int f = get_group_id(0);
  unsigned int g = get_local_id(0);
  __local float h[16];

  const unsigned int i = 4;
  const unsigned int j = 64 / d;
  const unsigned int k = 256;
  unsigned int l = c / 16;
  unsigned int m = l / i;
  unsigned int n = l * c / e;
  float16 o = (float16)(0.0);

  for (unsigned int p = 0; p < m / e; p++) {
    for (unsigned int q = 0; q < m; q++) {
      for (unsigned int r = g * j; r < (g + 1) * j; r++) {
        for (unsigned int s = 0; s < i; s++) {
          unsigned int t = p * j * l + q * i + s + l * r;

          float16 u = a[t + f * n];
          o.s0 += u.s0;
          o.s1 += u.s1;
          o.s2 += u.s2;
          o.s3 += u.s3;
          o.s4 += u.s4;
          o.s5 += u.s5;
          o.s6 += u.s6;
          o.s7 += u.s7;
          o.s8 += u.s8;
          o.s9 += u.s9;
          o.sA += u.sA;
          o.sB += u.sB;
          o.sC += u.sC;
          o.sD += u.sD;
          o.sE += u.sE;
          o.sF += u.sF;
        }
      }
    }
  }
  h[g] = o.s0 + o.s1 + o.s2 + o.s3 + o.s4 + o.s5 + o.s6 + o.s7 + o.s8 + o.s9 + o.sA + o.sB + o.sC + o.sD + o.sE + o.sF;
  barrier(1);
  b[f] = h[0] + h[1] + h[2] + h[3] + h[4] + h[5] + h[6] + h[7] + h[8] + h[9] + h[10] + h[11] + h[12] + h[13] + h[14] + h[15];
}