__kernel void A(__global float* a, __global float* b, __global float* c, __local float* d, __local float* e, int f) {
  int g = get_group_id(1);
  int h = get_local_id(0);
  int i = get_local_id(1);
  if (h == 0)
    d[i] = a[f * g + i + 1];
  barrier(1);
  int j = h * f + i;
  int k = (f + 1) * f * g + (f + 1) * h + i + f + 2;
  e[j] = b[k] * d[h];
  barrier(1);
  for (int l = 1; l < f; l = l * 2) {
    if (h % (2 * l) == 0)
      e[j] += e[(h + l) * f + i];
    barrier(1);
  }
  if (h == 0)
    c[g * f + i] = e[j];
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d) {
  int e = get_global_id(1) + 1;
  int f = get_global_id(0) + 1;
  int g = e * (1 + get_global_size(0)) + f;
  float h = 0.3f * d[g] + (1.0f - 0.3f) * 0.3f * b[e] * a[f];
  c[g] += h;
  d[g] = h;
}