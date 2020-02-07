void A(float* a, const float b, const float c, const float d) {
  if (0.f == c) {
    a[0] = a[1] = a[2] = d;
    return;
  }

  int e = (int)__clc_floor(b / 60.f) % 6;
  float f = b / 60.f - (float)e;
  float g = d * (1.f - c);
  float h = d * (1.f - c * f);
  float i = d * (1.f - (1.f - f) * c);

  if (e == 0) {
    a[0] = d, a[1] = i, a[2] = g;
  } else if (e == 1) {
    a[0] = h, a[1] = d, a[2] = g;
  } else if (e == 2) {
    a[0] = g, a[1] = d, a[2] = i;
  } else if (e == 3) {
    a[0] = g, a[1] = h, a[2] = d;
  } else if (e == 4) {
    a[0] = i, a[1] = g, a[2] = d;
  } else {
    a[0] = d, a[1] = g, a[2] = h;
  }
}

uint B(uint a, uint b, __global uint4* c) {
  const uint d = get_global_id(0) + (100) * get_global_id(1);
  uint e;
  uint4 f = c[d];
  e = (f.x ^ (f.x << 11));
  f.x = f.y;
  f.y = f.z;
  f.z = f.w;
  f.w = (f.w ^ (f.w >> 19)) ^ (e ^ (e >> 8));
  c[d] = f;
  return a + (f.w % (b - a));
}

float C(__global uint4* a) {
  return (B(0, 10000000, a) / 10000000.0f);
}

int2 D(int2 a) {
  return (int2)((a + (100)) % (100), (a + (100)) % (100));
}

int E(int2 a) {
  int2 b = D(a);
  return b.x + (100) * b.y;
}

__kernel void F(__global float4* a, __global int* b, __global float* c) {
  const int d = E((int2)(get_global_id(0), get_global_id(1)));
  int e = b[d];

  float f[3];
  f[0] = c[3 * e + 0];
  f[1] = c[3 * e + 1];
  f[2] = c[3 * e + 2];

    a[3 * d + 0] = (float4)(f], f], f], f]);
    a[3 * d + 1] = (float4)(f], f], f], f]);
    a[3 * d + 2] = (float4)(f], f], f], f]);
}

__kernel void G(__global uint4* a, __global int* b, __global int* c) {
  const int2 d = (int2)(get_global_id(0), get_global_id(1));
  const int e = E(d);

  int f = b[e];

  if (f == 0) {
    if (C(a) < 0.1f) {
      f = 1;
    }
  } else if (f == 1) {
    if (C(a) < 0.02f) {
      f = 2;
    }
  } else if (f == 2) {
    if (C(a) < 0.02f) {
      f = 3;
    }
  } else if (f == 3) {
    int g = b[E(d + (int2)(-1, 0))];
    int h = b[E(d + (int2)(1, 0))];
    int i = b[E(d + (int2)(0, -1))];
    int j = b[E(d + (int2)(0, 1))];
    if (C(a) < 0.0001f || ((g == 4 || h == 4 || i == 4 || j == 4) && C(a) < 0.8f)) {
      f = 4;
    }
  } else if (f == 4) {
    if (C(a) < 1.f) {
      f = 5;
    }
  } else if (f == 5) {
    if (C(a) < 0.8f) {
      f = 6;
    }
  } else if (f == 6) {
    if (C(a) < 0.8f) {
      f = 0;
    }
  }

  c[e] = f;
}

__kernel void H(__global int* a, __global int* b) {
  const int c = E((int2)(get_global_id(0), get_global_id(1)));
  a[c] = b[c];
}