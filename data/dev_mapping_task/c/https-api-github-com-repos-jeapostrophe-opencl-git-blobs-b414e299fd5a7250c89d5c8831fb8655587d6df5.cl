__kernel void A(__global float4* a, __global float4* b, __global float4* c, uint d, uint e) {
  int2 f = (int2)(get_global_id(0), get_global_id(1));

  float4 g = (float4)(0);
  float4 h = (float4)(0);
  float4 i = (float4)(0);
  float4 j = (float4)(0);

  e /= 4;

  for (int k = 0; k < d; k = k + 4) {
    float4 l = a[k / 4 + (f.y << 2) * (d / 4)];
    float4 m = a[k / 4 + ((f.y << 2) + 1) * (d / 4)];
    float4 n = a[k / 4 + ((f.y << 2) + 2) * (d / 4)];
    float4 o = a[k / 4 + ((f.y << 2) + 3) * (d / 4)];

    float4 p = b[f.x + k * e];
    float4 q = b[f.x + (k + 1) * e];
    float4 r = b[f.x + (k + 2) * e];
    float4 s = b[f.x + (k + 3) * e];

    g.x += l.x * p.x + l.y * q.x + l.z * r.x + l.w * s.x;
    g.y += l.x * p.y + l.y * q.y + l.z * r.y + l.w * s.y;
    g.z += l.x * p.z + l.y * q.z + l.z * r.z + l.w * s.z;
    g.w += l.x * p.w + l.y * q.w + l.z * r.w + l.w * s.w;

    h.x += m.x * p.x + m.y * q.x + m.z * r.x + m.w * s.x;
    h.y += m.x * p.y + m.y * q.y + m.z * r.y + m.w * s.y;
    h.z += m.x * p.z + m.y * q.z + m.z * r.z + m.w * s.z;
    h.w += m.x * p.w + m.y * q.w + m.z * r.w + m.w * s.w;

    i.x += n.x * p.x + n.y * q.x + n.z * r.x + n.w * s.x;
    i.y += n.x * p.y + n.y * q.y + n.z * r.y + n.w * s.y;
    i.z += n.x * p.z + n.y * q.z + n.z * r.z + n.w * s.z;
    i.w += n.x * p.w + n.y * q.w + n.z * r.w + n.w * s.w;

    j.x += o.x * p.x + o.y * q.x + o.z * r.x + o.w * s.x;
    j.y += o.x * p.y + o.y * q.y + o.z * r.y + o.w * s.y;
    j.z += o.x * p.z + o.y * q.z + o.z * r.z + o.w * s.z;
    j.w += o.x * p.w + o.y * q.w + o.z * r.w + o.w * s.w;
  }
  c[f.x + ((f.y << 2) + 0) * e] = g;
  c[f.x + ((f.y << 2) + 1) * e] = h;
  c[f.x + ((f.y << 2) + 2) * e] = i;
  c[f.x + ((f.y << 2) + 3) * e] = j;
}

__kernel void B(__global float4* a, __global float4* b, __global float4* c, int d, __local float4* e) {
  int f = get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2);

  int g = get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0);

  float4 h = (float4)(0);
  float4 i = (float4)(0);
  float4 j = (float4)(0);
  float4 k = (float4)(0);

  int l = d / 4;

  for (int m = 0; m < (l / get_local_size(0)); m++) {
    int n = m * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * l;

    e[f] = a[n];
    e[f + get_local_size(0)] = a[n + l];
    e[f + 2 * get_local_size(0)] = a[n + 2 * l];
    e[f + 3 * get_local_size(0)] = a[n + 3 * l];

    barrier(1);

    int o = get_global_id(0) + ((m * get_local_size(0)) << 2) * get_global_size(0);

    for (int p = 0; p < get_local_size(0) * 4; p = p + 4) {
      float4 q = e[(p >> 2) + get_local_id(1) * 4 * get_local_size(0)];
      float4 r = e[(p >> 2) + (get_local_id(1) * 4 + 1) * get_local_size(0)];
      float4 s = e[(p >> 2) + (get_local_id(1) * 4 + 2) * get_local_size(0)];
      float4 t = e[(p >> 2) + (get_local_id(1) * 4 + 3) * get_local_size(0)];

      float4 u = b[o + p * get_global_size(0)];
      float4 v = b[o + (p + 1) * get_global_size(0)];
      float4 w = b[o + (p + 2) * get_global_size(0)];
      float4 x = b[o + (p + 3) * get_global_size(0)];

      h.x += q.x * u.x + q.y * v.x + q.z * w.x + q.w * x.x;
      h.y += q.x * u.y + q.y * v.y + q.z * w.y + q.w * x.y;
      h.z += q.x * u.z + q.y * v.z + q.z * w.z + q.w * x.z;
      h.w += q.x * u.w + q.y * v.w + q.z * w.w + q.w * x.w;

      i.x += r.x * u.x + r.y * v.x + r.z * w.x + r.w * x.x;
      i.y += r.x * u.y + r.y * v.y + r.z * w.y + r.w * x.y;
      i.z += r.x * u.z + r.y * v.z + r.z * w.z + r.w * x.z;
      i.w += r.x * u.w + r.y * v.w + r.z * w.w + r.w * x.w;

      j.x += s.x * u.x + s.y * v.x + s.z * w.x + s.w * x.x;
      j.y += s.x * u.y + s.y * v.y + s.z * w.y + s.w * x.y;
      j.z += s.x * u.z + s.y * v.z + s.z * w.z + s.w * x.z;
      j.w += s.x * u.w + s.y * v.w + s.z * w.w + s.w * x.w;

      k.x += t.x * u.x + t.y * v.x + t.z * w.x + t.w * x.x;
      k.y += t.x * u.y + t.y * v.y + t.z * w.y + t.w * x.y;
      k.z += t.x * u.z + t.y * v.z + t.z * w.z + t.w * x.z;
      k.w += t.x * u.w + t.y * v.w + t.z * w.w + t.w * x.w;
    }
  }

  c[g] = h;
  c[g + get_global_size(0)] = i;
  c[g + 2 * get_global_size(0)] = j;
  c[g + 3 * get_global_size(0)] = k;
}

__kernel void C(__global float4* a, __global float4* b, __global float4* c, int d, __local float4* e, __local float4* f)

{
  float4 g = (float4)(0);
  float4 h = (float4)(0);
  float4 i = (float4)(0);
  float4 j = (float4)(0);

  int k = d / 4;

  for (int l = 0; l < (k / get_local_size(0)); l++) {
    e[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2)] = a[l * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0)];
    e[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + get_local_size(0)] = a[l * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0) + get_global_size(0)];
    e[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 2 * get_local_size(0)] = a[l * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 2 * get_global_size(0)];
    e[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 3 * get_local_size(0)] = a[l * get_local_size(0) + get_local_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 3 * get_global_size(0)];

    f[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2)] = b[get_global_id(0) + ((l * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0)];
    f[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + get_local_size(0)] = b[get_global_id(0) + ((l * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0) + get_global_size(0)];
    f[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 2 * get_local_size(0)] = b[get_global_id(0) + ((l * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0) + 2 * get_global_size(0)];
    f[get_local_id(0) + get_local_size(0) * (get_local_id(1) << 2) + 3 * get_local_size(0)] = b[get_global_id(0) + ((l * get_local_size(1) + get_local_id(1)) << 2) * get_global_size(0) + 3 * get_global_size(0)];

    barrier(1);

    for (int m = 0; m < get_local_size(0) << 2; m = m + 4) {
      float4 n = e[(m >> 2) + get_local_id(1) * 4 * get_local_size(0)];
      float4 o = e[(m >> 2) + (get_local_id(1) * 4 + 1) * get_local_size(0)];
      float4 p = e[(m >> 2) + (get_local_id(1) * 4 + 2) * get_local_size(0)];
      float4 q = e[(m >> 2) + (get_local_id(1) * 4 + 3) * get_local_size(0)];

      float4 r = f[get_local_id(0) + m * get_local_size(0)];
      float4 s = f[get_local_id(0) + (m + 1) * get_local_size(0)];
      float4 t = f[get_local_id(0) + (m + 2) * get_local_size(0)];
      float4 u = f[get_local_id(0) + (m + 3) * get_local_size(0)];

      g.x += n.x * r.x + n.y * s.x + n.z * t.x + n.w * u.x;
      g.y += n.x * r.y + n.y * s.y + n.z * t.y + n.w * u.y;
      g.z += n.x * r.z + n.y * s.z + n.z * t.z + n.w * u.z;
      g.w += n.x * r.w + n.y * s.w + n.z * t.w + n.w * u.w;

      h.x += o.x * r.x + o.y * s.x + o.z * t.x + o.w * u.x;
      h.y += o.x * r.y + o.y * s.y + o.z * t.y + o.w * u.y;
      h.z += o.x * r.z + o.y * s.z + o.z * t.z + o.w * u.z;
      h.w += o.x * r.w + o.y * s.w + o.z * t.w + o.w * u.w;

      i.x += p.x * r.x + p.y * s.x + p.z * t.x + p.w * u.x;
      i.y += p.x * r.y + p.y * s.y + p.z * t.y + p.w * u.y;
      i.z += p.x * r.z + p.y * s.z + p.z * t.z + p.w * u.z;
      i.w += p.x * r.w + p.y * s.w + p.z * t.w + p.w * u.w;

      j.x += q.x * r.x + q.y * s.x + q.z * t.x + q.w * u.x;
      j.y += q.x * r.y + q.y * s.y + q.z * t.y + q.w * u.y;
      j.z += q.x * r.z + q.y * s.z + q.z * t.z + q.w * u.z;
      j.w += q.x * r.w + q.y * s.w + q.z * t.w + q.w * u.w;
    }
  }
  c[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0)] = g;
  c[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0) + get_global_size(0)] = h;
  c[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 2 * get_global_size(0)] = i;
  c[get_global_id(0) + (get_global_id(1) << 2) * get_global_size(0) + 3 * get_global_size(0)] = j;
}