__kernel void A(__global float* a, __global float* b) {
  size_t c = get_global_id(0);
  float d = 0.f;

  if (a[c] > 0.5f)
    d = 10.f;
  else
    d = 2.f;

  b[c] = d;
}