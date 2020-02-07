__kernel void A(__global uint4* a, __global uchar4* b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);
  int f = get_global_size(0);
  int g = get_global_size(1);
  int h = (c - 1) / 2;

  if (d < h || e < h || d > f - h - 1 || e > g - h - 1) {
    b[d + e * f] = (uchar4)(0);
    return;
  }

  int4 i = (int4)(c * c);

  int2 j = (int2)(d - h, e - h);
  int2 k = (int2)(d + h, e - h);
  int2 l = (int2)(d + h, e + h);
  int2 m = (int2)(d - h, e + h);

  int4 n = (int4)(0);
  int4 o = (int4)(0);
  int4 p = (int4)(0);
  int4 q = (int4)(0);

  j.x -= 1;
  j.y -= 1;
  k.y -= 1;
  m.x -= 1;

  if (j.x >= 0 && j.y >= 0) {
    n = convert_int4(a[j.x + j.y * f]);
  }
  if (k.x >= 0 && k.y >= 0) {
    o = convert_int4(a[k.x + k.y * f]);
  }
  if (m.x >= 0 && m.y >= 0) {
    q = convert_int4(a[m.x + m.y * f]);
  }
  p = convert_int4(a[l.x + l.y * f]);

  b[d + e * f] = convert_uchar4((n + p - o - q) / i);
}

__kernel void B(__global uchar4* a, __global uint4* b, int c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = f + g * e;

  int i = __clc_pow((float)d, (float)c);

  uint4 j = 0;

  for (int k = 0; k < d; k++) {
    if ((f - (k * i)) < 0) {
      b[h] = j;
      return;
    }

    j += convert_uint4(a[h - (k * i)]);
  }

  b[h] = j;
}

__kernel void C(__global uint4* a, __global uint4* b, int c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = f + g * e;

  int i = __clc_pow((float)d, (float)c);

  uint4 j = 0;

  for (int k = 0; k < d; k++) {
    if (f - (k * i) < 0) {
      b[h] = j;
      return;
    }
    j += a[h - (k * i)];
  }

  b[h] = j;
}

__kernel void D(__global uint4* a, __global uint4* b, int c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);

  int h = __clc_pow((float)d, (float)c);

  uint4 i = (uint4)(0);

  for (int j = 0; j < d; j++) {
    if (g - (j * h) < 0) {
      b[f + g * e] = i;
      return;
    }

    i += a[f + e * (g - (j * h))];
  }

  b[f + g * e] = i;
}
__kernel void E(__global uchar4* a, __global uchar4* b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  int h = d + e * f;
  int i = (c - 1) / 2;

  if (d < i || d >= (f - i)) {
    b[h] = (uchar4)(0);
    return;
  }

  int4 j = (int4)(c);

  int4 k = 0;

  for (int l = -i; l < i; l = l + 2) {
    k += convert_int4(a[h + l]);
    k += convert_int4(a[h + l + 1]);
  }
  k += convert_int4(a[h + i]);
  b[h] = convert_uchar4(k / j);
}

__kernel void F(__global uchar4* a, __global uchar4* b, int c) {
  int d = get_global_id(0);
  int e = get_global_id(1);

  int f = get_global_size(0);
  int g = get_global_size(1);

  int h = d + e * f;
  int i = (c - 1) / 2;

  if (e < i || e >= (g - i)) {
    b[h] = (uchar4)(0);
    return;
  }

  int4 j = (int4)(c);

  int4 k = 0;

  for (int l = -i; l < i; l = l + 2) {
    k += convert_int4(a[h + l * f]);
    k += convert_int4(a[h + (l + 1) * f]);
  }
  k += convert_int4(a[h + i * f]);
  b[h] = convert_uchar4(k / j);
}

__kernel void G(__global uchar4* a, __global uchar4* b, int c, __local uchar4* d) {
  int e = get_global_id(0);
  int f = get_global_id(1);

  int g = get_global_size(0);
  int h = get_global_size(1);

  int i = e + f * g;
  int j = (c - 1) / 2;

  int k = get_local_id(0);
  int l = get_group_id(0);
  int m = get_group_id(1);

  int n = get_local_size(0);
  int o = get_local_size(1);

  int p = n * l + g * m * o;

  if (k < j) {
    d[k] = a[p - j + k];
    d[256 + j + k] = a[p + k + 256];
  }

  d[k + j] = a[p + k];

  barrier(1);

  if (e < j || e >= (g - j))
    return;

  int4 q = (int4)(c);

  int4 r = 0;

  for (int s = -j; s <= j; s++) {
    r += convert_int4(d[k + s + j]);
  }
  b[i] = convert_uchar4(r / q);
}