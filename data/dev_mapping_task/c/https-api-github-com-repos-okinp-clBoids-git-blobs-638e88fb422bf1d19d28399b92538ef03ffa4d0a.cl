typedef struct {
  float4 pos;
  float4 vel;
  float4 acc;
} Boid;

float A(float4 a) {
  return a.x * a.x + a.y * a.y + a.z * a.z;
}
float4 B(float4 a, float b) {
  float c = sqrt(A(a));
  if (c > b && c > 0) {
    float d = b / sqrt(3.0) / c;
    a = d * a;
    return a;
  } else {
    return a;
  }
}
float4 C(float4 a, Boid b, bool c) {
  float4 d = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float4 e = a - b.pos;
  float f = sqrt(A(e));
  if (f > 0) {
    e = e / sqrt(A(e));
    if (c && f < 100.0) {
      float g = 10.0f * f / 100;
      e = g * e;
    } else {
      float h = 10.0f;
      e = h * e;
    }
    d = e - b.vel;
    d = B(d, 2);
  } else {
    d.x = 0;
    d.y = 0;
    d.z = 0;
    d.w = 0;
  }
  return d;
}

float4 D(float a, Boid b, Boid c, float4 d) {
  if (a > 0 && a < 14) {
    float4 e = b.pos - c.pos;
    float f = A(e);
    e = e / sqrt(f);
    e = e / a;
    e.w = 1;
    d = d + e;
  }
  return d;
}

float4 E(float a, Boid b, Boid c, float4 d) {
  if (a > 0 && a < 40) {
    c.vel.w = 1;
    d += c.vel;
  }
  return d;
}
float4 F(float a, Boid b, Boid c, float4 d) {
  if (a > 0 && a < 15) {
    b.pos.w = 1;
    d = d + b.pos;
  }
  return d;
}

__kernel void G(__global Boid* a, __global Boid* b) {
  int c = get_global_id(0);
  int d = get_local_id(0);
  int e = get_global_size(0);
  int f = get_local_size(0);
  int g = e / f;

  float4 h = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float4 i = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  float4 j = (float4)(0.0f, 0.0f, 0.0f, 0.0f);
  h.w = 0;
  i.w = 0;
  j.w = 0;

  for (int k = c + 1; k < 300; k++) {
    float4 l = a[c].pos - a[k].pos;
    float m = sqrt(A(l));
    j = E(m, a[c], a[k], j);

    h = D(m, a[c], a[k], h);

    i = F(m, a[c], a[k], i);
  }

  if (h.w > 0) {
    h = h / h.w;
  }
  float n = A(h);
  if (n > 0) {
    h = h / sqrt(n);
    float o = 10.0f;
    h = o * h;
    h = h - a[c].vel;
    h = B(h, 2);
  }

  if (i.w > 0) {
    i = i / i.w;
    i = C(i, a[c], false);
  }

  if (j.w > 0) {
    j = j / j.w;
  }
  float p = A(j);
  if (p > 0) {
    j = j / sqrt(p);
    j = 10.0f * j;

    j = j - a[c].vel;
    j = B(j, 2);
  }

  b[c].acc = i + h + j;
  b[c].vel = a[c].vel + b[c].acc;
  b[c].vel = B(b[c].vel, 10);
  b[c].pos = a[c].pos + b[c].vel;
  if (b[c].pos.x > 1024) {
    b[c].pos.x = 0;
  }
  if (b[c].pos.x < 0) {
    b[c].pos.x = 1024;
  }
  if (b[c].pos.y > 768) {
    b[c].pos.y = 0;
  }
  if (b[c].pos.y < 0) {
    b[c].pos.y = 768;
  }
}