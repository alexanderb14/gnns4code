float A(float a, float b, float c) {
  return (0.2126f * a) + (0.7152f * b) + (0.0722f * c);
}

__kernel void B(__global float* a, __global float* b, float c, float d, float e, float f, uint g, uint h, uint i) {
  uint j = get_global_id(0);
  uint k = get_global_id(1);
  float l, m;
  float n, o;
  float p, q;
  float r = 0.0f;
  float s = 0.0f;
  float t = 0.0f;
  m = a[g * h * k + (j * h + 0)];
  o = a[g * h * k + (j * h + 1)];
  q = a[g * h * k + (j * h + 2)];

  r = A(m, o, q);

  float u = e * c;

  if (j != 0 && k != 0 && j != g - 1 && k != i - 1) {
    float v = 0.0f;
    float w = 0.0f;
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float aa = 0.0f;
    float ab = 0.0f;
    float ac = 0.0f;

    l = a[g * h * (k - 1) + ((j - 1) * h) + 0];
    n = a[g * h * (k - 1) + ((j - 1) * h) + 1];
    p = a[g * h * (k - 1) + ((j - 1) * h) + 2];

    v = A(l, n, p);

    l = a[g * h * (k - 1) + ((j)*h) + 0];
    n = a[g * h * (k - 1) + ((j)*h) + 1];
    p = a[g * h * (k - 1) + ((j)*h) + 2];

    w = A(l, n, p);

    l = a[g * h * (k - 1) + ((j + 1) * h) + 0];
    n = a[g * h * (k - 1) + ((j + 1) * h) + 1];
    p = a[g * h * (k - 1) + ((j + 1) * h) + 2];

    x = A(l, n, p);

    l = a[g * h * (k) + ((j - 1) * h) + 0];
    n = a[g * h * (k) + ((j - 1) * h) + 1];
    p = a[g * h * (k) + ((j - 1) * h) + 2];

    y = A(l, n, p);

    l = a[g * h * (k) + ((j + 1) * h) + 0];
    n = a[g * h * (k) + ((j + 1) * h) + 1];
    p = a[g * h * (k) + ((j + 1) * h) + 2];

    z = A(l, n, p);

    l = a[g * h * (k + 1) + ((j - 1) * h) + 0];
    n = a[g * h * (k + 1) + ((j - 1) * h) + 1];
    p = a[g * h * (k + 1) + ((j - 1) * h) + 2];

    aa = A(l, n, p);

    l = a[g * h * (k + 1) + ((j)*h) + 0];
    n = a[g * h * (k + 1) + ((j)*h) + 1];
    p = a[g * h * (k + 1) + ((j)*h) + 2];

    ab = A(l, n, p);

    l = a[g * h * (k + 1) + ((j + 1) * h) + 0];
    n = a[g * h * (k + 1) + ((j + 1) * h) + 1];
    p = a[g * h * (k + 1) + ((j + 1) * h) + 2];

    ac = A(l, n, p);

    t = (v + w + x + y + z + aa + ab + ac) / 8;
  } else {
    t = r;
  }

  s = t * log(f + t / r) + u;

  float ad = r / (r + s);

  l = __clc_pow((m / r), d) * ad;
  n = __clc_pow((o / r), d) * ad;
  p = __clc_pow((q / r), d) * ad;

  b[g * h * k + (j * h + 0)] = l;
  b[g * h * k + (j * h + 1)] = n;
  b[g * h * k + (j * h + 2)] = p;
  b[g * h * k + (j * h + 3)] = a[g * h * k + (j * h + 3)];
}

__kernel void C(__global float4* a, __global float4* b, float c, float d, float e, float f, uint g, uint h, uint i) {
  uint j = get_global_id(0);
  uint k = get_global_id(1);
  float l, m;
  float n, o;
  float p, q;
  float r = 0.0f;
  float s = 0.0f;
  float t = 0.0f;
  m = a[g * k + j].x;
  o = a[g * k + j].y;
  q = a[g * k + j].z;

  r = A(m, o, q);

  float u = e * c;

  if (j != 0 && k != 0 && j != g - 1 && k != i - 1) {
    float v = 0.0f;
    float w = 0.0f;
    float x = 0.0f;
    float y = 0.0f;
    float z = 0.0f;
    float aa = 0.0f;
    float ab = 0.0f;
    float ac = 0.0f;

    l = a[g * (k - 1) + j - 1].x;
    n = a[g * (k - 1) + j - 1].y;
    p = a[g * (k - 1) + j - 1].z;

    v = A(l, n, p);

    l = a[g * (k - 1) + j].x;
    n = a[g * (k - 1) + j].y;
    p = a[g * (k - 1) + j].z;

    w = A(l, n, p);

    l = a[g * (k - 1) + j + 1].x;
    n = a[g * (k - 1) + j + 1].y;
    p = a[g * (k - 1) + j + 1].z;

    x = A(l, n, p);

    l = a[g * k + j - 1].x;
    n = a[g * k + j - 1].y;
    p = a[g * k + j - 1].z;

    y = A(l, n, p);

    l = a[g * k + j + 1].x;
    n = a[g * k + j + 1].y;
    p = a[g * k + j + 1].z;

    z = A(l, n, p);

    l = a[g * (k + 1) + j - 1].x;
    n = a[g * (k + 1) + j - 1].y;
    p = a[g * (k + 1) + j - 1].z;

    aa = A(l, n, p);

    l = a[g * (k + 1) + j].x;
    n = a[g * (k + 1) + j].y;
    p = a[g * (k + 1) + j].z;

    ab = A(l, n, p);

    l = a[g * (k + 1) + j + 1].x;
    n = a[g * (k + 1) + j + 1].y;
    p = a[g * (k + 1) + j + 1].z;

    ac = A(l, n, p);

    t = (v + w + x + y + z + aa + ab + ac) / 8;
  } else {
    t = r;
  }

  s = t * log(f + t / r) + u;

  float ad = r / (r + s);

  l = __clc_pow((m / r), d) * ad;
  n = __clc_pow((o / r), d) * ad;
  p = __clc_pow((q / r), d) * ad;

  b[g * k + j].x = l;
  b[g * k + j].y = n;
  b[g * k + j].z = p;
  b[g * k + j].w = a[g * k + j].w;
}