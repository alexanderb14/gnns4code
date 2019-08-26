typedef int2 pos2; inline float A(float a) {
  return 1.0 / (1.0 + exp(-a));
}

inline float B(float a) {
  return A(a) * (1.0 - A(a));
}

kernel void C(uint a, global const float* b, global float* c) {
  uint d = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint e = 0; e < 10; e++) {
    uint f = d + e * get_local_size(0);
    if (f < a) {
      c[f] = A(b[f]);
    }
  }
};
kernel void D(uint a, global const float* b, global float* c) {
  uint d = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint e = 0; e < 10; e++) {
    uint f = d + e * get_local_size(0);
    if (f < a) {
      c[f] = B(b[f]);
    }
  }
};

inline float E(float a) {
  return max(0.f, a);
}

inline float F(float a) {
  return a < 0 ? 0 : 1;
}

kernel void G(uint a, global const float* b, global float* c) {
  uint d = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint e = 0; e < 10; e++) {
    uint f = d + e * get_local_size(0);
    if (f < a) {
      c[f] = E(b[f]);
    }
  }
};
kernel void H(uint a, global const float* b, global float* c) {
  uint d = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint e = 0; e < 10; e++) {
    uint f = d + e * get_local_size(0);
    if (f < a) {
      c[f] = F(b[f]);
    }
  }
};