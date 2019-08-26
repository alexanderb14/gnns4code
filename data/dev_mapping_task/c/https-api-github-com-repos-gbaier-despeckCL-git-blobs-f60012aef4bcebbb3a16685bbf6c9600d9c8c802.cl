__kernel void A(__global float* a, __global float* b, __global float* c, const int d, const float e, const float f) {
  const int g = get_global_id(0);

  if (g < d) {
    float h = exp(a[g] / e + b[g] / f);
    if (isnan(h) || isinf(h)) {
      h = 0.0f;
    }
    c[g] = h;
  }
}