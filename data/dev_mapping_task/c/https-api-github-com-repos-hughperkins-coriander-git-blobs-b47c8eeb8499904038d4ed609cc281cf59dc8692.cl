struct class_Eigen__array {
  int f0[1];
};
struct Eigen__Tuple {
  int f0;
  float f1;
};
struct Eigen__DSizes {
  struct class_Eigen__array f0;
};
struct Eigen__TensorEvaluator_0 {
  global int* f0;
  struct Eigen__DSizes f1;
  global struct Eigen__GpuDevice* f2;
  global struct class_Eigen__TensorMap* f3;
};
struct Eigen__GpuDevice {
  global struct class_Eigen__StreamInterface* f0;
  int f1;
  char f2[4];
};
struct class_Eigen__TensorMap {
  global int* f0;
  struct Eigen__DSizes f1;
  char f2[4];
};
struct class_Eigen__StreamInterface {};
struct Eigen__TensorEvaluator_4 {
  global float* f0;
  struct Eigen__DSizes f1;
  global struct Eigen__GpuDevice* f2;
  global struct class_Eigen__TensorMap_5* f3;
};
struct class_Eigen__TensorMap_5 {
  global float* f0;
  struct Eigen__DSizes f1;
  char f2[4];
};
struct class_Eigen__array_nopointers {
  int f0[1];
};
struct Eigen__DSizes_nopointers {
  struct class_Eigen__array_nopointers f0;
};
struct Eigen__TensorEvaluator_0_nopointers {
  struct Eigen__DSizes_nopointers f0;
};
struct Eigen__TensorEvaluator_3 {
  struct Eigen__TensorEvaluator_4 f0;
};
struct class_Eigen__array_10 {
  char f0[1];
};
struct Eigen__Sizes {
  char f0;
};
struct Eigen__TensorEvaluator_4_nopointers {
  struct Eigen__DSizes_nopointers f0;
};
struct Eigen__TensorEvaluator_3_nopointers {
  struct Eigen__TensorEvaluator_4_nopointers f0;
};
struct class_Eigen__array_11 {
  int f0;
};
struct Eigen__internal__ArgMaxTupleReducer {
  char f0;
};
struct class_Eigen__array_10_nopointers {
  char f0[1];
};
struct Eigen__TensorEvaluator_9 {
  struct class_Eigen__array_10 f0;
  struct Eigen__Sizes f1;
  struct class_Eigen__array_11 f2;
  struct class_Eigen__array f3;
  struct class_Eigen__array f4;
  struct class_Eigen__array f5;
  struct Eigen__TensorEvaluator_3 f6;
  struct Eigen__internal__ArgMaxTupleReducer f7;
  global struct Eigen__Tuple* f8;
  global struct Eigen__GpuDevice* f9;
};
struct Eigen__Sizes_nopointers {
  char f0;
};
struct Eigen__TensorEvaluator_2 {
  struct Eigen__TensorEvaluator_3 f0;
  struct Eigen__TensorEvaluator_9 f1;
  int f2;
  struct class_Eigen__array f3;
  int f4;
  int f5;
};
struct class_Eigen__array_11_nopointers {
  int f0;
};
struct Eigen__TensorEvaluator {
  struct Eigen__TensorEvaluator_0 f0;
  struct Eigen__TensorEvaluator_2 f1;
};
struct Eigen__internal__ArgMaxTupleReducer_nopointers {
  char f0;
};
struct Eigen__TensorEvaluator_9_nopointers {
  struct class_Eigen__array_10_nopointers f0;
  struct Eigen__Sizes_nopointers f1;
  struct class_Eigen__array_11_nopointers f2;
  struct class_Eigen__array_nopointers f3;
  struct class_Eigen__array_nopointers f4;
  struct class_Eigen__array_nopointers f5;
  struct Eigen__TensorEvaluator_3_nopointers f6;
  struct Eigen__internal__ArgMaxTupleReducer_nopointers f7;
};
struct Eigen__TensorEvaluator_2_nopointers {
  struct Eigen__TensorEvaluator_3_nopointers f0;
  struct Eigen__TensorEvaluator_9_nopointers f1;
  int f2;
  struct class_Eigen__array_nopointers f3;
  int f4;
  int f5;
};
struct Eigen__TensorEvaluator_nopointers {
  struct Eigen__TensorEvaluator_0_nopointers f0;
  struct Eigen__TensorEvaluator_2_nopointers f1;
};

kernel void A(global struct Eigen__TensorEvaluator_nopointers* a, global int* b, uint c, global float* d, uint e, global float* f, uint g, int h, local int* i);

kernel void A(global struct Eigen__TensorEvaluator_nopointers* a, global int* b, uint c, global float* d, uint e, global float* f, uint g, int h, local int* i) {
  f += g;
  d += e;
  b += c;
  struct Eigen__TensorEvaluator j[1];
  j[0].f0.f1.f0.f0[0] = a[0].f0.f0.f0.f0[0];
  j[0].f1.f0.f0.f1.f0.f0[0] = a[0].f1.f0.f0.f0.f0.f0[0];
  j[0].f1.f1.f0.f0[0] = a[0].f1.f1.f0.f0[0];
  j[0].f1.f1.f1.f0 = a[0].f1.f1.f1.f0;
  j[0].f1.f1.f2.f0 = a[0].f1.f1.f2.f0;
  j[0].f1.f1.f3.f0[0] = a[0].f1.f1.f3.f0[0];
  j[0].f1.f1.f4.f0[0] = a[0].f1.f1.f4.f0[0];
  j[0].f1.f1.f5.f0[0] = a[0].f1.f1.f5.f0[0];
  j[0].f1.f1.f6.f0.f1.f0.f0[0] = a[0].f1.f1.f6.f0.f0.f0.f0[0];
  j[0].f1.f1.f7.f0 = a[0].f1.f1.f7.f0;
  j[0].f1.f2 = a[0].f1.f2;
  j[0].f1.f3.f0[0] = a[0].f1.f3.f0[0];
  j[0].f1.f4 = a[0].f1.f4;
  j[0].f1.f5 = a[0].f1.f5;
  j[0].f0.f0 = b;
  j[0].f1.f0.f0.f0 = d;
  j[0].f1.f1.f6.f0.f0 = f;

  bool k;
  bool l;
  bool m;
  bool n;
  bool o;
  float p;
  float q;
  float r;
  float s;
  float t;
  float u;
  float v;
  float w;
  float x;
  float y;
  float z;
  float aa;
  float ab;
  global float* ac;
  global int* ad;
  global int* ae;
  global struct Eigen__Tuple* af;
  int ag;
  int ah;
  int ai;
  int aj;
  int ak;
  int al;
  int am;
  int an;
  int ao;
  int ap;
  int aq;
  int ar;
  int as;
  int at;
  int au;
  int av;
  int aw;
  int ax;
  int ay;
  int az;
  int ba;
  int bb;
  int bc;
  int bd;
  int be;
  int bf;
  int bg;
  int bh;
  int bi;
  int bj;
  int bk;
  int bl;
  int bm;
  int bn;
  int* bo;
  long bp;

v1:;
  ;
  am = get_group_id(0);
  ;
  an = get_local_size(0);
  ;
  ;
  ao = get_local_id(0);
  ;
  ap = (an * am) + ao;
  ;
  aq = get_num_groups(0);
  ;
  ;

  if (ap < h) {
    goto v2;
  } else {
    goto v19;
  }
v2:;
  ;
  ;
  ;
  ;
  ;
  ;
  bo = (&(j[0].f1.f4));
  ;
  ;
  af = (&(j[0].f1.f1.f8))[0];
  ;
  ;
  ar = (&(j[0].f1.f1.f3.f0[0]))[0];
  ;
  ;
  ac = (&(j[0].f1.f1.f6.f0.f0))[0];
  ;
  as = (&(j[0].f1.f2))[0];
  ;
  ;
  ae = (&(j[0].f0.f0))[0];
  ;
  ;
  at = ar & 3;
  ;
  ;

  au = ap;
  goto v3;
v3:;

  if (af == 0) {
    goto v5;
  } else {
    goto v4;
  }
v4:;
  ;
  ;
  ;
  av = (&(af[au].f0))[0];

  aw = av;
  goto v15;
v5:;
  ;
  ax = ar * au;

  if (ar > 0) {
    goto v6;
  } else {
    aw = 0;
    goto v15;
  }
v6:;

  if (at == 0) {
    ay = 0;

    t = -3.40282e+38f;

    az = 0;
    goto v10;
  } else {
    goto v7;
  }
v7:;

  ba = 0;

  u = -3.40282e+38f;

  bb = 0;

  bc = at;
  goto v8;
v8:;
  ;
  bd = ba + ax;
  ;
  ;
  ;
  v = (&(ac[bd]))[0];
  ;
  m = v <= u;
  ;
  be = m ? bb : bd;
  ;
  w = m ? u : v;
  ;
  bf = ba + 1;
  ;
  bg = bc + -1;
  ;

  if (bg == 0) {
    goto v9;
  } else {
    ba = bf;

    u = w;

    bb = be;

    bc = bg;
    goto v8;
  }
v9:;

  bh = be;

  ay = bf;

  t = w;

  az = be;
  goto v10;
v10:;

  if (ar + -1 < 3) {
    bi = bh;
    goto v14;
  } else {
    goto v11;
  }
v11:;

  bj = ay;

  x = t;

  bk = az;
  goto v12;
v12:;
  ;
  bl = bj + ax;
  ;
  ;
  ;
  y = (&(ac[bl]))[0];
  ;
  n = y <= x;
  ;
  ;
  z = n ? x : y;
  ;
  ;
  bm = (bj + 1) + ax;
  ;
  ;
  ;
  aa = (&(ac[bm]))[0];
  ;
  o = aa <= z;
  ;
  ;
  ab = o ? z : aa;
  ;
  ;
  bn = (bj + 2) + ax;
  ;
  ;
  ;
  p = (&(ac[bn]))[0];
  ;
  k = p <= ab;
  ;
  ;
  q = k ? ab : p;
  ;
  ;
  ag = (bj + 3) + ax;
  ;
  ;
  ;
  r = (&(ac[ag]))[0];
  ;
  l = r <= q;
  ;
  ah = l ? (k ? (o ? (n ? bk : bl) : bm) : bn) : ag;
  ;
  s = l ? q : r;
  ;
  ai = bj + 4;
  ;

  if (ai == ar) {
    goto v13;
  } else {
    bj = ai;

    x = s;

    bk = ah;
    goto v12;
  }
v13:;

  bi = ah;
  goto v14;
v14:;

  aw = bi;
  goto v15;
v15:;

  if (as < 0) {
    aj = aw;
    goto v17;
  } else {
    goto v16;
  }
v16:;
  ;
  bp = ((long*)bo)[0];
  ;
  ;
  ;
  ;
  ;
  ak = (aw % (int)bp) / (int)(bp >> 32);

  aj = ak;
  goto v17;
v17:;
  ;
  ;
  ad = (&(ae[au]));
  ;
  ad[0] = aj;
  ;
  al = au + (aq * an);
  ;

  if (al < h) {
    au = al;
    goto v3;
  } else {
    goto v18;
  }
v18:;
  goto v19;
v19:;
  return;
}