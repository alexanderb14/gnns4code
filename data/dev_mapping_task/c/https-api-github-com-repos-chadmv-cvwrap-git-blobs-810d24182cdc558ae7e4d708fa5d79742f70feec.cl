__kernel void A(__global float* a, __global const float* b, __global const float* c, __global const float* d, __global const float* e, __global const int* f, __global const int* g, __global const int* h, __global const float* i, __global const int* j, __global const float* k, __global const float4* l, __global const float4* m, const float n, const uint o) {
  unsigned int p = get_global_id(0);
  if (p >= o) {
    return;
  }
  unsigned int q = p * 3;
  float r = k[q];
  float s = k[q + 1];
  float t = k[q + 2];
  int u = j[q] * 3;
  int v = j[q + 1] * 3;
  int w = j[q + 2] * 3;
  float x = c[u] * r + c[v] * s + c[w] * t;
  float y = c[u + 1] * r + c[v + 1] * s + c[w + 1] * t;
  float z = c[u + 2] * r + c[v + 2] * s + c[w + 2] * t;
  float aa = d[u] * r + d[v] * s + d[w] * t;
  float ab = d[u + 1] * r + d[v + 1] * s + d[w + 1] * t;
  float ac = d[u + 2] * r + d[v + 2] * s + d[w + 2] * t;

  int ad = g[p];
  int ae = ad + f[p] - 1;
  float af = i[ae];
  float ag = aa * af;
  float ah = ab * af;
  float ai = ac * af;
  for (int aj = ad; aj < ae; aj++) {
    float ak = i[aj];
    int al = h[aj] * 3;
    ag += d[al] * ak;
    ah += d[al + 1] * ak;
    ai += d[al + 2] * ak;
  }

  float am = ((c[u] + c[v]) * 0.5f) - x;
  float an = ((c[u + 1] + c[v + 1]) * 0.5f) - y;
  float ao = ((c[u + 2] + c[v + 2]) * 0.5f) - z;
  float3 ap = (float3)(am an ao;
  float3 aq = (float3aiaq = normalize(aq);
  float3 ar = normalize(ap);
  float as = length(ap);
  if (__clc_fabs(dot(ar, aq) - 1.0f) < 0.001f || as < 0.0001f) {
    for (int aj = ad; aj < ae; aj++) {
      float ak = i[aj];
      int al = h[aj] * 3;
      ap.x -= (c[al] - x) * ak;
      ap.y -= (c[al + 1] - y) * ak;
      ap.z -= (c[al + 2] - z) * ak;
      ar = normalize(ap);
      as = length(ap);
      if (__clc_fabs(dot(ar, aq) - 1.0f) > 0.001f && as > 0.0001f) {
        break;
      }
    }
    ap = normalize(ap);
  } else {
    ap = ar;
  }



  float3 at = cross(aq, ap);
  float3 au = cross(at, aq);
  at = normalize(at);
  au = normalize(au);

  float4 av = (float4)(att.x, aqauu.x, xloat4 aw = (float4)(att.y, aqauu.y, yloat4 ax = (float4)(att.z, aqauu.z, zloat4 ay = (float4)(0.0f, 0.0f, 0.0f, 1.0f);







  __global const float4* az = &(m[8]);
  float4 ba = (float4)(doav                      doaw                      doax                      doay float4 bb = (float4)(doav                      doaw                      doax                      doay float4 bc = (float4)(doav                      doaw                      doax                      doay float4 bd = (float4)(doav                      doaw                      doax                      doay  float4 bebdat4 bfbdat4 bgbdat4 bhbd

  float4 bi = l[p*4];
  float4 bj = l[p*4+1];
  float4 bk = l[p*4+2];
  float4 bl = l[p*4+3];
  float4 bm = (float4)(dot(bi be, dot(bi bf, dot(bi bg, dot(bi bh);
  float4 bn = (float4)(dot(bj be, dot(bj bf, dot(bj bg, dot(bj bh);
  float4 bo = (float4)(dot(bk be, dot(bk bf, dot(bk bg, dot(bk bh);
  float4 bp = (float4)(dot(bl be, dot(bl bf, dot(bl bg, dot(bl bh);

  float4 bq = (fq                   q                     q                            1.0f);
  __global const float4* br = &(m[4]);
 __global const float4* bs = m;
  float4 bt = (flobs                   bs                   bs                   bbt = (float4)(dot(btoat4)(bm.x, bn.x, bo.x, bp.x)),
                     dot(btoat4)(bm.y, bn.y, bo.y, bp.y)),
                     dot(btoat4)(bm.z, bn.z, bo.z, bp.z)),
                     dot(btoat4)(bm.w, bn.w, bo.w, bp.w)));
  float3 bu = (float3)(dotbr               dotbr               dotbrat bv = e[p] * n;
  a[q] = bq.x + ((bu.x - bq.x) * bv);
  a[q+1] = bq.y + ((bu.y - bq.y) * bv);
  a[q+2] = bq.z + ((bu.z - bq.z) * bv);
}