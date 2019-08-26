__kernel void A(__global float* a, int b) {
  unsigned int c = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (c < b) {
    a[c] = 1.0f;
  }
}

__kernel void B(__global float* a, __global float* b, int c, __global float* d, __global float* e, int f) {
  unsigned int g = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (g < c) {
    d[g] = b[g] * a[(f * c) + g];
    e[g] = 1.0f;
  }
}

__kernel void C(int a, __global float* b, int c, __global float* d, int e) {
  unsigned int f = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (f < a) {
    b[c + f] = b[c + f] * d[(e * a) + f];
  }
}

__kernel void D(int a, __global float* b, int c, float d) {
  unsigned int e = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (e < a) {
    b[c + e] = b[c + e] / d;
  }
}

__kernel void E(int a, __global float* b, int c, float d) {
  unsigned int e = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (e < a) {
    b[c + e] = 1.0f / d;
  }
}

__kernel void F(__global float* a, __global float* b, float c, int d, int e, int f) {
  unsigned int g = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (g < d) {
    a[(f * d) + g] = a[((f + 1) * d) + g] * b[(e * d) + g] / c;
  }
}

__kernel void G(__global float* a, __global float* b, __global float* c, int d, int e) {
  unsigned int f = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (f < d) {
    a[f] += b[(e * d) + f] * c[(e * d) + f];
  }
}

__kernel void H(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, float f, int g, int h, int i) {
  unsigned int j = get_group_id(0) * get_local_size(0) + get_local_id(0);

  unsigned int k = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (j < g && k < g) {
    a[(k * g) + j] += d[(i * g) + k] * b[(k * g) + j] * c[(h * g) + j] * e[((i + 1) * g) + j] / f;
  }
}

__kernel void I(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, float f,

                int g, int h) {
  unsigned int i = get_group_id(0) * get_local_size(0) + get_local_id(0);

  unsigned int j = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (i < g && j < g) {
    a[(j * g) + i] = d[(j * g) + i] / (e[j] - b[(h * g) + j] * c[(h * g) + j] / f);
  }
}

__kernel void J(__global float* a, __global float* b, int c) {
  unsigned int d = get_group_id(0) * get_local_size(0) + get_local_id(0);

  unsigned int e = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (d < c && e < c) {
    a[(e * c) + d] = a[(e * c) + d] / b[e];
  }
}

__kernel void K(__global float* a, __global float* b, __global float* c, float d, int e, int f, int g, int h) {
  unsigned int i = get_group_id(0) * get_local_size(0) + get_local_id(0);

  unsigned int j = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (j < f && i < e && g == j) {
    a[(j * e) + i] += b[(h * e) + i] * c[(h * e) + i] / d;
  }
}

__kernel void L(__global float* a, __global float* b, int c, int d) {
  unsigned int e = get_group_id(0) * get_local_size(0) + get_local_id(0);

  unsigned int f = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (f < d && e < c) {
    a[(f * c) + e] = a[(f * c) + e] / b[e];
  }
}

__kernel void M(__global float* a, __global float* b, int c, int d) {
  unsigned int e = get_group_id(0) * get_local_size(0) + get_local_id(0);

  unsigned int f = get_group_id(1) * get_local_size(1) + get_local_id(1);

  if (e < c && f < d) {
    if (a[(f * c) + e] == 0) {
      a[(f * c) + e] = 1e-10;
    } else {
      a[(f * c) + e] = a[(f * c) + e] / b[e];
    }
  }
}

__kernel void N(__global float* a, __global float* b, __global float* c, float d, int e) {
  unsigned int f = get_group_id(0) * get_local_size(0) + get_local_id(0);

  if (f < e) {
    a[f] = b[f] * c[f] / d;
  }
}

__kernel void O(int a, __global float* b, int c, __global float* d, int e, __global float* f) {
  unsigned int g;
  unsigned int h = get_local_id(0);
  unsigned int i = get_num_groups(0) * (128);
  unsigned int j = (128) * get_group_id(0);

  for (g = j + h; g < a; g += i) {
    f[g] = b[c + g] * d[e + g];
  }
}

__kernel void P(int a, int b, __global float* c, int d, __global float* e, int f, __global float* g, int h) {
  unsigned int i, j;
  unsigned int k = get_local_id(0);
  unsigned int l = get_num_groups(0) * (128);
  unsigned int m = (128) * get_group_id(0);
  int n, o;

  float p;
  if (d == a) {
    n = b;
    o = a;
  } else {
    n = a;
    o = b;
  }

  for (i = m + k; i < o; i += l) {
    p = 0.f;
    for (j = 0; j < n; j++) {
      p += c[i * n + j] * e[j + f];
    }
    g[i + h] = p;
  }
}

__kernel void Q(int a, int b, __global float* c, int d, __global float* e, int f, __global float* g, int h) {
  unsigned int i, j;
  unsigned int k = get_local_id(0);
  unsigned int l = get_num_groups(0) * (128);
  unsigned int m = (128) * get_group_id(0);
  int n, o;

  float p;
  if (d == a) {
    n = b;
    o = a;
  } else {
    n = a;
    o = b;
  }

  for (i = m + k; i < o; i += l) {
    p = 0.f;
    for (j = 0; j < n; j++) {
      p += c[j * n + i] * e[j + f];
    }
    g[i + h] = p;
  }
}