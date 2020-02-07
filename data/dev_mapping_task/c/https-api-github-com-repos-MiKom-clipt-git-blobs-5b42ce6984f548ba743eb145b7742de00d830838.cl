__kernel void A(__global const float* a, __global float* b, __constant unsigned int* c, int d, int e, int f) {
  int g = get_global_id(0);
  if (g < e * f) {
    float h = a[g * 3];
    float i = a[g * 3 + 1];
    float j = a[g * 3 + 2];
    int k = g / e;
    int l = g % e;
    for (int m = -(d - 1) / 2; m <= (d - 1) / 2; m++) {
      for (int n = -(d - 1) / 2; n <= (d - 1) / 2; n++) {
        int o = (m + 3) * d + n + 3;
        if (c[o] == 0) {
          continue;
        }
        int p = clamp(k + m, 0, f - 1);
        int q = clamp(l + n, 0, e - 1);
        int r = p * e + q;
        h = max(h, a[r * 3]);
        i = max(i, a[r * 3 + 1]);
        j = max(j, a[r * 3 + 2]);
      }
    }
    b[g * 3] = h;
    b[g * 3 + 1] = i;
    b[g * 3 + 2] = j;
  }
}

__kernel void B(__global const float* a, __global float* b, __constant unsigned int* c, int d, int e, int f) {
  int g = get_global_id(0);
  if (g < e * f) {
    float h = a[g * 3];
    float i = a[g * 3 + 1];
    float j = a[g * 3 + 2];
    int k = g / e;
    int l = g % e;
    for (int m = -(d - 1) / 2; m <= (d - 1) / 2; m++) {
      for (int n = -(d - 1) / 2; n <= (d - 1) / 2; n++) {
        int o = (m + 3) * d + n + 3;
        if (c[o] == 0) {
          continue;
        }
        int p = clamp(k + m, 0, f - 1);
        int q = clamp(l + n, 0, e - 1);
        int r = p * e + q;
        h = min(h, a[r * 3]);
        i = min(i, a[r * 3 + 1]);
        j = min(j, a[r * 3 + 2]);
      }
    }
    b[g * 3] = h;
    b[g * 3 + 1] = i;
    b[g * 3 + 2] = j;
  }
}