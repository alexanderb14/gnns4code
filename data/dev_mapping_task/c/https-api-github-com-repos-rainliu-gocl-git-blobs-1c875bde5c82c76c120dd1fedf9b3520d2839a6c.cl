__kernel void A(__global float* a) {
  size_t b = get_global_id(0);
  size_t c = get_global_id(1);
  size_t d = get_global_size(0);
  size_t e = get_global_offset(0);
  size_t f = get_global_offset(1);
  size_t g = get_local_id(0);
  size_t h = get_local_id(1);

  int i = b - e;
  int j = c - f;
  int k = j * d + i;

  float l = b * 10.0f + c * 1.0f;
  l += g * 0.1f + h * 0.01f;

  a[k] = l;
}