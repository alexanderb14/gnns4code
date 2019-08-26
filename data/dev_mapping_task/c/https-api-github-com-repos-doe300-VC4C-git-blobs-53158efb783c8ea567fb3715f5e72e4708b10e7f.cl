typedef uint u; __constant uint Ga[87] = {0x428a2f98,  0x71374491,  0xb5c0fbcf,  0xe9b5dba5,  0x3956c25b,  0x59f111f1,  0x923f82a4,  0xab1c5ed5,  0xd807aa98,  0x12835b01,  0x243185be,  0x550c7dc3,  0x72be5d74,  0x80deb1fe,  0x9bdc06a7,  0xc19bf174,  0xe49b69c1,  0xefbe4786,  0x0fc19dc6,  0x240ca1cc,  0x2de92c6f,  0x4a7484aa,  0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
                          0x27b70a85,  0x2e1b2138,  0x4d2c6dfc,  0x53380d13,  0x650a7354,  0x766a0abb,  0x81c2c92e,  0x92722c85,  0xa2bfe8a1,  0xa81a664b,  0xc24b8b70,  0xc76c51a3,  0xd192e819,  0xd6990624,  0xf40e3585,  0x106aa070,  0x19a4c116,  0x1e376c08,  0x2748774c,  0x34b0bcb5,  0x391c0cb3,  0x4ed8aa4a,  0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2,

                          0xc19bf3f4U, 0x80000000U, 0x00000280U, 0x00a00055U, 0xf377ed68U, 0xa54ff53aU, 0x08909ae5U, 0x90bb1e3cU, 0x9b05688cU, 0xca0b3af3U, 0x3c6ef372U, 0xbb67ae85U, 0x6a09e667U, 0x50c6645bU, 0x510e527fU, 0x3ac42e24U, 0x5807aa98U, 0xc19bf274U, 0x00a00000U, 0x00000100U, 0x11002000U, 0x00400022U, 0x136032edU};
__kernel __attribute__((vec_type_hint(u))) __attribute__((reqd_work_group_size(128, 1, 1))) void A(const uint a, const uint b, const uint c, const uint d, const uint e, const uint f, const uint g, const uint h, const uint i, const uint j, const uint k, const uint l, const uint m,

                                                                                                   const u n,

                                                                                                   const uint o, const uint p, const uint q, const uint r, const uint s, const uint t, const uint u, const uint v, const uint w, const uint x, const uint y, const uint z, const uint aa, volatile __global uint* ab) {
  u ac[24];
  u* ad = &ac[8];

  const u ae = n + (uint)(get_global_id(0));

  ac[5] = aa;
  ac[5] += ae;

  ac[0] = (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)j, (u)i, (u)ac[5]);
  ac[0] += u;

  ac[2] = ac[0];
  ac[2] += m;

  ac[1] = z;
  ac[1] += ae;
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));

  ac[6] = v;
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)i, (u)ac[5], (u)ac[2]);

  ac[3] = ac[6];
  ac[3] += l;
  ac[0] += bitselect((u)l, (u)ac[1], (u)k ^ (u)l);
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)k, (u)ac[0], (u)ac[1] ^ (u)k);

  ac[7] = w;
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);

  ac[4] = ac[7];
  ac[4] += k;

  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[7];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[8];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[9];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[10];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[11];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[12];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[13];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[14];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[64];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += x;
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += y;
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[2] = (rotate((u)ae, (u)(32 - 7)) ^ rotate((u)ae, (u)(32 - 18)) ^ (ae >> 3U));
  ad[2] += q;
  ac[4] += ad[2];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[18];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[3] = ae;
  ad[3] += r;
  ac[1] += ad[3];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[19];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[4] = (rotate((u)ad[2], (u)(32 - 17)) ^ rotate((u)ad[2], (u)(32 - 19)) ^ (ad[2] >> 10U));
  ad[4] += Ga[65];
  ac[0] += ad[4];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[20];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[5] = (rotate((u)ad[3], (u)(32 - 17)) ^ rotate((u)ad[3], (u)(32 - 19)) ^ (ad[3] >> 10U));
  ac[6] += ad[5];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[21];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[6] = (rotate((u)ad[4], (u)(32 - 17)) ^ rotate((u)ad[4], (u)(32 - 19)) ^ (ad[4] >> 10U));
  ad[6] += Ga[66];
  ac[7] += ad[6];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[22];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[7] = (rotate((u)ad[5], (u)(32 - 17)) ^ rotate((u)ad[5], (u)(32 - 19)) ^ (ad[5] >> 10U));
  ad[7] += o;
  ac[5] += ad[7];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[23];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[8] = (rotate((u)ad[6], (u)(32 - 17)) ^ rotate((u)ad[6], (u)(32 - 19)) ^ (ad[6] >> 10U));
  ad[8] += p;
  ac[2] += ad[8];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[24];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[9] = ad[2];
  ad[9] += (rotate((u)ad[7], (u)(32 - 17)) ^ rotate((u)ad[7], (u)(32 - 19)) ^ (ad[7] >> 10U));
  ac[3] += ad[9];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[25];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[10] = ad[3];
  ad[10] += (rotate((u)ad[8], (u)(32 - 17)) ^ rotate((u)ad[8], (u)(32 - 19)) ^ (ad[8] >> 10U));
  ac[4] += ad[10];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[26];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[11] = ad[4];
  ad[11] += (rotate((u)ad[9], (u)(32 - 17)) ^ rotate((u)ad[9], (u)(32 - 19)) ^ (ad[9] >> 10U));
  ac[1] += ad[11];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[27];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[12] = ad[5];
  ad[12] += (rotate((u)ad[10], (u)(32 - 17)) ^ rotate((u)ad[10], (u)(32 - 19)) ^ (ad[10] >> 10U));
  ac[0] += ad[12];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[28];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[13] = ad[6];
  ad[13] += (rotate((u)ad[11], (u)(32 - 17)) ^ rotate((u)ad[11], (u)(32 - 19)) ^ (ad[11] >> 10U));
  ac[6] += ad[13];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[29];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[14] = Ga[67];
  ad[14] += ad[7];
  ad[14] += (rotate((u)ad[12], (u)(32 - 17)) ^ rotate((u)ad[12], (u)(32 - 19)) ^ (ad[12] >> 10U));
  ac[7] += ad[14];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[30];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[15] = s;
  ad[15] += ad[8];
  ad[15] += (rotate((u)ad[13], (u)(32 - 17)) ^ rotate((u)ad[13], (u)(32 - 19)) ^ (ad[13] >> 10U));
  ac[5] += ad[15];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[31];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[0] = t;
  ad[0] += ad[9];
  ad[0] += (rotate((u)ad[14], (u)(32 - 17)) ^ rotate((u)ad[14], (u)(32 - 19)) ^ (ad[14] >> 10U));
  ac[2] += ad[0];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[32];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[1] = p;
  ad[1] += (rotate((u)ad[2], (u)(32 - 7)) ^ rotate((u)ad[2], (u)(32 - 18)) ^ (ad[2] >> 3U));
  ad[1] += ad[10];
  ad[1] += (rotate((u)ad[15], (u)(32 - 17)) ^ rotate((u)ad[15], (u)(32 - 19)) ^ (ad[15] >> 10U));
  ac[3] += ad[1];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[33];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[2] += (rotate((u)ad[3], (u)(32 - 7)) ^ rotate((u)ad[3], (u)(32 - 18)) ^ (ad[3] >> 3U));
  ad[2] += ad[11];
  ad[2] += (rotate((u)ad[0], (u)(32 - 17)) ^ rotate((u)ad[0], (u)(32 - 19)) ^ (ad[0] >> 10U));
  ac[4] += ad[2];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[34];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[3] += (rotate((u)ad[4], (u)(32 - 7)) ^ rotate((u)ad[4], (u)(32 - 18)) ^ (ad[4] >> 3U));
  ad[3] += ad[12];
  ad[3] += (rotate((u)ad[1], (u)(32 - 17)) ^ rotate((u)ad[1], (u)(32 - 19)) ^ (ad[1] >> 10U));
  ac[1] += ad[3];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[35];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[4] += (rotate((u)ad[5], (u)(32 - 7)) ^ rotate((u)ad[5], (u)(32 - 18)) ^ (ad[5] >> 3U));
  ad[4] += ad[13];
  ad[4] += (rotate((u)ad[2], (u)(32 - 17)) ^ rotate((u)ad[2], (u)(32 - 19)) ^ (ad[2] >> 10U));
  ac[0] += ad[4];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[36];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[5] += (rotate((u)ad[6], (u)(32 - 7)) ^ rotate((u)ad[6], (u)(32 - 18)) ^ (ad[6] >> 3U));
  ad[5] += ad[14];
  ad[5] += (rotate((u)ad[3], (u)(32 - 17)) ^ rotate((u)ad[3], (u)(32 - 19)) ^ (ad[3] >> 10U));
  ac[6] += ad[5];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[37];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[6] += (rotate((u)ad[7], (u)(32 - 7)) ^ rotate((u)ad[7], (u)(32 - 18)) ^ (ad[7] >> 3U));
  ad[6] += ad[15];
  ad[6] += (rotate((u)ad[4], (u)(32 - 17)) ^ rotate((u)ad[4], (u)(32 - 19)) ^ (ad[4] >> 10U));
  ac[7] += ad[6];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[38];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[7] += (rotate((u)ad[8], (u)(32 - 7)) ^ rotate((u)ad[8], (u)(32 - 18)) ^ (ad[8] >> 3U));
  ad[7] += ad[0];
  ad[7] += (rotate((u)ad[5], (u)(32 - 17)) ^ rotate((u)ad[5], (u)(32 - 19)) ^ (ad[5] >> 10U));
  ac[5] += ad[7];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[39];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[8] += (rotate((u)ad[9], (u)(32 - 7)) ^ rotate((u)ad[9], (u)(32 - 18)) ^ (ad[9] >> 3U));
  ad[8] += ad[1];
  ad[8] += (rotate((u)ad[6], (u)(32 - 17)) ^ rotate((u)ad[6], (u)(32 - 19)) ^ (ad[6] >> 10U));
  ac[2] += ad[8];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[40];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[9] += (rotate((u)ad[10], (u)(32 - 7)) ^ rotate((u)ad[10], (u)(32 - 18)) ^ (ad[10] >> 3U));
  ad[9] += ad[2];
  ad[9] += (rotate((u)ad[7], (u)(32 - 17)) ^ rotate((u)ad[7], (u)(32 - 19)) ^ (ad[7] >> 10U));
  ac[3] += ad[9];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[41];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[10] += (rotate((u)ad[11], (u)(32 - 7)) ^ rotate((u)ad[11], (u)(32 - 18)) ^ (ad[11] >> 3U));
  ad[10] += ad[3];
  ad[10] += (rotate((u)ad[8], (u)(32 - 17)) ^ rotate((u)ad[8], (u)(32 - 19)) ^ (ad[8] >> 10U));
  ac[4] += ad[10];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[42];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[11] += (rotate((u)ad[12], (u)(32 - 7)) ^ rotate((u)ad[12], (u)(32 - 18)) ^ (ad[12] >> 3U));
  ad[11] += ad[4];
  ad[11] += (rotate((u)ad[9], (u)(32 - 17)) ^ rotate((u)ad[9], (u)(32 - 19)) ^ (ad[9] >> 10U));
  ac[1] += ad[11];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[43];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[12] += (rotate((u)ad[13], (u)(32 - 7)) ^ rotate((u)ad[13], (u)(32 - 18)) ^ (ad[13] >> 3U));
  ad[12] += ad[5];
  ad[12] += (rotate((u)ad[10], (u)(32 - 17)) ^ rotate((u)ad[10], (u)(32 - 19)) ^ (ad[10] >> 10U));
  ac[0] += ad[12];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[44];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[13] += (rotate((u)ad[14], (u)(32 - 7)) ^ rotate((u)ad[14], (u)(32 - 18)) ^ (ad[14] >> 3U));
  ad[13] += ad[6];
  ad[13] += (rotate((u)ad[11], (u)(32 - 17)) ^ rotate((u)ad[11], (u)(32 - 19)) ^ (ad[11] >> 10U));
  ac[6] += ad[13];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[45];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[14] += (rotate((u)ad[15], (u)(32 - 7)) ^ rotate((u)ad[15], (u)(32 - 18)) ^ (ad[15] >> 3U));
  ad[14] += ad[7];
  ad[14] += (rotate((u)ad[12], (u)(32 - 17)) ^ rotate((u)ad[12], (u)(32 - 19)) ^ (ad[12] >> 10U));
  ac[7] += ad[14];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[46];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[15] += (rotate((u)ad[0], (u)(32 - 7)) ^ rotate((u)ad[0], (u)(32 - 18)) ^ (ad[0] >> 3U));
  ad[15] += ad[8];
  ad[15] += (rotate((u)ad[13], (u)(32 - 17)) ^ rotate((u)ad[13], (u)(32 - 19)) ^ (ad[13] >> 10U));
  ac[5] += ad[15];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[47];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[0] += (rotate((u)ad[1], (u)(32 - 7)) ^ rotate((u)ad[1], (u)(32 - 18)) ^ (ad[1] >> 3U));
  ad[0] += ad[9];
  ad[0] += (rotate((u)ad[14], (u)(32 - 17)) ^ rotate((u)ad[14], (u)(32 - 19)) ^ (ad[14] >> 10U));
  ac[2] += ad[0];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[48];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[1] += (rotate((u)ad[2], (u)(32 - 7)) ^ rotate((u)ad[2], (u)(32 - 18)) ^ (ad[2] >> 3U));
  ad[1] += ad[10];
  ad[1] += (rotate((u)ad[15], (u)(32 - 17)) ^ rotate((u)ad[15], (u)(32 - 19)) ^ (ad[15] >> 10U));
  ac[3] += ad[1];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[49];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[2] += (rotate((u)ad[3], (u)(32 - 7)) ^ rotate((u)ad[3], (u)(32 - 18)) ^ (ad[3] >> 3U));
  ad[2] += ad[11];
  ad[2] += (rotate((u)ad[0], (u)(32 - 17)) ^ rotate((u)ad[0], (u)(32 - 19)) ^ (ad[0] >> 10U));
  ac[4] += ad[2];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[50];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[3] += (rotate((u)ad[4], (u)(32 - 7)) ^ rotate((u)ad[4], (u)(32 - 18)) ^ (ad[4] >> 3U));
  ad[3] += ad[12];
  ad[3] += (rotate((u)ad[1], (u)(32 - 17)) ^ rotate((u)ad[1], (u)(32 - 19)) ^ (ad[1] >> 10U));
  ac[1] += ad[3];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[51];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[4] += (rotate((u)ad[5], (u)(32 - 7)) ^ rotate((u)ad[5], (u)(32 - 18)) ^ (ad[5] >> 3U));
  ad[4] += ad[13];
  ad[4] += (rotate((u)ad[2], (u)(32 - 17)) ^ rotate((u)ad[2], (u)(32 - 19)) ^ (ad[2] >> 10U));
  ac[0] += ad[4];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[52];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[5] += (rotate((u)ad[6], (u)(32 - 7)) ^ rotate((u)ad[6], (u)(32 - 18)) ^ (ad[6] >> 3U));
  ad[5] += ad[14];
  ad[5] += (rotate((u)ad[3], (u)(32 - 17)) ^ rotate((u)ad[3], (u)(32 - 19)) ^ (ad[3] >> 10U));
  ac[6] += ad[5];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[53];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[6] += (rotate((u)ad[7], (u)(32 - 7)) ^ rotate((u)ad[7], (u)(32 - 18)) ^ (ad[7] >> 3U));
  ad[6] += ad[15];
  ad[6] += (rotate((u)ad[4], (u)(32 - 17)) ^ rotate((u)ad[4], (u)(32 - 19)) ^ (ad[4] >> 10U));
  ac[7] += ad[6];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[54];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[7] += (rotate((u)ad[8], (u)(32 - 7)) ^ rotate((u)ad[8], (u)(32 - 18)) ^ (ad[8] >> 3U));
  ad[7] += ad[0];
  ad[7] += (rotate((u)ad[5], (u)(32 - 17)) ^ rotate((u)ad[5], (u)(32 - 19)) ^ (ad[5] >> 10U));
  ac[5] += ad[7];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[55];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[8] += (rotate((u)ad[9], (u)(32 - 7)) ^ rotate((u)ad[9], (u)(32 - 18)) ^ (ad[9] >> 3U));
  ad[8] += ad[1];
  ad[8] += (rotate((u)ad[6], (u)(32 - 17)) ^ rotate((u)ad[6], (u)(32 - 19)) ^ (ad[6] >> 10U));
  ac[2] += ad[8];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[56];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[9] += (rotate((u)ad[10], (u)(32 - 7)) ^ rotate((u)ad[10], (u)(32 - 18)) ^ (ad[10] >> 3U));
  ad[9] += ad[2];
  ad[9] += (rotate((u)ad[7], (u)(32 - 17)) ^ rotate((u)ad[7], (u)(32 - 19)) ^ (ad[7] >> 10U));
  ac[3] += ad[9];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[57];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[10] += (rotate((u)ad[11], (u)(32 - 7)) ^ rotate((u)ad[11], (u)(32 - 18)) ^ (ad[11] >> 3U));
  ad[10] += ad[3];
  ad[10] += (rotate((u)ad[8], (u)(32 - 17)) ^ rotate((u)ad[8], (u)(32 - 19)) ^ (ad[8] >> 10U));
  ac[4] += ad[10];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[58];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[11] += (rotate((u)ad[12], (u)(32 - 7)) ^ rotate((u)ad[12], (u)(32 - 18)) ^ (ad[12] >> 3U));
  ad[11] += ad[4];
  ad[11] += (rotate((u)ad[9], (u)(32 - 17)) ^ rotate((u)ad[9], (u)(32 - 19)) ^ (ad[9] >> 10U));
  ac[1] += ad[11];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[59];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[12] += (rotate((u)ad[13], (u)(32 - 7)) ^ rotate((u)ad[13], (u)(32 - 18)) ^ (ad[13] >> 3U));
  ad[12] += ad[5];
  ad[12] += (rotate((u)ad[10], (u)(32 - 17)) ^ rotate((u)ad[10], (u)(32 - 19)) ^ (ad[10] >> 10U));
  ac[0] += ad[12];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[60];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[13] += (rotate((u)ad[14], (u)(32 - 7)) ^ rotate((u)ad[14], (u)(32 - 18)) ^ (ad[14] >> 3U));
  ad[13] += ad[6];
  ad[13] += (rotate((u)ad[11], (u)(32 - 17)) ^ rotate((u)ad[11], (u)(32 - 19)) ^ (ad[11] >> 10U));
  ac[6] += ad[13];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[61];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ac[7] += ad[14];
  ac[7] += (rotate((u)ad[15], (u)(32 - 7)) ^ rotate((u)ad[15], (u)(32 - 18)) ^ (ad[15] >> 3U));
  ac[7] += ad[7];
  ac[7] += (rotate((u)ad[12], (u)(32 - 17)) ^ rotate((u)ad[12], (u)(32 - 19)) ^ (ad[12] >> 10U));
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[62];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ac[5] += ad[15];
  ac[5] += (rotate((u)ad[0], (u)(32 - 7)) ^ rotate((u)ad[0], (u)(32 - 18)) ^ (ad[0] >> 3U));
  ac[5] += ad[8];
  ac[5] += (rotate((u)ad[13], (u)(32 - 17)) ^ rotate((u)ad[13], (u)(32 - 19)) ^ (ad[13] >> 10U));
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[63];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ac[5] += a;

  ad[7] = h;
  ad[7] += ac[2];

  ac[2] = Ga[68];
  ac[2] += ac[5];
  ad[0] = ac[5];
  ac[5] = Ga[76];

  ad[3] = d;
  ad[3] += ac[0];

  ac[0] = Ga[69];
  ac[0] += ac[2];
  ac[2] += Ga[70];

  ad[6] = g;
  ad[6] += ac[3];

  ac[3] = Ga[71];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += (Ga[72] ^ (ac[0] & Ga[73]));

  ac[7] += b;
  ac[3] += ac[7];
  ad[1] = ac[7];
  ac[7] = Ga[75];

  ad[2] = c;
  ad[2] += ac[6];

  ac[6] = Ga[74];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[5] = f;
  ad[5] += ac[4];

  ac[4] = Ga[77];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)Ga[78], (u)ac[0], (u)ac[6]);
  ac[4] += ad[2];

  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[4] = e;
  ad[4] += ac[1];

  ac[1] = Ga[79];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += ad[3];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[4];
  ac[0] += ad[4];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[5];
  ac[6] += ad[5];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[6];
  ac[7] += ad[6];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[7];
  ac[5] += ad[7];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[80];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[9];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[10];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[11];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[12];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[13];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[14];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[81];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[0] += (rotate((u)ad[1], (u)(32 - 7)) ^ rotate((u)ad[1], (u)(32 - 18)) ^ (ad[1] >> 3U));
  ac[2] += ad[0];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[16];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[1] += (rotate((u)ad[2], (u)(32 - 7)) ^ rotate((u)ad[2], (u)(32 - 18)) ^ (ad[2] >> 3U));
  ad[1] += Ga[82];
  ac[3] += ad[1];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[17];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[2] += (rotate((u)ad[3], (u)(32 - 7)) ^ rotate((u)ad[3], (u)(32 - 18)) ^ (ad[3] >> 3U));
  ad[2] += (rotate((u)ad[0], (u)(32 - 17)) ^ rotate((u)ad[0], (u)(32 - 19)) ^ (ad[0] >> 10U));
  ac[4] += ad[2];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[18];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[3] += (rotate((u)ad[4], (u)(32 - 7)) ^ rotate((u)ad[4], (u)(32 - 18)) ^ (ad[4] >> 3U));
  ad[3] += (rotate((u)ad[1], (u)(32 - 17)) ^ rotate((u)ad[1], (u)(32 - 19)) ^ (ad[1] >> 10U));
  ac[1] += ad[3];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[19];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[4] += (rotate((u)ad[5], (u)(32 - 7)) ^ rotate((u)ad[5], (u)(32 - 18)) ^ (ad[5] >> 3U));
  ad[4] += (rotate((u)ad[2], (u)(32 - 17)) ^ rotate((u)ad[2], (u)(32 - 19)) ^ (ad[2] >> 10U));
  ac[0] += ad[4];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[20];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[5] += (rotate((u)ad[6], (u)(32 - 7)) ^ rotate((u)ad[6], (u)(32 - 18)) ^ (ad[6] >> 3U));
  ad[5] += (rotate((u)ad[3], (u)(32 - 17)) ^ rotate((u)ad[3], (u)(32 - 19)) ^ (ad[3] >> 10U));
  ac[6] += ad[5];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[21];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[6] += (rotate((u)ad[7], (u)(32 - 7)) ^ rotate((u)ad[7], (u)(32 - 18)) ^ (ad[7] >> 3U));
  ad[6] += Ga[83];
  ad[6] += (rotate((u)ad[4], (u)(32 - 17)) ^ rotate((u)ad[4], (u)(32 - 19)) ^ (ad[4] >> 10U));
  ac[7] += ad[6];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[22];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[7] += Ga[84];
  ad[7] += ad[0];
  ad[7] += (rotate((u)ad[5], (u)(32 - 17)) ^ rotate((u)ad[5], (u)(32 - 19)) ^ (ad[5] >> 10U));
  ac[5] += ad[7];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[23];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[8] = Ga[65];
  ad[8] += ad[1];
  ad[8] += (rotate((u)ad[6], (u)(32 - 17)) ^ rotate((u)ad[6], (u)(32 - 19)) ^ (ad[6] >> 10U));
  ac[2] += ad[8];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[24];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[9] = ad[2];
  ad[9] += (rotate((u)ad[7], (u)(32 - 17)) ^ rotate((u)ad[7], (u)(32 - 19)) ^ (ad[7] >> 10U));
  ac[3] += ad[9];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[25];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[10] = ad[3];
  ad[10] += (rotate((u)ad[8], (u)(32 - 17)) ^ rotate((u)ad[8], (u)(32 - 19)) ^ (ad[8] >> 10U));
  ac[4] += ad[10];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[26];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[11] = ad[4];
  ad[11] += (rotate((u)ad[9], (u)(32 - 17)) ^ rotate((u)ad[9], (u)(32 - 19)) ^ (ad[9] >> 10U));
  ac[1] += ad[11];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[27];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[12] = ad[5];
  ad[12] += (rotate((u)ad[10], (u)(32 - 17)) ^ rotate((u)ad[10], (u)(32 - 19)) ^ (ad[10] >> 10U));
  ac[0] += ad[12];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[28];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[13] = ad[6];
  ad[13] += (rotate((u)ad[11], (u)(32 - 17)) ^ rotate((u)ad[11], (u)(32 - 19)) ^ (ad[11] >> 10U));
  ac[6] += ad[13];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[29];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[14] = Ga[85];
  ad[14] += ad[7];
  ad[14] += (rotate((u)ad[12], (u)(32 - 17)) ^ rotate((u)ad[12], (u)(32 - 19)) ^ (ad[12] >> 10U));
  ac[7] += ad[14];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[30];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[15] = Ga[83];
  ad[15] += (rotate((u)ad[0], (u)(32 - 7)) ^ rotate((u)ad[0], (u)(32 - 18)) ^ (ad[0] >> 3U));
  ad[15] += ad[8];
  ad[15] += (rotate((u)ad[13], (u)(32 - 17)) ^ rotate((u)ad[13], (u)(32 - 19)) ^ (ad[13] >> 10U));
  ac[5] += ad[15];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[31];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[0] += (rotate((u)ad[1], (u)(32 - 7)) ^ rotate((u)ad[1], (u)(32 - 18)) ^ (ad[1] >> 3U));
  ad[0] += ad[9];
  ad[0] += (rotate((u)ad[14], (u)(32 - 17)) ^ rotate((u)ad[14], (u)(32 - 19)) ^ (ad[14] >> 10U));
  ac[2] += ad[0];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[32];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[1] += (rotate((u)ad[2], (u)(32 - 7)) ^ rotate((u)ad[2], (u)(32 - 18)) ^ (ad[2] >> 3U));
  ad[1] += ad[10];
  ad[1] += (rotate((u)ad[15], (u)(32 - 17)) ^ rotate((u)ad[15], (u)(32 - 19)) ^ (ad[15] >> 10U));
  ac[3] += ad[1];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[33];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[2] += (rotate((u)ad[3], (u)(32 - 7)) ^ rotate((u)ad[3], (u)(32 - 18)) ^ (ad[3] >> 3U));
  ad[2] += ad[11];
  ad[2] += (rotate((u)ad[0], (u)(32 - 17)) ^ rotate((u)ad[0], (u)(32 - 19)) ^ (ad[0] >> 10U));
  ac[4] += ad[2];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[34];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[3] += (rotate((u)ad[4], (u)(32 - 7)) ^ rotate((u)ad[4], (u)(32 - 18)) ^ (ad[4] >> 3U));
  ad[3] += ad[12];
  ad[3] += (rotate((u)ad[1], (u)(32 - 17)) ^ rotate((u)ad[1], (u)(32 - 19)) ^ (ad[1] >> 10U));
  ac[1] += ad[3];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[35];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[4] += (rotate((u)ad[5], (u)(32 - 7)) ^ rotate((u)ad[5], (u)(32 - 18)) ^ (ad[5] >> 3U));
  ad[4] += ad[13];
  ad[4] += (rotate((u)ad[2], (u)(32 - 17)) ^ rotate((u)ad[2], (u)(32 - 19)) ^ (ad[2] >> 10U));
  ac[0] += ad[4];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[36];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[5] += (rotate((u)ad[6], (u)(32 - 7)) ^ rotate((u)ad[6], (u)(32 - 18)) ^ (ad[6] >> 3U));
  ad[5] += ad[14];
  ad[5] += (rotate((u)ad[3], (u)(32 - 17)) ^ rotate((u)ad[3], (u)(32 - 19)) ^ (ad[3] >> 10U));
  ac[6] += ad[5];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[37];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[6] += (rotate((u)ad[7], (u)(32 - 7)) ^ rotate((u)ad[7], (u)(32 - 18)) ^ (ad[7] >> 3U));
  ad[6] += ad[15];
  ad[6] += (rotate((u)ad[4], (u)(32 - 17)) ^ rotate((u)ad[4], (u)(32 - 19)) ^ (ad[4] >> 10U));
  ac[7] += ad[6];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[38];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[7] += (rotate((u)ad[8], (u)(32 - 7)) ^ rotate((u)ad[8], (u)(32 - 18)) ^ (ad[8] >> 3U));
  ad[7] += ad[0];
  ad[7] += (rotate((u)ad[5], (u)(32 - 17)) ^ rotate((u)ad[5], (u)(32 - 19)) ^ (ad[5] >> 10U));
  ac[5] += ad[7];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[39];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[8] += (rotate((u)ad[9], (u)(32 - 7)) ^ rotate((u)ad[9], (u)(32 - 18)) ^ (ad[9] >> 3U));
  ad[8] += ad[1];
  ad[8] += (rotate((u)ad[6], (u)(32 - 17)) ^ rotate((u)ad[6], (u)(32 - 19)) ^ (ad[6] >> 10U));
  ac[2] += ad[8];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[40];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[9] += (rotate((u)ad[10], (u)(32 - 7)) ^ rotate((u)ad[10], (u)(32 - 18)) ^ (ad[10] >> 3U));
  ad[9] += ad[2];
  ad[9] += (rotate((u)ad[7], (u)(32 - 17)) ^ rotate((u)ad[7], (u)(32 - 19)) ^ (ad[7] >> 10U));
  ac[3] += ad[9];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[41];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[10] += (rotate((u)ad[11], (u)(32 - 7)) ^ rotate((u)ad[11], (u)(32 - 18)) ^ (ad[11] >> 3U));
  ad[10] += ad[3];
  ad[10] += (rotate((u)ad[8], (u)(32 - 17)) ^ rotate((u)ad[8], (u)(32 - 19)) ^ (ad[8] >> 10U));
  ac[4] += ad[10];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[42];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[11] += (rotate((u)ad[12], (u)(32 - 7)) ^ rotate((u)ad[12], (u)(32 - 18)) ^ (ad[12] >> 3U));
  ad[11] += ad[4];
  ad[11] += (rotate((u)ad[9], (u)(32 - 17)) ^ rotate((u)ad[9], (u)(32 - 19)) ^ (ad[9] >> 10U));
  ac[1] += ad[11];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[43];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[12] += (rotate((u)ad[13], (u)(32 - 7)) ^ rotate((u)ad[13], (u)(32 - 18)) ^ (ad[13] >> 3U));
  ad[12] += ad[5];
  ad[12] += (rotate((u)ad[10], (u)(32 - 17)) ^ rotate((u)ad[10], (u)(32 - 19)) ^ (ad[10] >> 10U));
  ac[0] += ad[12];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[44];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[13] += (rotate((u)ad[14], (u)(32 - 7)) ^ rotate((u)ad[14], (u)(32 - 18)) ^ (ad[14] >> 3U));
  ad[13] += ad[6];
  ad[13] += (rotate((u)ad[11], (u)(32 - 17)) ^ rotate((u)ad[11], (u)(32 - 19)) ^ (ad[11] >> 10U));
  ac[6] += ad[13];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[45];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[14] += (rotate((u)ad[15], (u)(32 - 7)) ^ rotate((u)ad[15], (u)(32 - 18)) ^ (ad[15] >> 3U));
  ad[14] += ad[7];
  ad[14] += (rotate((u)ad[12], (u)(32 - 17)) ^ rotate((u)ad[12], (u)(32 - 19)) ^ (ad[12] >> 10U));
  ac[7] += ad[14];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[46];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[15] += (rotate((u)ad[0], (u)(32 - 7)) ^ rotate((u)ad[0], (u)(32 - 18)) ^ (ad[0] >> 3U));
  ad[15] += ad[8];
  ad[15] += (rotate((u)ad[13], (u)(32 - 17)) ^ rotate((u)ad[13], (u)(32 - 19)) ^ (ad[13] >> 10U));
  ac[5] += ad[15];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[47];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[0] += (rotate((u)ad[1], (u)(32 - 7)) ^ rotate((u)ad[1], (u)(32 - 18)) ^ (ad[1] >> 3U));
  ad[0] += ad[9];
  ad[0] += (rotate((u)ad[14], (u)(32 - 17)) ^ rotate((u)ad[14], (u)(32 - 19)) ^ (ad[14] >> 10U));
  ac[2] += ad[0];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[48];
  ac[0] += ac[2];
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);

  ad[1] += (rotate((u)ad[2], (u)(32 - 7)) ^ rotate((u)ad[2], (u)(32 - 18)) ^ (ad[2] >> 3U));
  ad[1] += ad[10];
  ad[1] += (rotate((u)ad[15], (u)(32 - 17)) ^ rotate((u)ad[15], (u)(32 - 19)) ^ (ad[15] >> 10U));
  ac[3] += ad[1];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[49];
  ac[6] += ac[3];
  ac[3] += (rotate((u)ac[2], (u)(32 - 2)) ^ rotate((u)ac[2], (u)(32 - 13)) ^ rotate((u)ac[2], (u)(32 - 22)));
  ac[3] += bitselect((u)ac[7], (u)ac[2], (u)ac[5] ^ (u)ac[7]);

  ad[2] += (rotate((u)ad[3], (u)(32 - 7)) ^ rotate((u)ad[3], (u)(32 - 18)) ^ (ad[3] >> 3U));
  ad[2] += ad[11];
  ad[2] += (rotate((u)ad[0], (u)(32 - 17)) ^ rotate((u)ad[0], (u)(32 - 19)) ^ (ad[0] >> 10U));
  ac[4] += ad[2];
  ac[4] += (rotate((u)ac[6], (u)(32 - 6)) ^ rotate((u)ac[6], (u)(32 - 11)) ^ rotate((u)ac[6], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[6]);
  ac[4] += Ga[50];
  ac[7] += ac[4];
  ac[4] += (rotate((u)ac[3], (u)(32 - 2)) ^ rotate((u)ac[3], (u)(32 - 13)) ^ rotate((u)ac[3], (u)(32 - 22)));
  ac[4] += bitselect((u)ac[5], (u)ac[3], (u)ac[2] ^ (u)ac[5]);

  ad[3] += (rotate((u)ad[4], (u)(32 - 7)) ^ rotate((u)ad[4], (u)(32 - 18)) ^ (ad[4] >> 3U));
  ad[3] += ad[12];
  ad[3] += (rotate((u)ad[1], (u)(32 - 17)) ^ rotate((u)ad[1], (u)(32 - 19)) ^ (ad[1] >> 10U));
  ac[1] += ad[3];
  ac[1] += (rotate((u)ac[7], (u)(32 - 6)) ^ rotate((u)ac[7], (u)(32 - 11)) ^ rotate((u)ac[7], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[6], (u)ac[7]);
  ac[1] += Ga[51];
  ac[5] += ac[1];
  ac[1] += (rotate((u)ac[4], (u)(32 - 2)) ^ rotate((u)ac[4], (u)(32 - 13)) ^ rotate((u)ac[4], (u)(32 - 22)));
  ac[1] += bitselect((u)ac[2], (u)ac[4], (u)ac[3] ^ (u)ac[2]);

  ad[4] += (rotate((u)ad[5], (u)(32 - 7)) ^ rotate((u)ad[5], (u)(32 - 18)) ^ (ad[5] >> 3U));
  ad[4] += ad[13];
  ad[4] += (rotate((u)ad[2], (u)(32 - 17)) ^ rotate((u)ad[2], (u)(32 - 19)) ^ (ad[2] >> 10U));
  ac[0] += ad[4];
  ac[0] += (rotate((u)ac[5], (u)(32 - 6)) ^ rotate((u)ac[5], (u)(32 - 11)) ^ rotate((u)ac[5], (u)(32 - 25)));
  ac[0] += bitselect((u)ac[6], (u)ac[7], (u)ac[5]);
  ac[0] += Ga[52];
  ac[2] += ac[0];
  ac[0] += (rotate((u)ac[1], (u)(32 - 2)) ^ rotate((u)ac[1], (u)(32 - 13)) ^ rotate((u)ac[1], (u)(32 - 22)));
  ac[0] += bitselect((u)ac[3], (u)ac[1], (u)ac[4] ^ (u)ac[3]);

  ad[5] += (rotate((u)ad[6], (u)(32 - 7)) ^ rotate((u)ad[6], (u)(32 - 18)) ^ (ad[6] >> 3U));
  ad[5] += ad[14];
  ad[5] += (rotate((u)ad[3], (u)(32 - 17)) ^ rotate((u)ad[3], (u)(32 - 19)) ^ (ad[3] >> 10U));
  ac[6] += ad[5];
  ac[6] += (rotate((u)ac[2], (u)(32 - 6)) ^ rotate((u)ac[2], (u)(32 - 11)) ^ rotate((u)ac[2], (u)(32 - 25)));
  ac[6] += bitselect((u)ac[7], (u)ac[5], (u)ac[2]);
  ac[6] += Ga[53];
  ac[3] += ac[6];
  ac[6] += (rotate((u)ac[0], (u)(32 - 2)) ^ rotate((u)ac[0], (u)(32 - 13)) ^ rotate((u)ac[0], (u)(32 - 22)));
  ac[6] += bitselect((u)ac[4], (u)ac[0], (u)ac[1] ^ (u)ac[4]);

  ad[6] += (rotate((u)ad[7], (u)(32 - 7)) ^ rotate((u)ad[7], (u)(32 - 18)) ^ (ad[7] >> 3U));
  ad[6] += ad[15];
  ad[6] += (rotate((u)ad[4], (u)(32 - 17)) ^ rotate((u)ad[4], (u)(32 - 19)) ^ (ad[4] >> 10U));
  ac[7] += ad[6];
  ac[7] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[7] += bitselect((u)ac[5], (u)ac[2], (u)ac[3]);
  ac[7] += Ga[54];
  ac[4] += ac[7];
  ac[7] += (rotate((u)ac[6], (u)(32 - 2)) ^ rotate((u)ac[6], (u)(32 - 13)) ^ rotate((u)ac[6], (u)(32 - 22)));
  ac[7] += bitselect((u)ac[1], (u)ac[6], (u)ac[0] ^ (u)ac[1]);

  ad[7] += (rotate((u)ad[8], (u)(32 - 7)) ^ rotate((u)ad[8], (u)(32 - 18)) ^ (ad[8] >> 3U));
  ad[7] += ad[0];
  ad[7] += (rotate((u)ad[5], (u)(32 - 17)) ^ rotate((u)ad[5], (u)(32 - 19)) ^ (ad[5] >> 10U));
  ac[5] += ad[7];
  ac[5] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[5] += bitselect((u)ac[2], (u)ac[3], (u)ac[4]);
  ac[5] += Ga[55];
  ac[1] += ac[5];
  ac[5] += (rotate((u)ac[7], (u)(32 - 2)) ^ rotate((u)ac[7], (u)(32 - 13)) ^ rotate((u)ac[7], (u)(32 - 22)));
  ac[5] += bitselect((u)ac[0], (u)ac[7], (u)ac[6] ^ (u)ac[0]);

  ad[8] += (rotate((u)ad[9], (u)(32 - 7)) ^ rotate((u)ad[9], (u)(32 - 18)) ^ (ad[9] >> 3U));
  ad[8] += ad[1];
  ad[8] += (rotate((u)ad[6], (u)(32 - 17)) ^ rotate((u)ad[6], (u)(32 - 19)) ^ (ad[6] >> 10U));
  ac[2] += ad[8];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  ac[2] += Ga[56];
  ac[0] += ac[2];

  ad[9] += (rotate((u)ad[10], (u)(32 - 7)) ^ rotate((u)ad[10], (u)(32 - 18)) ^ (ad[10] >> 3U));
  ad[9] += ad[2];
  ad[9] += (rotate((u)ad[7], (u)(32 - 17)) ^ rotate((u)ad[7], (u)(32 - 19)) ^ (ad[7] >> 10U));
  ac[3] += ad[9];
  ac[3] += (rotate((u)ac[0], (u)(32 - 6)) ^ rotate((u)ac[0], (u)(32 - 11)) ^ rotate((u)ac[0], (u)(32 - 25)));
  ac[3] += bitselect((u)ac[4], (u)ac[1], (u)ac[0]);
  ac[3] += Ga[57];
  ac[3] += ac[6];

  ad[10] += (rotate((u)ad[11], (u)(32 - 7)) ^ rotate((u)ad[11], (u)(32 - 18)) ^ (ad[11] >> 3U));
  ad[10] += ad[3];
  ad[10] += (rotate((u)ad[8], (u)(32 - 17)) ^ rotate((u)ad[8], (u)(32 - 19)) ^ (ad[8] >> 10U));
  ac[4] += ad[10];
  ac[4] += (rotate((u)ac[3], (u)(32 - 6)) ^ rotate((u)ac[3], (u)(32 - 11)) ^ rotate((u)ac[3], (u)(32 - 25)));
  ac[4] += bitselect((u)ac[1], (u)ac[0], (u)ac[3]);
  ac[4] += Ga[58];
  ac[4] += ac[7];
  ac[1] += (rotate((u)ac[4], (u)(32 - 6)) ^ rotate((u)ac[4], (u)(32 - 11)) ^ rotate((u)ac[4], (u)(32 - 25)));
  ac[1] += bitselect((u)ac[0], (u)ac[3], (u)ac[4]);
  ac[1] += ad[11];
  ac[1] += (rotate((u)ad[12], (u)(32 - 7)) ^ rotate((u)ad[12], (u)(32 - 18)) ^ (ad[12] >> 3U));
  ac[1] += ad[4];
  ac[1] += (rotate((u)ad[9], (u)(32 - 17)) ^ rotate((u)ad[9], (u)(32 - 19)) ^ (ad[9] >> 10U));
  ac[1] += Ga[59];
  ac[1] += ac[5];

  ac[2] += bitselect((u)ac[6], (u)ac[5], (u)ac[7] ^ (u)ac[6]);
  ac[2] += (rotate((u)ac[5], (u)(32 - 2)) ^ rotate((u)ac[5], (u)(32 - 13)) ^ rotate((u)ac[5], (u)(32 - 22)));
  ac[2] += ad[12];
  ac[2] += (rotate((u)ad[13], (u)(32 - 7)) ^ rotate((u)ad[13], (u)(32 - 18)) ^ (ad[13] >> 3U));
  ac[2] += ad[5];
  ac[2] += (rotate((u)ad[10], (u)(32 - 17)) ^ rotate((u)ad[10], (u)(32 - 19)) ^ (ad[10] >> 10U));
  ac[2] += ac[0];
  ac[2] += (rotate((u)ac[1], (u)(32 - 6)) ^ rotate((u)ac[1], (u)(32 - 11)) ^ rotate((u)ac[1], (u)(32 - 25)));
  ac[2] += bitselect((u)ac[3], (u)ac[4], (u)ac[1]);
  if (ac[2] == Ga[86])
    ab[ab[(0x0F)]++] = ae;
}