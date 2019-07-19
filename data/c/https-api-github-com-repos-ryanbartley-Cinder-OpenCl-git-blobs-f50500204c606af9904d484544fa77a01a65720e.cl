struct Particle {
  float4 pos;
  float4 vel;
};

__kernel void A(__global struct Particle* a, int b, float c, float d, float e, float f, float g, float h, float i, float j) {
  const float k = 0.00025f;
  const float l = 1.0f;
  float3 m = (float3)0.0f;
  float3 n = (float3)0.0f;
  float o = 1.0f;

  int p = get_global_id(0);

  float3 q = a[p].pos.xyz;
  float3 r = a[p].vel.xyz;

  for (int s = 0; s < b; s++) {
    if (s != p) {
      float3 t = a[s].pos.xyz;

      float3 u = q - t;
      float v = u.x * u.x + u.y * u.y + u.z * u.z;

      if (v < d - o * 0.01f) {
        float w = v / d;
        float3 x = normalize(u);

        if (w < h) {
          float y = (h / w - 1.0f) * e;
          m += x * y * j;
          o += (1.0f - w) * 2.0f;
        } else if (w < i) {
          float3 z = a[s].vel.xyz;
          float aa = i - h;
          float ab = (w - h) / aa;
          float y = (1.0f - (cos(ab * 6.28318f) * -0.5f + 0.5f)) * f;
          m += normalize(z) * y * j;
          o += (1.0f - w) * 0.5f;
        } else {
          float aa = 1.0f - i;
          float ab = (w - i) / aa;
          float y = (1.0f - (cos(ab * 6.28318f) * -0.5f + 0.5f)) * g;
          m -= x * y * j;
          o += (1.0f - w) * 0.25f;
        }
      }
    }
  }

  m -= q * 0.0015f;

  float3 ac = q + r * j;

  m = normalize(m) * min(length(m), 10.0f);
  n = r * c + m * j;

  float ad = l + o * 0.02f;
  float ae = n.x * n.x + n.y * n.y + n.z * n.z;
  if (ae > l)
    n = normalize(n) * ad;
  else if (ae < k)
    n = normalize(n) * k;

  float3 af = n;

  a[p].pos.xyz = ac;
  a[p].vel.xyz = af;
}

__kernel void B(__global float4* a, __global float4* b, int c, float d, float e, float f, float g, float h, float i, float j, float k, __local float4* l) {
  const float m = 0.5f;
  const float n = 1.0f;
  float3 o = (float3)0.0f;
  float3 p = (float3)0.0f;
  float q = 1.0f;

  int r = get_global_id(0);
  int s = get_local_id(0);

  int t = get_global_size(0);
  int u = get_local_size(0);
  int v = t / u;

  float3 w = a[r].xyz;
  float3 x = b[r].xyz;

  for (int y = 0; y < v; y++) {
    l[s] = a[y * u + s];
    barrier(1);
    for (int z = 0; z < u; z++) {
      if (r == (y * u + z))
        continue;
      float3 aa = l[z].xyz;
      float3 ab = w - aa;
      float ac = ab.x * ab.x + ab.y * ab.y + ab.z * ab.z;

      if (ac < e - q * 0.01f) {
        float ad = ac / e;
        float3 ae = normalize(ab);

        float af = (i / ad - 1.0f) * f;
        o += ae * af * k;
        q += (1.0f - ad) * 2.0f;

        float3 ag = b[y * u + z].xyz;
        float ah = j - i;
        float ai = (ad - i) / ah;
        af = (1.0f - (cos(ai * 6.28318f) * -0.5f + 0.5f)) * g;
        o += normalize(ag) * af * k;
        q += (1.0f - ad) * 0.5f;

        ah = 1.0f - j;
        ai = (ad - j) / ah;
        af = (1.0f - (cos(ai * 6.28318f) * -0.5f + 0.5f)) * h;
        o -= ae * af * k;
        q += (1.0f - ad) * 0.25f;
      }
    }
    barrier(1);
  }

  o -= w * 0.0015f;

  float3 aj = w + x * k;

  o = normalize(o) * min(length(o), 10.0f);
  p = x * d + o * k;

  float ak = n + q * 0.02f;
  float al = p.x * p.x + p.y * p.y + p.z * p.z;
  if (al > n)
    p = normalize(p) * ak;
  else if (al < m)
    p = normalize(p) * m;

  float3 am = p;

  a[r].xyz = aj;
  b[r].xyz = am;
}