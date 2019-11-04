inline void A(float* a) {
  float b = a[0] + a[7];
  float c = a[1] + a[6];
  float d = a[2] + a[5];
  float e = a[3] + a[4];

  float f = a[0] - a[7];
  float g = a[6] - a[1];
  float h = a[2] - a[5];
  float i = a[4] - a[3];

  float j = b + e;
  float k = b - e;
  float l = c + d;
  float m = c - d;

  a[0] = 0.35355339059327376220042218105242f * (j + l);
  a[2] = 0.35355339059327376220042218105242f * (1.3065629648763765278566431734272f * k + 0.54119610014619698439972320536639f * m);
  a[4] = 0.35355339059327376220042218105242f * (j - l);
  a[6] = 0.35355339059327376220042218105242f * (0.54119610014619698439972320536639f * k - 1.3065629648763765278566431734272f * m);

  a[1] = 0.35355339059327376220042218105242f * (1.3870398453221474618216191915664f * f - 1.1758756024193587169744671046113f * g + 0.78569495838710218127789736765722f * h - 0.27589937928294301233595756366937f * i);
  a[3] = 0.35355339059327376220042218105242f * (1.1758756024193587169744671046113f * f + 0.27589937928294301233595756366937f * g - 1.3870398453221474618216191915664f * h + 0.78569495838710218127789736765722f * i);
  a[5] = 0.35355339059327376220042218105242f * (0.78569495838710218127789736765722f * f + 1.3870398453221474618216191915664f * g + 0.27589937928294301233595756366937f * h - 1.1758756024193587169744671046113f * i);
  a[7] = 0.35355339059327376220042218105242f * (0.27589937928294301233595756366937f * f + 0.78569495838710218127789736765722f * g + 1.1758756024193587169744671046113f * h + 1.3870398453221474618216191915664f * i);
}
__kernel __attribute__((reqd_work_group_size(32, 16 / 8, 1))) void B(__global float* a, __global float* b, uint c, uint d, uint e) {
  __local float f[16][32 + 1];
  const uint g = get_local_id(0);
  const uint h = 8 * get_local_id(1);
  const uint i = g & (8 - 1);
  const uint j = get_group_id(0) * 32 + g;
  const uint k = get_group_id(1) * 16 + h;

  if ((j - i + 8 - 1 >= e) || (k + 8 - 1 >= d))
    return;

  __local float* l = &f[h + 0][g + 0];
  __local float* m = &f[h + i][g - i];
  b += k * c + j;
  a += k * c + j;

  float n[8];
  for (uint o = 0; o < 8; o++)
    l[o * (32 + 1)] = b[o * c];

  for (uint o = 0; o < 8; o++)
    n[o] = m[o];
  A(n);
  for (uint o = 0; o < 8; o++)
    m[o] = n[o];

  for (uint o = 0; o < 8; o++)
    n[o] = l[o * (32 + 1)];
  A(n);

  for (uint o = 0; o < 8; o++)
    a[o * c] = n[o];
}