inline uint A(uint a, __local uint* b, uint c) {
  uint d = 2 * get_local_id(0) - (get_local_id(0) & (c - 1));
  b[d] = 0;
  d += c;
  b[d] = a;

  for (uint e = 1; e < c; e <<= 1) {
    barrier(1);
    uint f = b[d] + b[d - e];
    barrier(1);
    b[d] = f;
  }

  return b[d];
}

inline uint B(uint a, __local uint* b, uint c) {
  return A(a, b, c) - a;
}
inline uint4 C(uint4 a, __local uint* b, uint c) {
  a.y += a.x;
  a.z += a.y;
  a.w += a.z;

  uint d = A(a.w, b, c / 4) - a.w;

  return (a + (uint4)d);
}

inline uint4 D(uint4 a, __local uint* b, uint c) {
  return C(a, b, c) - a;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void E(__global uint4* a, __global uint4* b, __local uint* c, uint d) {
  uint4 e = b[get_global_id(0)];

  uint4 f = D(e, c, d);

  a[get_global_id(0)] = f;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void F(__global uint* a, __global uint* b, __global uint* c, __local uint* d, uint e, uint f) {
  uint g = 0;
  if (get_global_id(0) < e)
    g = b[(4 * 256 - 1) + (4 * 256) * get_global_id(0)] + c[(4 * 256 - 1) + (4 * 256) * get_global_id(0)];

  uint h = B(g, d, f);

  if (get_global_id(0) < e)
    a[get_global_id(0)] = h;
}

__kernel __attribute__((reqd_work_group_size(256, 1, 1))) void G(__global uint4* a, __global uint* b) {
  __local uint c[1];

  uint4 d = a[get_global_id(0)];

  if (get_local_id(0) == 0)
    c[0] = b[get_group_id(0)];

  barrier(1);
  d += (uint4)c[0];
  a[get_global_id(0)] = d;
}