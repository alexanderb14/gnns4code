uint4 A(uint4 a) {
  return rotate(a & 0x00FF00FF, 24U) | rotate(a & 0xFF00FF00, 8U);
}
void B(uint4* restrict a, uint4* restrict b, const uint4 c, const uint4 d, const uint4 e, const uint4 f) {
  uint4 g = *a;
  uint4 h = *b;
  uint4 i[4];

  i[0].x = c.x;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0x428a2f98U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  i[0].y = c.y;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0x71374491U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  i[0].z = c.z;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0xb5c0fbcfU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  i[0].w = c.w;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0xe9b5dba5U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x = d.x;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x3956c25bU;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  i[1].y = d.y;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x59f111f1U;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  i[1].z = d.z;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x923f82a4U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  i[1].w = d.w;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0xab1c5ed5U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x = e.x;
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0xd807aa98U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;
  i[2].y = e.y;
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0x12835b01U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;
  i[2].z = e.z;
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0x243185beU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;
  i[2].w = e.w;
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0x550c7dc3U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x = f.x;
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0x72be5d74U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;
  i[3].y = f.y;
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0x80deb1feU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;
  i[3].z = f.z;
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0x9bdc06a7U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;
  i[3].w = f.w;
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0xc19bf174U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0xe49b69c1U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0xefbe4786U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0x0fc19dc6U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0x240ca1ccU;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x2de92c6fU;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x4a7484aaU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x5cb0a9dcU;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0x76f988daU;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0x983e5152U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0xa831c66dU;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0xb00327c8U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0xbf597fc7U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0xc6e00bf3U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0xd5a79147U;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0x06ca6351U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0x14292967U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0x27b70a85U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0x2e1b2138U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0x4d2c6dfcU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0x53380d13U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x650a7354U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x766a0abbU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x81c2c92eU;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0x92722c85U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0xa2bfe8a1U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0xa81a664bU;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0xc24b8b70U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0xc76c51a3U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0xd192e819U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0xd6990624U;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0xf40e3585U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0x106aa070U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[0].x += (rotate(i[3].z, 15U) ^ rotate(i[3].z, 13U) ^ (i[3].z >> 10U)) + i[2].y + (rotate(i[0].y, 25U) ^ rotate(i[0].y, 14U) ^ (i[0].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[0].x + 0x19a4c116U;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[0].y += (rotate(i[3].w, 15U) ^ rotate(i[3].w, 13U) ^ (i[3].w >> 10U)) + i[2].z + (rotate(i[0].z, 25U) ^ rotate(i[0].z, 14U) ^ (i[0].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[0].y + 0x1e376c08U;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[0].z += (rotate(i[0].x, 15U) ^ rotate(i[0].x, 13U) ^ (i[0].x >> 10U)) + i[2].w + (rotate(i[0].w, 25U) ^ rotate(i[0].w, 14U) ^ (i[0].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[0].z + 0x2748774cU;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[0].w += (rotate(i[0].y, 15U) ^ rotate(i[0].y, 13U) ^ (i[0].y >> 10U)) + i[3].x + (rotate(i[1].x, 25U) ^ rotate(i[1].x, 14U) ^ (i[1].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[0].w + 0x34b0bcb5U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[1].x += (rotate(i[0].z, 15U) ^ rotate(i[0].z, 13U) ^ (i[0].z >> 10U)) + i[3].y + (rotate(i[1].y, 25U) ^ rotate(i[1].y, 14U) ^ (i[1].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[1].x + 0x391c0cb3U;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[1].y += (rotate(i[0].w, 15U) ^ rotate(i[0].w, 13U) ^ (i[0].w >> 10U)) + i[3].z + (rotate(i[1].z, 25U) ^ rotate(i[1].z, 14U) ^ (i[1].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[1].y + 0x4ed8aa4aU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[1].z += (rotate(i[1].x, 15U) ^ rotate(i[1].x, 13U) ^ (i[1].x >> 10U)) + i[3].w + (rotate(i[1].w, 25U) ^ rotate(i[1].w, 14U) ^ (i[1].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[1].z + 0x5b9cca4fU;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[1].w += (rotate(i[1].y, 15U) ^ rotate(i[1].y, 13U) ^ (i[1].y >> 10U)) + i[0].x + (rotate(i[2].x, 25U) ^ rotate(i[2].x, 14U) ^ (i[2].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[1].w + 0x682e6ff3U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;

  i[2].x += (rotate(i[1].z, 15U) ^ rotate(i[1].z, 13U) ^ (i[1].z >> 10U)) + i[0].y + (rotate(i[2].y, 25U) ^ rotate(i[2].y, 14U) ^ (i[2].y >> 3U));
  h.w += (rotate(h.x, 26U) ^ rotate(h.x, 21U) ^ rotate(h.x, 7U)) + bitselect(h.z, h.y, h.x) + i[2].x + 0x748f82eeU;
  g.w += h.w;
  h.w += (rotate(g.x, 30U) ^ rotate(g.x, 19U) ^ rotate(g.x, 10U)) + bitselect(g.z, g.y, (g.x ^ g.z));
  ;

  i[2].y += (rotate(i[1].w, 15U) ^ rotate(i[1].w, 13U) ^ (i[1].w >> 10U)) + i[0].z + (rotate(i[2].z, 25U) ^ rotate(i[2].z, 14U) ^ (i[2].z >> 3U));
  h.z += (rotate(g.w, 26U) ^ rotate(g.w, 21U) ^ rotate(g.w, 7U)) + bitselect(h.y, h.x, g.w) + i[2].y + 0x78a5636fU;
  g.z += h.z;
  h.z += (rotate(h.w, 30U) ^ rotate(h.w, 19U) ^ rotate(h.w, 10U)) + bitselect(g.y, g.x, (h.w ^ g.y));
  ;

  i[2].z += (rotate(i[2].x, 15U) ^ rotate(i[2].x, 13U) ^ (i[2].x >> 10U)) + i[0].w + (rotate(i[2].w, 25U) ^ rotate(i[2].w, 14U) ^ (i[2].w >> 3U));
  h.y += (rotate(g.z, 26U) ^ rotate(g.z, 21U) ^ rotate(g.z, 7U)) + bitselect(h.x, g.w, g.z) + i[2].z + 0x84c87814U;
  g.y += h.y;
  h.y += (rotate(h.z, 30U) ^ rotate(h.z, 19U) ^ rotate(h.z, 10U)) + bitselect(g.x, h.w, (h.z ^ g.x));
  ;

  i[2].w += (rotate(i[2].y, 15U) ^ rotate(i[2].y, 13U) ^ (i[2].y >> 10U)) + i[1].x + (rotate(i[3].x, 25U) ^ rotate(i[3].x, 14U) ^ (i[3].x >> 3U));
  h.x += (rotate(g.y, 26U) ^ rotate(g.y, 21U) ^ rotate(g.y, 7U)) + bitselect(g.w, g.z, g.y) + i[2].w + 0x8cc70208U;
  g.x += h.x;
  h.x += (rotate(h.y, 30U) ^ rotate(h.y, 19U) ^ rotate(h.y, 10U)) + bitselect(h.w, h.z, (h.y ^ h.w));
  ;

  i[3].x += (rotate(i[2].z, 15U) ^ rotate(i[2].z, 13U) ^ (i[2].z >> 10U)) + i[1].y + (rotate(i[3].y, 25U) ^ rotate(i[3].y, 14U) ^ (i[3].y >> 3U));
  g.w += (rotate(g.x, 26U) ^ rotate(g.x, 21U) ^ rotate(g.x, 7U)) + bitselect(g.z, g.y, g.x) + i[3].x + 0x90befffaU;
  h.w += g.w;
  g.w += (rotate(h.x, 30U) ^ rotate(h.x, 19U) ^ rotate(h.x, 10U)) + bitselect(h.z, h.y, (h.x ^ h.z));
  ;

  i[3].y += (rotate(i[2].w, 15U) ^ rotate(i[2].w, 13U) ^ (i[2].w >> 10U)) + i[1].z + (rotate(i[3].z, 25U) ^ rotate(i[3].z, 14U) ^ (i[3].z >> 3U));
  g.z += (rotate(h.w, 26U) ^ rotate(h.w, 21U) ^ rotate(h.w, 7U)) + bitselect(g.y, g.x, h.w) + i[3].y + 0xa4506cebU;
  h.z += g.z;
  g.z += (rotate(g.w, 30U) ^ rotate(g.w, 19U) ^ rotate(g.w, 10U)) + bitselect(h.y, h.x, (g.w ^ h.y));
  ;

  i[3].z += (rotate(i[3].x, 15U) ^ rotate(i[3].x, 13U) ^ (i[3].x >> 10U)) + i[1].w + (rotate(i[3].w, 25U) ^ rotate(i[3].w, 14U) ^ (i[3].w >> 3U));
  g.y += (rotate(h.z, 26U) ^ rotate(h.z, 21U) ^ rotate(h.z, 7U)) + bitselect(g.x, h.w, h.z) + i[3].z + 0xbef9a3f7U;
  h.y += g.y;
  g.y += (rotate(g.z, 30U) ^ rotate(g.z, 19U) ^ rotate(g.z, 10U)) + bitselect(h.x, g.w, (g.z ^ h.x));
  ;

  i[3].w += (rotate(i[3].y, 15U) ^ rotate(i[3].y, 13U) ^ (i[3].y >> 10U)) + i[2].x + (rotate(i[0].x, 25U) ^ rotate(i[0].x, 14U) ^ (i[0].x >> 3U));
  g.x += (rotate(h.y, 26U) ^ rotate(h.y, 21U) ^ rotate(h.y, 7U)) + bitselect(h.w, h.z, h.y) + i[3].w + 0xc67178f2U;
  h.x += g.x;
  g.x += (rotate(g.y, 30U) ^ rotate(g.y, 19U) ^ rotate(g.y, 10U)) + bitselect(g.w, g.z, (g.y ^ g.w));
  ;
  *a += g;
  *b += h;
}

void C(uint4* restrict a, uint4* restrict b, const uint4 c, const uint4 d, const uint4 e, const uint4 f) {
  uint4 g[4];

  g[0].x = c.x;
  (*a).w = 0x98c7e2a2U + g[0].x;
  (*b).w = 0xfc08884dU + g[0].x;

  g[0].y = c.y;
  (*a).z = 0xcd2a11aeU + (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect(0x9b05688cU, 0x510e527fU, (*a).w) + g[0].y;
  (*b).z = 0xC3910C8EU + (*a).z + (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect(0x2a01a605U, 0xfb6feee7U, (*b).w);

  g[0].z = c.z;
  (*a).y = 0x0c2e12e0U + (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect(0x510e527fU, (*a).w, (*a).z) + g[0].z;
  (*b).y = 0x4498517BU + (*a).y + (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect(0x6a09e667U, (*b).w, ((*b).z ^ 0x6a09e667U));

  g[0].w = c.w;
  (*a).x = 0xa4ce148bU + (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[0].w;
  (*b).x = 0x95F61999U + (*a).x + (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));

  g[1].x = d.x;
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[1].x + 0x3956c25bU;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;
  g[1].y = d.y;
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[1].y + 0x59f111f1U;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;
  g[1].z = d.z;
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[1].z + 0x923f82a4U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;
  g[1].w = d.w;
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[1].w + 0xab1c5ed5U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x = e.x;
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[2].x + 0xd807aa98U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;
  g[2].y = e.y;
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[2].y + 0x12835b01U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;
  g[2].z = e.z;
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[2].z + 0x243185beU;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;
  g[2].w = e.w;
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[2].w + 0x550c7dc3U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x = f.x;
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[3].x + 0x72be5d74U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;
  g[3].y = f.y;
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[3].y + 0x80deb1feU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;
  g[3].z = f.z;
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[3].z + 0x9bdc06a7U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;
  g[3].w = f.w;
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[3].w + 0xc19bf174U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[0].x += (rotate(g[3].z, 15U) ^ rotate(g[3].z, 13U) ^ (g[3].z >> 10U)) + g[2].y + (rotate(g[0].y, 25U) ^ rotate(g[0].y, 14U) ^ (g[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[0].x + 0xe49b69c1U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[0].y += (rotate(g[3].w, 15U) ^ rotate(g[3].w, 13U) ^ (g[3].w >> 10U)) + g[2].z + (rotate(g[0].z, 25U) ^ rotate(g[0].z, 14U) ^ (g[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[0].y + 0xefbe4786U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[0].z += (rotate(g[0].x, 15U) ^ rotate(g[0].x, 13U) ^ (g[0].x >> 10U)) + g[2].w + (rotate(g[0].w, 25U) ^ rotate(g[0].w, 14U) ^ (g[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[0].z + 0x0fc19dc6U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[0].w += (rotate(g[0].y, 15U) ^ rotate(g[0].y, 13U) ^ (g[0].y >> 10U)) + g[3].x + (rotate(g[1].x, 25U) ^ rotate(g[1].x, 14U) ^ (g[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[0].w + 0x240ca1ccU;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[1].x += (rotate(g[0].z, 15U) ^ rotate(g[0].z, 13U) ^ (g[0].z >> 10U)) + g[3].y + (rotate(g[1].y, 25U) ^ rotate(g[1].y, 14U) ^ (g[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[1].x + 0x2de92c6fU;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[1].y += (rotate(g[0].w, 15U) ^ rotate(g[0].w, 13U) ^ (g[0].w >> 10U)) + g[3].z + (rotate(g[1].z, 25U) ^ rotate(g[1].z, 14U) ^ (g[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[1].y + 0x4a7484aaU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[1].z += (rotate(g[1].x, 15U) ^ rotate(g[1].x, 13U) ^ (g[1].x >> 10U)) + g[3].w + (rotate(g[1].w, 25U) ^ rotate(g[1].w, 14U) ^ (g[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[1].z + 0x5cb0a9dcU;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[1].w += (rotate(g[1].y, 15U) ^ rotate(g[1].y, 13U) ^ (g[1].y >> 10U)) + g[0].x + (rotate(g[2].x, 25U) ^ rotate(g[2].x, 14U) ^ (g[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[1].w + 0x76f988daU;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x += (rotate(g[1].z, 15U) ^ rotate(g[1].z, 13U) ^ (g[1].z >> 10U)) + g[0].y + (rotate(g[2].y, 25U) ^ rotate(g[2].y, 14U) ^ (g[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[2].x + 0x983e5152U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[2].y += (rotate(g[1].w, 15U) ^ rotate(g[1].w, 13U) ^ (g[1].w >> 10U)) + g[0].z + (rotate(g[2].z, 25U) ^ rotate(g[2].z, 14U) ^ (g[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[2].y + 0xa831c66dU;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[2].z += (rotate(g[2].x, 15U) ^ rotate(g[2].x, 13U) ^ (g[2].x >> 10U)) + g[0].w + (rotate(g[2].w, 25U) ^ rotate(g[2].w, 14U) ^ (g[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[2].z + 0xb00327c8U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[2].w += (rotate(g[2].y, 15U) ^ rotate(g[2].y, 13U) ^ (g[2].y >> 10U)) + g[1].x + (rotate(g[3].x, 25U) ^ rotate(g[3].x, 14U) ^ (g[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[2].w + 0xbf597fc7U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x += (rotate(g[2].z, 15U) ^ rotate(g[2].z, 13U) ^ (g[2].z >> 10U)) + g[1].y + (rotate(g[3].y, 25U) ^ rotate(g[3].y, 14U) ^ (g[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[3].x + 0xc6e00bf3U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[3].y += (rotate(g[2].w, 15U) ^ rotate(g[2].w, 13U) ^ (g[2].w >> 10U)) + g[1].z + (rotate(g[3].z, 25U) ^ rotate(g[3].z, 14U) ^ (g[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[3].y + 0xd5a79147U;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[3].z += (rotate(g[3].x, 15U) ^ rotate(g[3].x, 13U) ^ (g[3].x >> 10U)) + g[1].w + (rotate(g[3].w, 25U) ^ rotate(g[3].w, 14U) ^ (g[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[3].z + 0x06ca6351U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[3].w += (rotate(g[3].y, 15U) ^ rotate(g[3].y, 13U) ^ (g[3].y >> 10U)) + g[2].x + (rotate(g[0].x, 25U) ^ rotate(g[0].x, 14U) ^ (g[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[3].w + 0x14292967U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[0].x += (rotate(g[3].z, 15U) ^ rotate(g[3].z, 13U) ^ (g[3].z >> 10U)) + g[2].y + (rotate(g[0].y, 25U) ^ rotate(g[0].y, 14U) ^ (g[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[0].x + 0x27b70a85U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[0].y += (rotate(g[3].w, 15U) ^ rotate(g[3].w, 13U) ^ (g[3].w >> 10U)) + g[2].z + (rotate(g[0].z, 25U) ^ rotate(g[0].z, 14U) ^ (g[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[0].y + 0x2e1b2138U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[0].z += (rotate(g[0].x, 15U) ^ rotate(g[0].x, 13U) ^ (g[0].x >> 10U)) + g[2].w + (rotate(g[0].w, 25U) ^ rotate(g[0].w, 14U) ^ (g[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[0].z + 0x4d2c6dfcU;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[0].w += (rotate(g[0].y, 15U) ^ rotate(g[0].y, 13U) ^ (g[0].y >> 10U)) + g[3].x + (rotate(g[1].x, 25U) ^ rotate(g[1].x, 14U) ^ (g[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[0].w + 0x53380d13U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[1].x += (rotate(g[0].z, 15U) ^ rotate(g[0].z, 13U) ^ (g[0].z >> 10U)) + g[3].y + (rotate(g[1].y, 25U) ^ rotate(g[1].y, 14U) ^ (g[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[1].x + 0x650a7354U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[1].y += (rotate(g[0].w, 15U) ^ rotate(g[0].w, 13U) ^ (g[0].w >> 10U)) + g[3].z + (rotate(g[1].z, 25U) ^ rotate(g[1].z, 14U) ^ (g[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[1].y + 0x766a0abbU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[1].z += (rotate(g[1].x, 15U) ^ rotate(g[1].x, 13U) ^ (g[1].x >> 10U)) + g[3].w + (rotate(g[1].w, 25U) ^ rotate(g[1].w, 14U) ^ (g[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[1].z + 0x81c2c92eU;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[1].w += (rotate(g[1].y, 15U) ^ rotate(g[1].y, 13U) ^ (g[1].y >> 10U)) + g[0].x + (rotate(g[2].x, 25U) ^ rotate(g[2].x, 14U) ^ (g[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[1].w + 0x92722c85U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x += (rotate(g[1].z, 15U) ^ rotate(g[1].z, 13U) ^ (g[1].z >> 10U)) + g[0].y + (rotate(g[2].y, 25U) ^ rotate(g[2].y, 14U) ^ (g[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[2].x + 0xa2bfe8a1U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[2].y += (rotate(g[1].w, 15U) ^ rotate(g[1].w, 13U) ^ (g[1].w >> 10U)) + g[0].z + (rotate(g[2].z, 25U) ^ rotate(g[2].z, 14U) ^ (g[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[2].y + 0xa81a664bU;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[2].z += (rotate(g[2].x, 15U) ^ rotate(g[2].x, 13U) ^ (g[2].x >> 10U)) + g[0].w + (rotate(g[2].w, 25U) ^ rotate(g[2].w, 14U) ^ (g[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[2].z + 0xc24b8b70U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[2].w += (rotate(g[2].y, 15U) ^ rotate(g[2].y, 13U) ^ (g[2].y >> 10U)) + g[1].x + (rotate(g[3].x, 25U) ^ rotate(g[3].x, 14U) ^ (g[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[2].w + 0xc76c51a3U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x += (rotate(g[2].z, 15U) ^ rotate(g[2].z, 13U) ^ (g[2].z >> 10U)) + g[1].y + (rotate(g[3].y, 25U) ^ rotate(g[3].y, 14U) ^ (g[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[3].x + 0xd192e819U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[3].y += (rotate(g[2].w, 15U) ^ rotate(g[2].w, 13U) ^ (g[2].w >> 10U)) + g[1].z + (rotate(g[3].z, 25U) ^ rotate(g[3].z, 14U) ^ (g[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[3].y + 0xd6990624U;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[3].z += (rotate(g[3].x, 15U) ^ rotate(g[3].x, 13U) ^ (g[3].x >> 10U)) + g[1].w + (rotate(g[3].w, 25U) ^ rotate(g[3].w, 14U) ^ (g[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[3].z + 0xf40e3585U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[3].w += (rotate(g[3].y, 15U) ^ rotate(g[3].y, 13U) ^ (g[3].y >> 10U)) + g[2].x + (rotate(g[0].x, 25U) ^ rotate(g[0].x, 14U) ^ (g[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[3].w + 0x106aa070U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[0].x += (rotate(g[3].z, 15U) ^ rotate(g[3].z, 13U) ^ (g[3].z >> 10U)) + g[2].y + (rotate(g[0].y, 25U) ^ rotate(g[0].y, 14U) ^ (g[0].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[0].x + 0x19a4c116U;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[0].y += (rotate(g[3].w, 15U) ^ rotate(g[3].w, 13U) ^ (g[3].w >> 10U)) + g[2].z + (rotate(g[0].z, 25U) ^ rotate(g[0].z, 14U) ^ (g[0].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[0].y + 0x1e376c08U;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[0].z += (rotate(g[0].x, 15U) ^ rotate(g[0].x, 13U) ^ (g[0].x >> 10U)) + g[2].w + (rotate(g[0].w, 25U) ^ rotate(g[0].w, 14U) ^ (g[0].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[0].z + 0x2748774cU;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[0].w += (rotate(g[0].y, 15U) ^ rotate(g[0].y, 13U) ^ (g[0].y >> 10U)) + g[3].x + (rotate(g[1].x, 25U) ^ rotate(g[1].x, 14U) ^ (g[1].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[0].w + 0x34b0bcb5U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[1].x += (rotate(g[0].z, 15U) ^ rotate(g[0].z, 13U) ^ (g[0].z >> 10U)) + g[3].y + (rotate(g[1].y, 25U) ^ rotate(g[1].y, 14U) ^ (g[1].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[1].x + 0x391c0cb3U;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[1].y += (rotate(g[0].w, 15U) ^ rotate(g[0].w, 13U) ^ (g[0].w >> 10U)) + g[3].z + (rotate(g[1].z, 25U) ^ rotate(g[1].z, 14U) ^ (g[1].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[1].y + 0x4ed8aa4aU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[1].z += (rotate(g[1].x, 15U) ^ rotate(g[1].x, 13U) ^ (g[1].x >> 10U)) + g[3].w + (rotate(g[1].w, 25U) ^ rotate(g[1].w, 14U) ^ (g[1].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[1].z + 0x5b9cca4fU;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[1].w += (rotate(g[1].y, 15U) ^ rotate(g[1].y, 13U) ^ (g[1].y >> 10U)) + g[0].x + (rotate(g[2].x, 25U) ^ rotate(g[2].x, 14U) ^ (g[2].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[1].w + 0x682e6ff3U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;

  g[2].x += (rotate(g[1].z, 15U) ^ rotate(g[1].z, 13U) ^ (g[1].z >> 10U)) + g[0].y + (rotate(g[2].y, 25U) ^ rotate(g[2].y, 14U) ^ (g[2].y >> 3U));
  (*b).w += (rotate((*b).x, 26U) ^ rotate((*b).x, 21U) ^ rotate((*b).x, 7U)) + bitselect((*b).z, (*b).y, (*b).x) + g[2].x + 0x748f82eeU;
  (*a).w += (*b).w;
  (*b).w += (rotate((*a).x, 30U) ^ rotate((*a).x, 19U) ^ rotate((*a).x, 10U)) + bitselect((*a).z, (*a).y, ((*a).x ^ (*a).z));
  ;

  g[2].y += (rotate(g[1].w, 15U) ^ rotate(g[1].w, 13U) ^ (g[1].w >> 10U)) + g[0].z + (rotate(g[2].z, 25U) ^ rotate(g[2].z, 14U) ^ (g[2].z >> 3U));
  (*b).z += (rotate((*a).w, 26U) ^ rotate((*a).w, 21U) ^ rotate((*a).w, 7U)) + bitselect((*b).y, (*b).x, (*a).w) + g[2].y + 0x78a5636fU;
  (*a).z += (*b).z;
  (*b).z += (rotate((*b).w, 30U) ^ rotate((*b).w, 19U) ^ rotate((*b).w, 10U)) + bitselect((*a).y, (*a).x, ((*b).w ^ (*a).y));
  ;

  g[2].z += (rotate(g[2].x, 15U) ^ rotate(g[2].x, 13U) ^ (g[2].x >> 10U)) + g[0].w + (rotate(g[2].w, 25U) ^ rotate(g[2].w, 14U) ^ (g[2].w >> 3U));
  (*b).y += (rotate((*a).z, 26U) ^ rotate((*a).z, 21U) ^ rotate((*a).z, 7U)) + bitselect((*b).x, (*a).w, (*a).z) + g[2].z + 0x84c87814U;
  (*a).y += (*b).y;
  (*b).y += (rotate((*b).z, 30U) ^ rotate((*b).z, 19U) ^ rotate((*b).z, 10U)) + bitselect((*a).x, (*b).w, ((*b).z ^ (*a).x));
  ;

  g[2].w += (rotate(g[2].y, 15U) ^ rotate(g[2].y, 13U) ^ (g[2].y >> 10U)) + g[1].x + (rotate(g[3].x, 25U) ^ rotate(g[3].x, 14U) ^ (g[3].x >> 3U));
  (*b).x += (rotate((*a).y, 26U) ^ rotate((*a).y, 21U) ^ rotate((*a).y, 7U)) + bitselect((*a).w, (*a).z, (*a).y) + g[2].w + 0x8cc70208U;
  (*a).x += (*b).x;
  (*b).x += (rotate((*b).y, 30U) ^ rotate((*b).y, 19U) ^ rotate((*b).y, 10U)) + bitselect((*b).w, (*b).z, ((*b).y ^ (*b).w));
  ;

  g[3].x += (rotate(g[2].z, 15U) ^ rotate(g[2].z, 13U) ^ (g[2].z >> 10U)) + g[1].y + (rotate(g[3].y, 25U) ^ rotate(g[3].y, 14U) ^ (g[3].y >> 3U));
  (*a).w += (rotate((*a).x, 26U) ^ rotate((*a).x, 21U) ^ rotate((*a).x, 7U)) + bitselect((*a).z, (*a).y, (*a).x) + g[3].x + 0x90befffaU;
  (*b).w += (*a).w;
  (*a).w += (rotate((*b).x, 30U) ^ rotate((*b).x, 19U) ^ rotate((*b).x, 10U)) + bitselect((*b).z, (*b).y, ((*b).x ^ (*b).z));
  ;

  g[3].y += (rotate(g[2].w, 15U) ^ rotate(g[2].w, 13U) ^ (g[2].w >> 10U)) + g[1].z + (rotate(g[3].z, 25U) ^ rotate(g[3].z, 14U) ^ (g[3].z >> 3U));
  (*a).z += (rotate((*b).w, 26U) ^ rotate((*b).w, 21U) ^ rotate((*b).w, 7U)) + bitselect((*a).y, (*a).x, (*b).w) + g[3].y + 0xa4506cebU;
  (*b).z += (*a).z;
  (*a).z += (rotate((*a).w, 30U) ^ rotate((*a).w, 19U) ^ rotate((*a).w, 10U)) + bitselect((*b).y, (*b).x, ((*a).w ^ (*b).y));
  ;

  g[3].z += (rotate(g[3].x, 15U) ^ rotate(g[3].x, 13U) ^ (g[3].x >> 10U)) + g[1].w + (rotate(g[3].w, 25U) ^ rotate(g[3].w, 14U) ^ (g[3].w >> 3U));
  (*a).y += (rotate((*b).z, 26U) ^ rotate((*b).z, 21U) ^ rotate((*b).z, 7U)) + bitselect((*a).x, (*b).w, (*b).z) + g[3].z + 0xbef9a3f7U;
  (*b).y += (*a).y;
  (*a).y += (rotate((*a).z, 30U) ^ rotate((*a).z, 19U) ^ rotate((*a).z, 10U)) + bitselect((*b).x, (*a).w, ((*a).z ^ (*b).x));
  ;

  g[3].w += (rotate(g[3].y, 15U) ^ rotate(g[3].y, 13U) ^ (g[3].y >> 10U)) + g[2].x + (rotate(g[0].x, 25U) ^ rotate(g[0].x, 14U) ^ (g[0].x >> 3U));
  (*a).x += (rotate((*b).y, 26U) ^ rotate((*b).y, 21U) ^ rotate((*b).y, 7U)) + bitselect((*b).w, (*b).z, (*b).y) + g[3].w + 0xc67178f2U;
  (*b).x += (*a).x;
  (*a).x += (rotate((*a).y, 30U) ^ rotate((*a).y, 19U) ^ rotate((*a).y, 10U)) + bitselect((*a).w, (*a).z, ((*a).y ^ (*a).w));
  ;
  *a += (uint4)(0x6A09E667U, 0xBB67AE85U, 0x3C6EF372U, 0xA54FF53AU);
  *b += (uint4)(0x510E527FU, 0x9B05688CU, 0x1F83D9ABU, 0x5BE0CD19U);
}

__constant uint Ga[64] = {
    0x428a2f99, 0xf1374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf794, 0xf59b89c2, 0x73924787, 0x23c6886e, 0xa42ca65c, 0x15ed3627, 0x4d6edcbf, 0xe28217fc, 0xef02488f, 0xb707775c, 0x0468c23f, 0xe7e72b4c, 0x49e1f1a2, 0x4b99c816, 0x926d1570, 0xaa0fc072, 0xadb36e2c,
    0xad87a3ea, 0xbcb1d3a3, 0x7b993186, 0x562b9420, 0xbff3ca0c, 0xda4b0c23, 0x6cd8711a, 0x8f337caa, 0xc91b1417, 0xc359dce1, 0xa83253a7, 0x3b13c12d, 0x9d3d725d, 0xd9031a84, 0xb1a03340, 0x16f58012, 0xe64fb6a2, 0xe84d923a, 0xe93a5730, 0x09837686, 0x078ff753, 0x29833341, 0xd5de0b7e, 0x6948ccf4, 0xe0a1adbe, 0x7c728e11, 0x511c78e4, 0x315b45bd, 0xfca71413, 0xea28f96a, 0x79703128, 0x4e1ef848,
};

void D(uint4* restrict a, uint4* restrict b) {
  uint4 c = *a;
  uint4 d = *b;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[0];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[1];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[2];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[3];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[4];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[5];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[6];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[7];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[8];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[9];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[10];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[11];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[12];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[13];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[14];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[15];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[16];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[17];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[18];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[19];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[20];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[21];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[22];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[23];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[24];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[25];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[26];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[27];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[28];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[29];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[30];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[31];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[32];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[33];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[34];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[35];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[36];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[37];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[38];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[39];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[40];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[41];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[42];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[43];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[44];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[45];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[46];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[47];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[48];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[49];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[50];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[51];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[52];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[53];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[54];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[55];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  d.w += (rotate(d.x, 26U) ^ rotate(d.x, 21U) ^ rotate(d.x, 7U)) + bitselect(d.z, d.y, d.x) + Ga[56];
  c.w += d.w;
  d.w += (rotate(c.x, 30U) ^ rotate(c.x, 19U) ^ rotate(c.x, 10U)) + bitselect(c.z, c.y, (c.x ^ c.z));
  ;
  d.z += (rotate(c.w, 26U) ^ rotate(c.w, 21U) ^ rotate(c.w, 7U)) + bitselect(d.y, d.x, c.w) + Ga[57];
  c.z += d.z;
  d.z += (rotate(d.w, 30U) ^ rotate(d.w, 19U) ^ rotate(d.w, 10U)) + bitselect(c.y, c.x, (d.w ^ c.y));
  ;
  d.y += (rotate(c.z, 26U) ^ rotate(c.z, 21U) ^ rotate(c.z, 7U)) + bitselect(d.x, c.w, c.z) + Ga[58];
  c.y += d.y;
  d.y += (rotate(d.z, 30U) ^ rotate(d.z, 19U) ^ rotate(d.z, 10U)) + bitselect(c.x, d.w, (d.z ^ c.x));
  ;
  d.x += (rotate(c.y, 26U) ^ rotate(c.y, 21U) ^ rotate(c.y, 7U)) + bitselect(c.w, c.z, c.y) + Ga[59];
  c.x += d.x;
  d.x += (rotate(d.y, 30U) ^ rotate(d.y, 19U) ^ rotate(d.y, 10U)) + bitselect(d.w, d.z, (d.y ^ d.w));
  ;
  c.w += (rotate(c.x, 26U) ^ rotate(c.x, 21U) ^ rotate(c.x, 7U)) + bitselect(c.z, c.y, c.x) + Ga[60];
  d.w += c.w;
  c.w += (rotate(d.x, 30U) ^ rotate(d.x, 19U) ^ rotate(d.x, 10U)) + bitselect(d.z, d.y, (d.x ^ d.z));
  ;
  c.z += (rotate(d.w, 26U) ^ rotate(d.w, 21U) ^ rotate(d.w, 7U)) + bitselect(c.y, c.x, d.w) + Ga[61];
  d.z += c.z;
  c.z += (rotate(c.w, 30U) ^ rotate(c.w, 19U) ^ rotate(c.w, 10U)) + bitselect(d.y, d.x, (c.w ^ d.y));
  ;
  c.y += (rotate(d.z, 26U) ^ rotate(d.z, 21U) ^ rotate(d.z, 7U)) + bitselect(c.x, d.w, d.z) + Ga[62];
  d.y += c.y;
  c.y += (rotate(c.z, 30U) ^ rotate(c.z, 19U) ^ rotate(c.z, 10U)) + bitselect(d.x, c.w, (c.z ^ d.x));
  ;
  c.x += (rotate(d.y, 26U) ^ rotate(d.y, 21U) ^ rotate(d.y, 7U)) + bitselect(d.w, d.z, d.y) + Ga[63];
  d.x += c.x;
  c.x += (rotate(c.y, 30U) ^ rotate(c.y, 19U) ^ rotate(c.y, 10U)) + bitselect(c.w, c.z, (c.y ^ c.w));
  ;
  *a += c;
  *b += d;
}

void E(uint4 a[8]) {
  uint4 b[4];
  b[0] = (uint4)(a[1].x, a[2].y, a[3].z, a[0].w);
  b[1] = (uint4)(a[2].x, a[3].y, a[0].z, a[1].w);
  b[2] = (uint4)(a[3].x, a[0].y, a[1].z, a[2].w);
  b[3] = (uint4)(a[0].x, a[1].y, a[2].z, a[3].w);

  for (uint c = 0; c < 4; ++c)
    a[c] = A(b[c]);

  b[0] = (uint4)(a[5].x, a[6].y, a[7].z, a[4].w);
  b[1] = (uint4)(a[6].x, a[7].y, a[4].z, a[5].w);
  b[2] = (uint4)(a[7].x, a[4].y, a[5].z, a[6].w);
  b[3] = (uint4)(a[4].x, a[5].y, a[6].z, a[7].w);

  for (uint c = 0; c < 4; ++c)
    a[c + 4] = A(b[c]);
}

void F(uint4 a[8]) {
  uint4 b[4];
  b[0] = (uint4)(a[3].x, a[2].y, a[1].z, a[0].w);
  b[1] = (uint4)(a[0].x, a[3].y, a[2].z, a[1].w);
  b[2] = (uint4)(a[1].x, a[0].y, a[3].z, a[2].w);
  b[3] = (uint4)(a[2].x, a[1].y, a[0].z, a[3].w);

  for (uint c = 0; c < 4; ++c)
    a[c] = A(b[c]);

  b[0] = (uint4)(a[7].x, a[6].y, a[5].z, a[4].w);
  b[1] = (uint4)(a[4].x, a[7].y, a[6].z, a[5].w);
  b[2] = (uint4)(a[5].x, a[4].y, a[7].z, a[6].w);
  b[3] = (uint4)(a[6].x, a[5].y, a[4].z, a[7].w);

  for (uint c = 0; c < 4; ++c)
    a[c + 4] = A(b[c]);
}

void G(uint4 a[8]) {
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

void H(uint4 a[8], __global uint4* restrict b) {
  E(a);
  const uint c = 8;
  const uint d = (1024 / 16 + (1024 % 16 > 0));
  const uint e = 128;
  uint f = get_global_id(0) % e;

  for (uint g = 0; g < 1024 / 16; ++g) {
    for (uint h = 0; h < c; ++h)
      b[h + f * (c) + g * (e) * (c)] = a[h];
    for (uint i = 0; i < 16; ++i)
      G(a);
  }

  {
    uint g = (1024 / 16);
    for (uint h = 0; h < c; ++h)
      b[h + f * (c) + g * (e) * (c)] = a[h];
    for (uint i = 0; i < 1024 % 16; ++i)
      G(a);
  }

  for (uint i = 0; i < 1024; ++i) {
    uint4 j[8];
    uint k = a[7].x & 0x3FF;
    uint g = (k / 16);
    for (uint h = 0; h < c; ++h)
      j[h] = b[h + f * (c) + g * (e) * (c)];

    uint l = k % 16;
    for (uint h = 0; h < l; ++h)
      G(j);

    for (uint h = 0; h < c; ++h)
      a[h] ^= j[h];
    G(a);
  }
  F(a);
}

__attribute__((reqd_work_group_size(128, 1, 1))) __kernel void I(__global uint4* restrict a, __global uint* restrict b, __global uint4* restrict c, uint4 d, uint4 e) {
  uint4 f[8];
  uint4 g, h, i, j, k, l;
  uint4 m = (uint4)(ax, ay, az, get_global_id(0));

  B(&d, &e, m, (uint4)(0x80000000U, 0, 0, 0), (uint4)(0, 0, 0, 0), (uint4)(0, 0, 0, 0x280));
  C(&i, &j, d ^ 0x5C5C5C5CU, e ^ 0x5C5C5C5CU, 0x5C5C5C5CU, 0x5C5C5C5CU);
  C(&g, &h, d ^ 0x36363636U, e ^ 0x36363636U, 0x36363636U, 0x36363636U);

  k = g;
  l = h;
  B(&g, &h, a[0], a[1], a[2], a[3]);

  for (uint n = 0; n < 4; n++) {
    d = g;
    e = h;
    f[n * 2] = i;
    f[n * 2 + 1] = j;

    B(&d, &e, m, (uint4)(n + 1, 0x80000000U, 0, 0), (uint4)(0, 0, 0, 0), (uint4)(0, 0, 0, 0x4a0U));
    B(f + n * 2, f + n * 2 + 1, d, e, (uint4)(0x80000000U, 0U, 0U, 0U), (uint4)(0U, 0U, 0U, 0x300U));
  }
  H(f, c);
  B(&k, &l, f[0], f[1], f[2], f[3]);
  B(&k, &l, f[4], f[5], f[6], f[7]);
  D(&k, &l);
  B(&i, &j, k, l, (uint4)(0x80000000U, 0U, 0U, 0U), (uint4)(0U, 0U, 0U, 0x300U));

  if ((j.w & 0xFFFF) == 0)
    b[get_global_id(0) & 255] = get_global_id(0);
}