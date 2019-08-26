kernel void A(int a, int b, int c, int d, float e, float f, int g, int h, int i, global float* j, int k, global float* l) {
  float m = j[k];
  l[(2 * h + g) * (b + i) + a + h] += m * (1.f - e) * (1.f - f);
  l[(2 * h + g) * (d + i) + a + h] += m * f * (1.f - e);
  l[(2 * h + g) * (b + i) + c + h] += m * (1.f - f) * e;
  l[(2 * h + g) * (d + i) + c + h] += m * f * e;
}