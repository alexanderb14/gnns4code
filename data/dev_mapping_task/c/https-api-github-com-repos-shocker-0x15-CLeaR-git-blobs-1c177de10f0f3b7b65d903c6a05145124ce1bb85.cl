void A(volatile global float* a, float b); void B(volatile local float* a, float b); void C(volatile local float* a, float b); void A(volatile global float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(*a + b, uint);
  while ((e = atomic_cmpxchg((volatile global uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(__builtin_astype(c, float) + b, uint);
  }
}

void B(volatile local float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(fmin(*a, b), uint);
  while ((e = atomic_cmpxchg((volatile local uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(fmin(__builtin_astype(c, float), b), uint);
  }
}

void C(volatile local float* a, float b) {
  uint c, d, e;

  c = __builtin_astype(*a, uint);
  d = __builtin_astype(fmax(*a, b), uint);
  while ((e = atomic_cmpxchg((volatile local uint*)a, c, d)) != c) {
    c = e;
    d = __builtin_astype(fmax(__builtin_astype(c, float), b), uint);
  }
}

kernel void D(uint a, uint b, global float3* c);
kernel void E(uint a, uint b, uint c, global float3* d, global float3* e);
kernel void F(uint a, uint b, uint c, global float3* d, global float3* e);
kernel void G(uint a, uint b, uint c, global float3* d, global float3* e);
kernel void H(uint a, uint b, uint c, global float3* d, global uchar* e);

kernel void D(uint a, uint b, global float3* c) {
  *(c + a * get_global_id(1) + get_global_id(0)) = (float3)(0.0f, 0.0f, 0.0f);
}

kernel void E(uint a, uint b, uint c, global float3* d, global float3* e) {
  const uint f = get_global_id(0);
  const uint g = get_global_id(1);
  const global float3* h = d + a * g + f;
  global float3* i = e + a * g + f;
  *i = *h * (1.0f / c);
}

constant float Ga[] = {
    0.002969017f, 0.01330621f, 0.021938231f, 0.01330621f, 0.002969017f, 0.01330621f, 0.059634295f, 0.098320331f, 0.059634295f, 0.01330621f, 0.021938231f, 0.098320331f, 0.162102822f, 0.098320331f, 0.021938231f, 0.01330621f, 0.059634295f, 0.098320331f, 0.059634295f, 0.01330621f, 0.002969017f, 0.01330621f, 0.021938231f, 0.01330621f, 0.002969017f,
};
constant float Gb[] = {
    0.000763447f, 0.001831415f, 0.003421534f, 0.004978302f, 0.005641155f, 0.004978302f, 0.003421534f, 0.001831415f, 0.000763447f, 0.001831415f, 0.004393336f, 0.008207832f, 0.011942326f, 0.013532428f, 0.011942326f, 0.008207832f, 0.004393336f, 0.001831415f, 0.003421534f, 0.008207832f, 0.01533425f,  0.022311201f, 0.025281903f, 0.022311201f, 0.01533425f,  0.008207832f, 0.003421534f,
    0.004978302f, 0.011942326f, 0.022311201f, 0.032462606f, 0.036784952f, 0.032462606f, 0.022311201f, 0.011942326f, 0.004978302f, 0.005641155f, 0.013532428f, 0.025281903f, 0.036784952f, 0.041682812f, 0.036784952f, 0.025281903f, 0.013532428f, 0.005641155f, 0.004978302f, 0.011942326f, 0.022311201f, 0.032462606f, 0.036784952f, 0.032462606f, 0.022311201f, 0.011942326f, 0.004978302f,
    0.003421534f, 0.008207832f, 0.01533425f,  0.022311201f, 0.025281903f, 0.022311201f, 0.01533425f,  0.008207832f, 0.003421534f, 0.001831415f, 0.004393336f, 0.008207832f, 0.011942326f, 0.013532428f, 0.011942326f, 0.008207832f, 0.004393336f, 0.001831415f, 0.000763447f, 0.001831415f, 0.003421534f, 0.004978302f, 0.005641155f, 0.004978302f, 0.003421534f, 0.001831415f, 0.000763447f,
};

kernel void F(uint a, uint b, uint c, global float3* d, global float3* e) {
  const uint f = get_global_id(0);
  const uint g = get_global_id(1);
  const global float3* h = d + a * g + f;

  const int i = 4;
  for (int j = -i; j <= i; ++j) {
    for (int k = -i; k <= i; ++k) {
      int l = clamp((int)f + k, 0, (int)a - 1);
      int m = clamp((int)g + j, 0, (int)b - 1);
      global float* n = (global float*)(e + a * m + l);
      float o = Gb[(2 * i + 1) * (j + i) + (k + i)] * (1.0f / c);
      A(n + 0, o * h->s0);
      A(n + 1, o * h->s1);
      A(n + 2, o * h->s2);
    }
  }
}

constant float Gc = 30;
kernel void G(uint a, uint b, uint c, global float3* d, global float3* e) {
  const uint f = get_global_id(0);
  const uint g = get_global_id(1);
  const global float3* h = d + a * g + f;

  for (int i = 0; i < 3; ++i) {
    float j = *((const global float*)h + i) * (1.0f / c);
    if (j > Gc) {
      float k = j - Gc;
      const int l = k > 7.0f ? 7 : (int)k;
      for (int m = -l; m <= l; ++m) {
        for (int n = -l; n <= l; ++n) {
          float o = sqrt((float)(n * n + m * m));

          int p = clamp((int)f + n, 0, (int)a - 1);
          int q = clamp((int)g + m, 0, (int)b - 1);
          global float* r = (global float*)(e + a * q + p);
          if (n != 0 || m != 0)
            A(r + i, exp(-o) * k);
          else
            A(r + i, Gc);
        }
      }
    } else {
      global float* r = (global float*)(e + a * g + f);
      A(r + i, j);
    }
  }
}

kernel void H(uint a, uint b, uint c, global float3* d, global uchar* e) {
  const uint f = get_global_id(0);
  const uint g = get_global_id(1);
  const global float3* h = d + a * g + f;
  const uint i = c * (b - 1 - g) + f * 3;

  float3 j = *h;
    float3 k = (float3j                           j                           j
    float l = 0.2989 * k.s0 + 0.5866 * k.s1 + 0.1144 * k.s2;
    float m = (1.0 - exp(-l)) / l;
    if (l == 0.0f)
        m = 1.0f;

    uchar3 n = convert_uchar3_rtz(clamp(255.0f * __clc_pow(m * k, 1.0f / 2.2f), 0.0f, 255.0f));
    e[i + 0] = n.s2;
    e[i + 1] = n.s1;
    e[i + 2] = n.s0;
}