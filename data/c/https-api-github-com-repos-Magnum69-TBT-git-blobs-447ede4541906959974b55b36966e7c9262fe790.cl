struct Data {
  int m_n;
  float m_x;
  float m_y;
  uint m_d[3];
};

__kernel void A(__global struct Data* a) {
  a->m_n *= 2;

  float b = a->m_x;
  b = b * b;
  a->m_x = b;

  a->m_y *= 4;

  uint c = 0;
  c += a->m_d[0];
  c += a->m_d[1];
  c += a->m_d[2];

  a->m_d[2] = c;
}