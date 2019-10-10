__kernel void A(const float2 a, const float2 b, const unsigned int c, const unsigned int d, const unsigned int e, __global int* f) {
  int2 g = (int2)(get_global_id(0), get_global_id(1));

  float2 h = b + a * (float2)(gx, gy);
  float2 i = h * h;
  float2 j = h;

  int k = 0;
  while ((k < c) && ((i.x + i.y) < d)) {
    j.y = (2 * (j.x * j.y));
    j.x = i.x - i.y;
    j += h;
    i = j * j;

    k++;
  }
  if (k >= c)
    k = 0;

  f[g.y * e + g.x] = k;
}