enum neural_memory_format { x_f32, xb_f32, bx_f32, yxfb_f32, byxf_f32, bfyx_f32, fyxb_f32, oiyx_f32, byxf_b24_f32, yxoi_o4_f32, os_yxi_sv16_f32, bs_yxf_bv24_f32, any = -1 };

typedef struct _neural_memory_tag {
  uint format;
  uint feature_offset;
  uint spatial_offset;
  uint vector_size;
  uint data_offset;
  uint data[1];
} neural_memory;

typedef struct _neural_vector_tag {
  uint feature_offset;
  uint spatial_offset;
  uint raw_size;
  uint data[1];
} neural_vector;

__attribute__((overloadable)) __global uint* A(__global neural_memory* a) {
  return &(a->data[0]);
}
__attribute__((overloadable)) const __global uint* A(const __global neural_memory* a) {
  return &(a->data[0]);
}
__attribute__((overloadable)) uint B(const __global neural_memory* a) {
  return a->vector_size;
}

__attribute__((overloadable)) __global uint* C(__global neural_memory* a) {
  return A(a);
}
__attribute__((overloadable)) const __global uint* C(const __global neural_memory* a) {
  return A(a);
}
__attribute__((overloadable)) uint D(const __global neural_memory* a) {
  return a->feature_offset;
}

__attribute__((overloadable)) __global uint* E(__global neural_memory* a) {
  return &(a->data[a->feature_offset]);
}
__attribute__((overloadable)) const __global uint* E(const __global neural_memory* a) {
  return &(a->data[a->feature_offset]);
}
__attribute__((overloadable)) uint F(const __global neural_memory* a) {
  return a->spatial_offset - a->feature_offset;
}

__attribute__((overloadable)) __global uint* G(__global neural_memory* a) {
  return &(a->data[a->spatial_offset]);
}
__attribute__((overloadable)) const __global uint* G(const __global neural_memory* a) {
  return &(a->data[a->spatial_offset]);
}
__attribute__((overloadable)) uint H(const __global neural_memory* a) {
  return B(a) - a->spatial_offset;
}

__attribute__((overloadable)) __global void* I(__global neural_memory* a) {
  return &(a->data[a->data_offset]);
}
__attribute__((overloadable)) const __global void* I(const __global neural_memory* a) {
  return &(a->data[a->data_offset]);
}
__attribute__((overloadable)) size_t J(const __global neural_memory* a) {
  return sizeof(float);
}

__attribute__((overloadable)) size_t K(const __global neural_memory* a) {
  size_t b = J(a);

  const __global uint* c = A(a);
  uint d = B(a);

  for (uint e = 0; e < d; e++) {
    b *= c[e];
  }
  return b;
}

__attribute__((overloadable)) const __global uint* A(const __global neural_vector* b) {
  return &(b->data[0]);
}
__attribute__((overloadable)) uint B(const __global neural_vector* b) {
  return b->raw_size;
}

__attribute__((overloadable)) const __global uint* C(const __global neural_vector* b) {
  return A(b);
}
__attribute__((overloadable)) uint D(const __global neural_vector* b) {
  return b->feature_offset;
}

__attribute__((overloadable)) const __global uint* E(const __global neural_vector* b) {
  return &(b->data[b->feature_offset]);
}
__attribute__((overloadable)) uint F(const __global neural_vector* b) {
  return b->spatial_offset - b->feature_offset;
}

__attribute__((overloadable)) const __global uint* G(const __global neural_vector* b) {
  return &(b->data[b->spatial_offset]);
}
__attribute__((overloadable)) uint H(const __global neural_vector* b) {
  return B(b) - b->spatial_offset;
}
__kernel void L(__global neural_memory* a, __global neural_memory* b, __global neural_memory* c, __global neural_memory* d) {
  __global uint* e = A(a);
  __global uint* f = A(b);
  __global float* g = (__global float*)I(a);
  __global float* h = (__global float*)I(b);
  __global float* i = (__global float*)I(c);
  __global float* j = (__global float*)I(d);

  const int k = get_global_id(0);

  j[k] = 0;
  uint l = k / e[0];
  uint m = k % e[0];
  uint n = l * f[0];
  for (uint o = 0; o < e[2]; o++) {
    j[k] += g[o * e[0] + m] * h[n + o];
  }
  j[k] += i[l];
}

__kernel void M(const __global neural_memory* a, const __global neural_memory* b, float c, __global neural_memory* d, const __global neural_vector* e) {
  const __global uint* f = A(a);
  const __global uint* g = A(b);
  const __global uint* h = A(d);
  const __global float* i = (const __global float*)I(a);
  const __global float* j = (const __global float*)I(b);
  __global float* k = (__global float*)I(d);

  int l = get_global_id(0);
  const int m = h[0];
  const int n = l % h[0];

  const int o = l / m;

  const int p = (o % f[2]) * G(e)[0];
  const int q = (o * G(e)[1]) / f[2];

  const int r = o * m + n;

  k[r] = 0;
  for (uint s = 0; s < g[4]; s++) {
    for (uint t = 0; t < g[3]; t++) {
      int u = (p + t + ((q + s) * f[2])) * m + n;
      int v = s * g[3] + t;
      k[r] += i[u] * j[v];
    }
  }
  k[r] += c;
}