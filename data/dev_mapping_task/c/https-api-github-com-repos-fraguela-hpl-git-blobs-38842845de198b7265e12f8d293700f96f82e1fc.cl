__kernel void A(__global float* a, __global const float* b, __global const float* c, const uint d, const uint e) {
  const uint f = (d + get_global_size(0) - 1) / get_global_size(0);

  const uint g = min(d, ((int)get_global_id(0) + 1) * f);

  for (uint h = get_global_id(0) * f; h < g; ++h) {
    float i = 0.f;
    for (uint j = 0; j < e; ++j)
      i += b[h * e + j] * c[j];
    a[h] = i;
  }
}

__kernel void B(__global float* a, __global const float* b, __global const float* c, const uint d, const uint e) {
  for (uint f = get_global_id(0); f < d; f += (uint)(get_global_size(0))) {
    float g = 0.f;
    for (uint h = 0; h < e; ++h)
      g += b[f * e + h] * c[h];
    a[f] = g;
  }
}

__kernel void C(__global float* a, __global const float* b, __global const float* c, const uint d, const uint e) {
  __local float f[2048];

  const uint g = (d + get_global_size(0) - 1) / get_global_size(0);

  const uint h = min(d, ((int)get_global_id(0) + 1) * g);

  if (e <= 2048) {
    for (uint i = get_local_id(0); i < e; i += get_local_size(0))
      f[i] = c[i];

    barrier(1);

    for (uint j = get_global_id(0) * g; j < h; ++j) {
      float k = 0.f;
      for (uint i = 0; i < e; ++i)
        k += b[j * e + i] * f[i];
      a[j] = k;
    }

  } else {
    for (uint j = get_global_id(0) * g; j < h; ++j) {
      a[j] = *c - *c;
    }

    for (uint l = 0; l < e; l += 2048) {
      const uint m = min(l + 2048, e);

      for (uint i = (uint)(l + get_local_id(0)); i < m; i += get_local_size(0))
        f[i - l] = c[i];

      barrier(1);

      for (uint j = (uint)(get_global_id(0) * g); j < h; ++j) {
        float k = a[j];
        for (uint i = l; i < m; ++i)
          k += b[j * e + i] * f[i - l];
        a[j] = k;
      }

      barrier(1);
    }
  }
}

__kernel void D(__global float* a, __global const float* b, __global const float* c, const uint d, const uint e) {
  __local float f[2048];

  if (e <= 2048) {
    for (uint g = get_local_id(0); g < e; g += get_local_size(0))
      f[g] = c[g];

    barrier(1);

    for (uint h = get_global_id(0); h < d; h += get_global_size(0)) {
      float i = 0.f;
      for (uint g = 0; g < e; ++g)
        i += b[h * e + g] * f[g];
      a[h] = i;
    }

  } else {
    for (uint h = get_global_id(0); h < d; h += get_global_size(0))
      a[h] = 0.f;

    for (uint j = 0; j < e; j += 2048) {
      const uint k = min(j + 2048, e);

      for (uint g = j + get_local_id(0); g < k; g += get_local_size(0))
        f[g - j] = c[g];

      barrier(1);

      for (uint h = get_global_id(0); h < d; h += get_global_size(0)) {
        float i = a[h];
        for (uint g = j; g < k; ++g)
          i += b[h * e + g] * f[g - j];
        a[h] = i;
      }

      barrier(1);
    }
  }
}

__kernel void E(__global float* a, __global const float* b, __global const float* c, const uint d, const uint e) {
  __local float f[2048], g[256];

  const uint h = (d + get_global_size(0) - 1) / get_global_size(0);

  if (e <= 2048) {
    const uint i = get_local_id(0);

    const uint j = get_group_id(0) * get_local_size(0) * h;

    const uint k = min(d, j + (uint)get_local_size(0) * h);

    for (uint l = i; l < e; l += get_local_size(0))
      f[l] = c[l];

    barrier(1);

    for (uint m = j; m < k; ++m) {
      float n = 0.f;
      for (uint l = i; l < e; l += get_local_size(0))
        n += b[m * e + l] * f[l];

      g[i] = n;

      barrier(1);
      for (uint l = get_local_size(0) >> 1; l > 1; l = l >> 1) {
        if (i < l)
          g[i] += g[i + l];
        barrier(1);
      }
      if (!i)
        a[m] = g[0] + g[1];
    }

  } else {
    const uint k = min(d, ((int)get_global_id(0) + 1) * h);

    for (uint m = get_global_id(0) * h; m < k; ++m) {
      a[m] = *c - *c;
    }

    for (uint o = 0; o < e; o += 2048) {
      const uint p = min(o + 2048, e);

      for (uint l = o + get_local_id(0); l < p; l += get_local_size(0))
        f[l - o] = c[l];

      barrier(1);

      for (uint m = get_global_id(0) * h; m < k; ++m) {
        float n = a[m];
        for (uint l = o; l < p; ++l)
          n += b[m * e + l] * f[l - o];
        a[m] = n;
      }

      barrier(1);
    }
  }
}