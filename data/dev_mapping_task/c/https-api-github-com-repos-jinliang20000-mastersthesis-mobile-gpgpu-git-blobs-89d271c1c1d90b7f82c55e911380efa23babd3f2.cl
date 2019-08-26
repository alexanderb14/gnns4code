constant int Ga = 1; constant int Gb = 180; constant float Gc = 0.01745329252f; __kernel void A(__read_only image2d_t a, __global uint* b, sampler_t c, int d, int e, int f, int g) {
  int h = d / 2;
  int2 i = (int2)(get_global_id(0), get_global_id(1));
  float2 j = (float2)(i(float) f2 .0f, i(float) g2 .0f);

  float k = read_imagef(a, c, i).x;

  if (k > 0.0f) {
    for (int l = 0; l < Gb; l += Ga) {
      float m = (float)l * Gc;

      int n = (int)(j.x * cos(m) + j.y * sin(m));

      if (abs(n) > 2 && n >= -h && n < h) {
        size_t o = l * d + n + h;
        atomic_add(&b[o], 1);
      }
    }
  }
}