bool A(float3 a) {
  return length(a) < 1.0;
}
__kernel void B(__global const float* a, __global const float* b, __global const float* c, __global uchar* d, size_t e, size_t f) {
  size_t g = get_global_id(0);
  size_t h = get_global_id(1);
  size_t i = get_global_id(2);

  size_t j = get_global_size(0);
  size_t k = get_global_size(1);

  float3 l = (float3)(ag, bh, ci);

  d[g + h * e + i * f] = A(l) ? 1 : 0;
}

__kernel void C(__global const float3* a, __global const float3* b, __global float3* c, const size_t d) {
  size_t e = get_global_id(0);

  float3 f = a[e];
  float3 g = b[e];
  float3 h;

  bool i = A(f);
  bool j = A(g);

  for (size_t k = 0; k < d; ++k) {
    h = (f + g) / 2.0f;
    bool l = A(h);
    if (l == i) {
      f = h;
    } else {
      g = h;
    }
  }

  c[e] = (f + g) / 2.0f;
}