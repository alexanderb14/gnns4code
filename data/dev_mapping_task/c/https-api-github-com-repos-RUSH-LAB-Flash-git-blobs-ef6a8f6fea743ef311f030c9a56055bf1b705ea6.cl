__kernel void A(__global uint* a, __global const float* b, __global const short* c, __global const uint* d, uint e, uint f, uint g, uint h, uint i, __local uint* j, __local short* k, __local uint* l) {
  uint m = get_global_id(1);
  uint n = get_global_id(2);
  uint o = get_global_size(2);
  uint p = get_local_id(0);

  event_t q[3];
  q[0] = async_work_group_copy(j, d + n * h * f, f * h, 0);

  q[1] = async_work_group_copy(k, c + n * h * f, f * h, 0);

  wait_group_events(2, q);

  float r = 0;
  uint s = 0;
  uint t = 0;
  float u;
  uint v;

  for (uint w = 0; w < i; w++) {
    v = m * i + w;
    r = 0;

    for (uint x = 0; x < f; x++) {
      t = j[p * f + x];
      s = k[p * f + x] >= 0;
      u = b[v * g + t];
      r += s ? u : (-u);
    }

    l[w * h + p] = r > 0;
  }

  event_t y = async_work_group_copy(a + n * (e * h) + m * i * h, l, i * h, 0);

  wait_group_events(1, &y);
}

__kernel void B(__global uint* a, __global const uint* b, __global const float* c, __global const uint* d, __global const uint* e, __global const uint* f, __global const uint* g, __global const uint* h, uint i, uint j, uint k, uint l, __local uint* m) {
  uint n = get_global_id(1);
  uint o = get_global_id(2);
  uint p = get_global_size(2);
  uint q = get_local_id(0);

  float r = 0;
  uint s = 0;
  uint t = 0;
  uint u;
  uint v;
  uint w = 0;

  uint x = e[o * j + q];
  uint y = f[o * j + q];
  uint z = g[o * j + q];
  uint aa = h[o * j + q];

  for (uint ab = 0; ab < l; ab++) {
    u = n * l + ab;
    r = 0;

    w = d[u];
    v = d[u + 1] - w;

    for (uint ac = 0; ac < v; ac++) {
      t = b[w + ac];
      s = ((unsigned)(z * t + aa) >> 31);
      r += (((unsigned)(x * t + y) >> (32 - k)) == 1) ? (s ? c[w + t] : (-c[w + t])) : 0;
    }
    m[ab * j + q] = r > 0;
  }

  event_t ad = async_work_group_copy(a + o * (i * j) + n * l * j, m, l * j, 0);

  wait_group_events(1, &ad);
}

__kernel void C(__global uint* a, __global uint* b, __global uint* c, uint d, uint e, uint f, uint g) {
  uint h = get_global_id(0);
  uint i = get_global_id(1);

  uint j = 0;
  for (uint k = 0; k < e; k++) {
    j |= (unsigned)c[(i * (d * e) + h * e + k)] << k;
  }
  a[(d * g * i + h * g + 0)] = j;
  b[(d * g * i + h * g + 0)] = h;
  for (uint k = 1; k < g; k++) {
    a[(d * g * i + h * g + k)] = j ^ (1 << (k - 1));
    b[(d * g * i + h * g + k)] = h;
  }
}

__kernel void D(__global uint* a, __global uint* b, uint c, uint d, uint e, uint f) {
  uint g = get_global_id(0);
  uint h = get_global_id(1);

  uint i = 0;
  for (uint j = 0; j < d; j++) {
    i |= (unsigned)b[(h * (c * d) + g * d + j)] << j;
  }
  a[(c * f * h + g * f + 0)] = i;
  for (uint j = 1; j < f; j++) {
    a[(c * f * h + g * f + j)] = i ^ (1 << (j - 1));
  }
}