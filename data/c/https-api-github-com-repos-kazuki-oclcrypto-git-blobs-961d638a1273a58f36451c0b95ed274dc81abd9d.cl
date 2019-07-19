__kernel void A(const __global uint4* a, __global uint4* b, const __global uint2* c, const __global uint* d, const __global uint* e, const __global uint* f, const __global uint* g, __local uint* h, __local uint* i, __local uint* j, __local uint* k, uint l) {
  size_t m = get_global_id(0);
  size_t n = get_global_size(0);
  size_t o = get_local_id(0);
  size_t p = get_local_size(0);
  size_t q = 256 / p;
  if (q == 0)
    q = 1;
  size_t r = o * q;
  const uint2 s = (uint2)(1);
  const uint2 t = (uint2)(8);
  const uint2 u = (uint2)(~0xfefefefe);
  const uint2 v = (uint2)(0xfefefefe);
  uint4 w;
  uint2 x, y, z, aa;

  if (o < 256) {
    for (uint ab = 0; ab < q; ab++) {
      h[r + ab] = d[r + ab];
      i[r + ab] = e[r + ab];
      j[r + ab] = f[r + ab];
      k[r + ab] = g[r + ab];
    }
  }
  barrier(1);

  for (uint ac = m; ac < l; ac += n) {
    const __global uint2* ad = c;
    w = a[ac];
    x = w.s01 ^ ad[0];
    y = w.s23 ^ ad[1];
    ad += 2;

    for (int ae = 0;; ae++) {
      for (uint ab = 0; ab < 3; ab++) {
        z = x ^ ad[0];
    aa = (uint2z(h0 & 0xff]z i1 & 0xff]);
    z = z >> t;
    aa ^= (uint2z(i0 & 0xff]z j1 & 0xff]);
    z = z >> t;
    aa ^= (uint2z(j0 & 0xff]z k1 & 0xff]);
    z = z >> t;
    aa ^= (uint2z(k0]z h1]);
    y ^= (uint2)(aaa.s0 ^ aaa.s1, aaa.s0 ^ aaa.s1 ^ ((aaa.s0 << 8) | (aaa.s0 >> 24)));

    z = y ^ ad[1];
    aa = (uint2z(h0 & 0xff]z i1 & 0xff]);
    z = z >> t;
    aa ^= (uint2z(i0 & 0xff]z j1 & 0xff]);
    z = z >> t;
    aa ^= (uint2z(j0 & 0xff]z k1 & 0xff]);
    z = z >> t;
    aa ^= (uint2z(k0 & 0xff]z h1 & 0xff]);
    x ^= (uint2)(aaa.s0 ^ aaa.s1, aaa.s0 ^ aaa.s1 ^ ((aaa.s0 << 8) | (aaa.s0 >> 24)));
    ad += 2;
      }
      if (ae == 2)
        break;

      y.s0 ^= y.s1 | ad[1].s1;
   aa = (uint2)(xs0 & ad0].s0, ys0 & ad1].s0);
   aa = ((aa << s) & v) | ((((aa) << (uint2)(17)) | ((aa) >> (uint2)(32 - 17))) & u);
   x.s1 ^= aa.s0;
   x.s0 ^= x.s1 | ad[0].s1;
   y.s1 ^= aa.s1;
   ad += 2;
    }

    x ^= ad[1];
    y ^= ad[0];
    b[ac] = (uint4)(ys0, ys1, xs0, xs1);
  }
}

__kernel void B(const __global uint16* a, __global uint16* b, const __global uint* c, const __global uint d[256], const __global uint e[256], const __global uint f[256], const __global uint g[256], __local uint h[256], __local uint i[256], __local uint j[256], __local uint k[256], uint l) {
  const uint4 m = (uint4)(1);
  const uint4 n = (uint4)(8);
  const uint4 o = (uint4)(0xfefefefe);
  const uint4 p = (uint4)(~0xfefefefe);
  size_t q = get_global_id(0);
  size_t r = get_global_size(0);
  size_t s = get_local_id(0);
  size_t t = 256 / get_local_size(0);
  if (t == 0)
    t = 1;
  size_t u = s * t;
  uint16 v;
  uint4 w, x, y, z, aa, ab, ac, ad;
  l >>= 2;

  if (s < 256) {
    for (uint ae = 0; ae < t; ae++) {
      h[u + ae] = d[u + ae];
      i[u + ae] = e[u + ae];
      j[u + ae] = f[u + ae];
      k[u + ae] = g[u + ae];
    }
  }
  barrier(1);

  for (uint af = q; af < l; af += r) {
    const __global uint* ag = c;
    v = a[af];
    w = (uint4)(vs0, vs4, vs8, vsc) ^ ag[0];
    x = (uint4)(vs1, vs5, vs9, vsd) ^ ag[1];
    y = (uint4)(vs2, vs6, vsa, vse) ^ ag[2];
    z = (uint4)(vs3, vs7, vsb, vsf) ^ ag[3];
    ag += 4;

    for (int ah = 0;; ah++) {
      for (uint ae = 0; ae < 3; ae++) {
        aa = w ^ ag[0];
        ab = x ^ ag[1];
    ac = (uint4aahs0 & 0xff]aahs1 & 0xff]aahs2 & 0xff]aahs3 & 0xff]);
    ad = (uint4abis0 & 0xff]abis1 & 0xff]abis2 & 0xff]abis3 & 0xff]);
    aa = aa >> n;
    ab = ab >> n;
    ac ^= (uint4aais0 & 0xff]aais1 & 0xff]aais2 & 0xff]aais3 & 0xff]);
    ad ^= (uint4abjs0 & 0xff]abjs1 & 0xff]abjs2 & 0xff]abjs3 & 0xff]);
    aa = aa >> n;
    ab = ab >> n;
    ac ^= (uint4aajs0 & 0xff]aajs1 & 0xff]aajs2 & 0xff]aajs3 & 0xff]);
    ad ^= (uint4abks0 & 0xff]abks1 & 0xff]abks2 & 0xff]abks3 & 0xff]);
    aa = aa >> n;
    ab = ab >> n;
    ac ^= (uint4aaks0]aaks1]aaks2]aaks3]);
    ad ^= (uint4abhs0]abhs1]abhs2]abhs3]);
    ad ^= ac;
    y ^= ad;
    z ^= ad ^ (((ac) << (uint4)(8)) | ((ac) >> (uint4)(32 - 8)));

    aa = y ^ ag[2];
    ab = z ^ ag[3];
    ac = (uint4aahs0 & 0xff]aahs1 & 0xff]aahs2 & 0xff]aahs3 & 0xff]);
    ad = (uint4abis0 & 0xff]abis1 & 0xff]abis2 & 0xff]abis3 & 0xff]);
    aa = aa >> n;
    ab = ab >> n;
    ac ^= (uint4aais0 & 0xff]aais1 & 0xff]aais2 & 0xff]aais3 & 0xff]);
    ad ^= (uint4abjs0 & 0xff]abjs1 & 0xff]abjs2 & 0xff]abjs3 & 0xff]);
    aa = aa >> n;
    ab = ab >> n;
    ac ^= (uint4aajs0 & 0xff]aajs1 & 0xff]aajs2 & 0xff]aajs3 & 0xff]);
    ad ^= (uint4abks0 & 0xff]abks1 & 0xff]abks2 & 0xff]abks3 & 0xff]);
    aa = aa >> n;
    ab = ab >> n;
    ac ^= (uint4aaks0]aaks1]aaks2]aaks3]);
    ad ^= (uint4abhs0]abhs1]abhs2]abhs3]);
    ad ^= ac;
    w ^= ad;
    x ^= ad ^ (((ac) << (uint4)(8)) | ((ac) >> (uint4)(32 - 8)));
    ag += 4;
      }
      if (ah == 2)
        break;

      ac = w & ag[0];
      x ^= ((ac << m) & o) | ((((ac) << (uint4)(17)) | ((ac) >> (uint4)(32 - 17))) & p);
      w ^= x | ag[1];
      y ^= z | ag[3];
      ac = y & ag[2];
      z ^= ((ac << m) & o) | ((((ac) << (uint4)(17)) | ((ac) >> (uint4)(32 - 17))) & p);
      ag += 4;
    }

    y ^= ag[0];
    z ^= ag[1];
    w ^= ag[2];
    x ^= ag[3];
    b[af] = (uint16)(ys0, zs0, ws0, xs0, ys1, zs1, ws1, xs1, ys2, zs2, ws2, xs2, ys3, zs3, ws3, xs3);
  }
}