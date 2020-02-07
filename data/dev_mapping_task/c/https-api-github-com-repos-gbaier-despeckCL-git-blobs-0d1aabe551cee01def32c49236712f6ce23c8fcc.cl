__kernel void A(__global float* a, __global float* b, const int c, const int d, const int e, const int f, __constant float* g, __constant float* h, const int i, const float j, const float k) {
  const float l = 16.0f;
  const float m = 49.0f;

  const int n = get_global_id(0);

  const int o = (e - 1) / 2;

  if (n < (e * o + o) * c * d) {
    float p = a[n];

    if (p > k) {
      b[n] = 0.0f;
    } else {
      p = max(p, j);
      p = min(p, k);

      const float q = (p - j) / (k - j) * (i - 1);

      const float r = g[(unsigned int)q];
      const float s = h[(unsigned int)(r * (i - 1))];
      const float t = exp(-__clc_fabs(s - m) / l);

      b[n] = t;
    }
  }
}