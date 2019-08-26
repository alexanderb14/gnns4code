__kernel void A(const __global float* restrict a, const __global float* restrict b, const __global float* restrict c, __global float* restrict d, const int e, const int f) {
  const int g = get_global_id(0);
  const int h = g * e;
  float i = 0;
  float j = 0;
  for (int k = 0; k < e; k++) {
    i += b[h + k] * a[k];
  }
  i += c[g];
  if (f == 1) {
    d[g] = fmax(j, i);
  } else {
    d[g] = i;
  }
}