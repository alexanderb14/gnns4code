kernel void A(global uint* a, global float* b, global float* c) {
  float d[4];

  for (int e = 0; e < 4; e++) {
    d[a[e]] = e;
  }

  for (int e = 0; e < 4; e++) {
    c[e] = d[e];
  }
}