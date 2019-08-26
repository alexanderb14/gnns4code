__kernel __attribute__((work_group_size_hint(256, 1, 1))) void A(const uint a, const uint b, __global float* c, __global uint* d, __global uint* e, const uint f) {
  const size_t g = get_global_id(0);
  if (g >= a * b)
    return;

  const uint h = d[g];
  const uint i = e[g];
  const float j = (h && (i == f)) ? 1.f : 0.f;

  __global float* k = &c[g * 3];
  k[0] = j;
  k[1] = j;
  k[2] = j;
}