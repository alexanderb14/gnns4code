__kernel void A(__global char* a, uint b, __global char* c, uint d, int e) {
  uint f = get_global_id(0);
  for (uint g = 0; g < e; g++) {
    char h = a[f * b + g];
    char i = c[f * d + g];
    a[f * b + g] = i;
    c[f * d + g] = h;
  }
}