kernel void A(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = __clc_pow(e, c);
  }
  b[get_global_id(0)] = e;
}

kernel void B(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--)
    e = exp2(e) * 0.1f;

  b[get_global_id(0)] = e;
}

kernel void C(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = exp((float)-0x1.6p1 - e * 0.1f);
  }

  b[get_global_id(0)] = e;
}

kernel void D(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = exp10((float)-0x1.2p+5 - e * 0.1f);
  }

  b[get_global_id(0)] = e;
}

kernel void E(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = log2((float)0x1.1p0 - e * 0.0001f);
  }

  b[get_global_id(0)] = e;
}

kernel void F(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = log((float)0x1.1p0 - e * 0.0001f);
  }

  b[get_global_id(0)] = e;
}

kernel void G(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = log10((float)0x1.1p0 - e * 0.0001f);
  }

  b[get_global_id(0)] = e;
}

kernel void H(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--)
    e = sqrt(e) + sqrt(c + e);

  b[get_global_id(0)] = e;
}

kernel void I(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = sin(e);

    e *= 0x1p-16;
  }

  b[get_global_id(0)] = e;
}

kernel void J(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = cos(e);

    e *= 0x1p-16;
  }
  b[get_global_id(0)] = e;
}

kernel void K(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--) {
    e = tan(e);
  }

  b[get_global_id(0)] = e;
}

kernel void L(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--)
    e = asin(c - 1);

  b[get_global_id(0)] = e;
}

kernel void M(global float* a, global float* b, float c, uint d) {
  float e = a[get_global_id(0)];

  for (; d > 0; d--)
    e = acos(c - 1);

  b[get_global_id(0)] = e;
}