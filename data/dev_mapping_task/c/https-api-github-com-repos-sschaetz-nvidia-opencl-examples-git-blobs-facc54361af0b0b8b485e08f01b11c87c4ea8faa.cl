int A(int a, int b, int c) {
  return max(b, min(c, a));
}

uint B(float a, float b, float c) {
  a = clamp(a, 0.0f, 255.0f);
  b = clamp(b, 0.0f, 255.0f);
  c = clamp(c, 0.0f, 255.0f);
  return (convert_uint(c) << 16) + (convert_uint(b) << 8) + convert_uint(a);
}

uint C(__global uint* a, int b, int c, int d, int e) {
  b = A(b, 0, d - 1);
  c = A(c, 0, e - 1);
  return a[c * d + b];
}
__kernel void D(__global uint* a, __global uint* b, int c, int d, int e, int f, float g, float h, __local uint* i) {
  const int j = get_local_id(0);
  const int k = get_local_id(1);
  const int l = get_local_size(0);
  const int m = get_local_size(1);
  const int n = get_global_id(0);
  const int o = get_global_id(1);

  if (n >= c || o >= d)
    return;

  i[(f + k) * e + (f + j)] = C(a, n, o, c, d);

  if (j < f) {
    i[(f + k) * e + (j)] = C(a, n - f, o, c, d);

    i[(f + k) * e + (f + l + j)] = C(a, n + l, o, c, d);
  }
  if (k < f) {
    i[(k)*e + (f + j)] = C(a, n, o - f, c, d);

    i[(f + m + k) * e + (f + j)] = C(a, n, o + m, c, d);
  }

  if ((j < f) && (k < f)) {
    i[(k)*e + (j)] = C(a, n - f, o - f, c, d);

    i[(f + m + k) * e + (j)] = C(a, n - f, o + m, c, d);

    i[(k)*e + (f + l + j)] = C(a, n + m, o - f, c, d);

    i[(f + m + k) * e + (f + l + j)] = C(a, n + l, o + m, c, d);
  }

  barrier(1);

  float p = 0.0f;
  float q = 0.0f;
  float r = 0.0f;
  float s = 0.0f;

  for (int t = -f; t <= f; t++) {
    for (int u = -f; u <= f; u++) {
      uint v = i[(f + k + t) * e + (f + j + u)];

      float w = u * u + t * t;
      if (w <= f * f) {
        float x = convert_float(v & 0x0ff);
        float y = convert_float((v >> 8) & 0x0ff);
        float z = convert_float((v >> 16) & 0x0ff);

        float aa = (x + y + z) * 0.001307189542f;
        if (aa > g) {
          x *= h;
          y *= h;
          z *= h;
        }

        p += x;
        q += y;
        r += z;
        s += 1.0f;
      }
    }
  }

  p /= s;
  q /= s;
  r /= s;

  b[o * c + n] = B(p, q, r);
}