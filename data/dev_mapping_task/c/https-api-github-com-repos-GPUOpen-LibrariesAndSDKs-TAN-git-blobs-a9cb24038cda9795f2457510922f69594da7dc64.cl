__kernel __attribute__((reqd_work_group_size(4, 4, 4))) void A(volatile __global uint* a, __global float* b, __global float* c, float d, float e, float f, float g, float h, float i, float j, float k, float l, float m, float n, float o, float p, float q, float r, float s, float t, float u, float v, float w, float x, int y, int z, int aa, int ab, int ac, int ad) {
  int ae = get_global_id(0);
  int af = get_global_id(1);
  int ag = get_global_id(2);

  if (ae > ((ab) / 2 - 1))
    return;

  if (af > ((ac) / 2 - 1))
    return;

  if (ag > ((ad) / 2 - 1))
    return;
  int ah = ae - (ab) / 2;
  float ai = (ah % 2 == 0) ? ah : ah + 1;
  float aj = (ah % 2 == 0) ? 1.0f : -1.0f;

  float ak = ai * n + aj * d;

  int al = af - (ac) / 2;
  ai = (al % 2 == 0) ? al : al + 1;
  aj = (al % 2 == 0) ? 1.0f : -1.0f;
  float am = ai * p + aj * e;

  int an = ag - (ad) / 2;
  ai = (an % 2 == 0) ? an : an + 1;
  aj = (an % 2 == 0) ? 1.0f : -1.0f;
  float ao = ai * o + aj * f;
  float8 ap = __clc_pow(q, abs(ah) - 1) * __clc_pow(u, abs(al) - 1) * __clc_pow(s, abs(an) - 1);

  ap.s0123 *= __clc_pow(r, abs(ah));
  ap.s4567 *= __clc_pow(r, max(abs(ah) - 2.0f, 0.0f));

  ap.s0145 *= __clc_pow(v, abs(al));
  ap.s2367 *= __clc_pow(v, max(abs(al) - 2.0f, 0.0f));

  ap.s0246 *= __clc_pow(t, abs(an));
  ap.s1357 *= __clc_pow(t, max(abs(an) - 2.0f, 0.0f));

  float8 aq;
  aq.s0123 = ak - g;
  aq.s4567 = -ak - g;

  float8 ar;
  ar.s0145 = am - h;
  ar.s2367 = -am - h;

  float8 as;
  as.s0246 = ao - i;
  as.s1357 = -ao - i;

  float8 at = sqrt(aq * aq + ar * ar + as * as);

  int8 au = 1 + convert_int8((at / 340.0f) * y);

  int4 av = max(au.s0123, au.s4567);
  av.xy = max(av.xy, av.zw);
  av.x = max(av.x, av.y);

  if (av.x < z) {
    float8 aw = (at <= x) ? w : w * x / at;
    int ax = z - av.x;
    int ay = aa > ax ? ax : aa;

    float8 az = j * aq + k * ar + l * as;
    float8 ba = az / (m * at);
    float8 bb = (ba + 1.0f) / 2.0f;

    for (int bc = 0; bc < ay; bc++) {
      uint8 bd = convert_uint8(1024.0f * ap * aw * (c[bc] + bb * b[bc]));

      atomic_add(&a[bc + au.s0], bd.s0);
      atomic_add(&a[bc + au.s1], bd.s1);
      atomic_add(&a[bc + au.s2], bd.s2);
      atomic_add(&a[bc + au.s3], bd.s3);
      atomic_add(&a[bc + au.s4], bd.s4);
      atomic_add(&a[bc + au.s5], bd.s5);
      atomic_add(&a[bc + au.s6], bd.s6);
      atomic_add(&a[bc + au.s7], bd.s7);
    }
  }
}

__kernel __attribute__((reqd_work_group_size(4, 4, 4))) void B(volatile __global int* a, __global float* b, __global float* c, float d, float e, float f, float g, float h, float i, float j, float k, float l, float m, float n, float o, float p, float q, float r, float s, float t, float u, float v, float w, float x, int y, int z, int aa, int ab, int ac, int ad, int ae) {
  int af = get_global_id(0);
  int ag = get_global_id(1);
  int ah = get_global_id(2);

  if (af > ac)
    return;

  if (ag > ad)
    return;

  if (ah > ae)
    return;

  int ai = af - (ac) / 2;
  float aj = (ai % 2 == 0) ? ai : ai + 1;
  float ak = (ai % 2 == 0) ? 1.0f : -1.0f;
  float al = aj * n + ak * d;

  int am = ag - (ad) / 2;
  aj = (am % 2 == 0) ? am : am + 1;
  ak = (am % 2 == 0) ? 1.0f : -1.0f;
  float an = aj * p + ak * e;

  int ao = ah - (ae) / 2;
  aj = (ao % 2 == 0) ? ao : ao + 1;
  ak = (ao % 2 == 0) ? 1.0f : -1.0f;
  float ap = aj * o + ak * f;

  float aq = (ai > 0) ? ai / 2 : abs(ai - 1) / 2;
  float ar = (am > 0) ? am / 2 : abs(am - 1) / 2;
  float as = (ao > 0) ? ao / 2 : abs(ao - 1) / 2;

  float at = (ai > 0) ? (ai + 1) / 2 : abs(ai) / 2;
  float au = (am > 0) ? (am + 1) / 2 : abs(am) / 2;
  float av = (ao > 0) ? (ao + 1) / 2 : abs(ao) / 2;

  float aw = __clc_pow(q, at) * __clc_pow(r, aq) * __clc_pow(u, au) * __clc_pow(v, ar) * __clc_pow(s, av) * __clc_pow(t, as);

  float ax = al - g;

  float ay = an - h;

  float az = ap - i;

  float ba = sqrt(ax * ax + ay * ay + az * az);

  int bb = 1 + (int)((ba / 340.0f) * y);

  if (bb < z) {
    float bc = (ba <= x) ? w : w * x / ba;
    int bd = z - bb;
    int be = ab > bd ? bd : ab;

    float bf = j * ax + k * ay + l * az;
    float bg = bf / (m * ba);
    float bh = (bg + 1.0f) / 2.0f;

    if (bb < aa) {
      for (int bi = 0; bi < be; bi++) {
        int bj = convert_int(67108864.0f * aw * bc * (c[bi] + bh * b[bi]));
        atomic_add(&a[bi + bb], bj);
      }
    } else {
      int bj = convert_int(67108864.0f * aw * bc);
      atomic_add(&a[bb], bj);
    }
  }
}