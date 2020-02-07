__kernel void A(const __global float* a, __global float* b, const uint c, const uint d) {
  const uint e = get_global_id(0);
  const uint f = get_global_id(1);
  const uint g = (d % 16 == 0) ? 0 : 16 - (d % 16);

  if (e >= c)
    return;
  if (f >= d)
    b[(e * (d + g)) + f] = 0.0f;
  else
    b[(e * (d + g)) + f] = a[(e * d) + f];
}