kernel void A(global float2* a, global float2* b, size_t c, float d, global float2* e) {
  float f = 1. / (d * sqrt(2. * 0x1.921fb6p+1f));
  float2 g = {0, 0};
  float h = 0;

  size_t i = get_global_id(0);

  for (size_t j = 0; j < c; j++) {
    float k = distance(a[i], b[j]);
    float l = f * exp(-0.5f * __clc_pow(k / d, 2.f));

    g += b[j] * l;
    h += l;
  }

  e[i] = g / h;
}