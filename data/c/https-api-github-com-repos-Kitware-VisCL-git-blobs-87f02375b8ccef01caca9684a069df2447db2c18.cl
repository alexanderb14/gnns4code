__constant sampler_t Ga = 0x0000 | 0x0002 | 0x0000; typedef int4 brief_descr; int A(brief_descr a, brief_descr b) {
  int4 c = a ^ b;

  c = c - ((c >> 1) & 0x55555555);
  c = (c & 0x33333333) + ((c >> 2) & 0x33333333);
  int4 d = ((c + (c >> 4) & 0xF0F0F0F) * 0x1010101) >> 24;

  return d.x + d.y + d.z + d.w;
}

__kernel void B(__global int2* a, __read_only image2d_t b, __global brief_descr* c, __global brief_descr* d, __global int* e, unsigned f, unsigned g) {
  int h = get_global_id(0);
  brief_descr i = d[h];

  int2 j = a[h] / 2;

  int2 k;
  int l = -1;
  for (k.x = j.x - f; k.x <= j.x + f; k.x++) {
    for (k.y = j.y - f; k.y <= j.y + f; k.y++) {
      int m = read_imagei(b, Ga, k).x;
      if (m > -1) {
        int n = A(c[m], i);
        if (n <= g) {
          g = n;
          l = m;
        }
      }
    }
  }

  e[h] = l;
}