__kernel void A(__global const float4* a, __global float4* b, __global const int* c, const int d, const int e, const int f, const int g) {
  const size_t h = get_global_id(0);
  const size_t i = get_global_id(1);
  const size_t j = h - get_global_offset(0) + (i - get_global_offset(1)) * get_global_size(0);
  const float4 k = a[j];

  const int l = c[g ? d * (h % e) + i % d : d * (i % e) + h % d];

  float4 m = ((l == (int4)(0, 1, 2, 3)) ? (k) : (0.f));

  if (f)
    m = fmin(m + k, 1.0f);

  m.w = k.w;

  b[j] = m;
}