struct param {
  uint iWidth;
  uint iHeight;
  uint it;
  float mean;
  float q0;
  float3 empt;
};

__kernel void A(__constant struct param* a, __global const float* b, __global float* c) {
  int d = a->iWidth;
  int e = a->iHeight;
  int f = a->it;
  float g = a->mean;
  float h = a->q0;
  float i = (d - 4) * (e - 4);

  int j = get_global_id(0);
  int k = get_global_id(1);
  int l = get_global_id(2);
  int m = get_global_size(0);
  int n = get_global_size(1);
  int o = get_global_size(2);

  int p = l * m * n + k * m + j;

  int q = (p / (d - 4)) + 2;
  int r = (p % (d - 4)) + 2;

  if (p < i) {
    float s = 0.0001;
    float t = (-0.2) * (f - 1);
    float u = h * exp(t);

    float v = ((b[(q)*d + (r + 1)]) - (b[(q)*d + (r - 1)])) / 2;
    float w = ((b[(q + 1) * d + (r)]) - (b[(q - 1) * d + (r)])) / 2;
    float x = sqrt(v * v + w * w);
    float y = ((b[(q)*d + (r + 1)]) + (b[(q)*d + (r - 1)]) + (b[(q + 1) * d + (r)]) + (b[(q - 1) * d + (r)])) / 4 - (b[(q)*d + (r)]);

    float z = 0.5 * ((x / ((b[(q)*d + (r)]) + s)) * (x / ((b[(q)*d + (r)]) + s)));
    float aa = 0.625 * ((y / ((b[(q)*d + (r)]) + s)) * (y / ((b[(q)*d + (r)]) + s)));
    float ab = ((1 + (0.25 * y / ((b[(q)*d + (r)]) + s))) * (1 + (0.25 * y / ((b[(q)*d + (r)]) + s))));
    float ac = sqrt(__clc_fabs(z - aa) / __clc_fabs(ab + s));
    float ad = (ac * ac - u * u) / (u * u * (1 + u * u) + s);

    (c[(q)*d + (r)]) = 1 / (1 + ad);
  }
}

__kernel void B(__constant struct param* a, __global const float* b, __global const float* c, __global float* d) {
  int e = a->iWidth;
  int f = a->iHeight;
  int g = a->it;
  float h = a->mean;
  float i = a->q0;

  float j = (e - 4) * (f - 4);

  int k = get_global_id(0);
  int l = get_global_id(1);
  int m = get_global_id(2);
  int n = get_global_size(0);
  int o = get_global_size(1);
  int p = get_global_size(2);
  int q = m * n * o + l * n + k;

  int r = (q / (e - 4)) + 2;
  int s = (q % (e - 4)) + 2;

  if (q < j) {
    float t = ((b[(r)*e + (s + 1)]) * ((c[(r)*e + (s + 2)]) - (c[(r)*e + (s)])) - (b[(r)*e + (s - 1)]) * ((c[(r)*e + (s)]) - (c[(r)*e + (s - 2)]))) / 4;
    float u = ((b[(r + 1) * e + (s)]) * ((c[(r + 2) * e + (s)]) - (c[(r)*e + (s)])) - (b[(r - 1) * e + (s)]) * ((c[(r)*e + (s)]) - (c[(r - 2) * e + (s)]))) / 4;

    (d[(r)*e + (s)]) = (c[(r)*e + (s)]) + 0.035 * (t + u);
    if (r == 2 && s == 2) {
      (d[(2) * e + (2)]) = (b[(r + 1) * e + (s)]);
      (d[(2) * e + (3)]) = (c[(r + 2) * e + (s)]);
      (d[(2) * e + (4)]) = (c[(r)*e + (s)]);
    }
  }
}