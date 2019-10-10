__kernel void A(__global float* a, __constant unsigned int* b, unsigned int c, unsigned int d) {
  unsigned int e = get_global_id(0);
  unsigned int f = get_local_id(1);
  unsigned int g = get_global_size(0);

  for (unsigned int h = e; h < d; h += g) {
    unsigned int i = 0;
    unsigned int j = c + h;

    for (int k = 0; k < 31; k++, j >>= 1)
      if (j & 1)
        i ^= b[k + f * 31];

    a[f * d + h] = (float)(i + 1) * (1.0f / (float)0x80000001U);
  }
}

float B(unsigned int a) {
  const float b = 2.50662823884f;
  const float c = -18.61500062529f;
  const float d = 41.39119773534f;
  const float e = -25.44106049637f;
  const float f = -8.4735109309f;
  const float g = 23.08336743743f;
  const float h = -21.06224101826f;
  const float i = 3.13082909833f;
  const float j = 0.337475482272615f;
  const float k = 0.976169019091719f;
  const float l = 0.160797971491821f;
  const float m = 2.76438810333863E-02f;
  const float n = 3.8405729373609E-03f;
  const float o = 3.951896511919E-04f;
  const float p = 3.21767881768E-05f;
  const float q = 2.888167364E-07f;
  const float r = 3.960315187E-07f;

  float s;

  bool t = false;

  if (a >= 0x80000000UL) {
    a = 0xffffffffUL - a;
    t = true;
  }

  const float u = 1.0f / (float)0xffffffffUL;
  const float v = u / 2.0f;
  float w = a * u + v;

  float x = w - 0.5f;

  if (x > -0.42f) {
    s = x * x;
    s = x * (((e * s + d) * s + c) * s + b) / ((((i * s + h) * s + g) * s + f) * s + 1.0f);
  }

  else {
    s = log(-log(w));
    s = -(j + s * (k + s * (l + s * (m + s * (n + s * (o + s * (p + s * (q + s * r))))))));
  }

  return t ? -s : s;
}

__kernel void C(__global float* a, const unsigned int b, const unsigned int c, const unsigned int d) {
  const unsigned int e = ((unsigned int)-1) / (b * d + 1);
  const unsigned int f = get_global_id(0);
  const unsigned int g = get_global_size(0);

  for (unsigned int h = f; h < b; h += g) {
    unsigned int i = (c * b + h + 1) * e;
    a[h] = B(i);
  }
}