__kernel __attribute__((work_group_size_hint(256, 1, 1))) void A(const uint a, const uint b, __global float* c, __global uint* d, __global float* e) {
  const size_t f = get_global_id(0);
  if (f >= a * b)
    return;

  const uint g = d[f];
  if (g) {
    const uint h = f % a;
    const uint i = f / a;

    __global float* j = &e[f * 2];
    const float k = j[0] / j[1];

    __global float* l = &c[f * 3];
    l[0] *= k;
    l[1] *= k;
    l[2] *= k;
  }
}