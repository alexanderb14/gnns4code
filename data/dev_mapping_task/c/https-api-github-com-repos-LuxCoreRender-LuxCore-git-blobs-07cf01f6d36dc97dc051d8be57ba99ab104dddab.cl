__kernel __attribute__((work_group_size_hint(256, 1, 1))) void A(const uint a, const uint b, __global uint* c) {
  const size_t d = get_global_id(0);
  if (d > a * b)
    return;

  c[d] = 0;
}

__kernel __attribute__((work_group_size_hint(256, 1, 1))) void B(const uint a, const uint b, __global float* c, __global uint* d, __global float* e, const float f, const float g, const float h) {
  const size_t i = get_global_id(0);
  if (i > a * b)
    return;

  __global const float* j = &e[i * 4];
  float k = j[0];
  float l = j[1];
  float m = j[2];
  const float n = j[3];

  if (n > 0.f) {
    const float o = 1.f / n;
    k *= o;
    l *= o;
    m *= o;

    k *= f;
    l *= g;
    m *= h;

    __global uint* p = &d[i];

    __global float* q = &c[i * 3];
    if (*p) {
      q[0] += k;
      q[1] += l;
      q[2] += m;
    } else {
      q[0] = k;
      q[1] = l;
      q[2] = m;
    }

    *p = 1;
  }
}

__kernel __attribute__((work_group_size_hint(256, 1, 1))) void C(const uint a, const uint b, __global float* c, __global uint* d, __global float* e, const float f, const float g, const float h) {
  const size_t i = get_global_id(0);
  if (i > a * b)
    return;

  __global const float* j = &e[i * 3];
  float k = j[0];
  float l = j[1];
  float m = j[2];

  if ((k != 0.f) || (l != 0.f) || (m != 0.f)) {
    k *= f;
    l *= g;
    m *= h;

    __global uint* n = &d[i];

    __global float* o = &c[i * 3];
    if (*n) {
      o[0] += k;
      o[1] += l;
      o[2] += m;
    } else {
      o[0] = k;
      o[1] = l;
      o[2] = m;
    }

    *n = 1;
  }
}

__kernel __attribute__((work_group_size_hint(256, 1, 1))) void D(const uint a, const uint b, __global float* c, __global uint* d) {
  const size_t e = get_global_id(0);
  if (e > a * b)
    return;

  __global float* f = &c[e * 3];
  __global uint* g = &d[e];
  if (!(*g)) {
    f[0] = 0.f;
    f[1] = 0.f;
    f[2] = 0.f;
  }
}