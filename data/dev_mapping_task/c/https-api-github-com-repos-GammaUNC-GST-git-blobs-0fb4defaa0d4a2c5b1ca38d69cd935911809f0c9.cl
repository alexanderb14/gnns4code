int A(int a, int b) {
  return abs(a - (int)(a >= b) * (a - b + 2));
}

int B(__local int* a, uint b, uint c) {
  const uint d = 2 * get_local_size(1);
  return a[c * d + b];
}

void C(__local int* a, uint b, uint c, int d) {
  const uint e = 2 * get_local_size(1);
  a[c * e + b] = d;
}

void D(__local int* a, __local int* b, uint c, uint d, uint e, uint f) {
  const uint g = 2 * c;
  const int h = f + A((int)(g)-1, (int)e) / 2;
  const int i = f + A((int)(g) + 1, (int)e) / 2;

  const int j = B(a, (uint)h, d);
  const int k = B(a, (uint)i, d);

  C(b, d, g, B(a, c, d) - (j + k + 2) / 4);
}

void E(__local int* a, __local int* b, uint c, uint d, uint e, uint f) {
  const uint g = f + c;
  const int h = A((int)(2 * c), e);
  const int i = A((int)(2 * c) + 2, e);

  const int j = B(b, d, h);
  const int k = B(b, d, i);

  C(b, d, 2 * c + 1, B(a, g, d) + (j + k) / 2);
}

__kernel void F(const __global uchar* a, const __constant uint* b, __local int* c, __global char* d) {
  const int e = get_local_id(0);
  const int f = get_local_id(1);
  const int g = 2 * get_local_size(1);
  const int h = g * g;
  const int i = 4 * get_global_size(0) * get_global_size(1);
  const __global uchar* j = a + b[4 * (get_global_id(2) / 6)] + (get_global_id(2) % 6) * i;

  __global char* k = d + get_global_id(2) * i;
  {
    const uint l = get_group_id(1) * get_num_groups(0) + get_group_id(0);
    const __global uchar* m = j + l * h;

    const uint n = 4 * (f * get_local_size(0) + e);
    for (int o = 0; o < 4; ++o) {
      c[n + o] = ((int)(m[n + o])) - 128;
    }

    barrier(1);
  }
  __local int* p = c;
  __local int* q = c + h;

  const uint r = 31 - clz(g);
  for (uint o = 0; o < r - 1; ++o) {
    const int s = 1 << (o + 1);
    const int t = s >> 1;

    const bool u = e < t && f < s;

    if (u) {
      D(p, q, e, f, s, t);
    }

    barrier(1);

    if (u) {
      E(p, q, e, f, s, t);
    }

    barrier(1);

    if (u) {
      D(q, p, e, f, s, t);
    }

    barrier(1);

    if (u) {
      E(q, p, e, f, s, t);
    }

    barrier(1);
  }

  const int s = 1 << r;
  const int t = s >> 1;
  D(p, q, e, f, s, t);
  D(p, q, e, f + get_local_size(1), s, t);

  barrier(1);

  E(p, q, e, f, s, t);
  E(p, q, e, f + get_local_size(1), s, t);

  barrier(1);

  D(q, p, e, f, s, t);
  D(q, p, e, f + get_local_size(1), s, t);

  barrier(1);

  E(q, p, e, f, s, t);
  E(q, p, e, f + get_local_size(1), s, t);

  barrier(1);

  {
    const uint v = g;
    const uint w = v * get_num_groups(0);

    const uint x = e & 0x1;
    const uint y = 2 * f + x;
    const uint z = 4 * (e >> 1);
    const uint n = y * v + z;

    const uint aa = get_group_id(1) * g + 2 * f + x;
    const uint ab = 4 * (get_global_id(0) >> 1);
    const uint ac = aa * w + ab;

    for (int o = 0; o < 4; ++o) {
      k[ac + o] = (char)(c[n + o]);
    }
  }
}