float A(uint4 a) {
 float4 b = (float4) (((float) a55, ((float) a55, ((float) a55, ((float) a55);

 return length(b);
}

float4 B(uint4 a) {
 return (float4) (((float) a/255, ((float) a/255, ((float) a/255, ((float) a/255);
}

__kernel void C(__global uchar* a, __global float* b, __global int* c, uchar d, int e, __global int* f, int g) {
  int h = get_global_id(0);

  if (h > e - 1)
    return;

  int i = c[h];

  a[i] = d;
  b[i] = 1.0;

  f[((i / 1024) / 16) * 16 + (i % 1024) / 16] = g;
}

__kernel void D(__global int* a, __global uchar* b, __global uchar* c, __global float* d, __global float* e, __global int* f, int g, __global int* h, __local int* i, __local uchar* j, __local float* k,

                __read_only image2d_t l, sampler_t m) {
  int n = a[get_group_id(0)];
  int o = n % 16;
  int p = n / 16;

  int q = get_local_id(0);
  int r = get_local_id(1);

  int s = o * 16 + q;
  int t = p * 16 + r;
  int u = t * 1024 + s;

  int v = 16 + 2;
  int w = 1 + q;
  int x = 1 + r;
  int y = x * v + w;

  j[y] = b[u];
  k[y] = d[u];

  int z, aa;

  if (r == 0) {
    z = y - v;
    aa = u - 1024;
    k[z] = (t != 0) ? d[aa] : 0;
    j[z] = b[aa];

  } else if (r == 16 - 1) {
    z = y + v;
    aa = u + 1024;
    k[z] = (t != 512 - 1) ? d[aa] : 0;
    j[z] = b[aa];
  }
  if (q == 0) {
    z = y - 1;
    aa = u - 1;
    k[z] = (s != 0) ? d[aa] : 0;
    j[z] = b[aa];

  } else if (q == 16 - 1) {
    z = y + 1;
    aa = u + 1;
    k[z] = (s != 1024 - 1) ? d[aa] : 0;
    j[z] = b[aa];
  }

  if (q < 5 && r == 0)
    i[q] = 0;

  barrier(1);

 float4 ab = B(read_imageui(l, m, (int2) (s t));

 uchar ac = j[y];
 float ad = k[y];

 float4 ae = (float4) (
  (1.0f - distance(abb, Bi(lm2) (t)))/1.73205080756v2f) * k0f - distance(abb, Bi(lm2) (t)))/1.73205080756v2f) * k0f - distance(abb, Bi(lm2) (s t)/1.73205080756y72f) * k0f - distance(abb, Bi(lm2) (s t)/1.73205080756y72f) * kif (ae.x > ad) {
   ad = ae.x;
   ac = j[y - v];
 }

 if (ae.y > ad) {
   ad = ae.y;
   ac = j[y + v];
 }

 if (ae.z > ad) {
   ad = ae.z;
   ac = j[y - 1];
 }

 if (ae.w > ad) {
   ad = ae.w;
   ac = j[y + 1];
 }

 e[u] = ad;
 c[u] = ac;

 if (ad != k[y] || ac != j[y]) {
   i[0] = 1;

   if (t != 0 && r == 0)
     i[1] = 1;
   if (t != 512 && r == 16 - 1)
     i[2] = 1;
   if (s != 0 && q == 0)
     i[3] = 1;
   if (s != 1024 && q == 16 - 1)
     i[4] = 1;
 }

 barrier(1);

 if (q == 0 && r == 0 && i[0] == 1)
   h[n] = g;

 if (i[1])
   h[n - 16] = g;
 if (i[2])
   h[n + 16] = g;
 if (i[3])
   h[n - 1] = g;
 if (i[4])
   h[n + 1] = g;
}