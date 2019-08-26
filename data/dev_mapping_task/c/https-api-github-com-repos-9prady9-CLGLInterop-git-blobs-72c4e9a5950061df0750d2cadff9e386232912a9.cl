float A(int a) {
  a = (a << 13) ^ a;
  return (1.0 - ((a * (a * a * 15731 + 789221) + 1376312589) & 0x7fffffff) / 1073741824.0);
}

kernel void B(global float* a, int const b, int const c, uint const d) {
  int e = get_global_id(0);
  a[2 * e + 0] = A(d * e);
  a[2 * e + 1] = A(d ^ e);
}