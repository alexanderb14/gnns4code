__kernel void A(__global float* a, __local float* b, const uint c, const uint d) {
  const uint e = get_local_id(0);
  const uint f = get_global_id(0);

  const float g = (1.0 / (float)c);
  float h = 0.0;

  for (uint i = f * d; i < (f * d) + d; i++) {
    float j = g * ((float)i - 0.5);
    h += 4.0 / (1.0 + j * j);
  }

  b[e] = h;

  barrier(1);

  float k = 0;

  const uint l = get_local_size(0);

  for (uint m = 2; m - 1 < l; m *= 2) {
    if (e % m == 0) {
      b[e] += b[e + m / 2];
    }

    barrier(1);
  }

  if (e == 0) {
    a[get_group_id(0)] = b[0];
  }
}