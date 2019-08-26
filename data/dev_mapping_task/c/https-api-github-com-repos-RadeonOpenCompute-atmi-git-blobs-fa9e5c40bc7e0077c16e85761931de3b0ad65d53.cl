typedef struct pixel_type {
  float r;
  float g;
  float b;
  float x;
} pixel;

typedef struct arg_aos_struct_type {
  pixel* src;
  pixel* dst;
  int start_index;
  int end_index;
} args_aos;

typedef struct arg_da_struct_type {
  float* r;
  float* g;
  float* b;
  float* x;
  float* d_r;
  float* d_g;
  float* d_b;
  float* d_x;
  int start_index;
  int end_index;
} args_da;
__kernel void A(__global pixel* a, __global pixel* b, int c) {
  int d = get_global_id(0);
  float e;
  for (int f = 0; f < 1; f++) {
    for (int g = 0; g < c * 1024; g = g + 1024) {
      e = (0.3 * a[d + g].r + 0.59 * a[d + g].g + 0.11 * a[d + g].b + 1.0 * a[d + g].x);
      b[d + g].r = e;
      b[d + g].g = e;
      b[d + g].b = e;
      b[d + g].x = e;
    }
  }
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, __global float* e, __global float* f, __global float* g, __global float* h, int i) {
  size_t j = get_global_id(0);
  float k;
  for (int l = 0; l < 1; l++) {
    for (int m = 0; m < i * 1024; m = m + 1024) {
      k = (0.3 * a[j + m] + 0.59 * b[j + m] + 0.11 * c[j + m] + 1.0 * d[j + m]);
      e[j + m] = k;
      f[j + m] = k;
      g[j + m] = k;
      h[j + m] = k;
    }
  }
}