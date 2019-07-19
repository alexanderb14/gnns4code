__kernel void A(const __global uint4* a, __global uint4* b, const __global uint4 c[11], const __global uint d[256], const __global uint e[256], __local uint f[256], __local uint g[256]) {
  size_t h = get_global_id(0);
  size_t i = get_local_id(0);
  size_t j = get_local_size(0);
  size_t k = 256 / j;
  if (k == 0)
    k = 1;
  size_t l = i * k;
  const uint4 m = (uint4)(8);
  const uint4 n = (uint4)(0x00ff00ff);
  const uint4 o = (uint4)(0xff00ff00);
  uint4 p, q;

  for (uint r = 0; r < k; r++) {
    f[l + r] = d[l + r];
    g[l + r] = e[l + r];
  }
  barrier(1);

  q = a[h];
  p = (((((q) << (uint4)(8)) | ((q) >> (uint4)(32 - (8)))) & n) | ((((q) << (uint4)(24)) | ((q) >> (uint4)(32 - (24)))) & o)) ^ c[0];

  for (int r = 1; r <= 9; r++) {
  q = (uint4)(fps3 & 0xff], fps0 & 0xff], fps1 & 0xff], fps2 & 0xff]);
  p = p >> m;
  q = (((q) << (uint4)(24)) | ((q) >> (uint4)(32 - (24))));
  q ^= (uint4)(fps2 & 0xff], fps3 & 0xff], fps0 & 0xff], fps1 & 0xff]);
  p = p >> m;
  q = (((q) << (uint4)(24)) | ((q) >> (uint4)(32 - (24))));
  q ^= (uint4)(fps1 & 0xff], fps2 & 0xff], fps3 & 0xff], fps0 & 0xff]);
  p = p >> m;
  q = (((q) << (uint4)(24)) | ((q) >> (uint4)(32 - (24))));
  p = q ^ (uint4)(fps0], fps1], fps2], fps3]) ^ c[r];
  }

 q = (uint4)ps3 & 0xff],ps0 & 0xff],ps1 & 0xff],ps2 & 0xff]) << m;
 p = p >> m;
 q = (q | (uint4)ps2 & 0xff],ps3 & 0xff],ps0 & 0xff],ps1 & 0xff])) << m;
 p = p >> m;
 q = (q | (uint4)ps1 & 0xff],ps2 & 0xff],ps3 & 0xff],ps0 & 0xff])) << m;
 p = p >> m;
 b[h] = (q | (uint4)ps0],ps1],ps2],ps3])) ^ c[10];
}

__kernel void B(const __global uint4* a, __global uint4* b, const __global uint4 c[11], const __global uint d[256], const __global uint e[256], const __global uint f[256], const __global uint g[256], const __global uint h[256], __local uint i[256], __local uint j[256], __local uint k[256], __local uint l[256], __local uint m[256]) {
  size_t n = get_global_id(0);
  size_t o = get_global_size(0);
  size_t p = get_local_id(0);
  size_t q = get_local_size(0);
  size_t r = 256 / q;
  if (r == 0)
    r = 1;
  size_t s = p * r;
  const uint4 t = (uint4)(8);
  const uint4 u = (uint4)(0x00ff00ff);
  const uint4 v = (uint4)(0xff00ff00);
  uint4 w, x;

  if (p < 256) {
    for (uint y = 0; y < r; y++) {
      i[s + y] = d[s + y];
      j[s + y] = e[s + y];
      k[s + y] = f[s + y];
      l[s + y] = g[s + y];
      m[s + y] = h[s + y];
    }
  }
  barrier(1);

  x = a[n];
  w = (((((x) << (uint4)(8)) | ((x) >> (uint4)(32 - (8)))) & u) | ((((x) << (uint4)(24)) | ((x) >> (uint4)(32 - (24)))) & v)) ^ c[0];

  for (int y = 1; y <= 9; y++) {
  x = (uint4)(lws3 & 0xff], lws0 & 0xff], lws1 & 0xff], lws2 & 0xff]);
  w = w >> t;
  x ^= (uint4)(kws2 & 0xff], kws3 & 0xff], kws0 & 0xff], kws1 & 0xff]);
  w = w >> t;
  x ^= (uint4)(jws1 & 0xff], jws2 & 0xff], jws3 & 0xff], jws0 & 0xff]);
  w = w >> t;
  w = x ^ (uint4)(iws0], iws1], iws2], iws3]) ^ c[y];
  }

 x = (uint4)ws3 & 0xff],ws0 & 0xff],ws1 & 0xff],ws2 & 0xff]) << t;
 w = w >> t;
 x = (x | (uint4)ws2 & 0xff],ws3 & 0xff],ws0 & 0xff],ws1 & 0xff])) << t;
 w = w >> t;
 x = (x | (uint4)ws1 & 0xff],ws2 & 0xff],ws3 & 0xff],ws0 & 0xff])) << t;
 w = w >> t;
 b[n] = (x | (uint4)ws0],ws1],ws2],ws3])) ^ c[10];
}

__kernel void C(const __global uint4* a, __global uint4* b, const __global uint4 c[11], const __global uint d[256], const __global uint e[256], const __global uint f[256], const __global uint g[256], const __global uint h[256], __local uint i[256], __local uint j[256], __local uint k[256], __local uint l[256], __local uint m[256], uint n) {
  size_t o = get_global_id(0);
  size_t p = get_global_size(0);
  size_t q = get_local_id(0);
  size_t r = get_local_size(0);
  size_t s = 256 / r;
  if (s == 0)
    s = 1;
  size_t t = q * s;
  const uint4 u = (uint4)(8);
  const uint4 v = (uint4)(0x00ff00ff);
  const uint4 w = (uint4)(0xff00ff00);
  uint4 x, y;

  if (q < 256) {
    for (uint z = 0; z < s; z++) {
      i[t + z] = d[t + z];
      j[t + z] = e[t + z];
      k[t + z] = f[t + z];
      l[t + z] = g[t + z];
      m[t + z] = h[t + z];
    }
  }
  barrier(1);

  for (uint aa = o; aa < n; aa += p) {
    y = a[aa];
    x = (((((y) << (uint4)(8)) | ((y) >> (uint4)(32 - (8)))) & v) | ((((y) << (uint4)(24)) | ((y) >> (uint4)(32 - (24)))) & w)) ^ c[0];

    for (int z = 1; z <= 9; z++) {
   y = (uint4)(lxs3 & 0xff], lxs0 & 0xff], lxs1 & 0xff], lxs2 & 0xff]);
   x = x >> u;
   y ^= (uint4)(kxs2 & 0xff], kxs3 & 0xff], kxs0 & 0xff], kxs1 & 0xff]);
   x = x >> u;
   y ^= (uint4)(jxs1 & 0xff], jxs2 & 0xff], jxs3 & 0xff], jxs0 & 0xff]);
   x = x >> u;
   x = y ^ (uint4)(ixs0], ixs1], ixs2], ixs3]) ^ c[z];
    }

  y = (uint4)xs3 & 0xff],xs0 & 0xff],xs1 & 0xff],xs2 & 0xff]) << u;
  x = x >> u;
  y = (y | (uint4)xs2 & 0xff],xs3 & 0xff],xs0 & 0xff],xs1 & 0xff])) << u;
  x = x >> u;
  y = (y | (uint4)xs1 & 0xff],xs2 & 0xff],xs3 & 0xff],xs0 & 0xff])) << u;
  x = x >> u;
  b[aa] = (y | (uint4)xs0],xs1],xs2],xs3])) ^ c[10];
  }
}