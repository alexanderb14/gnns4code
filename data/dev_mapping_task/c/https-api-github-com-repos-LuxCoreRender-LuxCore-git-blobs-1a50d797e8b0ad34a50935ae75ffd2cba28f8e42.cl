__kernel __attribute__((work_group_size_hint(256, 1, 1))) void A(const uint a, const uint b, __global float* c, __global uint* d, const float e) {
  const size_t f = get_global_id(0);
  if (f >= a * b)
    return;

  const uint g = d[f];
  if (g) {
    __global float* h = &c[f * 3];

    h[0] *= e;
    h[1] *= e;
    h[2] *= e;
  }
}