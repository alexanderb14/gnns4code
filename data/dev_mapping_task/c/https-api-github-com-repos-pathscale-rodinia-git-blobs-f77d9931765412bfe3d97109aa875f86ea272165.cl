__kernel void A(__global float* a, __local float* b, int c, int d) {
  int e, f;
  int g = get_local_id(0);

  int h = d * c + d;
  for (e = 0; e < 16; e++) {
    b[e * 16 + g] = a[h + g];
    h += c;
  }

  barrier(1);

  for (e = 0; e < 16 - 1; e++) {
    if (g > e) {
      for (f = 0; f < e; f++)
        b[g * 16 + e] -= b[g * 16 + f] * b[f * 16 + e];
      b[g * 16 + e] /= b[e * 16 + e];
    }

    barrier(1);
    if (g > e) {
      for (f = 0; f < e + 1; f++)
        b[(e + 1) * 16 + g] -= b[(e + 1) * 16 + f] * b[f * 16 + g];
    }

    barrier(1);
  }

  h = (d + 1) * c + d;
  for (e = 1; e < 16; e++) {
    a[h + g] = b[e * 16 + g];
    h += c;
  }
}

__kernel void B(__global float* a, __local float* b, __local float* c, __local float* d, int e, int f) {
  int g, h, i;
  int j;

  int k = get_group_id(0);
  int l = get_local_id(0);

  if (l < 16) {
    j = l;
    i = f * e + f;
    for (g = 0; g < 16 / 2; g++) {
      b[g * 16 + j] = a[i + j];
      i += e;
    }

    i = f * e + f;
    for (g = 0; g < 16; g++) {
      c[g * 16 + j] = a[i + (k + 1) * 16 + j];
      i += e;
    }

  } else {
    j = l - 16;

    i = (f + 16 / 2) * e + f;
    for (g = 16 / 2; g < 16; g++) {
      b[g * 16 + j] = a[i + j];
      i += e;
    }

    i = (f + (k + 1) * 16) * e + f;
    for (g = 0; g < 16; g++) {
      d[g * 16 + j] = a[i + j];
      i += e;
    }
  }
  barrier(1);

  if (l < 16) {
    j = l;
    for (g = 1; g < 16; g++) {
      for (h = 0; h < g; h++)
        c[g * 16 + j] -= b[g * 16 + h] * c[h * 16 + j];
    }
  } else {
    j = l - 16;
    for (g = 0; g < 16; g++) {
      for (h = 0; h < g; h++)
        d[j * 16 + g] -= d[j * 16 + h] * b[h * 16 + g];
      d[j * 16 + g] /= b[g * 16 + g];
    }
  }

  barrier(1);

  if (l < 16) {
    j = l;
    i = (f + 1) * e + f;
    for (g = 1; g < 16; g++) {
      a[i + (k + 1) * 16 + j] = c[g * 16 + j];
      i += e;
    }
  } else {
    j = l - 16;
    i = (f + (k + 1) * 16) * e + f;
    for (g = 0; g < 16; g++) {
      a[i + j] = d[g * 16 + j];
      i += e;
    }
  }
}

__kernel void C(__global float* a, __local float* b, __local float* c, int d, int e) {
  int f = get_group_id(0);
  int g = get_group_id(1);

  int h = get_local_id(0);
  int i = get_local_id(1);

  int j;
  float k;

  int l = e + (g + 1) * 16;
  int m = e + (f + 1) * 16;

  b[i * 16 + h] = a[(e + i) * d + m + h];
  c[i * 16 + h] = a[(l + i) * d + e + h];

  barrier(1);

  k = 0;
  for (j = 0; j < 16; j++)
    k += c[i * 16 + j] * b[j * 16 + h];
  a[(l + i) * d + m + h] -= k;
}