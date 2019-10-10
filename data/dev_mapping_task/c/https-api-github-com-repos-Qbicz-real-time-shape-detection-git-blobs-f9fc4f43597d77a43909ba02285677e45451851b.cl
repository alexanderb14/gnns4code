enum {
  yuv_shift = 14,
  R2Y = 4899,
  G2Y = 9617,
  B2Y = 1868,
};

__kernel void A(int a, int b, int c, int d, int e, int f, __global const uchar* g, __global uchar* h) {
  const int i = get_global_id(0);
  const int j = get_global_id(1);

  c /= sizeof(uchar);
  d /= sizeof(uchar);
  if (j < b && i < a) {
    int k = j * c + i * e;
    int l = j * d + i;
    h[l] = (uchar)((((g[k + f] * B2Y + g[k + 1] * G2Y + g[k + (f ^ 2)] * R2Y)) + (1 << ((yuv_shift)-1))) >> (yuv_shift));
  }
}
__kernel void B(int a, int b, int c, int d, __global const uchar* e, __global uchar* f) {
  const int g = get_global_id(0);
  const int h = get_global_id(1);

  c /= sizeof(uchar);
  d /= sizeof(uchar);
  if (h < b && g < a) {
    int i = h * c + g;
    int j = h * d + g * 4;
    uchar k = e[i];
    f[j++] = k;
    f[j++] = k;
    f[j++] = k;
    f[j] = 255;
  }
}