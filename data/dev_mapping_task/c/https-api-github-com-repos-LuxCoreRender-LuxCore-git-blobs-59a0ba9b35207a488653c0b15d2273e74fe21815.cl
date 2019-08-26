__kernel __attribute__((work_group_size_hint(256, 1, 1))) void A(const uint a, const uint b, __global float* c, __global uint* d, const float e) {
  const size_t f = get_global_id(0);
  if (f >= a * b)
    return;

  const uint g = d[f];
  if (g) {
    const uint h = f % a;
    const uint i = f / a;
    const float j = h / (float)a;
    const float k = i / (float)b;
    const float l = (j - .5f) * 2.f;
    const float m = (k - .5f) * 2.f;
    const float n = sqrt(l * l + m * m);

    const float o = 1.f - (__clc_fabs(n) * 1.42f);
    float p = mix(1.f - e, 1.f, o);

    __global float* q = &c[f * 3];
    q[0] *= p;
    q[1] *= p;
    q[2] *= p;
  }
}