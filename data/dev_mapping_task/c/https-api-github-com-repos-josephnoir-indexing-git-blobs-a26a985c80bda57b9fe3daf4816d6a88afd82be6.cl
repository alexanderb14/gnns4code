kernel void A(global uint* restrict a, global uint* restrict b, local uint* c, uint d) {
  const uint e = get_local_id(0);
  const uint f = get_group_id(0);
  const uint g = get_local_size(0);
  const uint h = g * 2;
  const uint i = f * h;
  const uint j = h;

  uint k = 1;

  c[2 * e] = (i + (2 * e) < d) ? a[i + (2 * e)] : 0;
  c[2 * e + 1] = (i + (2 * e + 1) < d) ? a[i + (2 * e + 1)] : 0;

  for (uint l = j >> 1; l > 0; l >>= 1) {
    barrier(1);
    if (e < l) {
      int m = k * (2 * e + 1) - 1;
      int n = k * (2 * e + 2) - 1;
      c[n] += c[m];
    }
    k *= 2;
  }

  if (e == 0) {
    b[f] = c[j - 1];
    c[j - 1] = 0;
  }

  for (uint l = 1; l < j; l *= 2) {
    k >>= 1;
    barrier(1);
    if (e < l) {
      int m = k * (2 * e + 1) - 1;
      int n = k * (2 * e + 2) - 1;
      uint o = c[m];
      c[m] = c[n];
      c[n] += o;
    }
  }
  barrier(1);

  if (i + (2 * e) < d)
    a[i + (2 * e)] = c[2 * e];
  if (i + (2 * e + 1) < d)
    a[i + (2 * e + 1)] = c[2 * e + 1];
}

kernel void B(global uint* restrict a, global uint* restrict b, uint c) {
  local uint d[2048];
  uint e = get_local_id(0);
  uint f = 1;
  const uint g = 2048;

  d[2 * e] = (2 * e < c) ? b[2 * e] : 0;
  d[2 * e + 1] = (2 * e + 1 < c) ? b[2 * e + 1] : 0;

  for (uint h = g >> 1; h > 0; h >>= 1) {
    barrier(1);
    if (e < h) {
      int i = f * (2 * e + 1) - 1;
      int j = f * (2 * e + 2) - 1;
      d[j] += d[i];
    }
    f *= 2;
  }

  if (e == 0)
    d[g - 1] = 0;

  for (uint h = 1; h < g; h *= 2) {
    f >>= 1;
    barrier(1);
    if (e < h) {
      int i = f * (2 * e + 1) - 1;
      int j = f * (2 * e + 2) - 1;
      uint k = d[i];
      d[i] = d[j];
      d[j] += k;
    }
  }
  barrier(1);

  if (2 * e < c)
    b[2 * e] = d[2 * e];
  if (2 * e + 1 < c)
    b[2 * e + 1] = d[2 * e + 1];
}

kernel void C(global uint* restrict a, global uint* restrict b, uint c) {
  const uint d = get_local_id(0);
  const uint e = get_group_id(0);
  const uint f = get_local_size(0);
  const uint g = f * 2;
  const uint h = e * g;

  uint i = 2 * d;
  uint j = 2 * d + 1;
  uint k = i + h;
  uint l = j + h;
  uint m = b[e];
  if (k < c)
    a[k] += m;
  if (l < c)
    a[l] += m;
}