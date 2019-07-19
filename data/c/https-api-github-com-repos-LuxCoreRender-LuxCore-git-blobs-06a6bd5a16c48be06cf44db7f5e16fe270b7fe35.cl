__kernel __attribute__((work_group_size_hint(256, 1, 1))) void A(const uint a, const uint b, __global float* c, __global uint* d, __global float* e, __global float* f, __global float* g, const uint h) {
  const size_t i = get_global_id(0);
  if (i >= a * b)
    return;

  const uint j = i % a;
  const uint k = i / a;

  uint l = d[i];
  if (l) {
    const uint m = max(j, h) - h;
    const uint n = min(j + h, a - 1);

    float o = 0.f;
    const uint p = k;
    float3 q = 0.f;
    for (uint r = m; r <= n; ++r) {
      const uint s = r + p * a;
      l = d[s];

      if (l) {
        const uint t = (j - r) * (j - r) + (k - p) * (k - p);
        const float u = g[t];
        if (u == 0.f)
          continue;

        o += u;
        const uint v = s * 3;
        q.s0 += u * c[v];
        q.s1 += u * c[v + 1];
        q.s2 += u * c[v + 2];
      }
    }
    if (o > 0.f)
      q /= o;

    __global float* w = &f[(j + k * a) * 3];
    w[0] = q.s0;
    w[1] = q.s1;
    w[2] = q.s2;
  }
}

__kernel __attribute__((work_group_size_hint(256, 1, 1))) void B(const uint a, const uint b, __global float* c, __global uint* d, __global float* e, __global float* f, __global float* g, const uint h) {
  const size_t i = get_global_id(0);
  if (i >= a * b)
    return;

  const uint j = i % a;
  const uint k = i / a;

  uint l = d[i];
  if (l) {
    const uint m = max(k, h) - h;
    const uint n = min(k + h, b - 1);

    float o = 0.f;
    const uint p = j;
    float3 q = 0.f;
    for (uint r = m; r <= n; ++r) {
      const uint s = p + r * a;
      l = d[s];

      if (l) {
        const uint t = (j - p) * (j - p) + (k - r) * (k - r);
        const float u = g[t];
        if (u == 0.f)
          continue;

        const uint s = p + r * a;
        o += u;
        const uint v = s * 3;
        q.s0 += u * f[v];
        q.s1 += u * f[v + 1];
        q.s2 += u * f[v + 2];
      }
    }

    if (o > 0.f)
      q /= o;

    __global float* w = &e[(j + k * a) * 3];
    w[0] = q.s0;
    w[1] = q.s1;
    w[2] = q.s2;
  }
}

__kernel __attribute__((work_group_size_hint(256, 1, 1))) void C(const uint a, const uint b, __global float* c, __global uint* d, __global float* e, const float f) {
  const size_t g = get_global_id(0);
  if (g >= a * b)
    return;

  uint h = d[g];
  if (h) {
    __global float* i = &c[g * 3];
    __global float* j = &e[g * 3];

    i[0] = mix(i[0], j[0], f);
    i[1] = mix(i[1], j[1], f);
    i[2] = mix(i[2], j[2], f);
  }
}