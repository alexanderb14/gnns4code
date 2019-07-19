__kernel void A(__global float* a, __global float* b, __local float* c) {
  size_t d = get_global_id(0);
  size_t e = get_global_id(1);
  size_t f = get_global_size(0);
  size_t g = get_local_size(0) + 8;
  size_t h = get_local_size(0);
  size_t i = get_local_id(0);
  size_t j = get_local_id(1);
  size_t k = e * f + d;
  size_t l = j * (h + 8) + i;

  c[l + 4] = a[k];
  if ((i - h) >= -4 && d > 3) {
    c[l - h + 4] = a[k - h];
  }
  if ((h + i) < f + 4 && d < f - 4) {
    c[l + h + 4] = a[k + h];
  }

  barrier(1);

  if (d > 3 && d < f - 4) {
    float m = 4.f / 5.f * f;
    float n = -1.f / 5.f * f;
    float o = 4.f / 105.f * f;
    float p = -1.f / 280.f * f;
    b[k] = (m * (c[l + 1 + 4] - c[l - 1 + 4]) + n * (c[l + 2 + 4] - c[l - 2 + 4]) + o * (c[l + 3 + 4] - c[l - 3 + 4]) + p * (c[l + 4 + 4] - c[l - 4 + 4]));
  } else if (d <= 3) {
    float m = -25.f / 12.f * f;
    float n = 4.f * f;
    float o = -3.f * f;
    float p = 4.f / 3.f * f;
    float q = -1.f / 4.f * f;
    b[k] = m * c[l + 4] + n * c[l + 1 + 4] + o * c[l + 2 + 4] + p * c[l + 3 + 4] + q * c[l + 4 + 4];
  } else if (d >= f - 4) {
    float m = -25.f / 12.f * f;
    float n = 4.f * f;
    float o = -3.f * f;
    float p = 4.f / 3.f * f;
    float q = -1.f / 4.f * f;
    b[k] = -m * c[l + 4] - n * c[l - 1 + 4] - o * c[l - 2 + 4] - p * c[l - 3 + 4] - q * c[l - 4 + 4];
  }
  barrier(1);
}