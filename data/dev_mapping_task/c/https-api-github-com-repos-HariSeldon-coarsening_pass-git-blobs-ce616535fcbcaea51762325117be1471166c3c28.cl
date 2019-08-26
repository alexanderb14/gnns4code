__kernel void A(__global float* a, __global float* b, int c, int d, __local float* e) {
  unsigned int f = get_local_size(1);
  unsigned int g = get_local_size(0);

  unsigned int h = get_group_id(1);
  unsigned int i = get_group_id(0);

  unsigned int j = get_global_id(1);
  unsigned int k = get_global_id(0);

  unsigned int l = get_local_id(1);
  unsigned int m = get_local_id(0);

  unsigned int n = j * c + k;
  e[l * (g) + m] = b[n];

  barrier(1);

  unsigned int o = g * i * d + f * h;

  unsigned int p = l * g + m;
  unsigned int q = p / f;
  unsigned int r = p % f;

  unsigned int s = o + d * q + r;
  a[s] = e[r * g + q];
}

__kernel void B(__global float* a, __global const float* b, int c, int d) {
  unsigned int e = get_global_id(1);
  unsigned int f = get_global_id(0);

  unsigned int g = e * c + f;
  unsigned int h = f * d + e;
  a[h] = b[g];
}