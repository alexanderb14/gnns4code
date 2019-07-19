__kernel void A(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = a[d] + b[d];
}

__kernel void B(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = a[d] * b[d];
}

__kernel void C(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = dot(a[d], b[d]);
}

__kernel void D(__global float* a, __global float* b, const int c, const int d) {
  float e = (float)c;
  for (int f = 0; f < c; f++) {
    for (int g = 0; g < d; g++) {
      b[g] += a[f * d + g];
      b[g] /= e;
    }
  }
}

__kernel void E(__global float* a, __global float* b, const int c, const int d) {
  int e = get_global_id(0);
  for (int f = 0; f < d - 1; f++) {
    b[e * d + f] = (float)(e * d + f);
  }
}

__kernel void F(__global float* a, __local float* b, __global float* c, __const int d) {
  int e = get_global_id(0);
  float f = 0.0;

  while (e < d) {
    float g = a[e];
    f += g;
    e += get_global_size(0);
  }

  int h = get_local_id(0);
  b[h] = f;
  barrier(1);
  for (int i = get_local_size(0) / 2; i > 0; i >>= 1) {
    if (h < i) {
      b[h] += b[h + i];
    }
    barrier(1);
  }

  if (h == 0) {
    c[get_group_id(0)] = b[0];
  }
}

inline float G(__global float* a, __global float* b, const int c) {
  float d = 0.0f;
  for (int e = 0; e < c; e++) {
    d += a[e] * b[e];
  }
  return d;
}

inline float H(__global float* a, __global float* b, const int c) {
  float d = 0.0f;
  for (int e = 0; e < c; e++) {
    d += a[e] * b[e];
  }
  return d;
}

inline float I(__global float* a, __global float* b, const int c) {
  float d = H(a, b, c);
  float e = __clc_pow(0x1.5bf0a8p+1f, -d);
  float f = __clc_pow(1.0f + e, -1.0f);
  return f;
}

__kernel void J(__global float* a, __global float* b, __global float* c, const int d, const int e) {
  int f = get_global_id(0);
  c[f] = I(&a[f * e], b, e);
}

__kernel void K(__global float* a, __global float* b, __global float* c, const int d) {
  *c = G(a, b, d);
}

__kernel void L(__global float* a, __global float* b, __global float* c) {
  int d = get_global_id(0);
  c[d] = __clc_pow(a[d], b[d]);
}

__kernel void M(__global float* a, __global float* b, __global float* c, const int d) {
  int e = get_global_id(0);
  int f = get_global_size(0);
  float g = (float)d;

  c[e] = a[e];
  barrier(2);

  for (int h = f / 2; h > 0; h >>= 1) {
    if (e < h) {
      c[e] += c[e + h];
    }
    barrier(2);
  }

  b[e] = c[e];
}

__kernel void N(__global float* a, __global float* b, __local float* c, const int d) {
  int e = get_local_id(0);
  int f = get_global_id(0);
  int g = get_local_size(0);
  float h = (float)d;

  c[e] = a[f];
  barrier(1);

  for (int i = g / 2; i > 0; i >>= 1) {
    if (e < i) {
      c[e] += c[e + i];
    }
    barrier(1);
  }

  if (e == 0) {
    b[get_group_id(0)] = c[0];
  }
}

inline void O(__global float* a, __global float* b, __local float* c, const int d, const int e) {
  int f = get_local_id(0);
  int g = get_global_id(0);
  float h = (float)d;

  for (int i = 0; i < e; i++) {
    c[f * e + i] = a[g * e + i];
  }

  barrier(1);
  for (int j = d / 2; j > 0; j >>= 1) {
    if (f < j) {
      for (int i = 0; i < e; i++) {
        c[f * e + i] += c[f * e + j * e + i];
      }
    }
    barrier(1);
  }

  if (f == 0) {
    for (int i = 0; i < e; i++) {
      b[get_group_id(0) + i] = c[0 + i] / h;
    }
  }
}

__kernel void P(__global float* a, __global float* b, __local float* c, const int d, const int e) {
  O(a, b, c, d, e);
}