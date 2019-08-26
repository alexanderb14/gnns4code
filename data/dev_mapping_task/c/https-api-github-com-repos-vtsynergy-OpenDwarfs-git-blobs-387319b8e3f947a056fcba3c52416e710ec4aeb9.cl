__kernel void A(unsigned char a, float b, float c, __global uint2* d, __global unsigned int* e, __global uint2* f, uint g, __global unsigned char* h, __global float* i) {
  uint j = get_local_size(0) * get_group_id(0) + get_local_id(0);
  uint2 k;
  uint l, m;
  float n, o;

  unsigned int p = 0;

  if (j < g) {
    k = d[j];
    m = e[j];
    l = k.x;

    o = n = i[l];

    while (n - o < b && l > 0) {
      l--;
      o = i[l];
    }

    while (n - o <= c && l > 0) {
      if (h[l] == a) {
        f[m + p].x = l;
        f[m + p].y = k.y;
        p++;
      }
      l--;
      o = i[l];
    }
  }
}
__kernel void B(unsigned char a, float b, float c, __global uint2* d, __global uint* e, uint f, __global unsigned char* g, __global float* h) {
  uint i = get_local_size(0) * get_group_id(0) + get_local_id(0);
  uint2 j;
  uint k;
  float l, m;

  unsigned int n = 0;

  if (i < f) {
    j = d[i];
    k = j.x;

    m = l = h[k];

    while (l - m < b && k > 0) {
      k--;
      m = h[k];
    }

    while (l - m <= c && k > 0) {
      if (g[k] == a) {
        n++;
      }
      k--;
      m = h[k];
    }
    e[i] = n;
  }
}