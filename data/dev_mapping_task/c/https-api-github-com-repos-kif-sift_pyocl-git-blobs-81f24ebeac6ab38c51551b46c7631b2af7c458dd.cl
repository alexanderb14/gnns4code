typedef float4 keypoint; typedef struct t_keypoint {
  keypoint kp;
  unsigned char desc[128];
} t_keypoint;
__kernel void A(__global t_keypoint* a, __global t_keypoint* b, __global int2* c, __global int* d, int e, float f, int g, int h) {
  int i = get_global_id(0);
  if (!(0 <= i && i < g))
    return;

  float j = 1000000000000.0f, k = 1000000000000.0f;
  int l = 0;
  int m;

  uchar4 n[32];
  for (int o = 0; o < 32; o++)
  n[o] = (uchai(((a)[4i ((a)[4*oi ((a)[4*o+2i ((a)[4*o+3]);


 for (int o = 0; o<h; o++) {

      int p = 0;
      for (int q = 0; q < 32; q++) {
        uchar4 r = n[q];
   uchar4 s = (uchao4) (((b)[4oq], ((b)[4*o+1],((b)[4*o+2],((b)[4*q+3]);
   p += (int) (((int) (r.s0 < s.s0 ? s.s0-r.s0 : r.s0-s.s0)) + ((int) (r.s1 < s.s1 ? s.s1-r.s1 : r.s1-s.s1))+ ((int) (r.s2 < s.s2 ? s.s2-r.s2 : r.s2-s.s2)) + ((int) (r.s3 < s.s3 ? s.s3-r.s3 : r.s3-s.s3)));
      }

      if (p < j) {
        k = j;
        j = p;
        l = o;
      } else if (p < k) {
        k = p;
      }

 }

 if (k != 0 && j/k < f) {
      int2 t = 0;
      t.s0 = i;
      t.s1 = l;
      m = atomic_add(d, 1);
      if (m < e)
        c[m] = t;
 }
}
__kernel void B(__global t_keypoint* a, __global t_keypoint* b, __global char* c, int d, int e, __global int2* f, __global int* g, int h, float i, int j, int k) {
  int l = get_global_id(0);
  if (!(0 <= l && l < j))
    return;

  float m = 1000000000000.0f, n = 1000000000000.0f;
  int o = 0;
  int p;

  keypoint q = a[l].kp;
  int r = q.s0, s = q.s1;

  if (s < e && r < d && c[s * d + r] == 0)
    return;

  uchar4 t[32];
  for (int u = 0; u < 32; u++)
  t[u] = (uchal(((a)[4l ((a)[4*ul ((a)[4*u+2l ((a)[4*u+3]);


 for (int u = 0; u<k; u++) {

      int v = 0;
      for (int w = 0; w < 32; w++) {
        q = b[u].kp;
        r = q.s0, s = q.s1;
        if (s < e && r < d && c[s * d + r] != 0) {
          uchar4 x = t[w];
    uchar4 y = (uchau4) (((b)[4uw], ((b)[4*u+1],((b)[4*u+2],((b)[4*w+3]);
    v += (int) (((int) (x.s0 < y.s0 ? y.s0-x.s0 : x.s0-y.s0)) + ((int) (x.s1 < y.s1 ? y.s1-x.s1 : x.s1-y.s1))+ ((int) (x.s2 < y.s2 ? y.s2-x.s2 : x.s2-y.s2)) + ((int) (x.s3 < y.s3 ? y.s3-x.s3 : x.s3-y.s3)));
        }
      }

      if (v < m) {
        n = m;
        m = v;
        o = u;
      } else if (v < n) {
        n = v;
      }

 }

 if (n != 0 && m/n < i) {
      int2 z = 0;
      z.s0 = l;
      z.s1 = o;
      p = atomic_add(g, 1);
      if (p < h)
        f[p] = z;
 }
}
__kernel void C(__global t_keypoint* a, __global t_keypoint* b, __global int2* c, __global int* d, int e, float f, int g) {
  int h = get_group_id(0);
  int i = get_local_id(0);
  if (!(0 <= h && h < g))
    return;

  float j = 1000000000000.0f, k = 1000000000000.0f;
  int l = 0;
  int m;

  __local unsigned char n[64];
  __local int3 o[64];
  __local int3 p[64];

  for (int q = 0; q < 2; q++)
    n[q * 64 + i] = ((a[h]).desc)[q * 64 + i];
  barrier(1);
  int r = (g >> 6) + 1;
  int s = i * r;
  int t = ((s + r) < (g) ? (s + r) : (g));
  for (int q = s; q < t; q++) {
    unsigned int u = 0;
    for (int v = 0; v < 128; v++) {
      unsigned char w = n[v], x = ((b[q]).desc)[v];
      u += ((w > x) ? (w - x) : (-w + x));
    }
    if (u < j) {
      k = j;
      j = u;
      l = q;
    } else if (u < k) {
      k = u;
    }
  }

  o[i] = (int3)lr(1);

  unsigned int y, z, aa, ab, ac, ad, ae;
  int2 af;

  if (i < 32) {
    y = o[i].s0;
    z = o[i].s1;
    aa = o[i + 32].s0;
    ab = o[i + 32].s1;
    ac = o[i].s2;
    ad = o[i + 32].s2;
  af = (int2) ((y) < (aa) ? ((z) < (aa) ? (int2)z (int2)aa : ((y) < (ab) ? (int2)(ay (int2)(aab);
  o[i] = (int3) (afs0, afs1, (afs0 == yaad
  }
  barrier(1);
  if (i < 16) {
    y = o[i].s0;
    z = o[i].s1;
    ac = o[i].s2;
    aa = o[i + 16].s0;
    ab = o[i + 16].s1;
    ad = o[i + 16].s2;
  af = (int2) ((y) < (aa) ? ((z) < (aa) ? (int2)z (int2)aa : ((y) < (ab) ? (int2)(ay (int2)(aab);
  o[i] = (int3) (afs0, afs1, (afs0 == yaad
  }
  barrier(1);
  if (i < 8) {
    y = o[i].s0;
    z = o[i].s1;
    ac = o[i].s2;
    aa = o[i + 8].s0;
    ab = o[i + 8].s1;
    ad = o[i + 8].s2;
  af = (int2) ((y) < (aa) ? ((z) < (aa) ? (int2)z (int2)aa : ((y) < (ab) ? (int2)(ay (int2)(aab);
  o[i] = (int3) (afs0, afs1, (afs0 == yaad
  }
  barrier(1);
  if (i < 4) {
    y = o[i].s0;
    z = o[i].s1;
    ac = o[i].s2;
    aa = o[i + 4].s0;
    ab = o[i + 4].s1;
    ad = o[i + 4].s2;
  af = (int2) ((y) < (aa) ? ((z) < (aa) ? (int2)z (int2)aa : ((y) < (ab) ? (int2)(ay (int2)(aab);
  o[i] = (int3) (afs0, afs1, (afs0 == yaad
  }
  barrier(1);
  if (i < 2) {
    y = o[i].s0;
    z = o[i].s1;
    ac = o[i].s2;
    aa = o[i + 2].s0;
    ab = o[i + 2].s1;
    ad = o[i + 2].s2;
  af = (int2) ((y) < (aa) ? ((z) < (aa) ? (int2)z (int2)aa : ((y) < (ab) ? (int2)(ay (int2)(aab);
  o[i] = (int3) (afs0, afs1, (afs0 == yaad
  }
  barrier(1);

  if (i == 0) {
    y = o[i].s0;
    z = o[i].s1;
    ac = o[i].s2;
    aa = o[i + 1].s0;
    ab = o[i + 1].s1;
    ad = o[i + 1].s2;
  af = (int2) ((y) < (aa) ? ((z) < (aa) ? (int2)z (int2)aa : ((y) < (ab) ? (int2)(ay (int2)(aab);
  float ag = (float) af.s0, ah = (float) af.s1;
  unsigned int ai = (af.s0 == y ? ac : ad);
  if (ah != 0 && ag/ah < f && h <= ai) {
      int2 aj = 0;
      aj.s0 = h;
      aj.s1 = ai;
      m = atomic_add(d, 1);
      if (m < e)
        c[m] = aj;
  }
  }
}