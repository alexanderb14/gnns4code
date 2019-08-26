__kernel void A(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, __global float* g) {
  const int h = get_global_id(0);
  const int i = get_global_size(0);

  int2 j;
 int2 k = (int2)(f (j).y = h / (k).x; (j).x = (h - (j).y*(k).x);;

 float l = a[h];
 float m = c[h];
 float n = d[h];
 float o = d[h+1*i];
 float p = d[h+2*i];
 float q = d[h+3*i];
 float r = d[h+4*i];

 float s = n*l;
 if (j.x>0) s += a[(((int2)(jx-1, jy)).x + ((int2)(jx-1, jy)).y * (k).x)] * o;
 if (j.x<e-1) s += a[(((int2)(jx+1, jy)).x + ((int2)(jx+1, jy)).y * (k).x)] * p;
 if (j.y>0) s += a[(((int2)(jx, jy-1)).x + ((int2)(jx, jy-1)).y * (k).x)] * q;
 if (j.y<f-1) s += a[(((int2)(jx, jy+1)).x + ((int2)(jx, jy+1)).y * (k).x)] * r;
 float t = m - s;
 g[h] = t;
 b[h] = l + t/n;
}

__kernel void B(__global float* a, __global float* b, __global float* c, __global float* d, int e, int f, int g, __global float* h) {
  const int i = get_global_id(0);
  const int j = get_global_size(0);

  int3 k;
 int3 l = (int3)(g (k).z = i / ((l).x*(l).y); (k).y = (i - (k).z*(l).x*(l).y)/(l).x; (k).x = i - (l).x*((k).y + (k).z*(l).y);;

 float m = a[i];
 float n = c[i];
 float o = d[i];
 float p = d[i+1*j];
 float q = d[i+2*j];
 float r = d[i+3*j];
 float s = d[i+4*j];
 float t = d[i+5*j];
 float u = d[i+6*j];

 float v = o*m;
 if (k.x>0) v += a[(((int3)(k-1, k, k)).x + (((int3)(k-1, k, k)).y + ((int3)(k-1, k, k)).z * (l).y) * (l).x)] * p;
 if (k.x<e-1) v += a[(((int3)(k+1, k, k)).x + (((int3)(k+1, k, k)).y + ((int3)(k+1, k, k)).z * (l).y) * (l).x)] * q;
 if (k.y>0) v += a[(((int3)(k, k-1, k)).x + (((int3)(k, k-1, k)).y + ((int3)(k, k-1, k)).z * (l).y) * (l).x)] * r;
 if (k.y<f-1) v += a[(((int3)(k, k+1, k)).x + (((int3)(k, k+1, k)).y + ((int3)(k, k+1, k)).z * (l).y) * (l).x)] * s;
 if (k.z>0) v += a[(((int3)(k, k, k-1)).x + (((int3)(k, k, k-1)).y + ((int3)(k, k, k-1)).z * (l).y) * (l).x)] * t;
 if (k.z<g-1) v += a[(((int3)(k, k, k+1)).x + (((int3)(k, k, k+1)).y + ((int3)(k, k, k+1)).z * (l).y) * (l).x)] * u;
 float w = n - v;
 h[i] = w;
 b[i] = m + w/o;
}