int A(int a, int b, int c) {
  return a * 512 * 512 + b * 512 + c;
}

int B(int3 a) {
  int b = (a.x >= 0 && a.x < 512);
  int c = (a.y >= 0 && a.y < 512);
  int d = (a.z >= 0 && a.z < 512);

  return b && c && d;
}

int C(__global unsigned char* a, int3 b, int3 c) {
  unsigned char d = a[b.z * 512 * 512 + b.y * 512 + b.x];
  unsigned char e = a[c.z * 512 * 512 + c.y * 512 + c.x];

  int f = abs(d - e) < 1;
  return f;
}

__kernel void D(__global unsigned char* a, __global unsigned char* b, __global int* c) {
  int3 d;
  d.x = get_global_id(0);
  d.y = get_global_id(1);
  d.z = get_global_id(2);

  int e = A(d.z, d.y, d.x);

  if (b[e] == 2) {
    *c = 1;
    b[e] = 1;

    int f[6] = {-1, 1, 0, 0, 0, 0};
    int g[6] = {0, 0, -1, 1, 0, 0};
    int h[6] = {0, 0, 0, 0, -1, 1};

    for (int i = 0; i < 6; i++) {
      int3 j;
      j.x = d.x + f[i];
      j.y = d.y + g[i];
      j.z = d.z + h[i];

      if (!B(j)) {
        continue;
      }

      if (b[A(j.z, j.y, j.x)]) {
        continue;
      }

      if (C(a, d, j)) {
        b[A(j.z, j.y, j.x)] = 2;
      }
    }
  }
}