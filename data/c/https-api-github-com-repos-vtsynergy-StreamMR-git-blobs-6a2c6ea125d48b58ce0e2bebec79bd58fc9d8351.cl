__kernel void A(__global const float* a, __global float* b, const int c, __local float* d) {
  int e = ((c / 4) / get_num_groups(0)) * 4;
  int f = get_group_id(0) * e;

  int g = (get_group_id(0) == get_num_groups(0) - 1) ? c : f + e;

  int h = get_local_id(0);
  int i = f + h;

  float j = 0.0f;

  while (i < g) {
    j += a[i];
    i += get_local_size(0);
  }

  d[h] = j;
  barrier(1);

  for (unsigned int k = get_local_size(0) / 2; k > 0; k >>= 1) {
    if (h < k) {
      d[h] += d[h + k];
    }
    barrier(1);
  }

  if (h == 0) {
    b[get_group_id(0)] = d[0];
  }
}

inline float B(float a, __local float* b, int c) {
  int d = get_local_id(0);
  b[d] = 0.0f;

  d += get_local_size(0);
  b[d] = a;
  barrier(1);

  float e;
  for (int f = 1; f < get_local_size(0); f *= 2) {
    e = b[d - f];
    barrier(1);
    b[d] += e;
    barrier(1);
  }
  return b[d - c];
}

__kernel void C(__global float* a, const int b, __local float* c) {
  float d = 0.0f;
  if (get_local_id(0) < b) {
    d = a[get_local_id(0)];
  }

  d = B(d, c, 1);

  if (get_local_id(0) < b) {
    a[get_local_id(0)] = d;
  }
}

__kernel void D(__global const float* a, __global const float* b, __global float* c, const int d, __local float* e) {
  __local float f;

  __global float4* g = (__global float4*)a;
  __global float4* h = (__global float4*)c;
  int i = d / 4;

  int j = i / get_num_groups(0);
  int k = get_group_id(0) * j;

  int l = (get_group_id(0) == get_num_groups(0) - 1) ? i : k + j;

  int m = k + get_local_id(0);
  int n = k;

  float o = b[get_group_id(0)];

  while (n < l) {
    float4 p;
    if (m < l) {
      p = g[m];
    } else {
      p.x = 0.0f;
      p.y = 0.0f;
      p.z = 0.0f;
      p.w = 0.0f;
    }

    p.y += p.x;
    p.z += p.y;
    p.w += p.z;

    float q = B(p.w, e, 1);

    p.x += q + o;
    p.y += q + o;
    p.z += q + o;
    p.w += q + o;

    if (m < l) {
      h[m] = p;
    }

    if (get_local_id(0) == get_local_size(0) - 1)
      f = p.w;
    barrier(1);

    o = f;

    n += get_local_size(0);
    m += get_local_size(0);
  }
  int r = d / get_num_groups(0);
  int s = get_local_id(0) + get_group_id(0) * r;
  if (s < d - 1)
    c[s + 1] = c[s];
  if (s == 0)
    c[0] = 0;
}