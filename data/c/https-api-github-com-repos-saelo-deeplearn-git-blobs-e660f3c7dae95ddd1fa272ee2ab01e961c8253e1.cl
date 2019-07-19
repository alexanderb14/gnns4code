typedef int2 pos2; kernel void A(uint a, global const float* b, global const float* c, float d, global float* e) {
  uint f = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;

  for (uint g = 0; g < 10; g++) {
    uint h = f + g * get_local_size(0);
    if (h < a) {
      e[h] = b[h] + d * c[h];
    }
  }
}

kernel void B(uint a, global const float* b, global const float* c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) + (c[g]);
    }
  }
};
kernel void C(uint a, global const float* b, float c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) + (c);
    }
  }
};

kernel void D(uint a, global const float* b, global const float* c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) - (c[g]);
    }
  }
};
kernel void E(uint a, global const float* b, float c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) - (c);
    }
  }
};

kernel void F(uint a, global const float* b, global const float* c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) * (c[g]);
    }
  }
};
kernel void G(uint a, global const float* b, float c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) * (c);
    }
  }
};

kernel void H(uint a, global const float* b, global const float* c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) / (c[g]);
    }
  }
};
kernel void I(uint a, global const float* b, float c, global float* d) {
  uint e = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint f = 0; f < 10; f++) {
    uint g = e + f * get_local_size(0);
    if (g < a) {
      d[g] = (b[g]) / (c);
    }
  }
};

kernel void J(uint a, global const float* b, global float* c) {
  uint d = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint e = 0; e < 10; e++) {
    uint f = d + e * get_local_size(0);
    if (f < a) {
      c[f] = exp(b[f]);
    }
  }
};
kernel void K(uint a, global const float* b, global float* c) {
  uint d = get_local_id(0) + (get_global_id(0) - get_local_id(0)) * 10;
  for (uint e = 0; e < 10; e++) {
    uint f = d + e * get_local_size(0);
    if (f < a) {
      c[f] = log(b[f]);
    }
  }
};