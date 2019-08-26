constant int Ga[3] = {71, 72, 73};
const constant int Gb = 1;
constant int Gc[3] = {3, 2, 1};

constant int4 Gd = {1, 2, 3, 4};
constant int4 Ge = {0, -1, -2, -3};

struct Person {
  char name[7];
  int3 idNumber;
};

struct Test1 {
  int a0;
  char a1;
};

struct Test2 {
  char a0;
  int a1;
};
struct Test3 {
  int a0;
  int a1;
};
struct Test4 {
  float a0;
  float a1;
};

constant struct Person Gf = {{"james"}, (int3)(1, 2, 3)};
constant struct Test1 Gg = {1, 2};
constant struct Test2 Gh = {1, 2};

constant int3 Gi[3] = {(int3)(0, 1, 2), (int3)(3, 4, 5), (int3)(6, 7, 8)};
constant char4 Gj[3] = {(char4)(0, 1, 2, 3), (char4)(4, 5, 6, 7), (char4)(8, 9, 10, 11)};

constant struct Person Gk[3] = {{{"abc"}, (int3)(1, 2, 3)}, {{"defg"}, (int3)(4, 5, 6)}, {{"hijk"}, (int3)(7, 8, 9)}};
constant struct Test3 Gl = {0, 0};
constant int3 Gm = {0, 0, 0};
constant int Gn[3] = {0, 0, 0};
constant float Go[3] = {0.0f, 0.0f, 0.0f};

__kernel void A(__global int* a, int b, int c) {
  int d = (int)get_global_id(0);

  int4 e = Gd + Ge;
  a[d] = Ga[d % 3] * Gb * Gc[2] + b + c * e.y * Gd.x + Gl.a0 + Gm.x + Gn[1] + (int)Go[2];
}

__kernel void B(__global int* a) {
  int b = (int)get_global_id(0);
  a[b] = Gi[b % 3].y + Gj[b % 3].w;
}

__kernel void C(__global int* a) {
  int b = (int)get_global_id(0);

  a[b] = Gf.idNumber.y + Gg.a1 + Gh.a1;
}

__kernel void D(__global int* a) {
  int b = (int)get_global_id(0);

  a[b] = Gk[b % 3].idNumber.z + Gk[b % 3].name[2];
}