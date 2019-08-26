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

__kernel void B(__global float* a, __global const float* b, __global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b[e] + c[e];
    e = A(d, e);
  }
}

__kernel void C(__global float* a, __global const float* b, __global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b[e] - c[e];
    e = A(d, e);
  }
}

__kernel void D(__global float* a, __global const float* b, __global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b[e] / c[e];
    e = A(d, e);
  }
}

__kernel void E(__global float* a, __global const float* b, __global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b[e] * c[e];
    e = A(d, e);
  }
}

__kernel void F(__global float* a, float b, global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b * c[e];
    e = A(d, e);
  }
}

__kernel void G(__global float* a, global const float* b, float c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = c * b[e];
    e = A(d, e);
  }
}

__kernel void H(__global float* a, global const float* b, float c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = c + b[e];
    e = A(d, e);
  }
}

__kernel void I(__global float* a, float b, global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b + c[e];
    e = A(d, e);
  }
}

__kernel void J(__global float* a, float b, global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b - c[e];
    e = A(d, e);
  }
}

__kernel void K(__global float* a, global const float* b, float c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b[e] - c;
    e = A(d, e);
  }
}

__kernel void L(__global float* a, float b, global const float* c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b / c[e];
    e = A(d, e);
  }
}

__kernel void M(__global float* a, global const float* b, float c, int d) {
  int e = A(d, -1);
  while (e >= 0) {
    a[e] = b[e] / c;
    e = A(d, e);
  }
}

__kernel void N(__global float* a, __global const float* b, int c) {
  int d = A(c, -1);
  while (d >= 0) {
    a[d] = exp(b[d]);
    d = A(c, d);
  }
}