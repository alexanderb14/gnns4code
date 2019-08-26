__kernel void A(const int a, const int b, __global const float* c, __global float* d) {
  const int e = 8;
  const int f = get_global_id(0) * e;
  const int g = get_global_id(1) * e;

  if ((g < a) && (f < b)) {
    __global float* h = c + (g + 0) * b + (f + 0);
    __global float* i = c + (g + 1) * b + (f + 0);
    __global float* j = c + (g + 2) * b + (f + 0);
    __global float* k = c + (g + 3) * b + (f + 0);

    __global float* l = c + (g + 4) * b + (f + 0);
    __global float* m = c + (g + 5) * b + (f + 0);
    __global float* n = c + (g + 6) * b + (f + 0);
    __global float* o = c + (g + 7) * b + (f + 0);

    float8 p = *((__global float8*)h);
    float8 q = *((__global float8*)i);
    float8 r = *((__global float8*)j);
    float8 s = *((__global float8*)k);

    float8 t = *((__global float8*)l);
    float8 u = *((__global float8*)m);
    float8 v = *((__global float8*)n);
    float8 w = *((__global float8*)o);

    d[(f + 0) * a + (g + 0)] = p.s0;
    d[(f + 1) * a + (g + 0)] = p.s1;
    d[(f + 2) * a + (g + 0)] = p.s2;
    d[(f + 3) * a + (g + 0)] = p.s3;
    d[(f + 4) * a + (g + 0)] = p.s4;
    d[(f + 5) * a + (g + 0)] = p.s5;
    d[(f + 6) * a + (g + 0)] = p.s6;
    d[(f + 7) * a + (g + 0)] = p.s7;

    d[(f + 0) * a + (g + 1)] = q.s0;
    d[(f + 1) * a + (g + 1)] = q.s1;
    d[(f + 2) * a + (g + 1)] = q.s2;
    d[(f + 3) * a + (g + 1)] = q.s3;
    d[(f + 4) * a + (g + 1)] = q.s4;
    d[(f + 5) * a + (g + 1)] = q.s5;
    d[(f + 6) * a + (g + 1)] = q.s6;
    d[(f + 7) * a + (g + 1)] = q.s7;

    d[(f + 0) * a + (g + 2)] = r.s0;
    d[(f + 1) * a + (g + 2)] = r.s1;
    d[(f + 2) * a + (g + 2)] = r.s2;
    d[(f + 3) * a + (g + 2)] = r.s3;
    d[(f + 4) * a + (g + 2)] = r.s4;
    d[(f + 5) * a + (g + 2)] = r.s5;
    d[(f + 6) * a + (g + 2)] = r.s6;
    d[(f + 7) * a + (g + 2)] = r.s7;

    d[(f + 0) * a + (g + 3)] = s.s0;
    d[(f + 1) * a + (g + 3)] = s.s1;
    d[(f + 2) * a + (g + 3)] = s.s2;
    d[(f + 3) * a + (g + 3)] = s.s3;
    d[(f + 4) * a + (g + 3)] = s.s4;
    d[(f + 5) * a + (g + 3)] = s.s5;
    d[(f + 6) * a + (g + 3)] = s.s6;
    d[(f + 7) * a + (g + 3)] = s.s7;

    d[(f + 0) * a + (g + 4)] = t.s0;
    d[(f + 1) * a + (g + 4)] = t.s1;
    d[(f + 2) * a + (g + 4)] = t.s2;
    d[(f + 3) * a + (g + 4)] = t.s3;
    d[(f + 4) * a + (g + 4)] = t.s4;
    d[(f + 5) * a + (g + 4)] = t.s5;
    d[(f + 6) * a + (g + 4)] = t.s6;
    d[(f + 7) * a + (g + 4)] = t.s7;

    d[(f + 0) * a + (g + 5)] = u.s0;
    d[(f + 1) * a + (g + 5)] = u.s1;
    d[(f + 2) * a + (g + 5)] = u.s2;
    d[(f + 3) * a + (g + 5)] = u.s3;
    d[(f + 4) * a + (g + 5)] = u.s4;
    d[(f + 5) * a + (g + 5)] = u.s5;
    d[(f + 6) * a + (g + 5)] = u.s6;
    d[(f + 7) * a + (g + 5)] = u.s7;

    d[(f + 0) * a + (g + 6)] = v.s0;
    d[(f + 1) * a + (g + 6)] = v.s1;
    d[(f + 2) * a + (g + 6)] = v.s2;
    d[(f + 3) * a + (g + 6)] = v.s3;
    d[(f + 4) * a + (g + 6)] = v.s4;
    d[(f + 5) * a + (g + 6)] = v.s5;
    d[(f + 6) * a + (g + 6)] = v.s6;
    d[(f + 7) * a + (g + 6)] = v.s7;

    d[(f + 0) * a + (g + 7)] = w.s0;
    d[(f + 1) * a + (g + 7)] = w.s1;
    d[(f + 2) * a + (g + 7)] = w.s2;
    d[(f + 3) * a + (g + 7)] = w.s3;
    d[(f + 4) * a + (g + 7)] = w.s4;
    d[(f + 5) * a + (g + 7)] = w.s5;
    d[(f + 6) * a + (g + 7)] = w.s6;
    d[(f + 7) * a + (g + 7)] = w.s7;
  }
}