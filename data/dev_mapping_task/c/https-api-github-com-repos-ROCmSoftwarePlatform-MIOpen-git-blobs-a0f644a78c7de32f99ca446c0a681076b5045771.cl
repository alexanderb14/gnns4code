struct CheckNumericsResult {
  float sum;
  float absSum;
  float min;
  float max;

  int hasZero;
  int hasNan;
  int hasInf;
};

union AtomicFloat {
  unsigned int u32;
  float f32;
};

void A(volatile __global float* a, float b) {
  union AtomicFloat c, d, e;

  c.f32 = *a;
  do {
    d.f32 = c.f32;
    e.f32 = c.f32 + b;

    c.u32 = atomic_cmpxchg((volatile __global unsigned int*)a, d.u32, e.u32);
  } while (c.u32 != d.u32);
}

void B(volatile __global float* a, float b) {
  union AtomicFloat c, d, e;

  c.f32 = *a;
  do {
    d.f32 = c.f32;
    e.f32 = fmin(c.f32, b);

    c.u32 = atomic_cmpxchg((volatile __global unsigned int*)a, d.u32, e.u32);
  } while (c.u32 != d.u32);
}

void C(volatile __global float* a, float b) {
  union AtomicFloat c, d, e;

  c.f32 = *a;
  do {
    d.f32 = c.f32;
    e.f32 = fmax(c.f32, b);

    c.u32 = atomic_cmpxchg((volatile __global unsigned int*)a, d.u32, e.u32);
  } while (c.u32 != d.u32);
}
__kernel void D(const __global float* a, int b, __global struct CheckNumericsResult* c, int d) {
  const int e = get_local_id(0);
  const int f = get_global_id(0);
  const int g = get_global_size(0);

  local float h[4 * 256];

  int i = f;
  float j = 0.0f;
  float k = 0.0f;
  float l = 0x1.fffffep127f;
  float m = 0x1.0p-126f;
  while (i < b) {
    float n = a[i];
    j += n;
    k += __clc_fabs(n);
    l = min(l, n);
    m = max(m, n);

    if (__clc_fabs(n) <= 0.0f) {
      c->hasZero = 1;
    }
    if (isnan(n)) {
      c->hasNan = 1;
    }
    if (isinf(n)) {
      c->hasInf = 1;
    }
    i += g;
  }

  if (d) {
    h[4 * e + 0] = j;
    h[4 * e + 1] = k;
    h[4 * e + 2] = l;
    h[4 * e + 3] = m;
    barrier(1);

    if (e < 128) {
      h[4 * (e) + 0] += h[4 * (e + 128) + 0];
      h[4 * (e) + 1] += h[4 * (e + 128) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 128) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 128) + 3]);
      barrier(1);
    }
    if (e < 64) {
      h[4 * (e) + 0] += h[4 * (e + 64) + 0];
      h[4 * (e) + 1] += h[4 * (e + 64) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 64) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 64) + 3]);
      barrier(1);
    }
    if (e < 32) {
      h[4 * (e) + 0] += h[4 * (e + 32) + 0];
      h[4 * (e) + 1] += h[4 * (e + 32) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 32) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 32) + 3]);
      barrier(1);
    }
    if (e < 16) {
      h[4 * (e) + 0] += h[4 * (e + 16) + 0];
      h[4 * (e) + 1] += h[4 * (e + 16) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 16) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 16) + 3]);
      barrier(1);
    }
    if (e < 8) {
      h[4 * (e) + 0] += h[4 * (e + 8) + 0];
      h[4 * (e) + 1] += h[4 * (e + 8) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 8) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 8) + 3]);
      barrier(1);
    }
    if (e < 4) {
      h[4 * (e) + 0] += h[4 * (e + 4) + 0];
      h[4 * (e) + 1] += h[4 * (e + 4) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 4) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 4) + 3]);
      barrier(1);
    }
    if (e < 2) {
      h[4 * (e) + 0] += h[4 * (e + 2) + 0];
      h[4 * (e) + 1] += h[4 * (e + 2) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 2) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 2) + 3]);
      barrier(1);
    }
    if (e < 1) {
      h[4 * (e) + 0] += h[4 * (e + 1) + 0];
      h[4 * (e) + 1] += h[4 * (e + 1) + 1];
      h[4 * (e) + 2] = fmin(h[4 * (e) + 2], h[4 * (e + 1) + 2]);
      h[4 * (e) + 3] = fmax(h[4 * (e) + 3], h[4 * (e + 1) + 3]);
      barrier(1);
    }

    if (e == 0) {
      A(&c->sum, h[0]);
      A(&c->absSum, h[1]);
      B(&c->min, h[2]);
      C(&c->max, h[3]);
    }
  }
}