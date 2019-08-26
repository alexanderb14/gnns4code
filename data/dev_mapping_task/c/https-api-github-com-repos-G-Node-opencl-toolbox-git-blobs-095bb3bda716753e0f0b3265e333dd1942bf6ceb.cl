inline int A(int a, int b) {
  if (b == -1) {
    b = get_global_id(0);
  } else {
    b += get_global_size(0);
  }

  if (b >= a)
    b = -1;

  return b;
}

__kernel void B(__global const float* a, __global const float* b, __global float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    c[e] = a[e] + b[e];
    e = A(d, e);
  }
}