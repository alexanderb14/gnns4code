__kernel void A(__global float2* restrict a, __global float2* restrict b, __global float2* restrict c, __global float2* restrict d, __global float2* restrict e, float f, float g, float h, int i, int j) {
  int k = get_global_id(0);
  int l = get_global_id(1);
  int m = k + i * l;

 float2 n = {1 , -2*3.14159fg2 o = {1 , 2*3.14159fgt2 p = {nnn
 float2 q = {(o o/ n2*(o/ n

 if(k < i && l < j)
 {
    float r = p.x * (2 * d[m].x - f * f * b[m].x - f * f * 4 * 3.14159f * h * a[m].x * d[m].x / g) - p.y * (2 * d[m].y - f * f * b[m].y - f * f * 4 * 3.14159f * h * a[m].x * d[m].y / g) - q.x * (c[m].x) + q.y * (c[m].y);

    float s = p.y * (2 * d[m].x - f * f * b[m].x - f * f * 4 * 3.14159f * h * a[m].x * d[m].x / g) + p.x * (2 * d[m].y - f * f * b[m].y - f * f * 4 * 3.14159f * h * a[m].x * d[m].y / g) - q.y * (c[m].x) - q.x * (c[m].y);

    e[m].x = r;
    e[m].y = s;
 }
}