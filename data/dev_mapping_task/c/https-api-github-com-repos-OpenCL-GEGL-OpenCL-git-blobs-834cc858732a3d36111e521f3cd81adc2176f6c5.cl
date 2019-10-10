__kernel void A(const global float4* a, global float4* b, const global float* c, const int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  const int g = get_global_size(0);
  const int h = get_global_size(0);

  const int i = d / 2;

  const int j = e + (f + i) * g;
  const int k = e + f * h;

  const int l = j - i * g;

  float4 m = 0.0f;

  for (int n = 0; n < d; n++) {
    m += a[l + n * g] * c[n];
  }

  b[k] = m;
}

__kernel void B(const global float4* a, global float4* b, const global float* c, const int d) {
  const int e = get_global_id(0);
  const int f = get_global_id(1);
  const int g = get_global_size(0) + d - 1;
  const int h = get_global_size(0);

  const int i = d / 2;

  const int j = e + f * g + i;
  const int k = e + f * h;

  const int l = j - i;

  float4 m = 0.0f;

  for (int n = 0; n < d; n++) {
    m += a[l + n] * c[n];
  }

  b[k] = m;
}