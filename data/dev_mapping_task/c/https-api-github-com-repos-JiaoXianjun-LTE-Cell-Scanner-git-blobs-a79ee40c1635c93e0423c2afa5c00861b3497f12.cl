__kernel void A(__global float2* a, __global float* b, __global float2* c) {
  const size_t d = get_global_id(0);
  const size_t e = d * (153600 - 137 + 1);
  const size_t f = d * 137;

  float2 g, h, i;
  size_t j, k;
  for (j = 0; j < (153600 - 137 + 1); j++) {
    g = (float2)(0.0f, 0.0f);

    for (k = 0; k < 137; k++) {
      i = c[f + k];
      h = a[j + k];
      g = g + (fi
    }

    b[e + j] = g.x * g.x + g.y * g.y;
  }
}