__constant uint Ga[2] = {0x00FF00FF, 0xFF00FF00};
__constant uint Gb[] = {0x428a2f98U, 0x71374491U, 0xb5c0fbcfU, 0xe9b5dba5U, 0x3956c25bU, 0x59f111f1U, 0x923f82a4U, 0xab1c5ed5U, 0xd807aa98U, 0x12835b01U, 0x243185beU, 0x550c7dc3U, 0x72be5d74U, 0x80deb1feU, 0x9bdc06a7U, 0xe49b69c1U, 0xefbe4786U, 0x0fc19dc6U, 0x240ca1ccU, 0x2de92c6fU, 0x4a7484aaU, 0x5cb0a9dcU, 0x76f988daU, 0x983e5152U, 0xa831c66dU, 0xb00327c8U, 0xbf597fc7U, 0xc6e00bf3U, 0xd5a79147U, 0x06ca6351U,
                        0x14292967U, 0x27b70a85U, 0x2e1b2138U, 0x4d2c6dfcU, 0x53380d13U, 0x650a7354U, 0x766a0abbU, 0x81c2c92eU, 0x92722c85U, 0xa2bfe8a1U, 0xa81a664bU, 0xc24b8b70U, 0xc76c51a3U, 0xd192e819U, 0xd6990624U, 0xf40e3585U, 0x106aa070U, 0x19a4c116U, 0x1e376c08U, 0x2748774cU, 0x34b0bcb5U, 0x391c0cb3U, 0x4ed8aa4aU, 0x5b9cca4fU, 0x682e6ff3U, 0x748f82eeU, 0x78a5636fU, 0x84c87814U, 0x8cc70208U, 0x90befffaU,
                        0xa4506cebU, 0xbef9a3f7U, 0xc67178f2U, 0x98c7e2a2U, 0xfc08884dU, 0xcd2a11aeU, 0x510e527fU, 0x9b05688cU, 0xC3910C8EU, 0xfb6feee7U, 0x2a01a605U, 0x0c2e12e0U, 0x4498517BU, 0x6a09e667U, 0xa4ce148bU, 0x95F61999U, 0xc19bf174U, 0xBB67AE85U, 0x3C6EF372U, 0xA54FF53AU, 0x1F83D9ABU, 0x5BE0CD19U, 0x5C5C5C5CU, 0x36363636U, 0x80000000U, 0x000003FFU, 0x00000280U, 0x000004a0U, 0x00000300U};
void A(uint4* restrict a, uint4* restrict b, const uint4 c, const uint4 d, const uint4 e, const uint4 f) {
  uint4 g = *a;
  uint4 h = *b;
  uint4 i[4];

  i[0].x = c.x;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[0].x + Gb[0];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  i[0].y = c.y;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[0].y + Gb[1];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  i[0].z = c.z;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[0].z + Gb[2];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  i[0].w = c.w;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[0].w + Gb[3];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x = d.x;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[1].x + Gb[4];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  i[1].y = d.y;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[1].y + Gb[5];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  i[1].z = d.z;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[1].z + Gb[6];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  i[1].w = d.w;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[1].w + Gb[7];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x = e.x;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[2].x + Gb[8];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  i[2].y = e.y;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[2].y + Gb[9];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  i[2].z = e.z;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[2].z + Gb[10];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  i[2].w = e.w;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[2].w + Gb[11];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x = f.x;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[3].x + Gb[12];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  i[3].y = f.y;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[3].y + Gb[13];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  i[3].z = f.z;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[3].z + Gb[14];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  i[3].w = f.w;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[3].w + Gb[76];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[0].x + Gb[15];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[0].y + Gb[16];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[0].z + Gb[17];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[0].w + Gb[18];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[1].x + Gb[19];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[1].y + Gb[20];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[1].z + Gb[21];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[1].w + Gb[22];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[2].x + Gb[23];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[2].y + Gb[24];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[2].z + Gb[25];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[2].w + Gb[26];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[3].x + Gb[27];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[3].y + Gb[28];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[3].z + Gb[29];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[3].w + Gb[30];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[0].x + Gb[31];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[0].y + Gb[32];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[0].z + Gb[33];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[0].w + Gb[34];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[1].x + Gb[35];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[1].y + Gb[36];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[1].z + Gb[37];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[1].w + Gb[38];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[2].x + Gb[39];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[2].y + Gb[40];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[2].z + Gb[41];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[2].w + Gb[42];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[3].x + Gb[43];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[3].y + Gb[44];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[3].z + Gb[45];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[3].w + Gb[46];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[0].x + Gb[47];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[0].y + Gb[48];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[0].z + Gb[49];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[0].w + Gb[50];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[1].x + Gb[51];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[1].y + Gb[52];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[1].z + Gb[53];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[1].w + Gb[54];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U));
  h.w += bitselect(h.z, h.y, h.x);
  h.w += i[2].x + Gb[55];
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U));
  h.w += bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U));
  h.z += bitselect(h.y, h.x, g.w);
  h.z += i[2].y + Gb[56];
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U));
  h.z += bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U));
  h.y += bitselect(h.x, g.w, g.z);
  h.y += i[2].z + Gb[57];
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U));
  h.y += bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U));
  h.x += bitselect(g.w, g.z, g.y);
  h.x += i[2].w + Gb[58];
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U));
  h.x += bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U));
  g.w += bitselect(g.z, g.y, g.x);
  g.w += i[3].x + Gb[59];
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U));
  g.w += bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U));
  g.z += bitselect(g.y, g.x, h.w);
  g.z += i[3].y + Gb[60];
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U));
  g.z += bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U));
  g.y += bitselect(g.x, h.w, h.z);
  g.y += i[3].z + Gb[61];
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U));
  g.y += bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U));
  g.x += bitselect(h.w, h.z, h.y);
  g.x += i[3].w + Gb[62];
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U));
  g.x += bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  *a += g;
  *b += h;
}

void B(uint4* restrict a, uint4* restrict b, const uint4 c, const uint4 d, const uint4 e, const uint4 f) {
  uint4 g[4];

  g[0].x = c.x;
  (*a).w = Gb[63] + g[0].x;
  (*b).w = Gb[64] + g[0].x;

  g[0].y = c.y;
  (*a).z = Gb[65] + (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect(Gb[67], Gb[66], (*a).w) + g[0].y;
  (*b).z = Gb[68] + (*a).z + (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect(Gb[70], Gb[69], (*b).w);

  g[0].z = c.z;
  (*a).y = Gb[71] + (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect(Gb[66], (*a).w, (*a).z) + g[0].z;
  (*b).y = Gb[72] + (*a).y + (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect(Gb[73], (*b).w, ((*b).z ^ Gb[73]));

  g[0].w = c.w;
  (*a).x = Gb[74] + (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[0].w;
  (*b).x = Gb[75] + (*a).x + (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));

  g[1].x = d.x;
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[1].x + Gb[4];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;
  g[1].y = d.y;
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[1].y + Gb[5];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;
  g[1].z = d.z;
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[1].z + Gb[6];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;
  g[1].w = d.w;
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[1].w + Gb[7];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x = e.x;
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[2].x + Gb[8];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;
  g[2].y = e.y;
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[2].y + Gb[9];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;
  g[2].z = e.z;
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[2].z + Gb[10];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;
  g[2].w = e.w;
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[2].w + Gb[11];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x = f.x;
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[3].x + Gb[12];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;
  g[3].y = f.y;
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[3].y + Gb[13];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;
  g[3].z = f.z;
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[3].z + Gb[14];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;
  g[3].w = f.w;
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[3].w + Gb[76];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[0].x += (rotate(g[3].z, 15U) ^ rotate(g[3].z, 13U) ^ (g[3].z >> 10U)) + g[2].y + (rotate(g[0].y, 25U) ^ rotate(g[0].y, 14U) ^ (g[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[0].x + Gb[15];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[0].y += (rotate(g[3].w, 15U) ^ rotate(g[3].w, 13U) ^ (g[3].w >> 10U)) + g[2].z + (rotate(g[0].z, 25U) ^ rotate(g[0].z, 14U) ^ (g[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[0].y + Gb[16];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[0].z += (rotate(g[0].x, 15U) ^ rotate(g[0].x, 13U) ^ (g[0].x >> 10U)) + g[2].w + (rotate(g[0].w, 25U) ^ rotate(g[0].w, 14U) ^ (g[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[0].z + Gb[17];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[0].w += (rotate(g[0].y, 15U) ^ rotate(g[0].y, 13U) ^ (g[0].y >> 10U)) + g[3].x + (rotate(g[1].x, 25U) ^ rotate(g[1].x, 14U) ^ (g[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[0].w + Gb[18];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[1].x += (rotate(g[0].z, 15U) ^ rotate(g[0].z, 13U) ^ (g[0].z >> 10U)) + g[3].y + (rotate(g[1].y, 25U) ^ rotate(g[1].y, 14U) ^ (g[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[1].x + Gb[19];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[1].y += (rotate(g[0].w, 15U) ^ rotate(g[0].w, 13U) ^ (g[0].w >> 10U)) + g[3].z + (rotate(g[1].z, 25U) ^ rotate(g[1].z, 14U) ^ (g[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[1].y + Gb[20];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[1].z += (rotate(g[1].x, 15U) ^ rotate(g[1].x, 13U) ^ (g[1].x >> 10U)) + g[3].w + (rotate(g[1].w, 25U) ^ rotate(g[1].w, 14U) ^ (g[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[1].z + Gb[21];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[1].w += (rotate(g[1].y, 15U) ^ rotate(g[1].y, 13U) ^ (g[1].y >> 10U)) + g[0].x + (rotate(g[2].x, 25U) ^ rotate(g[2].x, 14U) ^ (g[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[1].w + Gb[22];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x += (rotate(g[1].z, 15U) ^ rotate(g[1].z, 13U) ^ (g[1].z >> 10U)) + g[0].y + (rotate(g[2].y, 25U) ^ rotate(g[2].y, 14U) ^ (g[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[2].x + Gb[23];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[2].y += (rotate(g[1].w, 15U) ^ rotate(g[1].w, 13U) ^ (g[1].w >> 10U)) + g[0].z + (rotate(g[2].z, 25U) ^ rotate(g[2].z, 14U) ^ (g[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[2].y + Gb[24];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[2].z += (rotate(g[2].x, 15U) ^ rotate(g[2].x, 13U) ^ (g[2].x >> 10U)) + g[0].w + (rotate(g[2].w, 25U) ^ rotate(g[2].w, 14U) ^ (g[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[2].z + Gb[25];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[2].w += (rotate(g[2].y, 15U) ^ rotate(g[2].y, 13U) ^ (g[2].y >> 10U)) + g[1].x + (rotate(g[3].x, 25U) ^ rotate(g[3].x, 14U) ^ (g[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[2].w + Gb[26];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x += (rotate(g[2].z, 15U) ^ rotate(g[2].z, 13U) ^ (g[2].z >> 10U)) + g[1].y + (rotate(g[3].y, 25U) ^ rotate(g[3].y, 14U) ^ (g[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[3].x + Gb[27];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[3].y += (rotate(g[2].w, 15U) ^ rotate(g[2].w, 13U) ^ (g[2].w >> 10U)) + g[1].z + (rotate(g[3].z, 25U) ^ rotate(g[3].z, 14U) ^ (g[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[3].y + Gb[28];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[3].z += (rotate(g[3].x, 15U) ^ rotate(g[3].x, 13U) ^ (g[3].x >> 10U)) + g[1].w + (rotate(g[3].w, 25U) ^ rotate(g[3].w, 14U) ^ (g[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[3].z + Gb[29];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[3].w += (rotate(g[3].y, 15U) ^ rotate(g[3].y, 13U) ^ (g[3].y >> 10U)) + g[2].x + (rotate(g[0].x, 25U) ^ rotate(g[0].x, 14U) ^ (g[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[3].w + Gb[30];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[0].x += (rotate(g[3].z, 15U) ^ rotate(g[3].z, 13U) ^ (g[3].z >> 10U)) + g[2].y + (rotate(g[0].y, 25U) ^ rotate(g[0].y, 14U) ^ (g[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[0].x + Gb[31];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[0].y += (rotate(g[3].w, 15U) ^ rotate(g[3].w, 13U) ^ (g[3].w >> 10U)) + g[2].z + (rotate(g[0].z, 25U) ^ rotate(g[0].z, 14U) ^ (g[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[0].y + Gb[32];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[0].z += (rotate(g[0].x, 15U) ^ rotate(g[0].x, 13U) ^ (g[0].x >> 10U)) + g[2].w + (rotate(g[0].w, 25U) ^ rotate(g[0].w, 14U) ^ (g[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[0].z + Gb[33];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[0].w += (rotate(g[0].y, 15U) ^ rotate(g[0].y, 13U) ^ (g[0].y >> 10U)) + g[3].x + (rotate(g[1].x, 25U) ^ rotate(g[1].x, 14U) ^ (g[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[0].w + Gb[34];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[1].x += (rotate(g[0].z, 15U) ^ rotate(g[0].z, 13U) ^ (g[0].z >> 10U)) + g[3].y + (rotate(g[1].y, 25U) ^ rotate(g[1].y, 14U) ^ (g[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[1].x + Gb[35];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[1].y += (rotate(g[0].w, 15U) ^ rotate(g[0].w, 13U) ^ (g[0].w >> 10U)) + g[3].z + (rotate(g[1].z, 25U) ^ rotate(g[1].z, 14U) ^ (g[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[1].y + Gb[36];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[1].z += (rotate(g[1].x, 15U) ^ rotate(g[1].x, 13U) ^ (g[1].x >> 10U)) + g[3].w + (rotate(g[1].w, 25U) ^ rotate(g[1].w, 14U) ^ (g[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[1].z + Gb[37];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[1].w += (rotate(g[1].y, 15U) ^ rotate(g[1].y, 13U) ^ (g[1].y >> 10U)) + g[0].x + (rotate(g[2].x, 25U) ^ rotate(g[2].x, 14U) ^ (g[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[1].w + Gb[38];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x += (rotate(g[1].z, 15U) ^ rotate(g[1].z, 13U) ^ (g[1].z >> 10U)) + g[0].y + (rotate(g[2].y, 25U) ^ rotate(g[2].y, 14U) ^ (g[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[2].x + Gb[39];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[2].y += (rotate(g[1].w, 15U) ^ rotate(g[1].w, 13U) ^ (g[1].w >> 10U)) + g[0].z + (rotate(g[2].z, 25U) ^ rotate(g[2].z, 14U) ^ (g[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[2].y + Gb[40];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[2].z += (rotate(g[2].x, 15U) ^ rotate(g[2].x, 13U) ^ (g[2].x >> 10U)) + g[0].w + (rotate(g[2].w, 25U) ^ rotate(g[2].w, 14U) ^ (g[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[2].z + Gb[41];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[2].w += (rotate(g[2].y, 15U) ^ rotate(g[2].y, 13U) ^ (g[2].y >> 10U)) + g[1].x + (rotate(g[3].x, 25U) ^ rotate(g[3].x, 14U) ^ (g[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[2].w + Gb[42];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x += (rotate(g[2].z, 15U) ^ rotate(g[2].z, 13U) ^ (g[2].z >> 10U)) + g[1].y + (rotate(g[3].y, 25U) ^ rotate(g[3].y, 14U) ^ (g[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[3].x + Gb[43];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[3].y += (rotate(g[2].w, 15U) ^ rotate(g[2].w, 13U) ^ (g[2].w >> 10U)) + g[1].z + (rotate(g[3].z, 25U) ^ rotate(g[3].z, 14U) ^ (g[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[3].y + Gb[44];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[3].z += (rotate(g[3].x, 15U) ^ rotate(g[3].x, 13U) ^ (g[3].x >> 10U)) + g[1].w + (rotate(g[3].w, 25U) ^ rotate(g[3].w, 14U) ^ (g[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[3].z + Gb[45];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[3].w += (rotate(g[3].y, 15U) ^ rotate(g[3].y, 13U) ^ (g[3].y >> 10U)) + g[2].x + (rotate(g[0].x, 25U) ^ rotate(g[0].x, 14U) ^ (g[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[3].w + Gb[46];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[0].x += (rotate(g[3].z, 15U) ^ rotate(g[3].z, 13U) ^ (g[3].z >> 10U)) + g[2].y + (rotate(g[0].y, 25U) ^ rotate(g[0].y, 14U) ^ (g[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[0].x + Gb[47];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[0].y += (rotate(g[3].w, 15U) ^ rotate(g[3].w, 13U) ^ (g[3].w >> 10U)) + g[2].z + (rotate(g[0].z, 25U) ^ rotate(g[0].z, 14U) ^ (g[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[0].y + Gb[48];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[0].z += (rotate(g[0].x, 15U) ^ rotate(g[0].x, 13U) ^ (g[0].x >> 10U)) + g[2].w + (rotate(g[0].w, 25U) ^ rotate(g[0].w, 14U) ^ (g[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[0].z + Gb[49];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[0].w += (rotate(g[0].y, 15U) ^ rotate(g[0].y, 13U) ^ (g[0].y >> 10U)) + g[3].x + (rotate(g[1].x, 25U) ^ rotate(g[1].x, 14U) ^ (g[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[0].w + Gb[50];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[1].x += (rotate(g[0].z, 15U) ^ rotate(g[0].z, 13U) ^ (g[0].z >> 10U)) + g[3].y + (rotate(g[1].y, 25U) ^ rotate(g[1].y, 14U) ^ (g[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[1].x + Gb[51];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[1].y += (rotate(g[0].w, 15U) ^ rotate(g[0].w, 13U) ^ (g[0].w >> 10U)) + g[3].z + (rotate(g[1].z, 25U) ^ rotate(g[1].z, 14U) ^ (g[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[1].y + Gb[52];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[1].z += (rotate(g[1].x, 15U) ^ rotate(g[1].x, 13U) ^ (g[1].x >> 10U)) + g[3].w + (rotate(g[1].w, 25U) ^ rotate(g[1].w, 14U) ^ (g[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[1].z + Gb[53];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[1].w += (rotate(g[1].y, 15U) ^ rotate(g[1].y, 13U) ^ (g[1].y >> 10U)) + g[0].x + (rotate(g[2].x, 25U) ^ rotate(g[2].x, 14U) ^ (g[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[1].w + Gb[54];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x += (rotate(g[1].z, 15U) ^ rotate(g[1].z, 13U) ^ (g[1].z >> 10U)) + g[0].y + (rotate(g[2].y, 25U) ^ rotate(g[2].y, 14U) ^ (g[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U));
  (*b).w += bitselect((*b).z, (*b).y, (*b).x);
  (*b).w += g[2].x + Gb[55];
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U));
  (*b).w += bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[2].y += (rotate(g[1].w, 15U) ^ rotate(g[1].w, 13U) ^ (g[1].w >> 10U)) + g[0].z + (rotate(g[2].z, 25U) ^ rotate(g[2].z, 14U) ^ (g[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U));
  (*b).z += bitselect((*b).y, (*b).x, (*a).w);
  (*b).z += g[2].y + Gb[56];
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U));
  (*b).z += bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[2].z += (rotate(g[2].x, 15U) ^ rotate(g[2].x, 13U) ^ (g[2].x >> 10U)) + g[0].w + (rotate(g[2].w, 25U) ^ rotate(g[2].w, 14U) ^ (g[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U));
  (*b).y += bitselect((*b).x, (*a).w, (*a).z);
  (*b).y += g[2].z + Gb[57];
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U));
  (*b).y += bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[2].w += (rotate(g[2].y, 15U) ^ rotate(g[2].y, 13U) ^ (g[2].y >> 10U)) + g[1].x + (rotate(g[3].x, 25U) ^ rotate(g[3].x, 14U) ^ (g[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U));
  (*b).x += bitselect((*a).w, (*a).z, (*a).y);
  (*b).x += g[2].w + Gb[58];
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U));
  (*b).x += bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x += (rotate(g[2].z, 15U) ^ rotate(g[2].z, 13U) ^ (g[2].z >> 10U)) + g[1].y + (rotate(g[3].y, 25U) ^ rotate(g[3].y, 14U) ^ (g[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U));
  (*a).w += bitselect((*a).z, (*a).y, (*a).x);
  (*a).w += g[3].x + Gb[59];
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U));
  (*a).w += bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[3].y += (rotate(g[2].w, 15U) ^ rotate(g[2].w, 13U) ^ (g[2].w >> 10U)) + g[1].z + (rotate(g[3].z, 25U) ^ rotate(g[3].z, 14U) ^ (g[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U));
  (*a).z += bitselect((*a).y, (*a).x, (*b).w);
  (*a).z += g[3].y + Gb[60];
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U));
  (*a).z += bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[3].z += (rotate(g[3].x, 15U) ^ rotate(g[3].x, 13U) ^ (g[3].x >> 10U)) + g[1].w + (rotate(g[3].w, 25U) ^ rotate(g[3].w, 14U) ^ (g[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U));
  (*a).y += bitselect((*a).x, (*b).w, (*b).z);
  (*a).y += g[3].z + Gb[61];
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U));
  (*a).y += bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[3].w += (rotate(g[3].y, 15U) ^ rotate(g[3].y, 13U) ^ (g[3].y >> 10U)) + g[2].x + (rotate(g[0].x, 25U) ^ rotate(g[0].x, 14U) ^ (g[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U));
  (*a).x += bitselect((*b).w, (*b).z, (*b).y);
  (*a).x += g[3].w + Gb[62];
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U));
  (*a).x += bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;
  *a += (uint4)(Gbb[73], Gbb[77], Gbb[78], Gbb[79]);
  *b += (uint4)(Gbb[66], Gbb[67], Gbb[80], Gbb[81]);
}

__constant uint Gc[64] = {
    0x428a2f99, 0xf1374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf794, 0xf59b89c2, 0x73924787, 0x23c6886e, 0xa42ca65c, 0x15ed3627, 0x4d6edcbf, 0xe28217fc, 0xef02488f, 0xb707775c, 0x0468c23f, 0xe7e72b4c, 0x49e1f1a2, 0x4b99c816, 0x926d1570, 0xaa0fc072, 0xadb36e2c,
    0xad87a3ea, 0xbcb1d3a3, 0x7b993186, 0x562b9420, 0xbff3ca0c, 0xda4b0c23, 0x6cd8711a, 0x8f337caa, 0xc91b1417, 0xc359dce1, 0xa83253a7, 0x3b13c12d, 0x9d3d725d, 0xd9031a84, 0xb1a03340, 0x16f58012, 0xe64fb6a2, 0xe84d923a, 0xe93a5730, 0x09837686, 0x078ff753, 0x29833341, 0xd5de0b7e, 0x6948ccf4, 0xe0a1adbe, 0x7c728e11, 0x511c78e4, 0x315b45bd, 0xfca71413, 0xea28f96a, 0x79703128, 0x4e1ef848,
};

void C(uint4* restrict a, uint4* restrict b) {
  uint4 c = *a;
  uint4 d = *b;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[0];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[1];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[2];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[3];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[4];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[5];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[6];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[7];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[8];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[9];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[10];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[11];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[12];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[13];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[14];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[15];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[16];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[17];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[18];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[19];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[20];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[21];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[22];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[23];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[24];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[25];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[26];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[27];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[28];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[29];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[30];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[31];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[32];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[33];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[34];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[35];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[36];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[37];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[38];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[39];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[40];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[41];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[42];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[43];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[44];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[45];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[46];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[47];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[48];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[49];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[50];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[51];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[52];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[53];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[54];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[55];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U));
  d.w += bitselect(d.z, d.y, d.x);
  d.w += Gc[56];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U));
  d.w += bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U));
  d.z += bitselect(d.y, d.x, c.w);
  d.z += Gc[57];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U));
  d.z += bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U));
  d.y += bitselect(d.x, c.w, c.z);
  d.y += Gc[58];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U));
  d.y += bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U));
  d.x += bitselect(c.w, c.z, c.y);
  d.x += Gc[59];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U));
  d.x += bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U));
  c.w += bitselect(c.z, c.y, c.x);
  c.w += Gc[60];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U));
  c.w += bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U));
  c.z += bitselect(c.y, c.x, d.w);
  c.z += Gc[61];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U));
  c.z += bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U));
  c.y += bitselect(c.x, d.w, d.z);
  c.y += Gc[62];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U));
  c.y += bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U));
  c.x += bitselect(d.w, d.z, d.y);
  c.x += Gc[63];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U));
  c.x += bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  *a += c;
  *b += d;
}

void D(uint4 a[8]) {
  uint4 b[4];
  b[0] = (uint4)(a[1].x, a[2].y, a[3].z, a[0].w);
  b[1] = (uint4)(a[2].x, a[3].y, a[0].z, a[1].w);
  b[2] = (uint4)(a[3].x, a[0].y, a[1].z, a[2].w);
  b[3] = (uint4)(a[0].x, a[1].y, a[2].z, a[3].w);

  for (uint c = 0; c < 4; ++c)
    a[c] = (rotate(b[c] & Ga[0], 24U) | rotate(b[c] & Ga[1], 8U));

  b[0] = (uint4)(a[5].x, a[6].y, a[7].z, a[4].w);
  b[1] = (uint4)(a[6].x, a[7].y, a[4].z, a[5].w);
  b[2] = (uint4)(a[7].x, a[4].y, a[5].z, a[6].w);
  b[3] = (uint4)(a[4].x, a[5].y, a[6].z, a[7].w);

  for (uint c = 0; c < 4; ++c)
    a[c + 4] = (rotate(b[c] & Ga[0], 24U) | rotate(b[c] & Ga[1], 8U));
}

void E(uint4 a[8]) {
  uint4 b[4];
  b[0] = (uint4)(a[3].x, a[2].y, a[1].z, a[0].w);
  b[1] = (uint4)(a[0].x, a[3].y, a[2].z, a[1].w);
  b[2] = (uint4)(a[1].x, a[0].y, a[3].z, a[2].w);
  b[3] = (uint4)(a[2].x, a[1].y, a[0].z, a[3].w);

  for (uint c = 0; c < 4; ++c)
    a[c] = (rotate(b[c] & Ga[0], 24U) | rotate(b[c] & Ga[1], 8U));

  b[0] = (uint4)(a[7].x, a[6].y, a[5].z, a[4].w);
  b[1] = (uint4)(a[4].x, a[7].y, a[6].z, a[5].w);
  b[2] = (uint4)(a[5].x, a[4].y, a[7].z, a[6].w);
  b[3] = (uint4)(a[6].x, a[5].y, a[4].z, a[7].w);

  for (uint c = 0; c < 4; ++c)
    a[c + 4] = (rotate(b[c] & Ga[0], 24U) | rotate(b[c] & Ga[1], 8U));
}

void F(uint4 a[8]) {
  uint4 b[4];

  for (uint c = 0; c < 4; ++c)
    b[c] = (a[c] ^= a[c + 4]);

  for (uint c = 0; c < 4; ++c) {
    b[0] ^= rotate(b[3] + b[2], 7U);
    b[1] ^= rotate(b[0] + b[3], 9U);
    b[2] ^= rotate(b[1] + b[0], 13U);
    b[3] ^= rotate(b[2] + b[1], 18U);
    b[2] ^= rotate(b[3].wxyz + b[0].zwxy, 7U);
    b[1] ^= rotate(b[2].wxyz + b[3].zwxy, 9U);
    b[0] ^= rotate(b[1].wxyz + b[2].zwxy, 13U);
    b[3] ^= rotate(b[0].wxyz + b[1].zwxy, 18U);
  }

  for (uint c = 0; c < 4; ++c)
    b[c] = (a[c + 4] ^= (a[c] += b[c]));

  for (uint c = 0; c < 4; ++c) {
    b[0] ^= rotate(b[3] + b[2], 7U);
    b[1] ^= rotate(b[0] + b[3], 9U);
    b[2] ^= rotate(b[1] + b[0], 13U);
    b[3] ^= rotate(b[2] + b[1], 18U);
    b[2] ^= rotate(b[3].wxyz + b[0].zwxy, 7U);
    b[1] ^= rotate(b[2].wxyz + b[3].zwxy, 9U);
    b[0] ^= rotate(b[1].wxyz + b[2].zwxy, 13U);
    b[3] ^= rotate(b[0].wxyz + b[1].zwxy, 18U);
  }

  for (uint c = 0; c < 4; ++c)
    a[c + 4] += b[c];
}

void G(uint4 a[8], __global uint4* restrict b) {
  D(a);
  const uint c = 8;
  const uint d = (1024 / 16 + (1024 % 16 > 0));
  const uint e = 128;
  uint f = get_global_id(0) % e;

  for (uint g = 0; g < 1024 / 16; ++g) {
    for (uint h = 0; h < c; ++h)
      b[h + f * (c) + g * (e) * (c)] = a[h];
    for (uint i = 0; i < 16; ++i)
      F(a);
  }

  {
    uint g = (1024 / 16);
    for (uint h = 0; h < c; ++h)
      b[h + f * (c) + g * (e) * (c)] = a[h];
    for (uint i = 0; i < 1024 % 16; ++i)
      F(a);
  }

  for (uint i = 0; i < 1024; ++i) {
    uint4 j[8];
    uint k = a[7].x & Gb[85];
    uint g = (k / 16);
    for (uint h = 0; h < c; ++h)
      j[h] = b[h + f * (c) + g * (e) * (c)];

    uint l = k % 16;
    for (uint h = 0; h < l; ++h)
      F(j);

    for (uint h = 0; h < c; ++h)
      a[h] ^= j[h];
    F(a);
  }
  E(a);
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void H(__global const uint4* restrict a, volatile __global uint* restrict b, __global uint4* restrict c, const uint4 d, const uint4 e, const uint f) {
  uint g = get_global_id(0);
  uint4 h[8];
  uint4 i, j, k, l, m, n;
 uint4 o = (uint4)(ax,ay,az,g
 uint4 p = d, q = e;

 A(&p,&q, o, (uint4)(Gbb[84],0,0,0), (uint4)(0,0,0,0), (uint4)(0,0,0, Gbb[86]));
 B(&k,&l, p^ Gb[82], q^ Gb[82], Gb[82], Gb[82]);
 B(&i,&j, p^ Gb[83], q^ Gb[83], Gb[83], Gb[83]);

 m = i;
 n = j;
 A(&i, &j, a[0],a[1],a[2],a[3]);

 for (uint r=0; r<4; r++)
 {
    p = i;
    q = j;
    h[r << 1] = k;
    h[(r << 1) + 1] = l;

    A(&p, &q, o, (uint4)(r + 1, Gbb[84], 0, 0), (uint4)(0, 0, 0, 0), (uint4)(0, 0, 0, Gbb[87]));
    A(h + (r << 1), h + (r << 1) + 1, p, q, (uint4)(Gbb[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, Gbb[88]));
 }
 G(h,c);
 A(&m,&n, h[0], h[1], h[2], h[3]);
 A(&m,&n, h[4], h[5], h[6], h[7]);
 C(&m,&n);
 A(&k,&l, m, n, (uint4)(Gbb[84], 0U, 0U, 0U), (uint4)(0U, 0U, 0U, Gbb[88]));

 bool s = ((rotate(l.w & Ga[0],24U)|rotate(l.w & Ga[1],8U)) <= f);
 if (s)
  b[b[(0xFF)]++] = g;
}