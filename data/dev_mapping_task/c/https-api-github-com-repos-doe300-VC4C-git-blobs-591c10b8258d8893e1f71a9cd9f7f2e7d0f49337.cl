kernel void A(global float a[], global float b[]) {
  int c = get_global_id(0);
  float8 d = vload8(c, a);
  float8 e = vload8(c, b);
  d += e;
  vstore8(d, c, a);
}

kernel void B(global float a[], global float b[], global float c[]) {
  int d = get_global_id(0);
  float16 e = vload16(d, b);
  float16 f = vload16(d, c);
  vstore16(e * f + e * f + e * f, d, a);
}

kernel void C(global float a[], global float b[]) {
  for (int c = 0; c < 1000; c++) {
    a[c] = -c;
    b[c] = -c;
  }
}