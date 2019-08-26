__kernel void A(const __global float* a, const __global float* b, uint c, uint d, __global float* e) {
  uint f = get_global_id(0);
  float g = 0;
  for (int h = 0; h < c; ++h) {
    g += a[f * c + h] * b[h];
  }
  e[f] = g;
}

__kernel void B(const __global float* a, const __global float* b, uint c, uint d, __global float* e) {
  for (uint f = get_global_id(0); f < d; f += get_global_size(0)) {
    const __global float* g = a + f * c;
    float h = 0;
    for (uint i = 0; i < c; ++i)
      h += g[i] * b[i];
    e[f] = h;
  }
}

__kernel void C(const __global float* a, const __global float* b, uint c, uint d, __global float* e, __local float* f) {
  for (uint g = get_group_id(0); g < d; g += get_num_groups(0)) {
    const __global float* h = a + g * c;
    float i = 0;
    for (uint j = get_local_id(0); j < c; j += get_local_size(0))
      i += h[j] * b[j];
    f[get_local_id(0)] = i;
    barrier(1);
    if (get_local_id(0) == 0) {
      float k = 0;
      for (uint l = 0; l < get_local_size(0); ++l)
        k += f[l];
      e[g] = k;
    }
    barrier(1);
  }
}