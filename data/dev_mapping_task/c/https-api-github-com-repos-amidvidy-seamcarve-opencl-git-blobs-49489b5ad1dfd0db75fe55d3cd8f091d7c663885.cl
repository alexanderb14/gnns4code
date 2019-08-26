__kernel void A(__global float* a, __global int* b, __global int* c, int d, int e, int f, int g) {
  const int h = get_local_id(0);
  const int i = e - 2;

  int j = *c;

  if (h == 0) {
    b[e - 1] = j;

    for (int k = i; k >= 0; k--) {
      float l = (j < 0) ? 0x1.fffffep127f : (a)[((k)*f + (j - 1))];
      float m = (a)[((k)*f + (j))];
      float n = (j > (d - g)) ? 0x1.fffffep127f : (a)[((k)*f + (j + 1))];

      if (l < m) {
        j += (l < n) ? -1 : 1;
      } else {
        j += (m < n) ? 0 : 1;
      }

      b[k] = j;
    }
  }
}