typedef int2 pos2; kernel __attribute__((reqd_work_group_size(1, 256, 1))) kernel void A(uint a, uint b, uint c, global const float* d, global const float* e, local float* f, global float* g) {
  uint h = get_global_id(0) * c;
  uint i = get_global_id(1);

  for (uint j = 0; j < c; j += get_local_size(1)) {
    uint k = j + get_local_id(1);
    if (k < c) {
      if (h + k < b)
        f[k] = e[h + k];
      else
        f[k] = 0;
    }
  }

  barrier(1);

  float l = 0;

  for (uint j = 0; j < c; j++)
    if (h + j < b && i < a)
      l += d[i * b + h + j] * f[j];

  if (i < a)
    g[i * get_global_size(0) + get_global_id(0)] = l;
}

kernel void B(uint a, uint b, global const float* c, global float* d) {
  uint e = get_global_id(0);

  if (e < a) {
    float f = 0;
    for (uint g = 0; g < b; g++)
      f += c[e * b + g];
    d[e] = f;
  }
}

kernel __attribute__((reqd_work_group_size(256, 1, 1))) kernel void C(uint a, uint b, uint c, global const float* d, global const float* e, local float* f, global float* g) {
  uint h = get_global_id(1) * c;
  uint i = get_global_id(0);

  for (uint j = 0; j < c; j += get_local_size(0)) {
    uint k = j + get_local_id(0);
    if (k < c) {
      if (h + k < a)
        f[k] = e[h + k];
      else
        f[k] = 0;
    }
  }

  barrier(1);

  float l = 0;

  for (uint j = 0; j < c; j++)
    if (h + j < a && i < b)

      l += d[(h + j) * b + i] * f[j];

  if (i < b)
    g[i * get_global_size(1) + get_global_id(1)] = l;
}

kernel void D(uint a, uint b, global const float* c, global const float* d, global float* e) {
  uint f = get_global_id(0);
  uint g = get_global_id(1);

  if (f < a && g < b) {
    e[f * b + g] = c[f] * d[g];
  }
}