__constant int Ga = 1000; __constant float Gb = 5.0; __constant float Gc = 8.0; __constant float Gd = 1e-5; float A(float3 a) {
  float3 b = a;

  float c = 1.0;
  float d = 0.0;
  float e, f, g;

  for (int h = 0; h < Ga; h++) {
    d = length(b);
    if (d > Gb)
      break;

    e = acos(b.z / d);
    f = atan2(b.y, b.x);
    c = __clc_pow(d, Gc - 1.0f) * Gc * c + 1.0f;

    g = __clc_pow(d, Gc);
    e = e * Gc;
    f = f * Gc;

    b = g * (float3)(sin(ecos(f sin(f* sin(eos(e
    b = b + a;
  }

  return 0.5 * log(d) * d / c;
}

bool B(float3 a) {
  return A(a) < Gd;
}
__kernel void C(__global const float* a, __global const float* b, __global const float* c, __global uchar* d, size_t e, size_t f) {
  size_t g = get_global_id(0);
  size_t h = get_global_id(1);
  size_t i = get_global_id(2);

  size_t j = get_global_size(0);
  size_t k = get_global_size(1);

  float3 l = (float3)(ag, bh, ci);

  d[g + h * e + i * f] = B(l) ? 1 : 0;
}

__kernel void D(__global const float3* a, __global const float3* b, __global float3* c, const size_t d) {
  size_t e = get_global_id(0);

  float3 f = a[e];
  float3 g = b[e];
  float3 h;

  bool i = B(f);
  bool j = B(g);

  for (size_t k = 0; k < d; ++k) {
    h = (f + g) / 2.0f;
    bool l = B(h);
    if (l == i) {
      f = h;
    } else {
      g = h;
    }
  }

  c[e] = (f + g) / 2.0f;
}