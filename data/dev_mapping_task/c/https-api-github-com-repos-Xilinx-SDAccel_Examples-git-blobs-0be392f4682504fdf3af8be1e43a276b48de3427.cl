__kernel __attribute__((reqd_work_group_size(1, 1, 1))) void A(__global unsigned short* a, __global unsigned short* b) {
  float c = 30.0f;
  float d = 0.0f;
  float e = 0.5f;
  float f = 0.5f;
  int g = 0;
  int h = 0;

  float i[2][2];
  float j[2][2];
  float k[2];
  float l[2];
  float m;
  float n, o;
  float p, q;
  float r;
  int s, t, u, v;

  __local unsigned short w[512];

  i[0][0] = e * cos((float)(c * 3.14159265359f / 180.0f));
  i[0][1] = f * sin((float)(d * 3.14159265359f / 180.0f));
  i[1][0] = e * sin((float)(c * 3.14159265359f / 180.0f));
  i[1][1] = f * cos((float)(d * 3.14159265359f / 180.0f));
  k[0] = g;
  k[1] = h;

  m = (i[0][0] * i[1][1]) - (i[0][1] * i[1][0]);
  if (m == 0.0f) {
    j[0][0] = 1.0f;
    j[0][1] = 0.0f;
    j[1][0] = 0.0f;
    j[1][1] = 1.0f;
    l[0] = -k[0];
    l[1] = -k[1];
  } else {
    j[0][0] = i[1][1] / m;
    j[0][1] = -i[0][1] / m;
    j[1][0] = -i[1][0] / m;
    j[1][1] = i[0][0] / m;
    l[0] = -j[0][0] * k[0] - j[0][1] * k[1];
    l[1] = -j[1][0] * k[0] - j[1][1] * k[1];
  }

  for (t = 0; t < 512; t++) {
    __attribute__((xcl_pipeline_loop)) for (s = 0; s < 512; s++) {
      n = l[0] + j[0][0] * (s - 512 / 2.0f) + j[0][1] * (t - 512 / 2.0f) + 512 / 2.0f;
      o = l[1] + j[1][0] * (s - 512 / 2.0f) + j[1][1] * (t - 512 / 2.0f) + 512 / 2.0f;

      u = (int)__clc_floor(n);
      v = (int)__clc_floor(o);

      p = n - u;
      q = o - v;

      if ((u >= 0) && (u + 1 < 512) && (v >= 0) && (v + 1 < 512)) {
        r = (1.0f - q) * ((1.0f - p) * (a[(v * 512) + u]) + p * (a[(v * 512) + u + 1])) + q * ((1.0f - p) * (a[((v + 1) * 512) + u]) + p * (a[((v + 1) * 512) + u + 1]));

        w[s] = (unsigned short)r;
      } else if (((u + 1 == 512) && (v >= 0) && (v < 512)) || ((v + 1 == 512) && (u >= 0) && (u < 512))) {
        w[s] = a[(v * 512) + u];
      } else {
        w[s] = (short)(1);
      }
    }

    event_t x = async_work_group_copy((__global char*)(&b[(t * 512)]), (const __local char*)(&w), 512 * sizeof(unsigned short), x);

    wait_group_events(1, &x);
  }
}