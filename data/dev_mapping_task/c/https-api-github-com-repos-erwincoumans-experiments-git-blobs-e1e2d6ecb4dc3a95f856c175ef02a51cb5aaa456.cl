typedef float4 Quaternion; __inline float4 A(float4 a, float4 b) {
  return cross(a, b);
}

__inline float B(float4 a, float4 b) {
  float4 c = (float4)(a.xyz, 0.f);
  float4 d = (float4)(b.xyz, 0.f);
  return dot(c, d);
}

__inline Quaternion C(Quaternion a, Quaternion b) {
  Quaternion c;
  c = A(a, b);
  c += a.w * b + b.w * a;
  c.w = a.w * b.w - B(a, b);
  return c;
}

__inline Quaternion D(Quaternion a) {
  return (Quaternion)(-a.xyz, a.w);
}

__inline float4 E(Quaternion a, float4 b) {
  Quaternion c = D(a);
  float4 d = b;
  d.w = 0.f;
  float4 e = C(C(a, d), c);
  return e;
}

__inline float4 F(const float4* a, const float4* b, const Quaternion* c) {
  return E(*c, *a) + (*b);
}

typedef struct { float4 m_row[3]; } Matrix3x3;

typedef unsigned int u32;

typedef struct {
  float4 m_pos;
  float4 m_quat;
  float4 m_linVel;
  float4 m_angVel;

  u32 m_collidableIdx;
  float m_invMass;
  float m_restituitionCoeff;
  float m_frictionCoeff;
} Body;

typedef struct Collidable {
  int m_unused1;
  int m_unused2;
  int m_shapeType;
  int m_shapeIndex;
} Collidable;

typedef struct {
  Matrix3x3 m_invInertia;
  Matrix3x3 m_initInvInertia;
} Shape;

__inline Matrix3x3 G(float4 a) {
  float4 b = (float4)(aa aa aa 0.f);
  Matrix3x3 c;

  c.m_row[0].x = __clc_fabs(1 - 2 * b.y - 2 * b.z);
  c.m_row[0].y = __clc_fabs(2 * a.x * a.y - 2 * a.w * a.z);
  c.m_row[0].z = __clc_fabs(2 * a.x * a.z + 2 * a.w * a.y);
  c.m_row[0].w = 0.f;

  c.m_row[1].x = __clc_fabs(2 * a.x * a.y + 2 * a.w * a.z);
  c.m_row[1].y = __clc_fabs(1 - 2 * b.x - 2 * b.z);
  c.m_row[1].z = __clc_fabs(2 * a.y * a.z - 2 * a.w * a.x);
  c.m_row[1].w = 0.f;

  c.m_row[2].x = __clc_fabs(2 * a.x * a.z - 2 * a.w * a.y);
  c.m_row[2].y = __clc_fabs(2 * a.y * a.z + 2 * a.w * a.x);
  c.m_row[2].z = __clc_fabs(1 - 2 * b.x - 2 * b.y);
  c.m_row[2].w = 0.f;

  return c;
}

typedef struct {
  float fx;
  float fy;
  float fz;
  int uw;
} btAABBCL;

__inline Matrix3x3 H(Matrix3x3 a) {
  Matrix3x3 b;
  b.m_row[0] = (float4)(a.m_row[0].x, a.m_row[1].x, a.m_row[2].x, 0.f);
  b.m_row[1] = (float4)(a.m_row[0].y, a.m_row[1].y, a.m_row[2].y, 0.f);
  b.m_row[2] = (float4)(a.m_row[0].z, a.m_row[1].z, a.m_row[2].z, 0.f);
  return b;
}

__inline Matrix3x3 I(Matrix3x3 a, Matrix3x3 b) {
  Matrix3x3 c;
  c = H(b);
  Matrix3x3 d;

  a.m_row[0].w = 0.f;
  a.m_row[1].w = 0.f;
  a.m_row[2].w = 0.f;
  for (int e = 0; e < 3; e++) {
    d.m_row[e].x = B(a.m_row[e], c.m_row[0]);
    d.m_row[e].y = B(a.m_row[e], c.m_row[1]);
    d.m_row[e].z = B(a.m_row[e], c.m_row[2]);
    d.m_row[e].w = 0.f;
  }
  return d;
}

__kernel void J(const int a, __global float4* b, __global float4* c, __global Body* d, __global Shape* e) {
  int f = get_global_id(0);

  float g = 0.0166666f;
  float h = (0.25f * 3.14159254);

  if (f < a) {
    float i = d[f].m_invMass;
    if (i != 0.f) {
      float4 j = (float4)(0.f, -9.8f, 0.f, 0.f);
      b[f] += j * g;

      float4 k = d[f].m_quat;

      d[f].m_linVel = (floatf, 0.f);
      d[f].m_angVel = (floaf, 0.f);

      Matrix3x3 l = G(k);
      Matrix3x3 m = H(l);
      Matrix3x3 n = e[f].m_initInvInertia;

      Matrix3x3 o = I(l, n);

      Matrix3x3 p = I(o, m);
      e[f].m_invInertia = p;

    } else {
      d[f].m_linVel = (float4)(0.f, 0.f, 0.f, 0.f);
      d[f].m_angVel = (float4)(0.f, 0.f, 0.f, 0.f);
    }
  }
}

__kernel void K(const int a, __global float4* b, __global float4* c, __global Body* d) {
  int e = get_global_id(0);

  if (e < a) {
    float f = d[e].m_invMass;
    if (f != 0.f) {
      b[e] = (floaeinVel.xyz, 0.f);
      c[e] = (floaengVel.xyz, 0.f);
    } else {
      b[e] = (float4)(0, 0, 0, 0);
      c[e] = (float4)(0, 0, 0, 0);
    }
  }
}

__kernel void L(const int a, const int b, __global float4* c, __global Body* d) {
  int e = get_global_id(0);

  if (e < b) {
    c[e + a / 4] = (floateos.xyz, 1.0);

    c[e + a / 4 + b] = d[e].m_quat;
  }
}

__kernel void M(const int a, const int b, __global float4* c, __global btAABBCL* d) {
  int e = get_global_id(0);

  if (e < b) {
    float4 f = c[e + a / 4];
    float4 g = c[e + a / 4 + b];
    float4 h = c[e + a / 4 + b + b];

    float4 i = (float4)(.4f, 1.f, .4f, 1.f);
    c[e + a / 4 + b + b] = i;

    float4 j = (float4)(1.01f, 1.01f, 1.01f, 0.f);

    Matrix3x3 k = G(g);

  float4 l = (float4) (
   dot(kow[0],jkow[1],jkow[2],j;


  d[e*2].fx = f.x-l.x;
  d[e*2].fy = f.y-l.y;
  d[e*2].fz = f.z-l.z;
  d[e*2].uw = e;

  d[e*2+1].fx = f.x+l.x;
  d[e*2+1].fy = f.y+l.y;
  d[e*2+1].fz = f.z+l.z;
  d[e*2+1].uw = e;
  }
}

__kernel void N(const int a, __global Body* b, __global Collidable* c, __global btAABBCL* d, __global btAABBCL* e) {
  int f = get_global_id(0);

  if (f < a) {
    float4 g = b[f].m_pos;
    float4 h = b[f].m_quat;

    int i = b[f].m_collidableIdx;
    int j = c[i].m_shapeIndex;

    if (j >= 0) {
      btAABBCL k = d[i * 2];
      btAABBCL l = d[i * 2 + 1];

      float4 m = ((float4)(lkf)) * 0.5f;
      float4 n = ((float4)(lkf)) * 0.5f;

      float4 o = F(&n, &g, &h);

      Matrix3x3 p = G(h);
   float4 q = (float4) ( dot(pow[pow[pow[2],m   e[f*2].fx = o.x-q.x;
   e[f*2].fy = o.y-q.y;
   e[f*2].fz = o.z-q.z;
   e[f*2].uw = f;

   e[f*2+1].fx = o.x+q.x;
   e[f*2+1].fy = o.y+q.y;
   e[f*2+1].fz = o.z+q.z;
   e[f*2+1].uw = b[f].m_invMass==0.f? 0 : 1;
    }
  }
}

__kernel void O(const int a, const int b, __global float4* c, __global int2* d, const int e) {
  int f = get_global_id(0);
  if (f < e) {
    int2 g = d[f];
    float4 h = (float4)(1.f, 0.4f, 0.4f, 1.f);

    c[g.x + a / 4 + b + b] = h;
    c[g.y + a / 4 + b + b] = h;
  }
}

__kernel void P(const int a, const int b, __global float4* c) {
  int d = get_global_id(0);

  if (d < b) {
    float4 e = c[d + a / 4];

    float4 f = c[d + a / 4 + b + b];

    float4 g = (float4)(1.f, 0.f, 0.f, 0.f);
    float4 h = (float4)(0.f, 1.f, 0.f, 0.f);
    float4 i = (float4)(0.f, 0.f, 1.f, 0.f);
    float j = 0;
    int k = 0;

    c[d + a / 4 + b + b] = h;

    for (int l = 0; l < b; l++) {
      if (l != d) {
        float4 m = c[l + a / 4];
        if ((m.x == e.x) && (m.y == e.y) && (m.z == e.z))
          k = 1;

        float n = ((m.x - e.x) * (m.x - e.x)) + ((m.y - e.y) * (m.y - e.y)) + ((m.z - e.z) * (m.z - e.z));

        if (n < 7.f)
          j += 0.25f;
      }
    }

    if (k) {
      c[d + a / 4 + b + b] = i;
    } else {
      if (j > 0.f)
        c[d + a / 4 + b + b] = g * j;
      else
        c[d + a / 4 + b + b] = h;
    }
  }
}