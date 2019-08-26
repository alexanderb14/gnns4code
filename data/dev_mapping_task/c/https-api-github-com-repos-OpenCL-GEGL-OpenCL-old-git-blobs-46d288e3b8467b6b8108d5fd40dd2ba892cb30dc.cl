__kernel void A(const global float4* a, const int b, global float4* c, constant float* d, const int e, const int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = g + h * get_global_size(0);

  int j = e / 2;
  int k = g + (h + f) * b;

  float4 l = 0.0f;

  for (int m = -j; m <= j; m++) {
    l += a[k + m * b] * d[m + j];
  }

  c[i] = l;
}

__kernel void B(const global float4* a, const int b, global float4* c, constant float* d, const int e, const int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = g + h * get_global_size(0);

  int j = e / 2;
  int k = h * b + (g + f);

  float4 l = 0.0f;

  for (int m = -j; m <= j; m++) {
    l += a[k + m] * d[m + j];
  }

  c[i] = l;
}