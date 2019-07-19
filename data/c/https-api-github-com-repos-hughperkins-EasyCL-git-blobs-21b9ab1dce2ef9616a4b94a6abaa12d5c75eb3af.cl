kernel void A(global float* a, global float* b) {
  const int c = get_global_id(0);
  b[c] = a[c] + 7;
}

kernel void B(global unsigned char* a, global unsigned char* b) {
  const int c = get_global_id(0);
  b[c] = a[c] + 7;
}

kernel void C(global int* a, global int* b) {
  const int c = get_global_id(0);
  b[c] = a[c] + 7;
}

kernel void D(global const int* a, global int* b) {
  const int c = get_global_id(0);
  int d = 0;
  int e = 0;

  while (e < 10001) {
    d = (d + a[e % 47]) % (103070 * 7);
    e++;
  }
  b[c] = d;
}

kernel void E(const int a, const int b, global int* c) {
  const int d = get_global_id(0);
  int e = 0;
  int f = 0;
  while (f < 100000) {
    e = (e + a) % 1357 * b;
    f++;
  }

  c[d] = e;
}