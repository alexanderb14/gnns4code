__kernel void A(__global float* a, __global float* b, __global float* c, float d, __global float* e) {
  float f = *a;
  float g = *b;
  float h = *c;

  float i = f * h;
  float j = g * d;
  float k = i * h;
  float l = j * d;
  float m;
  float n;
  float o;
  float p;
  float q;

  if (k > __clc_fabs(l)) {
    n = j / i;
    o = -d / h;
    float r = 1.f - n * o;

    q = 0.f;
    if (r > 0.f) {
      f /= r;
      g /= r;
      h *= r;
    }
  } else {
    m = i / j;
    p = h / d;
    float r = 1 + m * p;
    float s = f / r;
    q = 1.f;
    f = g / r;
    g = s;
    h = d * r;
  }

  const float t = 4096.f;
  const float u = t * t;
  const float v = 1.f / u;

  if (f != 0 && (__clc_fabs(f) < v || __clc_fabs(f) > u)) {
    if (q == 0.f) {
      m = 1.f;
      p = 1.f;
      q = -1.f;
    } else {
      n = 1.f;
      o = -1.f;
      q = -1.f;
    }
    while (__clc_fabs(f) < v || __clc_fabs(f) > u) {
      if (__clc_fabs(f) < v) {
        f *= u;
        h /= t;
        m /= t;
        n /= t;
      } else {
        f /= u;
        h *= t;
        m *= t;
        n *= t;
      }
    }
  }

  if (g != 0 && (__clc_fabs(g) < v || __clc_fabs(g) > u)) {
    if (q == 0.f) {
      m = 1.f;
      p = 1.f;
      q = -1.f;
    } else if (q == 1.f) {
      n = 1.f;
      o = -1.f;
      q = -1.f;
    }
    while (__clc_fabs(g) < v || __clc_fabs(g) > u) {
      if (__clc_fabs(g) < v) {
        g *= u;
        o /= t;
        p /= t;
      } else {
        g /= u;
        o *= t;
        p *= t;
      }
    }
  }

  e[0] = q;
  if (q == -1.f) {
    e[1] = m;
    e[2] = o;
    e[3] = n;
    e[4] = p;
  } else if (q == 0.f) {
    e[2] = o;
    e[3] = n;
  } else {
    e[1] = m;
    e[4] = p;
  }

  a[0] = f;
  b[0] = g;
  c[0] = h;
}