__kernel void A(const int a, __global float* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);
  const int e = c * d;
  for (int f = 2; f <= 2 * a - 2; f++) {
    if ((e >= ((2) > (f - a + 2) ? (2) : (f - a + 2))) && (e <= ((f) < (a) ? (f) : (a)))) {
      const int g = f - e + 2 - 1;
      const int h = e - 1;
      b[g * a + h] = b[(g - 1) * a + h] + b[g * a + (h - 1)] - b[(g - 1) * a + (h - 1)];
    }
    barrier(2);
  }
}

__kernel void B(const int a, __global double* b) {
  const int c = get_global_id(0);
  const int d = get_global_id(1);
  const int e = c * d;
  for (int f = 2; f <= 2 * a - 2; f++) {
    if ((e >= ((2) > (f - a + 2) ? (2) : (f - a + 2))) && (e <= ((f) < (a) ? (f) : (a)))) {
      const int g = f - e + 2 - 1;
      const int h = e - 1;
      b[g * a + h] = b[(g - 1) * a + h] + b[g * a + (h - 1)] - b[(g - 1) * a + (h - 1)];
    }
    barrier(2);
  }
}