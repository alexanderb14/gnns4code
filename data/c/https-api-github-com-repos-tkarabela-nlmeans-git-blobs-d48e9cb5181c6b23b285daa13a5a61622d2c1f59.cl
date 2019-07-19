float A(global const float* a, constant const float* b, int c, int d, int e, int f, int g, int h) {
  float i = 0.0f;

  for (int j = -2; j <= 2; j++)
    for (int k = -2; k <= 2; k++) {
      float l = a[(c + j) * h + (d + k)] - a[(e + j) * h + (f + k)];
      float m = l * l * b[(j + 2) * (2 * 2 + 1) + k + 2];
      i += m;
    }

  return i;
}

float B(global const float* a, constant const float* b, int c, int d, int e, int f, float g) {
  float h = 0.0f;
  float i = 0.0f;

  for (int j = -3; j <= 3; j++)
    for (int k = -3; k <= 3; k++) {
      int l = e + j;
      int m = f + k;

      float n = exp(-A(a, b, e, f, l, m, c, d) / g);
      h += n;

      i += a[(l)*d + (m)] * n;
    }

  return i / h;
}

kernel void C(global const float* a, global float* b, constant const float* c, int d, int e, float f) {
  int g = get_group_id(0);
  int h = get_num_groups(0);
  int i = get_local_id(0);
  int j = get_local_size(0);

  float k = f * f;

  for (int l = g; l < d; l += h) {
    for (int m = i; m < e; m += j) {
      float n;

      if (l > 2 + 3 && l < d - 2 - 3 && m > 2 + 3 && m < e - 2 - 3) {
        n = B(a, c, d, e, l, m, k);
      } else {
        n = a[(l)*e + (m)];
      }

      b[(l)*e + (m)] = n;
    }
  }
}