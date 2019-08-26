__kernel void A(__global uint* a, __global int* b) {
  a[get_global_id(0)] = !(b[get_global_id(0)] == 4) ? 1 : 0;
}

__kernel void B(__global uint* a, __local uint* b, const uint c, const uint d, const uint e, __global uint* f, __global uint* g) {
  const uint h = get_global_id(0);
  const uint i = get_local_id(0);
  if (h < d) {
    const uint j = (h == 0) ? e : 0;
    if (i == 0) {
      b[i] = j;
    } else {
      b[i] = f[h - 1];
    }
  } else {
    b[i] = 0;
  }
  barrier(1);
  for (uint k = 1; k < c; k <<= 1) {
    const uint l = i >= k ? b[i - k] : 0;
    barrier(1);
    if (i >= k) {
      b[i] = ((b[i]) + (l));
    }
    barrier(1);
  }
  if (h < d) {
    g[h] = b[i];
  }
  if (i == c - 1) {
    a[get_group_id(0)] = ((f[h]) + (b[i]));
  }
}

__kernel void C(__global uint* a, __local uint* b, const uint c, const uint d, const uint e, __global uint* f) {
  const uint g = get_global_id(0);
  const uint h = get_local_id(0);
  if (g < d) {
    b[h] = f[g];
  } else {
    b[h] = 0;
  }
  barrier(1);
  for (uint i = 1; i < c; i <<= 1) {
    const uint j = h >= i ? b[h - i] : 0;
    barrier(1);
    if (h >= i) {
      b[h] = ((b[h]) + (j));
    }
    barrier(1);
  }
  if (g < d) {
    f[g] = b[h];
  }
  if (h == c - 1) {
    a[get_group_id(0)] = b[h];
  }
}

__kernel void D(__global uint* a, __global uint* b, const uint c) {
  const uint d = get_global_id(0);
  const uint e = get_group_id(0);
  if (d < c) {
    a[d] = ((b[e]) + (a[d]));
  }
}

__kernel void E(__global int* a, __global int* b, __global uint* c) {
  if (!(a[get_global_id(0)] == 4))
    b[c[get_global_id(0)]] = a[get_global_id(0)];
}