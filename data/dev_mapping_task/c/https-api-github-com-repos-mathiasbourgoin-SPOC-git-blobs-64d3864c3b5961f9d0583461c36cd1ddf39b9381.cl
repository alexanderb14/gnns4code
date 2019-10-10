struct point {
  float x;
  float y;
};

__kernel void A(__global struct point* a, __global int* b, const int c, const float d) {
  const int e = 32 * get_local_size(0) * get_group_id(0) + get_local_id(0);
  int f = get_local_size(0);
  if (e < (int)(c - 32 * f))
    for (int g = 0; g < 32; g++) {
      int h = e + f * g;
      b[h] = (a[h].x * a[h].x + a[h].y * a[h].y <= d);
    }
}

struct point2 {
  double x;
  double y;
};

__kernel void B(__global struct point2* a, __global int* b, const int c, const float d) {
  const int e = 32 * get_local_size(0) * get_group_id(0) + get_local_id(0);
  int f = get_local_size(0);
  if (e < (int)(c - 32 * f))
    for (int g = 0; g < 32; g++) {
      int h = e + f * g;
      b[h] = (a[h].x * a[h].x + a[h].y * a[h].y <= (double)d);
    }
}