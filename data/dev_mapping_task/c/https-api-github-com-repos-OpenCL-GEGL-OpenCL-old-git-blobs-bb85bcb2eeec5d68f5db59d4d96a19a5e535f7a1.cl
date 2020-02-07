__kernel void A(__global const float4* a, __global float4* b, int c, int d) {
  const int e = get_global_id(0) * (c + 2 * d) + (d + get_global_id(1));

  const int f = get_global_id(0) * c + get_global_id(1);
  int g;
  float4 h;

  h = (float4)(0.0f);

  if (get_global_id(1) < c) {
    for (g = -d; g <= d; g++) {
      h += a[e + g];
    }
    b[f] = h / (float)(2 * d + 1);
  }
}

__kernel void B(__global const float4* a, __global float4* b, int c, int d) {
  const int e = get_global_id(0) * c + get_global_id(1);
  int f;
  float4 g;

  g = (float4)(0.0f);
  int h = get_global_id(0) * c + get_global_id(1);

  if (get_global_id(1) < c) {
    for (f = -d; f <= d; f++) {
      g += a[h];
      h += c;
    }
    b[e] = g / (float)(2 * d + 1);
  }
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void C(__global const float4* a, __global float4* b, __local float4* c, const int d, const int e, const int f, const int g) {
  const int h = get_local_id(0);
  const int i = 2 * f;
  const int j = i + d;
  const int k = i + e;
  const float4 l = (float4)((i + 1) * (i + 1));
  int m, n;
  int o = get_global_id(1) * g;
  const int p = get_group_id(0) * (get_local_size(0) - i) + h - f;
  const int q = p + f;
  int r = g;
  int s = 0;
  float4 t = (float4)0.0f;
  float4 u = (float4)0.0f;

  if (q < j) {
    m = o;
    n = o + i;

    for (int v = 0; v < i + 1; ++v) {
      t += a[(o + v) * j + q];
    }

    c[h] = t;
  }

  barrier(1);

  while (1) {
    if (p < d) {
      if (h >= f && h < get_local_size(0) - f) {
        u = (float4)0.0f;

        for (int v = 0; v < i + 1; ++v) {
          u += c[h - f + v];
        }

        b[o * d + p] = u / l;
      }
    }

    if (--r == 0 || o == e - 1)
      break;

    barrier(1);

    ++o;

    if (q < j) {
      t = c[h];
      t -= a[(m)*j + q];
      t += a[(n + 1) * j + q];
      ++m;
      ++n;
      c[h] = t;
    }

    barrier(1);
  }
}