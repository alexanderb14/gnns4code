__kernel void A(__global float* a, int b, int c) {
  int d, e;
  __local float f[64][64];

  int g = c * b + c;
  for (d = 0; d < 64; d++) {
    f[d][get_local_id(0)] = a[g + get_local_id(0)];
    g += b;
  }
  barrier(1);

  for (d = 0; d < 64 - 1; d++) {
    if (get_local_id(0) > d) {
      for (e = 0; e < d; e++)
        f[get_local_id(0)][d] -= f[get_local_id(0)][e] * f[e][d];
      f[get_local_id(0)][d] /= f[d][d];

      barrier(1);

      for (e = 0; e < d + 1; e++)
        f[d + 1][get_local_id(0)] -= f[d + 1][e] * f[e][get_local_id(0)];

      barrier(1);
    }
  }

  g = (c + 1) * b + c;
  for (d = 1; d < 64; d++) {
    a[g + get_local_id(0)] = f[d][get_local_id(0)];
    g += b;
  }
}

__kernel void B(__global float* a, int b, int c) {
  __local float d[64][64];
  __local float e[64][64];
  __local float f[64][64];

  int g, h, i;
  int j;

  if (get_local_id(0) < 64) {
    j = get_local_id(0);

    i = c * b + c;
    for (g = 0; g < 64 / 2; g++) {
      d[g][j] = a[i + j];
      i += b;
    }

    i = c * b + c;
    for (g = 0; g < 64; g++) {
      e[g][j] = a[i + (get_group_id(0) + 1) * 64 + j];
      i += b;
    }

  } else {
    j = get_local_id(0) - 64;

    i = (c + 64 / 2) * b + c;
    for (g = 64 / 2; g < 64; g++) {
      d[g][j] = a[i + j];
      i += b;
    }

    i = (c + (get_group_id(0) + 1) * 64) * b + c;
    for (g = 0; g < 64; g++) {
      f[g][j] = a[i + j];
      i += b;
    }
  }
  barrier(1);

  if (get_local_id(0) < 64) {
    j = get_local_id(0);
    for (g = 1; g < 64; g++) {
      for (h = 0; h < g; h++)
        e[g][j] -= d[g][h] * e[h][j];
    }

    i = (c + 1) * b + c;
    for (g = 1; g < 64; g++) {
      a[i + (get_group_id(0) + 1) * 64 + j] = e[g][j];
      i += b;
    }
  } else {
    j = get_local_id(0) - 64;
    for (g = 0; g < 64; g++) {
      for (h = 0; h < g; h++)
        f[j][g] -= f[j][h] * d[h][g];
      f[j][g] /= d[g][g];
    }

    barrier(1);

    i = (c + (get_group_id(0) + 1) * 64) * b + c;
    for (g = 0; g < 64; g++) {
      a[i + j] = f[g][j];
      i += b;
    }
  }
}

__kernel void C(__global float* a, int b, int c) {
  __local float d[64][64];
  __local float e[64][64];

  int f;
  float g;

  int h = c + (get_group_id(1) + 1) * 64;
  int i = c + (get_group_id(0) + 1) * 64;

  d[get_local_id(1)][get_local_id(0)] = a[(c + get_local_id(1)) * b + i + get_local_id(0)];
  e[get_local_id(1)][get_local_id(0)] = a[(h + get_local_id(1)) * b + c + get_local_id(0)];

  barrier(1);

  g = 0;
  for (f = 0; f < 64; f++)
    g += e[get_local_id(1)][f] * d[f][get_local_id(0)];
  a[(h + get_local_id(1)) * b + i + get_local_id(0)] -= g;
}