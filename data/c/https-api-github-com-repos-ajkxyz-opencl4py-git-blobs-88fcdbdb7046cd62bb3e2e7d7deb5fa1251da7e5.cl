__kernel __attribute__((vec_type_hint(float4))) void A(__global float* a, __global float* b, const float c) {
  size_t d = get_global_id(0);
  a[d] += b[d] * c;
}