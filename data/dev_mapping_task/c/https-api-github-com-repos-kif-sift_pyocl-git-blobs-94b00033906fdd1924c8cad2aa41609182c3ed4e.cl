typedef float4 keypoint; __kernel void A(__global float* a, float b, __global float* c, float d, __global float* e, int f, int g, int h) {
  int i = (int)get_global_id(1);
  int j = (int)get_global_id(0);

  if (j < g && i < h) {
    int k = j + g * i;
    int l = f * g * h + k;
    e[l] = b * a[k] + d * c[k];
  }
}
__kernel void B(__global keypoint* a, __global keypoint* b, __global int* c, int d, int e) {
  int f = (int)get_global_id(0);
  if (f < d) {
    b[f] = a[f];
  } else if (f < e) {
    keypoint g = a[f];

    if (g.s1 != -1) {
      int h = atomic_add(c, 1);
      if (h < e)
        b[h] = g;
    }
  }
}