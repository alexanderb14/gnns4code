__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = get_local_id(1);
  int e = get_local_id(0);
  int f = get_group_id(1) * 16 * 1;
  int g = get_group_id(0) * 16 * 1;

  __local float h[16 * 1 + ((17 / 2) * 2)][(16 * 1 + ((17 / 2) * 2) + ((32 - (((17 / 2) * 2) + 16 * 1 - 16)) & 31))];

  for (int i = d; i < min(16 * 1 + ((17 / 2) * 2), (4096 + ((17 / 2) * 2))); i += 16) {
    for (int j = e; j < min(16 * 1 + ((17 / 2) * 2), (4096 + ((17 / 2) * 2))); j += 16) {
      h[i][j] = b[(f + i) * (4096 + ((17 / 2) * 2)) + (g + j)];
    }
  }
  barrier(1);

  float k[1][1];
  for (int l = 0; l < 1; l++) {
    for (int m = 0; m < 1; m++) {
      k[l][m] = 0.0f;
    }
  }

  for (int i = 0; i < 17; i++) {
    for (int j = 0; j < 17; j++) {
      for (int l = 0; l < 1; l++) {
        for (int m = 0; m < 1; m++) {
          k[l][m] += h[d + l * 16 + i][e + m * 16 + j] * c[i * 17 + j];
        }
      }
    }
  }

  for (int l = 0; l < 1; l++) {
    for (int m = 0; m < 1; m++) {
      a[(f + d + l * 16) * 4096 + g + e + m * 16] = k[l][m];
    }
  }
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  int d = get_group_id(0) * get_local_size(0) + get_local_id(0);
  int e = get_group_id(1) * get_local_size(1) + get_local_id(1);
  int f, g;
  float h = 0.0;

  if (e < 4096 && d < 4096) {
    for (g = 0; g < 17; g++) {
      for (f = 0; f < 17; f++) {
        h += b[(e + g) * (4096 + ((17 / 2) * 2)) + (d + f)] * c[g * 17 + f];
      }
    }

    a[e * 4096 + d] = h;
  }
}