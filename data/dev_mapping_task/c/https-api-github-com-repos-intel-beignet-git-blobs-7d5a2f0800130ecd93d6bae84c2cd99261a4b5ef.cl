kernel void A(global float* a, global float* b) {
  int c = get_global_id(0);
  float d = sqrt(a[c]);
  b[c * 4] = 1.0f / d;
  b[c * 4 + 1] = (float)c / d;
  b[c * 4 + 2] = 2.0f / d;
  b[c * 4 + 3] = 1.0f / d + d;
};