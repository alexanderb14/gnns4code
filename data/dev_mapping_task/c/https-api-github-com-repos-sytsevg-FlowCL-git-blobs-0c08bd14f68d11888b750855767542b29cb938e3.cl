kernel void A(global float* a, uint b) {
  float c;
  float d = 1.0f;
  float e = 1.0f;
  float f = 0.0f;
  float g = 0.0f;

  while (b--) {
    c = d / e;
    f += c;
    g = 4.0f * f;
    d *= -1.0f;
    e += 2.0f;
  }

  a[get_global_id(0)] = g;
}

kernel void B(global float* a, global float* b, float c) {
  b[get_global_id(0)] = a[get_global_id(0)] + c;
}

kernel void C(global float* a, global float* b) {
  b[get_global_id(0)] = a[get_global_id(0)];
}

kernel void D(global float4* a, float b) {
  a[get_global_id(0)].xyzw = b;
}

kernel void E(global float4* a, float b) {
  a[get_global_id(0)].xyzw += b;
}

inline uint F(uint a, uint b, uint c, uint d, uint e, uint f) {
  return (c * (d * e)) + (b * d) + a;
}

kernel void G(global int* a, volatile global uint* b, volatile global uint* c, global float* d) {
  uint e = get_global_id(0);
  uint f = get_global_id(1);
  uint g = get_global_id(2);
  uint h = F(e, f, g, get_global_size(0), get_global_size(1), get_global_size(2));

  if (h == 0) {
    *b = 0;
    *c = 0;
  }

  barrier(1 | 2);

  (void)atomic_add(b, 1);
  (void)atomic_add(c, a[h]);

  barrier(1 | 2);

  if (h == (get_global_size(0) * get_global_size(1) * get_global_size(2)) - 1) {
    *d = (float)(*c) / (float)(*b);
  }
}

kernel void H(global uint4* a, global uint* b, uint c) {
  uint d = (c / 4) / get_global_size(0);
  uint e = get_global_id(0);
  uint f = get_global_size(0);
  uint g = (uint)-1;
  local uint h;

  for (uint i = 0; i < d; i++, e += f) {
    g = min(g, a[e].x);
    g = min(g, a[e].y);
    g = min(g, a[e].z);
    g = min(g, a[e].w);
  }

  if (get_local_id(0) == 0) {
    h = (uint)-1;
  }

  barrier(1);

  (void)atomic_min(&h, g);

  barrier(1);

  if (get_local_id(0) == 0) {
    b[get_group_id(0)] = h;
  }
}

kernel void I(global uint* a, global uint* b) {
  (void)atomic_min(b, a[get_global_id(0)]);
}

kernel void J(global uint4* a, global uint* b, uint c) {
  uint d = (c / 4) / get_global_size(0);
  uint e = get_global_id(0);
  uint f = get_global_size(0);
  uint g = 0;
  local uint h;

  for (uint i = 0; i < d; i++, e += f) {
    g = max(g, a[e].x);
    g = max(g, a[e].y);
    g = max(g, a[e].z);
    g = max(g, a[e].w);
  }

  if (get_local_id(0) == 0) {
    h = 0;
  }

  barrier(1);

  (void)atomic_max(&h, g);

  barrier(1);

  if (get_local_id(0) == 0) {
    b[get_group_id(0)] = h;
  }
}

kernel void K(global uint* a, global uint* b) {
  (void)atomic_max(b, a[get_global_id(0)]);
}

kernel void L(global int* a) {
}

kernel void M(global float* a, global float* b) {
}