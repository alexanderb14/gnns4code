__kernel void A(__global const uint* a, __global const uchar* b, __global const uint* c, __global uint* d) {
  int e = get_global_id(0);
  uint f[16] = {0};
  uint g;
  uint h = get_global_size(0);
  int i = e * (16 / 4);

  uint j, k, l, m;

  for (g = 0; g != (16 / 4) && a[i + g]; g++)
    f[g] = a[i + g];

  g = b[e];

  (f)[(g) >> 2] = ((f)[(g) >> 2] & ~(0xffU << (((g)&3) << 3))) + ((0x80) << (((g)&3) << 3));
  f[14] = g << 3;

  j = 0x67452301;
  k = 0xefcdab89;
  l = 0x98badcfe;
  m = 0x10325476;

  (j) += (((m)) ^ (((k)) & (((l)) ^ ((m))))) + (f[0]) + (0xd76aa478);
  (j) = rotate((j), (uint)(7));
  (j) += (k);
  (m) += (((l)) ^ (((j)) & (((k)) ^ ((l))))) + (f[1]) + (0xe8c7b756);
  (m) = rotate((m), (uint)(12));
  (m) += (j);
  (l) += (((k)) ^ (((m)) & (((j)) ^ ((k))))) + (f[2]) + (0x242070db);
  (l) = rotate((l), (uint)(17));
  (l) += (m);
  (k) += (((j)) ^ (((l)) & (((m)) ^ ((j))))) + (f[3]) + (0xc1bdceee);
  (k) = rotate((k), (uint)(22));
  (k) += (l);
  (j) += (((m)) ^ (((k)) & (((l)) ^ ((m))))) + (f[4]) + (0xf57c0faf);
  (j) = rotate((j), (uint)(7));
  (j) += (k);
  (m) += (((l)) ^ (((j)) & (((k)) ^ ((l))))) + (f[5]) + (0x4787c62a);
  (m) = rotate((m), (uint)(12));
  (m) += (j);
  (l) += (((k)) ^ (((m)) & (((j)) ^ ((k))))) + (f[6]) + (0xa8304613);
  (l) = rotate((l), (uint)(17));
  (l) += (m);
  (k) += (((j)) ^ (((l)) & (((m)) ^ ((j))))) + (f[7]) + (0xfd469501);
  (k) = rotate((k), (uint)(22));
  (k) += (l);
  (j) += (((m)) ^ (((k)) & (((l)) ^ ((m))))) + (f[8]) + (0x698098d8);
  (j) = rotate((j), (uint)(7));
  (j) += (k);
  (m) += (((l)) ^ (((j)) & (((k)) ^ ((l))))) + (f[9]) + (0x8b44f7af);
  (m) = rotate((m), (uint)(12));
  (m) += (j);
  (l) += (((k)) ^ (((m)) & (((j)) ^ ((k))))) + (f[10]) + (0xffff5bb1);
  (l) = rotate((l), (uint)(17));
  (l) += (m);
  (k) += (((j)) ^ (((l)) & (((m)) ^ ((j))))) + (f[11]) + (0x895cd7be);
  (k) = rotate((k), (uint)(22));
  (k) += (l);
  (j) += (((m)) ^ (((k)) & (((l)) ^ ((m))))) + (f[12]) + (0x6b901122);
  (j) = rotate((j), (uint)(7));
  (j) += (k);
  (m) += (((l)) ^ (((j)) & (((k)) ^ ((l))))) + (f[13]) + (0xfd987193);
  (m) = rotate((m), (uint)(12));
  (m) += (j);
  (l) += (((k)) ^ (((m)) & (((j)) ^ ((k))))) + (f[14]) + (0xa679438e);
  (l) = rotate((l), (uint)(17));
  (l) += (m);
  (k) += (((j)) ^ (((l)) & (((m)) ^ ((j))))) + (f[15]) + (0x49b40821);
  (k) = rotate((k), (uint)(22));
  (k) += (l);

  (j) += (((l)) ^ (((m)) & (((k)) ^ ((l))))) + (f[1]) + (0xf61e2562);
  (j) = rotate((j), (uint)(5));
  (j) += (k);
  (m) += (((k)) ^ (((l)) & (((j)) ^ ((k))))) + (f[6]) + (0xc040b340);
  (m) = rotate((m), (uint)(9));
  (m) += (j);
  (l) += (((j)) ^ (((k)) & (((m)) ^ ((j))))) + (f[11]) + (0x265e5a51);
  (l) = rotate((l), (uint)(14));
  (l) += (m);
  (k) += (((m)) ^ (((j)) & (((l)) ^ ((m))))) + (f[0]) + (0xe9b6c7aa);
  (k) = rotate((k), (uint)(20));
  (k) += (l);
  (j) += (((l)) ^ (((m)) & (((k)) ^ ((l))))) + (f[5]) + (0xd62f105d);
  (j) = rotate((j), (uint)(5));
  (j) += (k);
  (m) += (((k)) ^ (((l)) & (((j)) ^ ((k))))) + (f[10]) + (0x02441453);
  (m) = rotate((m), (uint)(9));
  (m) += (j);
  (l) += (((j)) ^ (((k)) & (((m)) ^ ((j))))) + (f[15]) + (0xd8a1e681);
  (l) = rotate((l), (uint)(14));
  (l) += (m);
  (k) += (((m)) ^ (((j)) & (((l)) ^ ((m))))) + (f[4]) + (0xe7d3fbc8);
  (k) = rotate((k), (uint)(20));
  (k) += (l);
  (j) += (((l)) ^ (((m)) & (((k)) ^ ((l))))) + (f[9]) + (0x21e1cde6);
  (j) = rotate((j), (uint)(5));
  (j) += (k);
  (m) += (((k)) ^ (((l)) & (((j)) ^ ((k))))) + (f[14]) + (0xc33707d6);
  (m) = rotate((m), (uint)(9));
  (m) += (j);
  (l) += (((j)) ^ (((k)) & (((m)) ^ ((j))))) + (f[3]) + (0xf4d50d87);
  (l) = rotate((l), (uint)(14));
  (l) += (m);
  (k) += (((m)) ^ (((j)) & (((l)) ^ ((m))))) + (f[8]) + (0x455a14ed);
  (k) = rotate((k), (uint)(20));
  (k) += (l);
  (j) += (((l)) ^ (((m)) & (((k)) ^ ((l))))) + (f[13]) + (0xa9e3e905);
  (j) = rotate((j), (uint)(5));
  (j) += (k);
  (m) += (((k)) ^ (((l)) & (((j)) ^ ((k))))) + (f[2]) + (0xfcefa3f8);
  (m) = rotate((m), (uint)(9));
  (m) += (j);
  (l) += (((j)) ^ (((k)) & (((m)) ^ ((j))))) + (f[7]) + (0x676f02d9);
  (l) = rotate((l), (uint)(14));
  (l) += (m);
  (k) += (((m)) ^ (((j)) & (((l)) ^ ((m))))) + (f[12]) + (0x8d2a4c8a);
  (k) = rotate((k), (uint)(20));
  (k) += (l);

  (j) += (((k)) ^ ((l)) ^ ((m))) + (f[5]) + (0xfffa3942);
  (j) = rotate((j), (uint)(4));
  (j) += (k);
  (m) += (((j)) ^ ((k)) ^ ((l))) + (f[8]) + (0x8771f681);
  (m) = rotate((m), (uint)(11));
  (m) += (j);
  (l) += (((m)) ^ ((j)) ^ ((k))) + (f[11]) + (0x6d9d6122);
  (l) = rotate((l), (uint)(16));
  (l) += (m);
  (k) += (((l)) ^ ((m)) ^ ((j))) + (f[14]) + (0xfde5380c);
  (k) = rotate((k), (uint)(23));
  (k) += (l);
  (j) += (((k)) ^ ((l)) ^ ((m))) + (f[1]) + (0xa4beea44);
  (j) = rotate((j), (uint)(4));
  (j) += (k);
  (m) += (((j)) ^ ((k)) ^ ((l))) + (f[4]) + (0x4bdecfa9);
  (m) = rotate((m), (uint)(11));
  (m) += (j);
  (l) += (((m)) ^ ((j)) ^ ((k))) + (f[7]) + (0xf6bb4b60);
  (l) = rotate((l), (uint)(16));
  (l) += (m);
  (k) += (((l)) ^ ((m)) ^ ((j))) + (f[10]) + (0xbebfbc70);
  (k) = rotate((k), (uint)(23));
  (k) += (l);
  (j) += (((k)) ^ ((l)) ^ ((m))) + (f[13]) + (0x289b7ec6);
  (j) = rotate((j), (uint)(4));
  (j) += (k);
  (m) += (((j)) ^ ((k)) ^ ((l))) + (f[0]) + (0xeaa127fa);
  (m) = rotate((m), (uint)(11));
  (m) += (j);
  (l) += (((m)) ^ ((j)) ^ ((k))) + (f[3]) + (0xd4ef3085);
  (l) = rotate((l), (uint)(16));
  (l) += (m);
  (k) += (((l)) ^ ((m)) ^ ((j))) + (f[6]) + (0x04881d05);
  (k) = rotate((k), (uint)(23));
  (k) += (l);
  (j) += (((k)) ^ ((l)) ^ ((m))) + (f[9]) + (0xd9d4d039);
  (j) = rotate((j), (uint)(4));
  (j) += (k);
  (m) += (((j)) ^ ((k)) ^ ((l))) + (f[12]) + (0xe6db99e5);
  (m) = rotate((m), (uint)(11));
  (m) += (j);
  (l) += (((m)) ^ ((j)) ^ ((k))) + (f[15]) + (0x1fa27cf8);
  (l) = rotate((l), (uint)(16));
  (l) += (m);
  (k) += (((l)) ^ ((m)) ^ ((j))) + (f[2]) + (0xc4ac5665);
  (k) = rotate((k), (uint)(23));
  (k) += (l);

  (j) += (((l)) ^ (((k)) | ~((m)))) + (f[0]) + (0xf4292244);
  (j) = rotate((j), (uint)(6));
  (j) += (k);
  (m) += (((k)) ^ (((j)) | ~((l)))) + (f[7]) + (0x432aff97);
  (m) = rotate((m), (uint)(10));
  (m) += (j);
  (l) += (((j)) ^ (((m)) | ~((k)))) + (f[14]) + (0xab9423a7);
  (l) = rotate((l), (uint)(15));
  (l) += (m);
  (k) += (((m)) ^ (((l)) | ~((j)))) + (f[5]) + (0xfc93a039);
  (k) = rotate((k), (uint)(21));
  (k) += (l);
  (j) += (((l)) ^ (((k)) | ~((m)))) + (f[12]) + (0x655b59c3);
  (j) = rotate((j), (uint)(6));
  (j) += (k);
  (m) += (((k)) ^ (((j)) | ~((l)))) + (f[3]) + (0x8f0ccc92);
  (m) = rotate((m), (uint)(10));
  (m) += (j);
  (l) += (((j)) ^ (((m)) | ~((k)))) + (f[10]) + (0xffeff47d);
  (l) = rotate((l), (uint)(15));
  (l) += (m);
  (k) += (((m)) ^ (((l)) | ~((j)))) + (f[1]) + (0x85845dd1);
  (k) = rotate((k), (uint)(21));
  (k) += (l);
  (j) += (((l)) ^ (((k)) | ~((m)))) + (f[8]) + (0x6fa87e4f);
  (j) = rotate((j), (uint)(6));
  (j) += (k);
  (m) += (((k)) ^ (((j)) | ~((l)))) + (f[15]) + (0xfe2ce6e0);
  (m) = rotate((m), (uint)(10));
  (m) += (j);
  (l) += (((j)) ^ (((m)) | ~((k)))) + (f[6]) + (0xa3014314);
  (l) = rotate((l), (uint)(15));
  (l) += (m);
  (k) += (((m)) ^ (((l)) | ~((j)))) + (f[13]) + (0x4e0811a1);
  (k) = rotate((k), (uint)(21));
  (k) += (l);
  (j) += (((l)) ^ (((k)) | ~((m)))) + (f[4]) + (0xf7537e82);
  (j) = rotate((j), (uint)(6));
  (j) += (k);
  (m) += (((k)) ^ (((j)) | ~((l)))) + (f[11]) + (0xbd3af235);
  (m) = rotate((m), (uint)(10));
  (m) += (j);
  (l) += (((j)) ^ (((m)) | ~((k)))) + (f[2]) + (0x2ad7d2bb);
  (l) = rotate((l), (uint)(15));
  (l) += (m);
  (k) += (((m)) ^ (((l)) | ~((j)))) + (f[9]) + (0xeb86d391);
  (k) = rotate((k), (uint)(21));
  (k) += (l);

  j = j + 0x67452301;
  k = k + 0xefcdab89;
  l = l + 0x98badcfe;
  m = m + 0x10325476;

  if (c[0] == j && c[1] == k && c[2] == l && c[3] == m) {
    for (g = 0; g != (16 / 4); g++)
      d[g] = a[i + g];
  }
}