__kernel void A(const int a, const float b, __local float* c, __global float* d) {
  int e = get_local_size(0);
  int f = get_local_id(0);
  int g = get_group_id(0);
  float h, i, j = 0.0f;
  int k, l, m;
  l = (g * e + f) * a;
  m = l + a;
  for (k = l; k < m; k++) {
    h = (k + 0.5f) * b;
    j += 4.0f / (1.0f + h * h);
  }
  c[f] = j;
  barrier(1);
  if (f == 0) {
    i = 0.0f;
    for (k = 0; k < e; k++) {
      i += c[k];
    }
    d[g] = i;
  }
}

__kernel void B(const int a, const float b, __local float* c, __global float* d) {
  int e = get_local_size(0);
  int f = get_local_id(0);
  int g = get_group_id(0);
  float h, i = 0.0f;

  float4 j, k;
  float4 l = {0.5f, 1.5f, 2.5f, 3.5f};
  float4 m = {4.0f, 4.0f, 4.0f, 4.0f};
  float4 n = {1.0f, 1.0f, 1.0f, 1.0f};

  int o, p, q;
  p = (g * e + f) * a;
  q = p + a;
  for (o = p; o < q; o = o + 4) {
    j = ((float4)o + l) * b;
    k = m / (n + j * j);
    i += k.s0 + k.s1 + k.s2 + k.s3;
  }
  c[f] = i;
  barrier(1);
  if (f == 0) {
    h = 0.0f;
    for (o = 0; o < e; o++) {
      h += c[o];
    }
    d[g] = h;
  }
}

__kernel void C(const int a, const float b, __local float* c, __global float* d) {
  int e = get_local_size(0);
  int f = get_local_id(0);
  int g = get_group_id(0);
  float h, i = 0.0f;

  float8 j, k;
  float8 l = {0.5f, 1.5f, 2.5f, 3.5f, 4.5f, 5.5f, 6.5f, 7.5f};
  float8 m = {4.0f, 4.0f, 4.0f, 4.0f, 4.0f, 4.0f, 4.0f, 4.0f};
  float8 n = {1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f, 1.0f};

  int o, p, q;
  p = (g * e + f) * a;
  q = p + a;
  for (o = p; o < q; o = o + 8) {
    j = ((float8)o + l) * b;
    k = m / (n + j * j);
    i += k.s0 + k.s1 + k.s2 + k.s3 + k.s4 + k.s5 + k.s6 + k.s7;
  }
  c[f] = i;
  barrier(1);
  if (f == 0) {
    h = 0.0f;
    for (o = 0; o < e; o++) {
      h += c[o];
    }
    d[g] = h;
  }
}