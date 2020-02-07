__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, uint e, uint f, float g) {
  uint h = get_global_id(0);
  uint i = get_global_id(1);

  float j = 0;

  for (uint k = 0; k < e; k++) {
    const float l = b[k * f + h];
    const float m = a[k + i * e];
    j += l * m;
  }

  j *= g;
  j += c[h];

  d[i * f + h] = j;
}

__kernel void B(__global float* a, __global float* b, __global float* c, uint d, uint e) {
  uint f = get_global_id(0);
  uint g = get_global_id(1);

  float h = 0;

  for (uint i = 0; i < e; i++) {
    const float j = b[f * e + i];
    const float k = c[g * e + i];
    h += j * k;
  }

  a[f + g * d] = h;
}

__kernel void C(__global float* a, __global float* b, uint c, uint d, float e) {
  uint f = get_global_id(0);

  float g = 0;
  for (uint h = 0; h < d; h++) {
    const float i = b[f + h * c];
    g += i;
  }

  g *= e;

  a[f] = g;
}