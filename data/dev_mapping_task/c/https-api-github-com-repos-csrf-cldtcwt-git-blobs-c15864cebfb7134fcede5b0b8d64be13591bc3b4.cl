__attribute__((reqd_work_group_size(32, 8, 1))) __kernel void A(__global const float* a, unsigned int b, unsigned int c, __global float2* d, unsigned int e, unsigned int f, unsigned int g, unsigned int h, unsigned int i) {
  const int2 j = (int2)(get_global_id(0), get_global_id(1));
  const int2 k = (int2)(get_local_id(0), get_local_id(1));

  __local float l[8][32];

  l[k.y][k.x] = a[j.y * c + j.x + b];

  int2 m = j >> 1;

  barrier(1);

    if (all(m < (ini    & !(j.x & 1) & !(j.y & 1)) {

    float n = l[k.y][k.x];
    float o = l[k.y][k.x + 1];
    float p = l[k.y + 1][k.x];
    float q = l[k.y + 1][k.x + 1];

    const float r = 1.0f / sqrt(2.0f);

    const size_t s = m.y * g + m.x;
        d[s + e] = r * (float2) (n- q o+ p;
        d[s + f] = r * (float2) (n+ q o- p;

    }
}