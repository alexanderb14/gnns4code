typedef uchar uint8_t; typedef char int8_t; typedef ushort uint16_t; typedef short int16_t; typedef uint uint32_t; typedef int int32_t; typedef ulong uint64_t; typedef long int64_t; typedef uint32_t host_size_t; typedef struct dyna_salt_t {
  host_size_t salt_cmp_size;
  host_size_t bitfield_and_offset;
} dyna_salt;
inline uint A(uint a) {
  return bitselect(rotate(a, 24U), rotate(a, 8U), 0x00FF00FFU);
}
typedef struct {
  unsigned int istate[5];
  unsigned int ostate[5];
  unsigned int buf[5];
  unsigned int out[4];

} temp_buf;
inline void B(__private uint* a, __private uint* b) {
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[0];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999 + b[1];
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999 + b[2];
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999 + b[3];
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999 + b[4];
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[5];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999 + b[6];
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999 + b[7];
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999 + b[8];
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999 + b[9];
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[10];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999 + b[11];
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999 + b[12];
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999 + b[13];
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999 + b[14];
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[15];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999 + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999 + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999 + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999 + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
}

inline void C(__private uint* a, __private uint* b) {
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[0];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999 + b[1];
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999 + b[2];
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999 + b[3];
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999 + b[4];
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[5];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999;
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999;
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999;
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999;
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999;
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999;
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999;
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999;
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999;
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[3], a[2], a[1]) + 0x5A827999 + b[15];
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[2], a[1], a[0]) + 0x5A827999 + (b[0] = rotate(((b[2] ^ b[0])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[1], a[0], a[4]) + 0x5A827999 + (b[1] = rotate(((b[3] ^ b[1])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[0], a[4], a[3]) + 0x5A827999 + (b[2] = rotate(((b[15] ^ b[4] ^ b[2])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[4], a[3], a[2]) + 0x5A827999 + (b[3] = rotate(((b[0] ^ b[5] ^ b[3])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[4] = rotate(((b[1] ^ b[4])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[5] = rotate(((b[2] ^ b[5])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[6] = rotate((b[3]), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[7] = rotate(((b[4] ^ b[15])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[8] = rotate(((b[5] ^ b[0])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[9] = rotate(((b[6] ^ b[1])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[10] = rotate(((b[7] ^ b[2])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[11] = rotate(((b[8] ^ b[3])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[12] = rotate(((b[9] ^ b[4])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[13] = rotate(((b[10] ^ b[5] ^ b[15])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[14] = rotate(((b[11] ^ b[6] ^ b[0])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0x6ED9EBA1 + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0x6ED9EBA1 + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0x6ED9EBA1 + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0x6ED9EBA1 + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0x6ED9EBA1 + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + bitselect(a[1], a[2], (a[3]) ^ (a[1])) + 0x8F1BBCDC + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + bitselect(a[0], a[1], (a[2]) ^ (a[0])) + 0x8F1BBCDC + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + bitselect(a[4], a[0], (a[1]) ^ (a[4])) + 0x8F1BBCDC + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + bitselect(a[3], a[4], (a[0]) ^ (a[3])) + 0x8F1BBCDC + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + bitselect(a[2], a[3], (a[4]) ^ (a[2])) + 0x8F1BBCDC + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[0] = rotate(((b[13] ^ b[8] ^ b[2] ^ b[0])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[1] = rotate(((b[14] ^ b[9] ^ b[3] ^ b[1])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[2] = rotate(((b[15] ^ b[10] ^ b[4] ^ b[2])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[3] = rotate(((b[0] ^ b[11] ^ b[5] ^ b[3])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[4] = rotate(((b[1] ^ b[12] ^ b[6] ^ b[4])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[5] = rotate(((b[2] ^ b[13] ^ b[7] ^ b[5])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[6] = rotate(((b[3] ^ b[14] ^ b[8] ^ b[6])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[7] = rotate(((b[4] ^ b[15] ^ b[9] ^ b[7])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[8] = rotate(((b[5] ^ b[0] ^ b[10] ^ b[8])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[9] = rotate(((b[6] ^ b[1] ^ b[11] ^ b[9])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[10] = rotate(((b[7] ^ b[2] ^ b[12] ^ b[10])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  {
    a[4] += rotate((a[0]), (uint)5) + (a[1] ^ a[2] ^ a[3]) + 0xCA62C1D6 + (b[11] = rotate(((b[8] ^ b[3] ^ b[13] ^ b[11])), (uint)1));
    a[1] = rotate((a[1]), (uint)30);
  };
  {
    a[3] += rotate((a[4]), (uint)5) + (a[0] ^ a[1] ^ a[2]) + 0xCA62C1D6 + (b[12] = rotate(((b[9] ^ b[4] ^ b[14] ^ b[12])), (uint)1));
    a[0] = rotate((a[0]), (uint)30);
  };
  {
    a[2] += rotate((a[3]), (uint)5) + (a[4] ^ a[0] ^ a[1]) + 0xCA62C1D6 + (b[13] = rotate(((b[10] ^ b[5] ^ b[15] ^ b[13])), (uint)1));
    a[4] = rotate((a[4]), (uint)30);
  };
  {
    a[1] += rotate((a[2]), (uint)5) + (a[3] ^ a[4] ^ a[0]) + 0xCA62C1D6 + (b[14] = rotate(((b[11] ^ b[6] ^ b[0] ^ b[14])), (uint)1));
    a[3] = rotate((a[3]), (uint)30);
  };
  {
    a[0] += rotate((a[1]), (uint)5) + (a[2] ^ a[3] ^ a[4]) + 0xCA62C1D6 + (b[15] = rotate(((b[12] ^ b[7] ^ b[1] ^ b[15])), (uint)1));
    a[2] = rotate((a[2]), (uint)30);
  };
  ;
}

inline void D(__private uint* a, __private uint* b) {
  uint c[5], d[16];

  { (d[0]) = ((unsigned long)(a)[(0)] << 24) | ((unsigned long)((a)[(0)] & 0xff00) << 8) | ((unsigned long)((a)[(0)] >> 8) & 0xff00) | ((unsigned long)(a)[(0)] >> 24); };
  { (d[1]) = ((unsigned long)(a)[(1)] << 24) | ((unsigned long)((a)[(1)] & 0xff00) << 8) | ((unsigned long)((a)[(1)] >> 8) & 0xff00) | ((unsigned long)(a)[(1)] >> 24); };
  { (d[2]) = ((unsigned long)(a)[(2)] << 24) | ((unsigned long)((a)[(2)] & 0xff00) << 8) | ((unsigned long)((a)[(2)] >> 8) & 0xff00) | ((unsigned long)(a)[(2)] >> 24); };
  { (d[3]) = ((unsigned long)(a)[(3)] << 24) | ((unsigned long)((a)[(3)] & 0xff00) << 8) | ((unsigned long)((a)[(3)] >> 8) & 0xff00) | ((unsigned long)(a)[(3)] >> 24); };
  { (d[4]) = ((unsigned long)(a)[(4)] << 24) | ((unsigned long)((a)[(4)] & 0xff00) << 8) | ((unsigned long)((a)[(4)] >> 8) & 0xff00) | ((unsigned long)(a)[(4)] >> 24); };
  { (d[5]) = ((unsigned long)(a)[(5)] << 24) | ((unsigned long)((a)[(5)] & 0xff00) << 8) | ((unsigned long)((a)[(5)] >> 8) & 0xff00) | ((unsigned long)(a)[(5)] >> 24); };
  { (d[6]) = ((unsigned long)(a)[(6)] << 24) | ((unsigned long)((a)[(6)] & 0xff00) << 8) | ((unsigned long)((a)[(6)] >> 8) & 0xff00) | ((unsigned long)(a)[(6)] >> 24); };
  { (d[7]) = ((unsigned long)(a)[(7)] << 24) | ((unsigned long)((a)[(7)] & 0xff00) << 8) | ((unsigned long)((a)[(7)] >> 8) & 0xff00) | ((unsigned long)(a)[(7)] >> 24); };
  { (d[8]) = ((unsigned long)(a)[(8)] << 24) | ((unsigned long)((a)[(8)] & 0xff00) << 8) | ((unsigned long)((a)[(8)] >> 8) & 0xff00) | ((unsigned long)(a)[(8)] >> 24); };
  { (d[9]) = ((unsigned long)(a)[(9)] << 24) | ((unsigned long)((a)[(9)] & 0xff00) << 8) | ((unsigned long)((a)[(9)] >> 8) & 0xff00) | ((unsigned long)(a)[(9)] >> 24); };
  { (d[10]) = ((unsigned long)(a)[(10)] << 24) | ((unsigned long)((a)[(10)] & 0xff00) << 8) | ((unsigned long)((a)[(10)] >> 8) & 0xff00) | ((unsigned long)(a)[(10)] >> 24); };
  { (d[11]) = ((unsigned long)(a)[(11)] << 24) | ((unsigned long)((a)[(11)] & 0xff00) << 8) | ((unsigned long)((a)[(11)] >> 8) & 0xff00) | ((unsigned long)(a)[(11)] >> 24); };
  { (d[12]) = ((unsigned long)(a)[(12)] << 24) | ((unsigned long)((a)[(12)] & 0xff00) << 8) | ((unsigned long)((a)[(12)] >> 8) & 0xff00) | ((unsigned long)(a)[(12)] >> 24); };
  { (d[13]) = ((unsigned long)(a)[(13)] << 24) | ((unsigned long)((a)[(13)] & 0xff00) << 8) | ((unsigned long)((a)[(13)] >> 8) & 0xff00) | ((unsigned long)(a)[(13)] >> 24); };
  { (d[14]) = ((unsigned long)(a)[(14)] << 24) | ((unsigned long)((a)[(14)] & 0xff00) << 8) | ((unsigned long)((a)[(14)] >> 8) & 0xff00) | ((unsigned long)(a)[(14)] >> 24); };
  { (d[15]) = ((unsigned long)(a)[(15)] << 24) | ((unsigned long)((a)[(15)] & 0xff00) << 8) | ((unsigned long)((a)[(15)] >> 8) & 0xff00) | ((unsigned long)(a)[(15)] >> 24); };

  c[0] = 0x67452301;
  c[1] = 0xEFCDAB89;
  c[2] = 0x98BADCFE;
  c[3] = 0x10325476;
  c[4] = 0xC3D2E1F0;

  B(c, d);

  c[0] += 0x67452301;
  c[1] += 0xEFCDAB89;
  c[2] += 0x98BADCFE;
  c[3] += 0x10325476;
  c[4] += 0xC3D2E1F0;

  b[0] = c[0];
  b[1] = c[1];
  b[2] = c[2];
  b[3] = c[3];
  b[4] = c[4];
}

inline void E(__private uint* a, __private uint* b, __private uint* c) {
  uint d[5], e[16];

  d[0] = a[0];
  d[1] = a[1];
  d[2] = a[2];
  d[3] = a[3];
  d[4] = a[4];

  { (e[0]) = ((unsigned long)(c)[(0)] << 24) | ((unsigned long)((c)[(0)] & 0xff00) << 8) | ((unsigned long)((c)[(0)] >> 8) & 0xff00) | ((unsigned long)(c)[(0)] >> 24); };
  { (e[1]) = ((unsigned long)(c)[(1)] << 24) | ((unsigned long)((c)[(1)] & 0xff00) << 8) | ((unsigned long)((c)[(1)] >> 8) & 0xff00) | ((unsigned long)(c)[(1)] >> 24); };
  { (e[2]) = ((unsigned long)(c)[(2)] << 24) | ((unsigned long)((c)[(2)] & 0xff00) << 8) | ((unsigned long)((c)[(2)] >> 8) & 0xff00) | ((unsigned long)(c)[(2)] >> 24); };
  { (e[3]) = ((unsigned long)(c)[(3)] << 24) | ((unsigned long)((c)[(3)] & 0xff00) << 8) | ((unsigned long)((c)[(3)] >> 8) & 0xff00) | ((unsigned long)(c)[(3)] >> 24); };
  { (e[4]) = ((unsigned long)(c)[(4)] << 24) | ((unsigned long)((c)[(4)] & 0xff00) << 8) | ((unsigned long)((c)[(4)] >> 8) & 0xff00) | ((unsigned long)(c)[(4)] >> 24); };
  { (e[5]) = ((unsigned long)(c)[(5)] << 24) | ((unsigned long)((c)[(5)] & 0xff00) << 8) | ((unsigned long)((c)[(5)] >> 8) & 0xff00) | ((unsigned long)(c)[(5)] >> 24); };
  { (e[6]) = ((unsigned long)(c)[(6)] << 24) | ((unsigned long)((c)[(6)] & 0xff00) << 8) | ((unsigned long)((c)[(6)] >> 8) & 0xff00) | ((unsigned long)(c)[(6)] >> 24); };
  { (e[7]) = ((unsigned long)(c)[(7)] << 24) | ((unsigned long)((c)[(7)] & 0xff00) << 8) | ((unsigned long)((c)[(7)] >> 8) & 0xff00) | ((unsigned long)(c)[(7)] >> 24); };
  { (e[8]) = ((unsigned long)(c)[(8)] << 24) | ((unsigned long)((c)[(8)] & 0xff00) << 8) | ((unsigned long)((c)[(8)] >> 8) & 0xff00) | ((unsigned long)(c)[(8)] >> 24); };
  { (e[9]) = ((unsigned long)(c)[(9)] << 24) | ((unsigned long)((c)[(9)] & 0xff00) << 8) | ((unsigned long)((c)[(9)] >> 8) & 0xff00) | ((unsigned long)(c)[(9)] >> 24); };
  { (e[10]) = ((unsigned long)(c)[(10)] << 24) | ((unsigned long)((c)[(10)] & 0xff00) << 8) | ((unsigned long)((c)[(10)] >> 8) & 0xff00) | ((unsigned long)(c)[(10)] >> 24); };
  { (e[11]) = ((unsigned long)(c)[(11)] << 24) | ((unsigned long)((c)[(11)] & 0xff00) << 8) | ((unsigned long)((c)[(11)] >> 8) & 0xff00) | ((unsigned long)(c)[(11)] >> 24); };
  { (e[12]) = ((unsigned long)(c)[(12)] << 24) | ((unsigned long)((c)[(12)] & 0xff00) << 8) | ((unsigned long)((c)[(12)] >> 8) & 0xff00) | ((unsigned long)(c)[(12)] >> 24); };
  { (e[13]) = ((unsigned long)(c)[(13)] << 24) | ((unsigned long)((c)[(13)] & 0xff00) << 8) | ((unsigned long)((c)[(13)] >> 8) & 0xff00) | ((unsigned long)(c)[(13)] >> 24); };
  { (e[14]) = ((unsigned long)(c)[(14)] << 24) | ((unsigned long)((c)[(14)] & 0xff00) << 8) | ((unsigned long)((c)[(14)] >> 8) & 0xff00) | ((unsigned long)(c)[(14)] >> 24); };
  { (e[15]) = ((unsigned long)(c)[(15)] << 24) | ((unsigned long)((c)[(15)] & 0xff00) << 8) | ((unsigned long)((c)[(15)] >> 8) & 0xff00) | ((unsigned long)(c)[(15)] >> 24); };

  B(d, e);

  d[0] += a[0];
  d[1] += a[1];
  d[2] += a[2];
  d[3] += a[3];
  d[4] += a[4];

  { (c)[(0)] = ((unsigned char)((d[0]) >> 24)) | ((unsigned char)((d[0]) >> 16)) << 8 | ((unsigned char)((d[0]) >> 8)) << 16 | ((unsigned char)((d[0]))) << 24; };
  { (c)[(1)] = ((unsigned char)((d[1]) >> 24)) | ((unsigned char)((d[1]) >> 16)) << 8 | ((unsigned char)((d[1]) >> 8)) << 16 | ((unsigned char)((d[1]))) << 24; };
  { (c)[(2)] = ((unsigned char)((d[2]) >> 24)) | ((unsigned char)((d[2]) >> 16)) << 8 | ((unsigned char)((d[2]) >> 8)) << 16 | ((unsigned char)((d[2]))) << 24; };
  { (c)[(3)] = ((unsigned char)((d[3]) >> 24)) | ((unsigned char)((d[3]) >> 16)) << 8 | ((unsigned char)((d[3]) >> 8)) << 16 | ((unsigned char)((d[3]))) << 24; };
  { (c)[(4)] = ((unsigned char)((d[4]) >> 24)) | ((unsigned char)((d[4]) >> 16)) << 8 | ((unsigned char)((d[4]) >> 8)) << 16 | ((unsigned char)((d[4]))) << 24; };

  c[5] = 0x80 | (c[5] & 0xffffff00);

  { (c)[(15)] = ((unsigned char)((0x2A0) >> 24)) | ((unsigned char)((0x2A0) >> 16)) << 8 | ((unsigned char)((0x2A0) >> 8)) << 16 | ((unsigned char)((0x2A0))) << 24; };

  d[0] = b[0];
  d[1] = b[1];
  d[2] = b[2];
  d[3] = b[3];
  d[4] = b[4];

  { (e[0]) = ((unsigned long)(c)[(0)] << 24) | ((unsigned long)((c)[(0)] & 0xff00) << 8) | ((unsigned long)((c)[(0)] >> 8) & 0xff00) | ((unsigned long)(c)[(0)] >> 24); };
  { (e[1]) = ((unsigned long)(c)[(1)] << 24) | ((unsigned long)((c)[(1)] & 0xff00) << 8) | ((unsigned long)((c)[(1)] >> 8) & 0xff00) | ((unsigned long)(c)[(1)] >> 24); };
  { (e[2]) = ((unsigned long)(c)[(2)] << 24) | ((unsigned long)((c)[(2)] & 0xff00) << 8) | ((unsigned long)((c)[(2)] >> 8) & 0xff00) | ((unsigned long)(c)[(2)] >> 24); };
  { (e[3]) = ((unsigned long)(c)[(3)] << 24) | ((unsigned long)((c)[(3)] & 0xff00) << 8) | ((unsigned long)((c)[(3)] >> 8) & 0xff00) | ((unsigned long)(c)[(3)] >> 24); };
  { (e[4]) = ((unsigned long)(c)[(4)] << 24) | ((unsigned long)((c)[(4)] & 0xff00) << 8) | ((unsigned long)((c)[(4)] >> 8) & 0xff00) | ((unsigned long)(c)[(4)] >> 24); };
  e[5] = 0x80000000;
  e[6] = 0;
  e[7] = 0;
  e[8] = 0;
  e[9] = 0;
  e[10] = 0;
  e[11] = 0;
  e[12] = 0;
  e[13] = 0;
  e[14] = 0;
  e[15] = 0x2A0;

  C(d, e);

  d[0] += b[0];
  d[1] += b[1];
  d[2] += b[2];
  d[3] += b[3];
  d[4] += b[4];

  c[0] = d[0];
  c[1] = d[1];
  c[2] = d[2];
  c[3] = d[3];
  c[4] = d[4];
}
__kernel void F(const __global unsigned int* a, constant unsigned int* b

                ,
                int c, __global temp_buf* d) {
  int e = get_global_id(0);
  int f, g;
  unsigned int h[4];
  unsigned int i[5], j[5];
  unsigned int k[16] = {0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636};
  unsigned int l[16] = {0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C};
  f = 4 * e;
  h[0] = a[f++];
  h[1] = a[f++];
  h[2] = a[f++];
  h[3] = a[f];
  for (g = 0; g < 4; g++) {
    k[g] = k[g] ^ h[g];
    l[g] = l[g] ^ h[g];
  }
  D(k, i);
  D(l, j);
  ;

  unsigned int m[16] = {0};

  if (c & 1) {
    for (f = 0; f <= c >> 1; f++)
      m[f] = b[f];
    m[(c >> 1) + 1] = 0x01 << 8;
  } else {
    for (f = 0; f<c>> 1; f++)
      m[f] = b[f];
    m[c >> 1] = 0x01 << 24;
  }

  if (c & 1)
    m[(c >> 1) + 1] = 0x80 << 16 | m[(c >> 1) + 1];
  else
    m[(c >> 1) + 1] = 0x80 | m[(c >> 1) + 1];

  { (m)[(15)] = ((unsigned char)(((64 + (c << 1) + 4) << 3) >> 24)) | ((unsigned char)(((64 + (c << 1) + 4) << 3) >> 16)) << 8 | ((unsigned char)(((64 + (c << 1) + 4) << 3) >> 8)) << 16 | ((unsigned char)(((64 + (c << 1) + 4) << 3))) << 24; };

  E(i, j, m);

  d[e].out[0] = m[0];
  d[e].out[1] = m[1];
  d[e].out[2] = m[2];
  d[e].out[3] = m[3];

  d[e].buf[0] = m[0];
  d[e].buf[1] = m[1];
  d[e].buf[2] = m[2];
  d[e].buf[3] = m[3];
  d[e].buf[4] = m[4];

  for (f = 0; f < 5; f++) {
    d[e].istate[f] = i[f];
    d[e].ostate[f] = j[f];
  }
}

__kernel void G(const __global unsigned int* a, __global temp_buf* b, __global unsigned int* c) {
  int d = get_global_id(0);
  int e, f;
  unsigned int g[4];
  unsigned int h[5], i[5];
  unsigned int j[16] = {0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636, 0x36363636};
  unsigned int k[16] = {0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C, 0x5C5C5C5C};
  e = 4 * d;
  g[0] = a[e++];
  g[1] = a[e++];
  g[2] = a[e++];
  g[3] = a[e];
  for (f = 0; f < 4; f++) {
    j[f] = j[f] ^ g[f];
    k[f] = k[f] ^ g[f];
  }
  D(j, h);
  D(k, i);
  ;

  unsigned int l[5];

  e = d * 5;
  l[0] = c[e++];
  l[1] = c[e++];
  l[2] = c[e++];
  l[3] = c[e++];
  l[4] = c[e];

  { (l[0]) = ((unsigned long)(l)[(0)] << 24) | ((unsigned long)((l)[(0)] & 0xff00) << 8) | ((unsigned long)((l)[(0)] >> 8) & 0xff00) | ((unsigned long)(l)[(0)] >> 24); };
  { (l[1]) = ((unsigned long)(l)[(1)] << 24) | ((unsigned long)((l)[(1)] & 0xff00) << 8) | ((unsigned long)((l)[(1)] >> 8) & 0xff00) | ((unsigned long)(l)[(1)] >> 24); };
  { (l[2]) = ((unsigned long)(l)[(2)] << 24) | ((unsigned long)((l)[(2)] & 0xff00) << 8) | ((unsigned long)((l)[(2)] >> 8) & 0xff00) | ((unsigned long)(l)[(2)] >> 24); };
  { (l[3]) = ((unsigned long)(l)[(3)] << 24) | ((unsigned long)((l)[(3)] & 0xff00) << 8) | ((unsigned long)((l)[(3)] >> 8) & 0xff00) | ((unsigned long)(l)[(3)] >> 24); };
  { (l[4]) = ((unsigned long)(l)[(4)] << 24) | ((unsigned long)((l)[(4)] & 0xff00) << 8) | ((unsigned long)((l)[(4)] >> 8) & 0xff00) | ((unsigned long)(l)[(4)] >> 24); };

  b[d].buf[0] = l[0];
  b[d].buf[1] = l[1];
  b[d].buf[2] = l[2];
  b[d].buf[3] = l[3];
  b[d].buf[4] = l[4];

  b[d].out[0] = l[0];
  b[d].out[1] = l[1];
  b[d].out[2] = l[2];
  b[d].out[3] = l[3];

  for (e = 0; e < 5; e++) {
    b[d].istate[e] = h[e];
    b[d].ostate[e] = i[e];
  }
}

__kernel void H(__global temp_buf* a, uint b) {
  uint c = get_global_id(0);
  uint d;
  uint e[5], f[5], g[5], h[4];
  uint i[5], j[16];

  for (d = 0; d < 5; d++) {
    e[d] = a[c].istate[d];
    f[d] = a[c].ostate[d];
    g[d] = a[c].buf[d];
  }

  h[0] = a[c].out[0];
  h[1] = a[c].out[1];
  h[2] = a[c].out[2];
  h[3] = a[c].out[3];

  for (d = 0; d < b; d++) {
    j[0] = g[0];
    j[1] = g[1];
    j[2] = g[2];
    j[3] = g[3];
    j[4] = g[4];
    j[5] = 0x80000000;
    j[6] = 0;
    j[7] = 0;
    j[8] = 0;
    j[9] = 0;
    j[10] = 0;
    j[11] = 0;
    j[12] = 0;
    j[13] = 0;
    j[14] = 0;
    j[15] = 0x2A0;

    i[0] = e[0];
    i[1] = e[1];
    i[2] = e[2];
    i[3] = e[3];
    i[4] = e[4];

    C(i, j);

    j[0] = i[0] + e[0];
    j[1] = i[1] + e[1];
    j[2] = i[2] + e[2];
    j[3] = i[3] + e[3];
    j[4] = i[4] + e[4];
    j[5] = 0x80000000;
    j[6] = 0;
    j[7] = 0;
    j[8] = 0;
    j[9] = 0;
    j[10] = 0;
    j[11] = 0;
    j[12] = 0;
    j[13] = 0;
    j[14] = 0;
    j[15] = 0x2A0;

    i[0] = f[0];
    i[1] = f[1];
    i[2] = f[2];
    i[3] = f[3];
    i[4] = f[4];

    C(i, j);

    g[0] = i[0] + f[0];
    g[1] = i[1] + f[1];
    g[2] = i[2] + f[2];
    g[3] = i[3] + f[3];
    g[4] = i[4] + f[4];

    h[0] ^= g[0];
    h[1] ^= g[1];
    h[2] ^= g[2];
    h[3] ^= g[3];
  }

  a[c].buf[0] = g[0];
  a[c].buf[1] = g[1];
  a[c].buf[2] = g[2];
  a[c].buf[3] = g[3];
  a[c].buf[4] = g[4];

  a[c].out[0] = h[0];
  a[c].out[1] = h[1];
  a[c].out[2] = h[2];
  a[c].out[3] = h[3];
}

__kernel void I(__global temp_buf* a, __global unsigned int* b) {
  uint c = get_global_id(0);
  uint d;
  uint e[4];

  for (d = 0; d < 4; d++)
    e[d] = a[c].out[d];

  d = c * 4;
  { (b)[(d++)] = ((unsigned char)((e[0]) >> 24)) | ((unsigned char)((e[0]) >> 16)) << 8 | ((unsigned char)((e[0]) >> 8)) << 16 | ((unsigned char)((e[0]))) << 24; };
  { (b)[(d++)] = ((unsigned char)((e[1]) >> 24)) | ((unsigned char)((e[1]) >> 16)) << 8 | ((unsigned char)((e[1]) >> 8)) << 16 | ((unsigned char)((e[1]))) << 24; };
  { (b)[(d++)] = ((unsigned char)((e[2]) >> 24)) | ((unsigned char)((e[2]) >> 16)) << 8 | ((unsigned char)((e[2]) >> 8)) << 16 | ((unsigned char)((e[2]))) << 24; };
  { (b)[(d)] = ((unsigned char)((e[3]) >> 24)) | ((unsigned char)((e[3]) >> 16)) << 8 | ((unsigned char)((e[3]) >> 8)) << 16 | ((unsigned char)((e[3]))) << 24; };
}