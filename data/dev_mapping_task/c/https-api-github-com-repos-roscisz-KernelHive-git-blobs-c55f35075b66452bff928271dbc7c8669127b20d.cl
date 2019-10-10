__kernel void A(__global float* a, unsigned int b, unsigned int c, __global float* d, unsigned int e) {
  __local float f[16];
  float g = 0.0;

  int h = get_global_id(0);
  int i = get_group_id(0);
  int j = get_local_id(0);

  int k = b / sizeof(float);
  int l = k / get_global_size(0);

  if (h == 0) {
    d[0] = 0.0;
  }
  barrier(2);

  f[j] = 0.0;
  barrier(1);

  for (int m = 0; m < l; m++) {
    int n = (h * l) + m;
    f[j] += a[n];
  }
  barrier(1);

  for (int m = 0; m < 16; m++) {
    g += f[m];
  }

  if (j == 0) {
    a[i] = g;
  }
  barrier(2);

  if (h == 0) {
    for (int m = 0; m < 8; m++) {
      d[0] += a[m];
    }
  }
}