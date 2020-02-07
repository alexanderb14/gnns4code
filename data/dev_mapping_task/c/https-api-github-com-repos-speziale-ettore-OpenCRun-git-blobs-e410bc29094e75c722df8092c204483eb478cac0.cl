kernel void A(global float* a, global float* b, local float* c, local float* d) {
  size_t e = get_global_size(0), f = get_local_size(0);

  uint g = get_global_id(0), h = get_global_id(1);

  uint i = get_local_id(0), j = get_local_id(1);

  float k = 0.0f;

  for (uint l = 0; l < e; l += f) {
    c[(i)*f + (j)] = b[(g)*e + (l + j)];
    d[(i)*f + (j)] = b[(l + i) * e + (h)];

    barrier(1);

    for (uint m = 0; m < f; ++m)
      k += c[(i)*f + (m)] * d[(m)*f + (j)];

    barrier(1);
  }

  a[(g)*e + (h)] = k;
}