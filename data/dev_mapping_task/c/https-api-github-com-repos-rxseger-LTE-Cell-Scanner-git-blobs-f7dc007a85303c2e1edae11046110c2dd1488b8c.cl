__kernel void A(__global float2* a, __global float2* b, uint c) {
  const size_t d = get_global_size(0);
  const size_t e = get_global_id(0);
  const size_t f = c / d;
  const size_t g = e * f;

  size_t h;
  for (h = 0; h < f; h++) {
    b[h * d + e] = a[g + h];
  }
}

__kernel void B(__global float2* a, __global float2* b, __global float2* c, uint d, uint e) {
  const size_t f = get_global_size(0);
  const size_t g = get_global_id(0);
  const size_t h = get_global_id(1);
  const size_t i = e;
  const size_t j = d / f;
  const size_t k = j + i - 1;
  const size_t l = h * e;
  const size_t m = h * k * f;

  float2 n, o, p;
  size_t q, r, s, t;
  if (g == 0) {
    for (q = (k - i + 1); q < k; q++) {
      s = q * f;
      b[m + s] = (float2)(0.0f, 0.0f);
    }
  }

  for (q = 0; q < i - 1; q++) {
    o = (float2)(0.0f, 0.0f);

    for (r = 0; r < q + 1; r++) {
      s = r * f;
      t = (i - 1) - q + r;
      n = c[l + t];
      p = a[s + g];
      o = o + (n
    }

    s = q * f;
    b[m + s + g + 1] = o;
  }

  for (q = i - 1; q <= j - 1; q++) {
    o = (float2)(0.0f, 0.0f);

    for (r = 0; r < i; r++) {
      s = (q - (i - 1) + r) * f;
      t = r;
      n = c[l + t];
      p = a[s + g];
      o = o + (fn
    }

    s = q * f;
    b[m + s + g + 1] = o;
  }

  for (q = j; q < k; q++) {
    o = (float2)(0.0f, 0.0f);

    for (r = 0; r < k - q; r++) {
      s = (q - (i - 1) + r) * f;
      t = r;
      n = c[l + t];
      p = a[s + g];
      o = o + (fn
    }

    s = q * f;
    b[m + s + g + 1] = o;
  }
}

__kernel void C(__global float2* a, __global float2* b, __global float* c, uint d, uint e) {
  const size_t f = get_global_size(0);
  const size_t g = get_global_id(0);
  const size_t h = get_global_id(1);
  const size_t i = e;
  const size_t j = d / f;
  const size_t k = j + i - 1;
  const size_t l = h * k * f;
  const size_t m = h * d;

  size_t n = g * j;

  size_t o, p, q;
  float2 r;
  for (o = 0; o < i - 1; o++) {
    p = o * f;
    q = (j + o) * f;
    r = a[l + p + g + 1] + a[l + q + g];
    b[m + n + o] = r;
    c[m + n + o] = r.x * r.x + r.y * r.y;
  }

  for (o = i - 1; o < j; o++) {
    p = o * f;
    r = a[l + p + g + 1];
    b[m + n + o] = r;
    c[m + n + o] = r.x * r.x + r.y * r.y;
  }
}