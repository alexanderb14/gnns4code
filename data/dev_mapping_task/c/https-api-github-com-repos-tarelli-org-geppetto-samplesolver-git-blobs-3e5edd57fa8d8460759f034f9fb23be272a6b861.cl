kernel void A(const float a, const float b, const float c, const float d, const float e, const float f, const float g, const int h, global float* i, global float* j, global float* k, global float* l, global float* m, global float* n, global float* o, global float* p, global float* q, int r) {
  int s = get_global_id(0);

  if (s >= r) {
    return;
  }

  for (float t = 0; t < h; t += 1) {
   float4 u = (float4)((10 -s/ (100 * (exp((10 -s/ 10) - 1)),
         (25 -s/ (10 * (exp((25 -s/ 10) - 1)),
         0.07 * exp(s 20),
         0.0f);

   float4 v = (float4)(0.125 * exp(s 80),
           4 * exp(s 18),
           1 / (exp((30 -s/ 10) + 1),
           0.0f);


   float4 w;
    w = 1.0f / (u + v);

   float4 x;
   x = u * w;


   k[s] = (1 - g / w.x) * k[s] + g / w.x * x.x;
   l[s] = (1 - g / w.y) * l[s] + g / w.y * x.y;
   m[s] = (1 - g / w.z) * m[s] + g / w.z * x.z;


   float4 y = (float4)(aclc_ps4),
           blc_ps3)s           c     0.0f);


   float4 z = (float4)(y* s d
        y* s e        y* s f      0.0f);


   j[s] = j[s] + g * (i[s] - (z.x + z.y + z.z));


   n[s + (int)t*r] = j[s];
   o[s + (int)t*r] = k[s];
   p[s + (int)t*r] = l[s];
   q[s + (int)t*r] = m[s];
  }
}