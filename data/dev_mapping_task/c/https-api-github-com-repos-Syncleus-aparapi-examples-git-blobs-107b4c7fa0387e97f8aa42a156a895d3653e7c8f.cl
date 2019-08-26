void A(__global float* a, __global char* b, __global char* c, int d, int e, int f, int g) {
  float h = 0.0f;
  int i = 0;
  for (int j = -3; j < 6; j += 3) {
    for (int k = -1; k < 2; k++) {
      int l = 0xff & b[(((g + k) * d) + (f + j))];
      h = h + ((float)l * a[i++]);
    }
  }
  char m = (char)max(0, min((int)h, 255));
  c[(g * d) + f] = m;
  return;
}

__kernel void B(__global float* a, __global char* b, __global char* c, int d, int e) {
  int f = get_global_id(0) % (d * 3);
  int g = get_global_id(0) / (d * 3);
  if (f > 3 && f < ((d * 3) - 3) && g > 1 && g < (e - 1)) {
    A(a, b, c, d * 3, e, f, g);
  }
}