__kernel void A(global float* a, global float* b) {
  int c = get_global_id(0);

  __local float d[256];
  d[get_local_id(0)] = a[c];

  __local uchar* e = (__local uchar*)&d[0];
  uchar f;
  for (int g = 0; g < 3; g++) {
    f = *e;
    e++;
  }

  b[c] = f;
}