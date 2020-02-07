__kernel void A(__global uchar4* a, __global unsigned int* b, __local uchar4* c, int d, int e, int f, float g) {
  int h = get_global_id(0);
  int i = get_global_id(1) - 1;
  int j = i * (int)get_global_size(0) + h;

  int k = (int)get_local_id(1) * d + get_local_id(0) + 1;

  if ((i > -1) && (i < f) && (h < e)) {
    c[k] = a[j];
  } else {
    c[k] = (uchar4)0;
  }

  if (get_local_id(1) < 2) {
    k += (int)get_local_size(1) * d;

    if (((i + get_local_size(1)) < f) && (h < e)) {
      c[k] = a[j + get_local_size(1) * get_global_size(0)];
    } else {
      c[k] = (uchar4)0;
    }
  }

  if (get_local_id(0) == (get_local_size(0) - 1)) {
    k = (int)get_local_id(1) * d;

    if ((i > -1) && (i < f) && (get_group_id(0) > 0)) {
      c[k] = a[i * (int)get_global_size(0) + get_group_id(0) * get_local_size(0) - 1];
    } else {
      c[k] = (uchar4)0;
    }

    if (get_local_id(1) < 2) {
      k += (int)get_local_size(1) * d;

      if (((i + get_local_size(1)) < f) && (get_group_id(0) > 0)) {
        c[k] = a[(i + (int)get_local_size(1)) * (int)get_global_size(0) + get_group_id(0) * get_local_size(0) - 1];
      } else {
        c[k] = (uchar4)0;
      }
    }
  } else if (get_local_id(0) == 0) {
    k = ((int)get_local_id(1) + 1) * d - 1;

    if ((i > -1) && (i < f) && (((int)get_group_id(0) + 1) * (int)get_local_size(0) < e)) {
      c[k] = a[i * (int)get_global_size(0) + (get_group_id(0) + 1) * get_local_size(0)];
    } else {
      c[k] = (uchar4)0;
    }

    if (get_local_id(1) < 2) {
      k += ((int)get_local_size(1) * d);

      if (((i + get_local_size(1)) < f) && ((get_group_id(0) + 1) * get_local_size(0) < e)) {
        c[k] = a[(i + (int)get_local_size(1)) * (int)get_global_size(0) + (get_group_id(0) + 1) * get_local_size(0)];
      } else {
        c[k] = (uchar4)0;
      }
    }
  }

  barrier(1);

  float l = 0.0f;
  float m[3] = {0.0f, 0.0f, 0.0f};
  float n[3] = {0.0f, 0.0f, 0.0f};

  k = (int)get_local_id(1) * d + get_local_id(0);

  m[0] += (float)c[k].x;
  m[1] += (float)c[k].y;
  m[2] += (float)c[k].z;
  n[0] -= (float)c[k].x;
  n[1] -= (float)c[k].y;
  n[2] -= (float)c[k++].z;

  n[0] -= (float)(c[k].x << 1);
  n[1] -= (float)(c[k].y << 1);
  n[2] -= (float)(c[k++].z << 1);

  m[0] -= (float)c[k].x;
  m[1] -= (float)c[k].y;
  m[2] -= (float)c[k].z;
  n[0] -= (float)c[k].x;
  n[1] -= (float)c[k].y;
  n[2] -= (float)c[k].z;

  k += (d - 2);

  m[0] += (float)(c[k].x << 1);
  m[1] += (float)(c[k].y << 1);
  m[2] += (float)(c[k++].z << 1);

  k++;

  m[0] -= (float)(c[k].x << 1);
  m[1] -= (float)(c[k].y << 1);
  m[2] -= (float)(c[k].z << 1);

  k += (d - 2);

  m[0] += (float)c[k].x;
  m[1] += (float)c[k].y;
  m[2] += (float)c[k].z;
  n[0] += (float)c[k].x;
  n[1] += (float)c[k].y;
  n[2] += (float)c[k++].z;

  n[0] += (float)(c[k].x << 1);
  n[1] += (float)(c[k].y << 1);
  n[2] += (float)(c[k++].z << 1);

  m[0] -= (float)c[k].x;
  m[1] -= (float)c[k].y;
  m[2] -= (float)c[k].z;
  n[0] += (float)c[k].x;
  n[1] += (float)c[k].y;
  n[2] += (float)c[k].z;

  l = 0.30f * sqrt((m[0] * m[0]) + (n[0] * n[0]));
  l += 0.55f * sqrt((m[1] * m[1]) + (n[1] * n[1]));
  l += 0.15f * sqrt((m[2] * m[2]) + (n[2] * n[2]));

  if (l < g) {
    l = 0.0f;
  } else if (l > 255.0f) {
    l = 255.0f;
  }

  unsigned int o = 0x000000FF & (unsigned int)l;
  o |= 0x0000FF00 & (((unsigned int)l) << 8);
  o |= 0x00FF0000 & (((unsigned int)l) << 16);

  if ((i + 1 < f) && (h < e)) {
    b[j + get_global_size(0)] = o;
  }
}