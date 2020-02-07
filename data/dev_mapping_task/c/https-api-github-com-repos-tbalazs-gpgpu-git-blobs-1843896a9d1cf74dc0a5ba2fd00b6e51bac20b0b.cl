__kernel void A(const int a, const int b, __global float* c, __global float* d, __global float* e, __global float* f) {
  int g = get_global_id(0);
  if (g < a) {
    float h = f[g];
    for (int i = 0; i < b; ++i) {
      h += d[i + g * b] * e[i];
    }
    c[g] = h;
  }
}

__kernel void B(const int a, __global float* b, __global float* c, __global float* d, __global float* e) {
  int f = get_group_id(0);
  int g = get_local_id(0);

  __local float h[32];

  h[g] = c[f * 32 + g] * d[g];

  for (int i = 32 / 2; i > 0; i >>= 1) {
    barrier(1);
    if (g + i < 32) {
      h[g] += h[g + i];
    }
  }

  if (g == 0) {
    b[f] = h[0] + e[f];
  }
}

__kernel void C(const int a, const int b, __global float* c, __global float* d, __global float* e, __global float* f) {
  __local float g[8 * 2];

  int h = get_local_id(0) / 2;
  int i = get_local_id(0) % 2;

  for (int j = h; j < a; j += 8) {
    g[h * 2 + i] = 0.0f;
    for (int k = i; k < b; k += 2) {
      g[h * 2 + i] += d[k + j * b] * e[k];
    }

    for (int l = 2 / 2; l > 0; l >>= 1) {
      barrier(1);
      if (i + l < 2) {
        g[h * 2 + i] += g[h * 2 + i + l];
      }
    }

    if (i == 0) {
      c[j] = g[h * 2 + 0] + f[j];
    }
  }
}

__kernel void D(const int a, const int b, __global float* c) {
  int d = get_local_id(0);

  for (int e = 0; e < b; ++e) {
    float f = c[e + e * a];
    float g = c[e + d * a] / f;
    barrier(2);
    if (d != e) {
      for (int h = 0; h < a; ++h) {
        c[h + d * a] = c[h + d * a] - g * c[h + a * e];
      }
    }
    barrier(2);
  }

  float g = c[d + d * a];
  for (int h = 0; h < a; ++h) {
    c[h + d * a] = c[h + d * a] / g;
  }
}