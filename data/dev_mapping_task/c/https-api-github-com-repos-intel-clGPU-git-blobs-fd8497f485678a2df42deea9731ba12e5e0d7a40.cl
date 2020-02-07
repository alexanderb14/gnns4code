__kernel void A(int a, float b, __global float* c, uint d, __global float* e, uint f) {
  const uint g = get_global_id(0);
  const uint h = get_global_id(1);

  const bool i = a == (1);

  const bool j = g < h;
  const bool k = g > h;

  if (i && j)
    return;
  if (!i && k)
    return;

  float l = c[g * d];
  float m = c[h * d];
  float n = e[((h) * (f) + (g))];
  float o = l * m;
  n = mad(b, o, n);
  e[((h) * (f) + (g))] = n;
}