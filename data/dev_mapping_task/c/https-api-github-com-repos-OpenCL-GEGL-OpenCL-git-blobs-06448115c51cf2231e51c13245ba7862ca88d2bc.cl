inline int A(int a, int b) {
  int c = (a < 0);
  return ((a + c) / b) - c;
}

__kernel void B(__global float4* a, float4 b, float4 c, int d, int e, int f, int g) {
  size_t h = get_global_size(0);
  size_t i = get_global_offset(0);
  size_t j = get_global_offset(1);
  size_t k = get_global_id(0) - i;
  size_t l = get_global_id(1) - j;

  int m = get_global_id(0) - f;
  int n = get_global_id(1) - g;

  int o = A(m, d);
  int p = A(n, e);
  a[k + l * h] = (o + p) & 1 ? c : b;
}