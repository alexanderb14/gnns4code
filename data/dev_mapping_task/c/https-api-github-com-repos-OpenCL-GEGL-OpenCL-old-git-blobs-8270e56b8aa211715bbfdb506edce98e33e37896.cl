float A(float4 a, float4 b) {
  float4 c = a - b;
  c *= c;
  return c.x + c.y + c.z;
}

__kernel void B(__global const float4* a, int b, int c, __global float4* d, int e, int f) {
  int g = get_global_id(0);
  int h = get_global_id(1);
  int i = h * get_global_size(0) + g;

  __global const float4* j = a + ((e + g) + (h + e) * b);
  float4 k = 0;

  int l = 0;
  if (f == 2) {
    for (int m = -e; m < 0; m++) {
      for (int n = -e; n < 0; n++) {
        __global const float4* o = j;
        float p = 1000.0f;

        int q[4] = {nge nge};
        int r[4] = { mhe mhe for (int s = 0; s < 4; s++){if (q[s] >= 0 && q[s] < b && r[s] >= 0 && r[s] < c){__global const float4* t = a + (q[s] + r[s] * b);
        float u = A(*t, *j);
        if (u < p) {
          p = u;
          o = t;
        }
      }
    }

    k += *o;

    ++l;
    if (m == 0 && n == 0)
      break;
  }
}
d[i] = k / (float4)(l);
return;
}
else if (f == 1) {
  for (int m = -e; m <= 0; m++) {
    for (int n = -e; n <= e; n++) {
      __global const float4* o = j;
      float p = 1000.0f;

      if (m != 0 && n != 0) {
        int q[4] = {mge mge};
        int r[4] = {nhe nhe};

        for (m = 0; m < 2; m++) {
          if (q[m] >= 0 && q[m] < b && r[m] >= 0 && r[m] < c) {
            __global const float4* t = a + (q[m] + r[m] * b);
            float u = A(*t, *j);
            if (u < p) {
              p = u;
              o = t;
            }
          }
        }
      }
      k += *o;
      ++l;
      if (m == 0 && n == 0)
        break;
    }
  }
  d[i] = k / (float4)(l);
  return;
}
return;
}