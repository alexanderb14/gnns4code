__kernel void A(__global int4* a, __global int4* b, __global int4* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = d / 4;
  int i = e / 4;

  int4 j = (int4){0, 0, 0, 0};
  int4 k = (int4){0, 0, 0, 0};
  int4 l = (int4){0, 0, 0, 0};
  int4 m = (int4){0, 0, 0, 0};

  int n = g * 4 * h;

  for (int o = 0; o < h; o++) {
    int4 p = a[n + o];
    int4 q = a[n + 1 * h + o];
    int4 r = a[n + 2 * h + o];
    int4 s = a[n + 3 * h + o];
    int4 t = b[o * 4 * i + f];
    int4 u = b[(o * 4 + 1) * i + f];
    int4 v = b[(o * 4 + 2) * i + f];
    int4 w = b[(o * 4 + 3) * i + f];

    j.x += p.x * t.x + p.y * u.x + p.z * v.x + p.w * w.x;
    j.y += p.x * t.y + p.y * u.y + p.z * v.y + p.w * w.y;
    j.z += p.x * t.z + p.y * u.z + p.z * v.z + p.w * w.z;
    j.w += p.x * t.w + p.y * u.w + p.z * v.w + p.w * w.w;

    k.x += q.x * t.x + q.y * u.x + q.z * v.x + q.w * w.x;
    k.y += q.x * t.y + q.y * u.y + q.z * v.y + q.w * w.y;
    k.z += q.x * t.z + q.y * u.z + q.z * v.z + q.w * w.z;
    k.w += q.x * t.w + q.y * u.w + q.z * v.w + q.w * w.w;

    l.x += r.x * t.x + r.y * u.x + r.z * v.x + r.w * w.x;
    l.y += r.x * t.y + r.y * u.y + r.z * v.y + r.w * w.y;
    l.z += r.x * t.z + r.y * u.z + r.z * v.z + r.w * w.z;
    l.w += r.x * t.w + r.y * u.w + r.z * v.w + r.w * w.w;

    m.x += s.x * t.x + s.y * u.x + s.z * v.x + s.w * w.x;
    m.y += s.x * t.y + s.y * u.y + s.z * v.y + s.w * w.y;
    m.z += s.x * t.z + s.y * u.z + s.z * v.z + s.w * w.z;
    m.w += s.x * t.w + s.y * u.w + s.z * v.w + s.w * w.w;
  }
  c[g * 4 * i + f] = j;
  c[(g * 4 + 1) * i + f] = k;
  c[(g * 4 + 2) * i + f] = l;
  c[(g * 4 + 3) * i + f] = m;
}

__kernel void B(__global int4* a, __global int* b, __global int* c, int d, int e) {
  int f = get_global_id(0);
  int g = get_global_id(1);
  int h = d / 4;

  int4 i = (int4){0, 0, 0, 0};
  int4 j = (int4){0, 0, 0, 0};
  int4 k = (int4){0, 0, 0, 0};
  int4 l = (int4){0, 0, 0, 0};
  int4 m = (int4){0, 0, 0, 0};
  int4 n = (int4){0, 0, 0, 0};
  int4 o = (int4){0, 0, 0, 0};
  int4 p = (int4){0, 0, 0, 0};
  int4 q = (int4){0, 0, 0, 0};
  int4 r = (int4){0, 0, 0, 0};
  int4 s = (int4){0, 0, 0, 0};
  int4 t = (int4){0, 0, 0, 0};
  int4 u = (int4){0, 0, 0, 0};
  int4 v = (int4){0, 0, 0, 0};
  int4 w = (int4){0, 0, 0, 0};
  int4 x = (int4){0, 0, 0, 0};

  int y = g * 4 * h;
  int z;

  for (int aa = 0; aa < h; aa++) {
    int ab = aa * 4 * e + f * 4;
    int4 ac = a[y + aa];
    int4 ad = a[y + 1 * h + aa];
    int4 ae = a[y + 2 * h + aa];
    int4 af = a[y + 3 * h + aa];
        int4 ag abb3 * d   int4 ah = (inabbabababb3 * d       int4 ai = (inabbabababb3 * d       int4 aj = (inabbabababb3 * d        i += ac * ag;
        j += ac * ah;
        k += ac * ai;
        l += ac * aj;
        m += ad * ag;
        n += ad * ah;
        o += ad * ai;
        p += ad * aj;
        q += ae * ag;
        r += ae * ah;
        s += ae * ai;
        t += ae * aj;
        u += af * ag;
        v += af * ah;
        w += af * ai;
        x += af * aj;
  }
  z = g * 4 * e + f * 4;
  c[z] = i.x + i.y + i.z + i.w;
  c[z + 1] = j.x + j.y + j.z + j.w;
  c[z + 2] = k.x + k.y + k.z + k.w;
  c[z + 3] = l.x + l.y + l.z + l.w;
  z += e;
  c[z] = m.x + m.y + m.z + m.w;
  c[z + 1] = n.x + n.y + n.z + n.w;
  c[z + 2] = o.x + o.y + o.z + o.w;
  c[z + 3] = p.x + p.y + p.z + p.w;
  z += e;
  c[z] = q.x + q.y + q.z + q.w;
  c[z + 1] = r.x + r.y + r.z + r.w;
  c[z + 2] = s.x + s.y + s.z + s.w;
  c[z + 3] = t.x + t.y + t.z + t.w;
  z += e;
  c[z] = u.x + u.y + u.z + u.w;
  c[z + 1] = v.x + v.y + v.z + v.w;
  c[z + 2] = w.x + w.y + w.z + w.w;
  c[z + 3] = x.x + x.y + x.z + x.w;
}

__kernel void C(__global int4* a, __global int* b, __global int* c, int d, int e) {
  int4 f, g, h, i;
  int j = get_global_id(0);
  int k = get_global_id(1);

  f = (int4){0, 0, 0, 0};
  g = (int4){0, 0, 0, 0};
  h = (int4){0, 0, 0, 0};
  i = (int4){0, 0, 0, 0};
  for (int l = 0; l < e / 4; l++) {
    int4 m = a[k * e / 4 + l];
    int n = l * 4 * d + j * 4;
        f +=nnb * d   g += m * (inn{nnn*b * d       h += m * (inn{nnn*b * d       i += m * (inn{
          nnn* b* d   }
    c[k * d + j * 4] = f.x + f.y + f.z + f.w;
    c[k * d + j * 4 + 1] = g.x + g.y + g.z + g.w;
    c[k * d + j * 4 + 2] = h.x + h.y + h.z + h.w;
    c[k * d + j * 4 + 3] = i.x + i.y + i.z + i.w;
}

__kernel void D(__global int4 *a, __global int *b, __global int *c, int d, int e)
{
        int4 f;
        int g = get_global_id(0);
        int h = get_global_id(1);

        f = (int4){0, 0, 0, 0};
        for (int i = 0; i < e / 4; i++) {
          int j = i * 4 * d + g;
        f += a[h * e / 4 + jjb * d
    c[h * d + g] = f.x + f.y + f.z + f.w;
        }

        __kernel void E(__global float4 * a, __global float* b, __global float* c, int d, int e) {
          float4 f;
          int g = get_global_id(0);
          int h = get_global_id(1);

          f = (float4){0.0f, 0.0f, 0.0f, 0.0f};
          for (int i = 0; i < e / 4; i++) {
        f += a[h * e / 4 + i] * (floai4)gi *b4 + gi *b4 + gi *b4 + g) * d
          }
          c[h * d + g] = f.x + f.y + f.z + f.w;
        }

        __kernel void F(__global double4 * a, __global double* b, __global double* c, int d, int e) {
          double4 f;
          int g = get_global_id(0);
          int h = get_global_id(1);

          f = (double4){0.0, 0.0, 0.0, 0.0};
          for (int i = 0; i < e / 4; i++) {
        f += a[h * e / 4 + i] * (doubli4)gi *b4 + gi *b4 + gi *b4 + g) * d
          }
          c[h * d + g] = f.x + f.y + f.z + f.w;
        }