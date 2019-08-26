__kernel void A(int a, int b, __global int* c) {
  int d[2][3];
  int e, f;
  double g;
  double h;

  d[0][0] = d[0][1] = d[0][2] = d[1][0] = d[1][1] = d[1][2] = a;

  for (int i = 0; i < b; i++) {
    e = (1403580 * d[0][1] - 810728 * d[0][2]) % 4294967087;
    f = (527612 * d[1][0] - 1370589 * d[1][2]) % 4294944443;
    g = (e - f) % 4294967087;

    if (g > 0) {
      h = g / 4294967088.0;
    } else if (g < 0) {
      h = (g + 4294967087) / 4294967088.0;
    } else {
      h = 4294967087 / 4294967088.0;
    }

    d[0][2] = d[0][1];
    d[0][1] = d[0][0];
    d[0][0] = e;
    d[1][2] = d[1][1];
    d[1][1] = d[1][0];
    d[1][0] = f;

    c[i] = 2147483647 * h;
  }
}

__kernel void B(__global int* a, __global float* b, float c, float d, float e, float f, float g, int h) {
  float i = 1.0 / h;
  float j = sqrt(i);
  int k = get_global_id(0);
  int l[2][3];
  float m;
  float n, o;

  float p;
  float q = c;
  float r = e;

  int s, t, u;

  l[0][0] = l[0][1] = l[0][2] = l[1][0] = l[1][1] = l[1][2] = (int)a[k];

  for (int v = 0; v < h * 2; v++) {
    s = (1403580 * l[0][1] - 810728 * l[0][2]) % 4294967087;
    t = (527612 * l[1][0] - 1370589 * l[1][2]) % 4294944443;

    u = (s - t) % 4294967087;

    if (u > 0) {
      m = u / 4294967088.0;
    } else if (u < 0) {
      m = (u + 4294967087) / 4294967088.0;
    } else {
      m = 4294967087 / 4294967088.0;
    }

    l[0][2] = l[0][1];
    l[0][1] = l[0][0];
    l[0][0] = s;
    l[1][2] = l[1][1];
    l[1][1] = l[1][0];
    l[1][0] = t;

    if (v > 1 && v % 2 == 0) {
      n = sqrt((float)-2.0 * log(m)) * cos((float)(2.0 * 3.141592653589793 * p));
      o = sqrt((float)-2.0 * log(m)) * sin((float)(2.0 * 3.141592653589793 * p));
      q = q * (1 + d * i + sqrt(r) * j * n);

      r = __clc_fabs((float)(r + f * (e - r) * i + g * sqrt(r) * j * o));

    } else {
      p = m;
    }
  }
  b[k] = q;
}

__kernel void C(__global float* a, float b) {
  1;
}
__kernel void D(__global float* a, float b) {
  int c = get_global_id(0);
  a[c] = fmax(0.0f, a[c] - b);
}
__kernel void E(__global float* a, float b) {
  int c = get_global_id(0);
  a[c] = fmax(0.0f, b - a[c]);
}

__kernel void F(int a, __global float* b, __global float* c) {
  double d, e;
  d = e = 0.0;
  int f;
  for (f = 0; f < a; f++) {
    d += b[f];
  }
  c[0] = e = d / a;
  d = 0.0;
  for (f = 0; f < a; f++) {
    d += (b[f] - e) * (b[f] - e);
  }
  c[1] = sqrt((float)(d / (a - 1)));
}