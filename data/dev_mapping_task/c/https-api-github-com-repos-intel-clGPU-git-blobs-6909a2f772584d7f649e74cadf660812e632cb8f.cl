__kernel void A(float a, __global float* b, uint c, __global float* d, uint e, __global float* f, uint g) {
  const uint h = get_global_id(0);
  const uint i = get_global_id(1);

  const uint j = i * g + h;
  float k = f[j];
  float l = b[h * c] * d[i * e];
  k = mad(a, l, k);
  f[j] = k;
}