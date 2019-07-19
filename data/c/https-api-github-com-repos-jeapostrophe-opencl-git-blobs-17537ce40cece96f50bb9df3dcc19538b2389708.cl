float A(__global float* a, __global float* b, const uint c, const float d) {
  uint e = 0;

  float f = (a[0] - d);
  e += (f < 0) ? 1 : 0;
  for (uint g = 1; g < c; g += 1) {
    float h = (a[g] - d) - ((b[g - 1] * b[g - 1]) / f);

    e += (h < 0) ? 1 : 0;
    f = h;
  }
  return e;
}

__kernel void B(__global uint* a, __global float* b, __global float* c, __global float* d, const uint e) {
  uint f = get_global_id(0);

  uint g = 2 * f;
  uint h = g + 1;

  float i = b[g];
  float j = b[h];

  uint k = A(c, d, e, i);
  uint l = A(c, d, e, j);

  a[f] = l - k;
}
__kernel void C(__global float* a, __global float* b, __global uint* c, __global float* d, __global float* e, const uint f, const float g) {
  uint h = get_global_id(0);
  uint i = h;

  uint j = 2 * h;
  uint k = j + 1;

  uint l = 0;
  while (i >= c[l]) {
    i -= c[l];
    ++l;
  }

  uint m = 2 * l;
  uint n = m + 1;

  if (c[l] == 1) {
    float o = (b[n] + b[m]) / 2;
    float p = A(d, e, f, o) - A(d, e, f, b[m]);

    if (b[n] - b[m] < g) {
      a[j] = b[m];
      a[k] = b[n];
    } else if (p == 0) {
      a[j] = o;
      a[k] = b[n];
    } else {
      a[j] = b[m];
      a[k] = o;
    }
  }

  else {
    float q = (b[n] - b[m]) / c[l];
    a[j] = b[m] + q * i;
    a[k] = a[j] + q;
  }
}