typedef uchar u8; typedef ushort u16; typedef uint u32; typedef ulong u64; typedef uchar u8x; typedef ushort u16x; typedef uint u32x; typedef ulong u64x; inline u32 A(u64 a) {
  const u32 b = (u32)(a);

  return b;
}

inline u32 B(u64 a) {
  a >>= 32;

  const u32 b = (u32)(a);

  return b;
}

inline u64 C(const u32 a, const u32 b) {
  return __builtin_astype((uint2)(b, a), ulong);
}

inline u32x D(u64x a) {
  u32x b;

  b = (u32)a;
  return b;
}

inline u32x E(u64x a) {
  a >>= 32;

  u32x b;

  b = (u32)a;
  return b;
}

inline u64x F(const u32x a, const u32x b) {
  u64x c;

  c = __builtin_astype((uint2)(b, a), ulong);
  return c;
}
inline u32 G(const u32 a) {
  return (__builtin_astype(__builtin_astype(a, uchar4).s3210, uint));
}

inline u64 H(const u64 a) {
  return (__builtin_astype(__builtin_astype(a, uchar8).s76543210, ulong));
}

inline u32 I(const u32 a, const u32 b) {
  return rotate(a, 32 - b);
}

inline u32 J(const u32 a, const u32 b) {
  return rotate(a, b);
}

inline u64 K(const u64 a, const u32 b) {
  return rotate(a, (u64)64 - b);
}

inline u64 L(const u64 a, const u32 b) {
  return rotate(a, (u64)b);
}

inline u32x M(const u32x a) {
  return ((a >> 24) & 0x000000ff) | ((a >> 8) & 0x0000ff00) | ((a << 8) & 0x00ff0000) | ((a << 24) & 0xff000000);
}

inline u64x N(const u64x a) {
  return ((a >> 56) & 0x00000000000000ff) | ((a >> 40) & 0x000000000000ff00) | ((a >> 24) & 0x0000000000ff0000) | ((a >> 8) & 0x00000000ff000000) | ((a << 8) & 0x000000ff00000000) | ((a << 24) & 0x0000ff0000000000) | ((a << 40) & 0x00ff000000000000) | ((a << 56) & 0xff00000000000000);
}

inline u32x O(const u32x a, const u32 b) {
  return rotate(a, 32 - b);
}

inline u32x P(const u32x a, const u32 b) {
  return rotate(a, b);
}

inline u64x Q(const u64x a, const u32 b) {
  return rotate(a, (u64)64 - b);
}

inline u64x R(const u64x a, const u32 b) {
  return rotate(a, (u64)b);
}

inline u32x S(const u32x a, const u32x b, const u32x c) {
  return (((a) >> (b)) & (((u32x)(1u) << (c)) - 1));
}

inline u32 T(const u32 a, const u32 b, const u32 c) {
  return (((a) >> (b)) & ((1u << (c)) - 1));
}

inline u32x U(const u32x a, const u32x b, const u32 c) {
  const u64x d = ((((u64x)(a)) << 32) | ((u64x)(b))) >> ((c & 3) * 8);

  return (u32x)(d);
}

inline u32 V(const u32 a, const u32 b, const u32 c) {
  const u64 d = ((((u64)a) << 32) | ((u64)b)) >> ((c & 3) * 8);

  return (u32)(d);
}

typedef struct { u32 digest_buf[16]; } digest_t;

typedef struct {
  u32 salt_buf[16];
  u32 salt_buf_pc[8];

  u32 salt_len;
  u32 salt_iter;
  u32 salt_sign[2];

  u32 keccak_mdlen;
  u32 truecrypt_mdlen;

  u32 digests_cnt;
  u32 digests_done;

  u32 digests_offset;

  u32 scrypt_N;
  u32 scrypt_r;
  u32 scrypt_p;
  u32 scrypt_tmto;
  u32 scrypt_phy;

} salt_t;

typedef struct {
  int V;
  int R;
  int P;

  int enc_md;

  u32 id_buf[8];
  u32 u_buf[32];
  u32 o_buf[32];

  int id_len;
  int o_len;
  int u_len;

  u32 rc4key[2];
  u32 rc4data[2];

} pdf_t;

typedef struct {
  u32 pke[25];
  u32 eapol[64];
  int eapol_size;
  int keyver;
  u8 orig_mac1[6];
  u8 orig_mac2[6];
  u8 orig_nonce1[32];
  u8 orig_nonce2[32];

} wpa_t;

typedef struct {
  u32 cry_master_buf[64];
  u32 ckey_buf[64];
  u32 public_key_buf[64];

  u32 cry_master_len;
  u32 ckey_len;
  u32 public_key_len;

} bitcoin_wallet_t;

typedef struct {
  u32 salt_buf[30];
  u32 salt_len;

  u32 esalt_buf[38];
  u32 esalt_len;

} sip_t;

typedef struct { u32 data[384]; } androidfde_t;

typedef struct {
  u32 nr_buf[16];
  u32 nr_len;

  u32 msg_buf[128];
  u32 msg_len;

} ikepsk_t;

typedef struct {
  u32 user_len;
  u32 domain_len;
  u32 srvchall_len;
  u32 clichall_len;

  u32 userdomain_buf[64];
  u32 chall_buf[256];

} netntlm_t;

typedef struct {
  u32 user[16];
  u32 realm[16];
  u32 salt[32];
  u32 timestamp[16];
  u32 checksum[4];

} krb5pa_t;

typedef struct {
  u32 account_info[512];
  u32 checksum[4];
  u32 edata2[2560];
  u32 edata2_len;

} krb5tgs_t;

typedef struct {
  u32 salt_buf[16];
  u32 data_buf[112];
  u32 keyfile_buf[16];
  u32 signature;

} tc_t;

typedef struct { u32 salt_buf[16]; } pbkdf2_md5_t;

typedef struct { u32 salt_buf[16]; } pbkdf2_sha1_t;

typedef struct { u32 salt_buf[16]; } pbkdf2_sha256_t;

typedef struct { u32 salt_buf[32]; } pbkdf2_sha512_t;

typedef struct {
  u32 salt_buf[128];
  u32 salt_len;

} rakp_t;

typedef struct {
  u32 data_len;
  u32 data_buf[512];

} cloudkey_t;

typedef struct {
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[5];

  u32 keySize;

} office2007_t;

typedef struct {
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[8];

} office2010_t;

typedef struct {
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[8];

} office2013_t;

typedef struct {
  u32 version;
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[4];
  u32 rc4key[2];

} oldoffice01_t;

typedef struct {
  u32 version;
  u32 encryptedVerifier[4];
  u32 encryptedVerifierHash[5];
  u32 rc4key[2];

} oldoffice34_t;

typedef struct {
  u32 salt_buf[128];
  u32 salt_len;

  u32 pc_digest[5];
  u32 pc_offset;

} pstoken_t;

typedef struct {
  u32 type;
  u32 mode;
  u32 magic;
  u32 salt_len;
  u32 salt_buf[4];
  u32 verify_bytes;
  u32 compress_length;
  u32 data_len;
  u32 data_buf[2048];
  u32 auth_len;
  u32 auth_buf[4];

} zip2_t;

typedef struct { u32 salt_buf[32]; } win8phone_t;

typedef struct {
  u32 version;
  u32 algorithm;

  u32 keyfile_len;
  u32 keyfile[8];

  u32 final_random_seed[8];
  u32 transf_random_seed[8];
  u32 enc_iv[4];
  u32 contents_hash[8];

  u32 contents_len;
  u32 contents[75000];

  u32 expected_bytes[8];

} keepass_t;

typedef struct {
  u32 digest[4];
  u32 out[4];

} pdf14_tmp_t;

typedef struct {
  union {
    u32 dgst32[16];
    u64 dgst64[8];
  };

  u32 dgst_len;
  u32 W_len;

} pdf17l8_tmp_t;

typedef struct { u32 digest_buf[4]; } phpass_tmp_t;

typedef struct { u32 digest_buf[4]; } md5crypt_tmp_t;

typedef struct {
  u32 alt_result[8];

  u32 p_bytes[4];
  u32 s_bytes[4];

} sha256crypt_tmp_t;

typedef struct {
  u64 l_alt_result[8];

  u64 l_p_bytes[2];
  u64 l_s_bytes[2];

} sha512crypt_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[10];
  u32 out[10];

} wpa_tmp_t;

typedef struct { u64 dgst[8]; } bitcoin_wallet_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[4];

} dcc2_tmp_t;

typedef struct {
  u32 E[18];

  u32 P[18];

  u32 S0[256];
  u32 S1[256];
  u32 S2[256];
  u32 S3[256];

} bcrypt_tmp_t;

typedef struct {
  u32 digest[2];

  u32 P[18];

  u32 S0[256];
  u32 S1[256];
  u32 S2[256];
  u32 S3[256];

} pwsafe2_tmp_t;

typedef struct { u32 digest_buf[8]; } pwsafe3_tmp_t;

typedef struct { u32 digest_buf[5]; } androidpin_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[10];
  u32 out[10];

} androidfde_tmp_t;

typedef struct {
  u32 ipad[16];
  u32 opad[16];

  u32 dgst[64];
  u32 out[64];

} tc_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[32];
  u64 out[32];

} tc64_tmp_t;

typedef struct {
  u32 ipad[4];
  u32 opad[4];

  u32 dgst[32];
  u32 out[32];

} pbkdf2_md5_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[32];
  u32 out[32];

} pbkdf2_sha1_tmp_t;

typedef struct {
  u32 ipad[8];
  u32 opad[8];

  u32 dgst[32];
  u32 out[32];

} pbkdf2_sha256_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[16];
  u64 out[16];

} pbkdf2_sha512_tmp_t;

typedef struct { u64 out[8]; } ecryptfs_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[16];
  u64 out[16];

} oraclet_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[5];

} agilekey_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst1[5];
  u32 out1[5];

  u32 dgst2[5];
  u32 out2[5];

} mywallet_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[5];

} sha1aix_tmp_t;

typedef struct {
  u32 ipad[8];
  u32 opad[8];

  u32 dgst[8];
  u32 out[8];

} sha256aix_tmp_t;

typedef struct {
  u64 ipad[8];
  u64 opad[8];

  u64 dgst[8];
  u64 out[8];

} sha512aix_tmp_t;

typedef struct {
  u32 ipad[8];
  u32 opad[8];

  u32 dgst[8];
  u32 out[8];

} lastpass_tmp_t;

typedef struct { u64 digest_buf[8]; } drupal7_tmp_t;

typedef struct {
  u32 ipad[5];
  u32 opad[5];

  u32 dgst[5];
  u32 out[5];

} lotus8_tmp_t;

typedef struct { u32 out[5]; } office2007_tmp_t;

typedef struct { u32 out[5]; } office2010_tmp_t;

typedef struct { u64 out[8]; } office2013_tmp_t;

typedef struct { u32 digest_buf[5]; } saph_sha1_tmp_t;

typedef struct {
  u32 block[16];

  u32 dgst[8];

  u32 block_len;
  u32 final_len;

} seven_zip_tmp_t;

typedef struct {
  u32 KEK[4];
  u32 lsb[4];
  u32 cipher[4];

} axcrypt_tmp_t;

typedef struct { u32 tmp_digest[8]; } keepass_tmp_t;

typedef struct {
  u32 Kc[16];
  u32 Kd[16];

  u32 iv[2];

} bsdicrypt_tmp_t;

typedef struct { u32 dgst[17][5]; } rar3_tmp_t;

typedef struct { u32 user[16]; } cram_md5_t;

typedef struct {
  u32 iv_buf[4];
  u32 iv_len;

  u32 salt_buf[4];
  u32 salt_len;

  u32 crc;

  u32 data_buf[96];
  u32 data_len;

  u32 unpack_size;

} seven_zip_t;

typedef struct {
  u32 key;
  u64 val;

} hcstat_table_t;

typedef struct {
  u32 cs_buf[0x100];
  u32 cs_len;

} cs_t;

typedef struct { u32 cmds[0x100]; } kernel_rule_t;

typedef struct {
  u32 salt_pos;
  u32 digest_pos;
  u32 hash_pos;
  u32 gidvid;
  u32 il_pos;

} plain_t;

typedef struct {
  u32 i[16];

  u32 pw_len;

  u32 alignment_placeholder_1;
  u32 alignment_placeholder_2;
  u32 alignment_placeholder_3;

} pw_t;

typedef struct { u32 i; } bf_t;

typedef struct {
  u32 i[8];

  u32 pw_len;

} comb_t;

typedef struct { u32 b[32]; } bs_word_t;

typedef struct { uint4 P[64]; } scrypt_tmp_t;
inline int W(const u32 a[4], __global u32* b) {
  if (a[3] > b[3])
    return (1);
  if (a[3] < b[3])
    return (-1);
  if (a[2] > b[2])
    return (1);
  if (a[2] < b[2])
    return (-1);
  if (a[1] > b[1])
    return (1);
  if (a[1] < b[1])
    return (-1);
  if (a[0] > b[0])
    return (1);
  if (a[0] < b[0])
    return (-1);

  return (0);
}

inline int X(const u32 a[4], const u32 b, __global digest_t* c) {
  for (u32 d = 0, e = b; e; e >>= 1) {
    const u32 f = e >> 1;

    const u32 g = d + f;

    const int h = W(a, c[g].digest_buf);

    if (h > 0) {
      d += f + 1;

      e--;
    }

    if (h == 0)
      return (g);
  }

  return (-1);
}

inline u32 Y(__global u32* a, const u32 b, const u32 c, const u32 d) {
  return (a[(d >> c) & b] & (1 << (d & 0x1f)));
}

inline u32 Z(const u32 a[2], __global u32* b, __global u32* c, __global u32* d, __global u32* e, __global u32* f, __global u32* g, __global u32* h, __global u32* i, const u32 j, const u32 k, const u32 l) {
  if (Y(b, j, k, a[0]) == 0)
    return (0);
  if (Y(c, j, k, a[1]) == 0)
    return (0);
  if (Y(d, j, k, a[2]) == 0)
    return (0);
  if (Y(e, j, k, a[3]) == 0)
    return (0);

  if (Y(f, j, l, a[0]) == 0)
    return (0);
  if (Y(g, j, l, a[1]) == 0)
    return (0);
  if (Y(h, j, l, a[2]) == 0)
    return (0);
  if (Y(i, j, l, a[3]) == 0)
    return (0);

  return (1);
}

inline void AA(__global plain_t* a, __global u32* b, const int c, const int d, const int e, const u32 f, const u32 g) {
  const u32 h = atomic_add(b, 1);

  a[h].salt_pos = c;
  a[h].digest_pos = d;
  a[h].hash_pos = e;
  a[h].gidvid = f;
  a[h].il_pos = g;
}

inline void AB(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] &= 0;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 1:
      a[0] &= 0x000000FF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 2:
      a[0] &= 0x0000FFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 3:
      a[0] &= 0x00FFFFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 4:
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 5:
      a[1] &= 0x000000FF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 6:
      a[1] &= 0x0000FFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 7:
      a[1] &= 0x00FFFFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 8:
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 9:
      a[2] &= 0x000000FF;
      a[3] &= 0;
      break;
    case 10:
      a[2] &= 0x0000FFFF;
      a[3] &= 0;
      break;
    case 11:
      a[2] &= 0x00FFFFFF;
      a[3] &= 0;
      break;
    case 12:
      a[3] &= 0;
      break;
    case 13:
      a[3] &= 0x000000FF;
      break;
    case 14:
      a[3] &= 0x0000FFFF;
      break;
    case 15:
      a[3] &= 0x00FFFFFF;
      break;
  }
}

inline void AC(const u32x a[4], u32x b[4], u32x c[4]) {
  c[3] = ((a[3] >> 8) & 0x00FF0000) | ((a[3] >> 16) & 0x000000FF);
  c[2] = ((a[3] << 8) & 0x00FF0000) | ((a[3] >> 0) & 0x000000FF);
  c[1] = ((a[2] >> 8) & 0x00FF0000) | ((a[2] >> 16) & 0x000000FF);
  c[0] = ((a[2] << 8) & 0x00FF0000) | ((a[2] >> 0) & 0x000000FF);
  b[3] = ((a[1] >> 8) & 0x00FF0000) | ((a[1] >> 16) & 0x000000FF);
  b[2] = ((a[1] << 8) & 0x00FF0000) | ((a[1] >> 0) & 0x000000FF);
  b[1] = ((a[0] >> 8) & 0x00FF0000) | ((a[0] >> 16) & 0x000000FF);
  b[0] = ((a[0] << 8) & 0x00FF0000) | ((a[0] >> 0) & 0x000000FF);
}

inline void AD(const u32x a[4], const u32x b[4], u32x c[4]) {
  c[0] = ((a[0] & 0x000000ff) >> 0) | ((a[0] & 0x00ff0000) >> 8) | ((a[1] & 0x000000ff) << 16) | ((a[1] & 0x00ff0000) << 8);
  c[1] = ((a[2] & 0x000000ff) >> 0) | ((a[2] & 0x00ff0000) >> 8) | ((a[3] & 0x000000ff) << 16) | ((a[3] & 0x00ff0000) << 8);
  c[2] = ((b[0] & 0x000000ff) >> 0) | ((b[0] & 0x00ff0000) >> 8) | ((b[1] & 0x000000ff) << 16) | ((b[1] & 0x00ff0000) << 8);
  c[3] = ((b[2] & 0x000000ff) >> 0) | ((b[2] & 0x00ff0000) >> 8) | ((b[3] & 0x000000ff) << 16) | ((b[3] & 0x00ff0000) << 8);
}

inline void AE(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;
  }
}

inline void AF(u32x a[4], u32x b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;
  }
}

inline void AG(u32x a[4], u32x b[4], u32x c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;
  }
}

inline void AH(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;

    case 48:
      d[0] = 0x01;
      break;

    case 49:
      d[0] = d[0] | 0x0100;
      break;

    case 50:
      d[0] = d[0] | 0x010000;
      break;

    case 51:
      d[0] = d[0] | 0x01000000;
      break;

    case 52:
      d[1] = 0x01;
      break;

    case 53:
      d[1] = d[1] | 0x0100;
      break;

    case 54:
      d[1] = d[1] | 0x010000;
      break;

    case 55:
      d[1] = d[1] | 0x01000000;
      break;

    case 56:
      d[2] = 0x01;
      break;

    case 57:
      d[2] = d[2] | 0x0100;
      break;

    case 58:
      d[2] = d[2] | 0x010000;
      break;

    case 59:
      d[2] = d[2] | 0x01000000;
      break;

    case 60:
      d[3] = 0x01;
      break;

    case 61:
      d[3] = d[3] | 0x0100;
      break;

    case 62:
      d[3] = d[3] | 0x010000;
      break;

    case 63:
      d[3] = d[3] | 0x01000000;
      break;
  }
}

inline void AI(u32x a[4], u32x b[4], u32x c[4], u32x d[4], u32x e[4], u32x f[4], u32x g[4], u32x h[4], const u32 i) {
  switch (i) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;

    case 48:
      d[0] = 0x01;
      break;

    case 49:
      d[0] = d[0] | 0x0100;
      break;

    case 50:
      d[0] = d[0] | 0x010000;
      break;

    case 51:
      d[0] = d[0] | 0x01000000;
      break;

    case 52:
      d[1] = 0x01;
      break;

    case 53:
      d[1] = d[1] | 0x0100;
      break;

    case 54:
      d[1] = d[1] | 0x010000;
      break;

    case 55:
      d[1] = d[1] | 0x01000000;
      break;

    case 56:
      d[2] = 0x01;
      break;

    case 57:
      d[2] = d[2] | 0x0100;
      break;

    case 58:
      d[2] = d[2] | 0x010000;
      break;

    case 59:
      d[2] = d[2] | 0x01000000;
      break;

    case 60:
      d[3] = 0x01;
      break;

    case 61:
      d[3] = d[3] | 0x0100;
      break;

    case 62:
      d[3] = d[3] | 0x010000;
      break;

    case 63:
      d[3] = d[3] | 0x01000000;
      break;

    case 64:
      e[0] = 0x01;
      break;

    case 65:
      e[0] = e[0] | 0x0100;
      break;

    case 66:
      e[0] = e[0] | 0x010000;
      break;

    case 67:
      e[0] = e[0] | 0x01000000;
      break;

    case 68:
      e[1] = 0x01;
      break;

    case 69:
      e[1] = e[1] | 0x0100;
      break;

    case 70:
      e[1] = e[1] | 0x010000;
      break;

    case 71:
      e[1] = e[1] | 0x01000000;
      break;

    case 72:
      e[2] = 0x01;
      break;

    case 73:
      e[2] = e[2] | 0x0100;
      break;

    case 74:
      e[2] = e[2] | 0x010000;
      break;

    case 75:
      e[2] = e[2] | 0x01000000;
      break;

    case 76:
      e[3] = 0x01;
      break;

    case 77:
      e[3] = e[3] | 0x0100;
      break;

    case 78:
      e[3] = e[3] | 0x010000;
      break;

    case 79:
      e[3] = e[3] | 0x01000000;
      break;

    case 80:
      f[0] = 0x01;
      break;

    case 81:
      f[0] = f[0] | 0x0100;
      break;

    case 82:
      f[0] = f[0] | 0x010000;
      break;

    case 83:
      f[0] = f[0] | 0x01000000;
      break;

    case 84:
      f[1] = 0x01;
      break;

    case 85:
      f[1] = f[1] | 0x0100;
      break;

    case 86:
      f[1] = f[1] | 0x010000;
      break;

    case 87:
      f[1] = f[1] | 0x01000000;
      break;

    case 88:
      f[2] = 0x01;
      break;

    case 89:
      f[2] = f[2] | 0x0100;
      break;

    case 90:
      f[2] = f[2] | 0x010000;
      break;

    case 91:
      f[2] = f[2] | 0x01000000;
      break;

    case 92:
      f[3] = 0x01;
      break;

    case 93:
      f[3] = f[3] | 0x0100;
      break;

    case 94:
      f[3] = f[3] | 0x010000;
      break;

    case 95:
      f[3] = f[3] | 0x01000000;
      break;

    case 96:
      g[0] = 0x01;
      break;

    case 97:
      g[0] = g[0] | 0x0100;
      break;

    case 98:
      g[0] = g[0] | 0x010000;
      break;

    case 99:
      g[0] = g[0] | 0x01000000;
      break;

    case 100:
      g[1] = 0x01;
      break;

    case 101:
      g[1] = g[1] | 0x0100;
      break;

    case 102:
      g[1] = g[1] | 0x010000;
      break;

    case 103:
      g[1] = g[1] | 0x01000000;
      break;

    case 104:
      g[2] = 0x01;
      break;

    case 105:
      g[2] = g[2] | 0x0100;
      break;

    case 106:
      g[2] = g[2] | 0x010000;
      break;

    case 107:
      g[2] = g[2] | 0x01000000;
      break;

    case 108:
      g[3] = 0x01;
      break;

    case 109:
      g[3] = g[3] | 0x0100;
      break;

    case 110:
      g[3] = g[3] | 0x010000;
      break;

    case 111:
      g[3] = g[3] | 0x01000000;
      break;

    case 112:
      h[0] = 0x01;
      break;

    case 113:
      h[0] = h[0] | 0x0100;
      break;

    case 114:
      h[0] = h[0] | 0x010000;
      break;

    case 115:
      h[0] = h[0] | 0x01000000;
      break;

    case 116:
      h[1] = 0x01;
      break;

    case 117:
      h[1] = h[1] | 0x0100;
      break;

    case 118:
      h[1] = h[1] | 0x010000;
      break;

    case 119:
      h[1] = h[1] | 0x01000000;
      break;

    case 120:
      h[2] = 0x01;
      break;

    case 121:
      h[2] = h[2] | 0x0100;
      break;

    case 122:
      h[2] = h[2] | 0x010000;
      break;

    case 123:
      h[2] = h[2] | 0x01000000;
      break;

    case 124:
      h[3] = 0x01;
      break;

    case 125:
      h[3] = h[3] | 0x0100;
      break;

    case 126:
      h[3] = h[3] | 0x010000;
      break;

    case 127:
      h[3] = h[3] | 0x01000000;
      break;
  }
}

inline void AJ(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;
  }
}

inline void AK(u32x a[4], u32x b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;
  }
}

inline void AL(u32x a[4], u32x b[4], u32x c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;
  }
}

inline void AM(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;

    case 48:
      d[0] = 0x02;
      break;

    case 49:
      d[0] = d[0] | 0x0200;
      break;

    case 50:
      d[0] = d[0] | 0x020000;
      break;

    case 51:
      d[0] = d[0] | 0x02000000;
      break;

    case 52:
      d[1] = 0x02;
      break;

    case 53:
      d[1] = d[1] | 0x0200;
      break;

    case 54:
      d[1] = d[1] | 0x020000;
      break;

    case 55:
      d[1] = d[1] | 0x02000000;
      break;

    case 56:
      d[2] = 0x02;
      break;

    case 57:
      d[2] = d[2] | 0x0200;
      break;

    case 58:
      d[2] = d[2] | 0x020000;
      break;

    case 59:
      d[2] = d[2] | 0x02000000;
      break;

    case 60:
      d[3] = 0x02;
      break;

    case 61:
      d[3] = d[3] | 0x0200;
      break;

    case 62:
      d[3] = d[3] | 0x020000;
      break;

    case 63:
      d[3] = d[3] | 0x02000000;
      break;
  }
}

inline void AN(u32x a[4], u32x b[4], u32x c[4], u32x d[4], u32x e[4], u32x f[4], u32x g[4], u32x h[4], const u32 i) {
  switch (i) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;

    case 48:
      d[0] = 0x02;
      break;

    case 49:
      d[0] = d[0] | 0x0200;
      break;

    case 50:
      d[0] = d[0] | 0x020000;
      break;

    case 51:
      d[0] = d[0] | 0x02000000;
      break;

    case 52:
      d[1] = 0x02;
      break;

    case 53:
      d[1] = d[1] | 0x0200;
      break;

    case 54:
      d[1] = d[1] | 0x020000;
      break;

    case 55:
      d[1] = d[1] | 0x02000000;
      break;

    case 56:
      d[2] = 0x02;
      break;

    case 57:
      d[2] = d[2] | 0x0200;
      break;

    case 58:
      d[2] = d[2] | 0x020000;
      break;

    case 59:
      d[2] = d[2] | 0x02000000;
      break;

    case 60:
      d[3] = 0x02;
      break;

    case 61:
      d[3] = d[3] | 0x0200;
      break;

    case 62:
      d[3] = d[3] | 0x020000;
      break;

    case 63:
      d[3] = d[3] | 0x02000000;
      break;

    case 64:
      e[0] = 0x02;
      break;

    case 65:
      e[0] = e[0] | 0x0200;
      break;

    case 66:
      e[0] = e[0] | 0x020000;
      break;

    case 67:
      e[0] = e[0] | 0x02000000;
      break;

    case 68:
      e[1] = 0x02;
      break;

    case 69:
      e[1] = e[1] | 0x0200;
      break;

    case 70:
      e[1] = e[1] | 0x020000;
      break;

    case 71:
      e[1] = e[1] | 0x02000000;
      break;

    case 72:
      e[2] = 0x02;
      break;

    case 73:
      e[2] = e[2] | 0x0200;
      break;

    case 74:
      e[2] = e[2] | 0x020000;
      break;

    case 75:
      e[2] = e[2] | 0x02000000;
      break;

    case 76:
      e[3] = 0x02;
      break;

    case 77:
      e[3] = e[3] | 0x0200;
      break;

    case 78:
      e[3] = e[3] | 0x020000;
      break;

    case 79:
      e[3] = e[3] | 0x02000000;
      break;

    case 80:
      f[0] = 0x02;
      break;

    case 81:
      f[0] = f[0] | 0x0200;
      break;

    case 82:
      f[0] = f[0] | 0x020000;
      break;

    case 83:
      f[0] = f[0] | 0x02000000;
      break;

    case 84:
      f[1] = 0x02;
      break;

    case 85:
      f[1] = f[1] | 0x0200;
      break;

    case 86:
      f[1] = f[1] | 0x020000;
      break;

    case 87:
      f[1] = f[1] | 0x02000000;
      break;

    case 88:
      f[2] = 0x02;
      break;

    case 89:
      f[2] = f[2] | 0x0200;
      break;

    case 90:
      f[2] = f[2] | 0x020000;
      break;

    case 91:
      f[2] = f[2] | 0x02000000;
      break;

    case 92:
      f[3] = 0x02;
      break;

    case 93:
      f[3] = f[3] | 0x0200;
      break;

    case 94:
      f[3] = f[3] | 0x020000;
      break;

    case 95:
      f[3] = f[3] | 0x02000000;
      break;

    case 96:
      g[0] = 0x02;
      break;

    case 97:
      g[0] = g[0] | 0x0200;
      break;

    case 98:
      g[0] = g[0] | 0x020000;
      break;

    case 99:
      g[0] = g[0] | 0x02000000;
      break;

    case 100:
      g[1] = 0x02;
      break;

    case 101:
      g[1] = g[1] | 0x0200;
      break;

    case 102:
      g[1] = g[1] | 0x020000;
      break;

    case 103:
      g[1] = g[1] | 0x02000000;
      break;

    case 104:
      g[2] = 0x02;
      break;

    case 105:
      g[2] = g[2] | 0x0200;
      break;

    case 106:
      g[2] = g[2] | 0x020000;
      break;

    case 107:
      g[2] = g[2] | 0x02000000;
      break;

    case 108:
      g[3] = 0x02;
      break;

    case 109:
      g[3] = g[3] | 0x0200;
      break;

    case 110:
      g[3] = g[3] | 0x020000;
      break;

    case 111:
      g[3] = g[3] | 0x02000000;
      break;

    case 112:
      h[0] = 0x02;
      break;

    case 113:
      h[0] = h[0] | 0x0200;
      break;

    case 114:
      h[0] = h[0] | 0x020000;
      break;

    case 115:
      h[0] = h[0] | 0x02000000;
      break;

    case 116:
      h[1] = 0x02;
      break;

    case 117:
      h[1] = h[1] | 0x0200;
      break;

    case 118:
      h[1] = h[1] | 0x020000;
      break;

    case 119:
      h[1] = h[1] | 0x02000000;
      break;

    case 120:
      h[2] = 0x02;
      break;

    case 121:
      h[2] = h[2] | 0x0200;
      break;

    case 122:
      h[2] = h[2] | 0x020000;
      break;

    case 123:
      h[2] = h[2] | 0x02000000;
      break;

    case 124:
      h[3] = 0x02;
      break;

    case 125:
      h[3] = h[3] | 0x0200;
      break;

    case 126:
      h[3] = h[3] | 0x020000;
      break;

    case 127:
      h[3] = h[3] | 0x02000000;
      break;
  }
}

inline void AO(u32x a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;
  }
}

inline void AP(u32x a[4], u32x b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;
  }
}

inline void AQ(u32x a[4], u32x b[4], u32x c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;
  }
}

inline void AR(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;

    case 48:
      d[0] = 0x80;
      break;

    case 49:
      d[0] = d[0] | 0x8000;
      break;

    case 50:
      d[0] = d[0] | 0x800000;
      break;

    case 51:
      d[0] = d[0] | 0x80000000;
      break;

    case 52:
      d[1] = 0x80;
      break;

    case 53:
      d[1] = d[1] | 0x8000;
      break;

    case 54:
      d[1] = d[1] | 0x800000;
      break;

    case 55:
      d[1] = d[1] | 0x80000000;
      break;

    case 56:
      d[2] = 0x80;
      break;

    case 57:
      d[2] = d[2] | 0x8000;
      break;

    case 58:
      d[2] = d[2] | 0x800000;
      break;

    case 59:
      d[2] = d[2] | 0x80000000;
      break;

    case 60:
      d[3] = 0x80;
      break;

    case 61:
      d[3] = d[3] | 0x8000;
      break;

    case 62:
      d[3] = d[3] | 0x800000;
      break;

    case 63:
      d[3] = d[3] | 0x80000000;
      break;
  }
}

inline void AS(u32x a[4], u32x b[4], u32x c[4], u32x d[4], u32x e[4], u32x f[4], u32x g[4], u32x h[4], const u32 i) {
  switch (i) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;

    case 48:
      d[0] = 0x80;
      break;

    case 49:
      d[0] = d[0] | 0x8000;
      break;

    case 50:
      d[0] = d[0] | 0x800000;
      break;

    case 51:
      d[0] = d[0] | 0x80000000;
      break;

    case 52:
      d[1] = 0x80;
      break;

    case 53:
      d[1] = d[1] | 0x8000;
      break;

    case 54:
      d[1] = d[1] | 0x800000;
      break;

    case 55:
      d[1] = d[1] | 0x80000000;
      break;

    case 56:
      d[2] = 0x80;
      break;

    case 57:
      d[2] = d[2] | 0x8000;
      break;

    case 58:
      d[2] = d[2] | 0x800000;
      break;

    case 59:
      d[2] = d[2] | 0x80000000;
      break;

    case 60:
      d[3] = 0x80;
      break;

    case 61:
      d[3] = d[3] | 0x8000;
      break;

    case 62:
      d[3] = d[3] | 0x800000;
      break;

    case 63:
      d[3] = d[3] | 0x80000000;
      break;

    case 64:
      e[0] = 0x80;
      break;

    case 65:
      e[0] = e[0] | 0x8000;
      break;

    case 66:
      e[0] = e[0] | 0x800000;
      break;

    case 67:
      e[0] = e[0] | 0x80000000;
      break;

    case 68:
      e[1] = 0x80;
      break;

    case 69:
      e[1] = e[1] | 0x8000;
      break;

    case 70:
      e[1] = e[1] | 0x800000;
      break;

    case 71:
      e[1] = e[1] | 0x80000000;
      break;

    case 72:
      e[2] = 0x80;
      break;

    case 73:
      e[2] = e[2] | 0x8000;
      break;

    case 74:
      e[2] = e[2] | 0x800000;
      break;

    case 75:
      e[2] = e[2] | 0x80000000;
      break;

    case 76:
      e[3] = 0x80;
      break;

    case 77:
      e[3] = e[3] | 0x8000;
      break;

    case 78:
      e[3] = e[3] | 0x800000;
      break;

    case 79:
      e[3] = e[3] | 0x80000000;
      break;

    case 80:
      f[0] = 0x80;
      break;

    case 81:
      f[0] = f[0] | 0x8000;
      break;

    case 82:
      f[0] = f[0] | 0x800000;
      break;

    case 83:
      f[0] = f[0] | 0x80000000;
      break;

    case 84:
      f[1] = 0x80;
      break;

    case 85:
      f[1] = f[1] | 0x8000;
      break;

    case 86:
      f[1] = f[1] | 0x800000;
      break;

    case 87:
      f[1] = f[1] | 0x80000000;
      break;

    case 88:
      f[2] = 0x80;
      break;

    case 89:
      f[2] = f[2] | 0x8000;
      break;

    case 90:
      f[2] = f[2] | 0x800000;
      break;

    case 91:
      f[2] = f[2] | 0x80000000;
      break;

    case 92:
      f[3] = 0x80;
      break;

    case 93:
      f[3] = f[3] | 0x8000;
      break;

    case 94:
      f[3] = f[3] | 0x800000;
      break;

    case 95:
      f[3] = f[3] | 0x80000000;
      break;

    case 96:
      g[0] = 0x80;
      break;

    case 97:
      g[0] = g[0] | 0x8000;
      break;

    case 98:
      g[0] = g[0] | 0x800000;
      break;

    case 99:
      g[0] = g[0] | 0x80000000;
      break;

    case 100:
      g[1] = 0x80;
      break;

    case 101:
      g[1] = g[1] | 0x8000;
      break;

    case 102:
      g[1] = g[1] | 0x800000;
      break;

    case 103:
      g[1] = g[1] | 0x80000000;
      break;

    case 104:
      g[2] = 0x80;
      break;

    case 105:
      g[2] = g[2] | 0x8000;
      break;

    case 106:
      g[2] = g[2] | 0x800000;
      break;

    case 107:
      g[2] = g[2] | 0x80000000;
      break;

    case 108:
      g[3] = 0x80;
      break;

    case 109:
      g[3] = g[3] | 0x8000;
      break;

    case 110:
      g[3] = g[3] | 0x800000;
      break;

    case 111:
      g[3] = g[3] | 0x80000000;
      break;

    case 112:
      h[0] = 0x80;
      break;

    case 113:
      h[0] = h[0] | 0x8000;
      break;

    case 114:
      h[0] = h[0] | 0x800000;
      break;

    case 115:
      h[0] = h[0] | 0x80000000;
      break;

    case 116:
      h[1] = 0x80;
      break;

    case 117:
      h[1] = h[1] | 0x8000;
      break;

    case 118:
      h[1] = h[1] | 0x800000;
      break;

    case 119:
      h[1] = h[1] | 0x80000000;
      break;

    case 120:
      h[2] = 0x80;
      break;

    case 121:
      h[2] = h[2] | 0x8000;
      break;

    case 122:
      h[2] = h[2] | 0x800000;
      break;

    case 123:
      h[2] = h[2] | 0x80000000;
      break;

    case 124:
      h[3] = 0x80;
      break;

    case 125:
      h[3] = h[3] | 0x8000;
      break;

    case 126:
      h[3] = h[3] | 0x800000;
      break;

    case 127:
      h[3] = h[3] | 0x80000000;
      break;
  }
}

inline void AT(u32x a[16], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      a[4] = 0x80;
      break;

    case 17:
      a[4] = a[4] | 0x8000;
      break;

    case 18:
      a[4] = a[4] | 0x800000;
      break;

    case 19:
      a[4] = a[4] | 0x80000000;
      break;

    case 20:
      a[5] = 0x80;
      break;

    case 21:
      a[5] = a[5] | 0x8000;
      break;

    case 22:
      a[5] = a[5] | 0x800000;
      break;

    case 23:
      a[5] = a[5] | 0x80000000;
      break;

    case 24:
      a[6] = 0x80;
      break;

    case 25:
      a[6] = a[6] | 0x8000;
      break;

    case 26:
      a[6] = a[6] | 0x800000;
      break;

    case 27:
      a[6] = a[6] | 0x80000000;
      break;

    case 28:
      a[7] = 0x80;
      break;

    case 29:
      a[7] = a[7] | 0x8000;
      break;

    case 30:
      a[7] = a[7] | 0x800000;
      break;

    case 31:
      a[7] = a[7] | 0x80000000;
      break;

    case 32:
      a[8] = 0x80;
      break;

    case 33:
      a[8] = a[8] | 0x8000;
      break;

    case 34:
      a[8] = a[8] | 0x800000;
      break;

    case 35:
      a[8] = a[8] | 0x80000000;
      break;

    case 36:
      a[9] = 0x80;
      break;

    case 37:
      a[9] = a[9] | 0x8000;
      break;

    case 38:
      a[9] = a[9] | 0x800000;
      break;

    case 39:
      a[9] = a[9] | 0x80000000;
      break;

    case 40:
      a[10] = 0x80;
      break;

    case 41:
      a[10] = a[10] | 0x8000;
      break;

    case 42:
      a[10] = a[10] | 0x800000;
      break;

    case 43:
      a[10] = a[10] | 0x80000000;
      break;

    case 44:
      a[11] = 0x80;
      break;

    case 45:
      a[11] = a[11] | 0x8000;
      break;

    case 46:
      a[11] = a[11] | 0x800000;
      break;

    case 47:
      a[11] = a[11] | 0x80000000;
      break;

    case 48:
      a[12] = 0x80;
      break;

    case 49:
      a[12] = a[12] | 0x8000;
      break;

    case 50:
      a[12] = a[12] | 0x800000;
      break;

    case 51:
      a[12] = a[12] | 0x80000000;
      break;

    case 52:
      a[13] = 0x80;
      break;

    case 53:
      a[13] = a[13] | 0x8000;
      break;

    case 54:
      a[13] = a[13] | 0x800000;
      break;

    case 55:
      a[13] = a[13] | 0x80000000;
      break;

    case 56:
      a[14] = 0x80;
      break;

    case 57:
      a[14] = a[14] | 0x8000;
      break;

    case 58:
      a[14] = a[14] | 0x800000;
      break;

    case 59:
      a[14] = a[14] | 0x80000000;
      break;

    case 60:
      a[15] = 0x80;
      break;

    case 61:
      a[15] = a[15] | 0x8000;
      break;

    case 62:
      a[15] = a[15] | 0x800000;
      break;

    case 63:
      a[15] = a[15] | 0x80000000;
      break;
  }
}

inline void AU(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  const int f = e & 3;

  const int g = 4 - e;

  switch (e / 4) {
    case 0:
      d[2] = U(0, d[1], g);
      d[1] = U(d[1], d[0], g);
      d[0] = U(d[0], c[3], g);
      c[3] = U(c[3], c[2], g);
      c[2] = U(c[2], c[1], g);
      c[1] = U(c[1], c[0], g);
      c[0] = U(c[0], b[3], g);
      b[3] = U(b[3], b[2], g);
      b[2] = U(b[2], b[1], g);
      b[1] = U(b[1], b[0], g);
      b[0] = U(b[0], a[3], g);
      a[3] = U(a[3], a[2], g);
      a[2] = U(a[2], a[1], g);
      a[1] = U(a[1], a[0], g);
      a[0] = U(a[0], 0, g);

      if (f == 0) {
        a[0] = a[1];
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 1:
      d[2] = U(0, d[0], g);
      d[1] = U(d[0], c[3], g);
      d[0] = U(c[3], c[2], g);
      c[3] = U(c[2], c[1], g);
      c[2] = U(c[1], c[0], g);
      c[1] = U(c[0], b[3], g);
      c[0] = U(b[3], b[2], g);
      b[3] = U(b[2], b[1], g);
      b[2] = U(b[1], b[0], g);
      b[1] = U(b[0], a[3], g);
      b[0] = U(a[3], a[2], g);
      a[3] = U(a[2], a[1], g);
      a[2] = U(a[1], a[0], g);
      a[1] = U(a[0], 0, g);
      a[0] = 0;

      if (f == 0) {
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 2:
      d[2] = U(0, c[3], g);
      d[1] = U(c[3], c[2], g);
      d[0] = U(c[2], c[1], g);
      c[3] = U(c[1], c[0], g);
      c[2] = U(c[0], b[3], g);
      c[1] = U(b[3], b[2], g);
      c[0] = U(b[2], b[1], g);
      b[3] = U(b[1], b[0], g);
      b[2] = U(b[0], a[3], g);
      b[1] = U(a[3], a[2], g);
      b[0] = U(a[2], a[1], g);
      a[3] = U(a[1], a[0], g);
      a[2] = U(a[0], 0, g);
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 3:
      d[2] = U(0, c[2], g);
      d[1] = U(c[2], c[1], g);
      d[0] = U(c[1], c[0], g);
      c[3] = U(c[0], b[3], g);
      c[2] = U(b[3], b[2], g);
      c[1] = U(b[2], b[1], g);
      c[0] = U(b[1], b[0], g);
      b[3] = U(b[0], a[3], g);
      b[2] = U(a[3], a[2], g);
      b[1] = U(a[2], a[1], g);
      b[0] = U(a[1], a[0], g);
      a[3] = U(a[0], 0, g);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 4:
      d[2] = U(0, c[1], g);
      d[1] = U(c[1], c[0], g);
      d[0] = U(c[0], b[3], g);
      c[3] = U(b[3], b[2], g);
      c[2] = U(b[2], b[1], g);
      c[1] = U(b[1], b[0], g);
      c[0] = U(b[0], a[3], g);
      b[3] = U(a[3], a[2], g);
      b[2] = U(a[2], a[1], g);
      b[1] = U(a[1], a[0], g);
      b[0] = U(a[0], 0, g);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 5:
      d[2] = U(0, c[0], g);
      d[1] = U(c[0], b[3], g);
      d[0] = U(b[3], b[2], g);
      c[3] = U(b[2], b[1], g);
      c[2] = U(b[1], b[0], g);
      c[1] = U(b[0], a[3], g);
      c[0] = U(a[3], a[2], g);
      b[3] = U(a[2], a[1], g);
      b[2] = U(a[1], a[0], g);
      b[1] = U(a[0], 0, g);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 6:
      d[2] = U(0, b[3], g);
      d[1] = U(b[3], b[2], g);
      d[0] = U(b[2], b[1], g);
      c[3] = U(b[1], b[0], g);
      c[2] = U(b[0], a[3], g);
      c[1] = U(a[3], a[2], g);
      c[0] = U(a[2], a[1], g);
      b[3] = U(a[1], a[0], g);
      b[2] = U(a[0], 0, g);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 7:
      d[2] = U(0, b[2], g);
      d[1] = U(b[2], b[1], g);
      d[0] = U(b[1], b[0], g);
      c[3] = U(b[0], a[3], g);
      c[2] = U(a[3], a[2], g);
      c[1] = U(a[2], a[1], g);
      c[0] = U(a[1], a[0], g);
      b[3] = U(a[0], 0, g);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 8:
      d[2] = U(0, b[1], g);
      d[1] = U(b[1], b[0], g);
      d[0] = U(b[0], a[3], g);
      c[3] = U(a[3], a[2], g);
      c[2] = U(a[2], a[1], g);
      c[1] = U(a[1], a[0], g);
      c[0] = U(a[0], 0, g);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 9:
      d[2] = U(0, b[0], g);
      d[1] = U(b[0], a[3], g);
      d[0] = U(a[3], a[2], g);
      c[3] = U(a[2], a[1], g);
      c[2] = U(a[1], a[0], g);
      c[1] = U(a[0], 0, g);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 10:
      d[2] = U(0, a[3], g);
      d[1] = U(a[3], a[2], g);
      d[0] = U(a[2], a[1], g);
      c[3] = U(a[1], a[0], g);
      c[2] = U(a[0], 0, g);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 11:
      d[2] = U(0, a[2], g);
      d[1] = U(a[2], a[1], g);
      d[0] = U(a[1], a[0], g);
      c[3] = U(a[0], 0, g);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 12:
      d[2] = U(0, a[1], g);
      d[1] = U(a[1], a[0], g);
      d[0] = U(a[0], 0, g);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 13:
      d[2] = U(0, a[0], g);
      d[1] = U(a[0], 0, g);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[1] = d[2];
        d[2] = 0;
      }

      break;
  }
}

inline void AV(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32 e) {
  switch (e / 4) {
    case 0:
      d[2] = U(d[1], 0, e);
      d[1] = U(d[0], d[1], e);
      d[0] = U(c[3], d[0], e);
      c[3] = U(c[2], c[3], e);
      c[2] = U(c[1], c[2], e);
      c[1] = U(c[0], c[1], e);
      c[0] = U(b[3], c[0], e);
      b[3] = U(b[2], b[3], e);
      b[2] = U(b[1], b[2], e);
      b[1] = U(b[0], b[1], e);
      b[0] = U(a[3], b[0], e);
      a[3] = U(a[2], a[3], e);
      a[2] = U(a[1], a[2], e);
      a[1] = U(a[0], a[1], e);
      a[0] = U(0, a[0], e);
      break;

    case 1:
      d[2] = U(d[0], 0, e);
      d[1] = U(c[3], d[0], e);
      d[0] = U(c[2], c[3], e);
      c[3] = U(c[1], c[2], e);
      c[2] = U(c[0], c[1], e);
      c[1] = U(b[3], c[0], e);
      c[0] = U(b[2], b[3], e);
      b[3] = U(b[1], b[2], e);
      b[2] = U(b[0], b[1], e);
      b[1] = U(a[3], b[0], e);
      b[0] = U(a[2], a[3], e);
      a[3] = U(a[1], a[2], e);
      a[2] = U(a[0], a[1], e);
      a[1] = U(0, a[0], e);
      a[0] = 0;
      break;

    case 2:
      d[2] = U(c[3], 0, e);
      d[1] = U(c[2], c[3], e);
      d[0] = U(c[1], c[2], e);
      c[3] = U(c[0], c[1], e);
      c[2] = U(b[3], c[0], e);
      c[1] = U(b[2], b[3], e);
      c[0] = U(b[1], b[2], e);
      b[3] = U(b[0], b[1], e);
      b[2] = U(a[3], b[0], e);
      b[1] = U(a[2], a[3], e);
      b[0] = U(a[1], a[2], e);
      a[3] = U(a[0], a[1], e);
      a[2] = U(0, a[0], e);
      a[1] = 0;
      a[0] = 0;
      break;

    case 3:
      d[2] = U(c[2], 0, e);
      d[1] = U(c[1], c[2], e);
      d[0] = U(c[0], c[1], e);
      c[3] = U(b[3], c[0], e);
      c[2] = U(b[2], b[3], e);
      c[1] = U(b[1], b[2], e);
      c[0] = U(b[0], b[1], e);
      b[3] = U(a[3], b[0], e);
      b[2] = U(a[2], a[3], e);
      b[1] = U(a[1], a[2], e);
      b[0] = U(a[0], a[1], e);
      a[3] = U(0, a[0], e);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 4:
      d[2] = U(c[1], 0, e);
      d[1] = U(c[0], c[1], e);
      d[0] = U(b[3], c[0], e);
      c[3] = U(b[2], b[3], e);
      c[2] = U(b[1], b[2], e);
      c[1] = U(b[0], b[1], e);
      c[0] = U(a[3], b[0], e);
      b[3] = U(a[2], a[3], e);
      b[2] = U(a[1], a[2], e);
      b[1] = U(a[0], a[1], e);
      b[0] = U(0, a[0], e);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 5:
      d[2] = U(c[0], 0, e);
      d[1] = U(b[3], c[0], e);
      d[0] = U(b[2], b[3], e);
      c[3] = U(b[1], b[2], e);
      c[2] = U(b[0], b[1], e);
      c[1] = U(a[3], b[0], e);
      c[0] = U(a[2], a[3], e);
      b[3] = U(a[1], a[2], e);
      b[2] = U(a[0], a[1], e);
      b[1] = U(0, a[0], e);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 6:
      d[2] = U(b[3], 0, e);
      d[1] = U(b[2], b[3], e);
      d[0] = U(b[1], b[2], e);
      c[3] = U(b[0], b[1], e);
      c[2] = U(a[3], b[0], e);
      c[1] = U(a[2], a[3], e);
      c[0] = U(a[1], a[2], e);
      b[3] = U(a[0], a[1], e);
      b[2] = U(0, a[0], e);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 7:
      d[2] = U(b[2], 0, e);
      d[1] = U(b[1], b[2], e);
      d[0] = U(b[0], b[1], e);
      c[3] = U(a[3], b[0], e);
      c[2] = U(a[2], a[3], e);
      c[1] = U(a[1], a[2], e);
      c[0] = U(a[0], a[1], e);
      b[3] = U(0, a[0], e);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 8:
      d[2] = U(b[1], 0, e);
      d[1] = U(b[0], b[1], e);
      d[0] = U(a[3], b[0], e);
      c[3] = U(a[2], a[3], e);
      c[2] = U(a[1], a[2], e);
      c[1] = U(a[0], a[1], e);
      c[0] = U(0, a[0], e);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 9:
      d[2] = U(b[0], 0, e);
      d[1] = U(a[3], b[0], e);
      d[0] = U(a[2], a[3], e);
      c[3] = U(a[1], a[2], e);
      c[2] = U(a[0], a[1], e);
      c[1] = U(0, a[0], e);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 10:
      d[2] = U(a[3], 0, e);
      d[1] = U(a[2], a[3], e);
      d[0] = U(a[1], a[2], e);
      c[3] = U(a[0], a[1], e);
      c[2] = U(0, a[0], e);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 11:
      d[2] = U(a[2], 0, e);
      d[1] = U(a[1], a[2], e);
      d[0] = U(a[0], a[1], e);
      c[3] = U(0, a[0], e);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 12:
      d[2] = U(a[1], 0, e);
      d[1] = U(a[0], a[1], e);
      d[0] = U(0, a[0], e);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 13:
      d[2] = U(a[0], 0, e);
      d[1] = U(0, a[0], e);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;
  }
}

inline void AW(u32x a[16], const u32x b, const u32 c) {
  switch (c) {
    case 0:
      a[0] = b;
      break;
    case 1:
      a[0] = (a[0] & 0x000000ff) | (b << 8);
      a[1] = (a[1] & 0xffffff00) | (b >> 24);
      break;
    case 2:
      a[0] = (a[0] & 0x0000ffff) | (b << 16);
      a[1] = (a[1] & 0xffff0000) | (b >> 16);
      break;
    case 3:
      a[0] = (a[0] & 0x00ffffff) | (b << 24);
      a[1] = (a[1] & 0xff000000) | (b >> 8);
      break;
    case 4:
      a[1] = b;
      break;
    case 5:
      a[1] = (a[1] & 0x000000ff) | (b << 8);
      a[2] = (a[2] & 0xffffff00) | (b >> 24);
      break;
    case 6:
      a[1] = (a[1] & 0x0000ffff) | (b << 16);
      a[2] = (a[2] & 0xffff0000) | (b >> 16);
      break;
    case 7:
      a[1] = (a[1] & 0x00ffffff) | (b << 24);
      a[2] = (a[2] & 0xff000000) | (b >> 8);
      break;
    case 8:
      a[2] = b;
      break;
    case 9:
      a[2] = (a[2] & 0x000000ff) | (b << 8);
      a[3] = (a[3] & 0xffffff00) | (b >> 24);
      break;
    case 10:
      a[2] = (a[2] & 0x0000ffff) | (b << 16);
      a[3] = (a[3] & 0xffff0000) | (b >> 16);
      break;
    case 11:
      a[2] = (a[2] & 0x00ffffff) | (b << 24);
      a[3] = (a[3] & 0xff000000) | (b >> 8);
      break;
    case 12:
      a[3] = b;
      break;
    case 13:
      a[3] = (a[3] & 0x000000ff) | (b << 8);
      a[4] = (a[4] & 0xffffff00) | (b >> 24);
      break;
    case 14:
      a[3] = (a[3] & 0x0000ffff) | (b << 16);
      a[4] = (a[4] & 0xffff0000) | (b >> 16);
      break;
    case 15:
      a[3] = (a[3] & 0x00ffffff) | (b << 24);
      a[4] = (a[4] & 0xff000000) | (b >> 8);
      break;
    case 16:
      a[4] = b;
      break;
    case 17:
      a[4] = (a[4] & 0x000000ff) | (b << 8);
      a[5] = (a[5] & 0xffffff00) | (b >> 24);
      break;
    case 18:
      a[4] = (a[4] & 0x0000ffff) | (b << 16);
      a[5] = (a[5] & 0xffff0000) | (b >> 16);
      break;
    case 19:
      a[4] = (a[4] & 0x00ffffff) | (b << 24);
      a[5] = (a[5] & 0xff000000) | (b >> 8);
      break;
    case 20:
      a[5] = b;
      break;
    case 21:
      a[5] = (a[5] & 0x000000ff) | (b << 8);
      a[6] = (a[6] & 0xffffff00) | (b >> 24);
      break;
    case 22:
      a[5] = (a[5] & 0x0000ffff) | (b << 16);
      a[6] = (a[6] & 0xffff0000) | (b >> 16);
      break;
    case 23:
      a[5] = (a[5] & 0x00ffffff) | (b << 24);
      a[6] = (a[6] & 0xff000000) | (b >> 8);
      break;
    case 24:
      a[6] = b;
      break;
    case 25:
      a[6] = (a[6] & 0x000000ff) | (b << 8);
      a[7] = (a[7] & 0xffffff00) | (b >> 24);
      break;
    case 26:
      a[6] = (a[6] & 0x0000ffff) | (b << 16);
      a[7] = (a[7] & 0xffff0000) | (b >> 16);
      break;
    case 27:
      a[6] = (a[6] & 0x00ffffff) | (b << 24);
      a[7] = (a[7] & 0xff000000) | (b >> 8);
      break;
    case 28:
      a[7] = b;
      break;
    case 29:
      a[7] = (a[7] & 0x000000ff) | (b << 8);
      a[8] = (a[8] & 0xffffff00) | (b >> 24);
      break;
    case 30:
      a[7] = (a[7] & 0x0000ffff) | (b << 16);
      a[8] = (a[8] & 0xffff0000) | (b >> 16);
      break;
    case 31:
      a[7] = (a[7] & 0x00ffffff) | (b << 24);
      a[8] = (a[8] & 0xff000000) | (b >> 8);
      break;
  }
}

inline void AX(u32x a[16], const u32x b, const u32 c) {
  switch (c) {
    case 0:
      a[0] = b;
      break;
    case 1:
      a[0] = (a[0] & 0xff000000) | (b >> 8);
      a[1] = (a[1] & 0x00ffffff) | (b << 24);
      break;
    case 2:
      a[0] = (a[0] & 0xffff0000) | (b >> 16);
      a[1] = (a[1] & 0x0000ffff) | (b << 16);
      break;
    case 3:
      a[0] = (a[0] & 0xffffff00) | (b >> 24);
      a[1] = (a[1] & 0x000000ff) | (b << 8);
      break;
    case 4:
      a[1] = b;
      break;
    case 5:
      a[1] = (a[1] & 0xff000000) | (b >> 8);
      a[2] = (a[2] & 0x00ffffff) | (b << 24);
      break;
    case 6:
      a[1] = (a[1] & 0xffff0000) | (b >> 16);
      a[2] = (a[2] & 0x0000ffff) | (b << 16);
      break;
    case 7:
      a[1] = (a[1] & 0xffffff00) | (b >> 24);
      a[2] = (a[2] & 0x000000ff) | (b << 8);
      break;
    case 8:
      a[2] = b;
      break;
    case 9:
      a[2] = (a[2] & 0xff000000) | (b >> 8);
      a[3] = (a[3] & 0x00ffffff) | (b << 24);
      break;
    case 10:
      a[2] = (a[2] & 0xffff0000) | (b >> 16);
      a[3] = (a[3] & 0x0000ffff) | (b << 16);
      break;
    case 11:
      a[2] = (a[2] & 0xffffff00) | (b >> 24);
      a[3] = (a[3] & 0x000000ff) | (b << 8);
      break;
    case 12:
      a[3] = b;
      break;
    case 13:
      a[3] = (a[3] & 0xff000000) | (b >> 8);
      a[4] = (a[4] & 0x00ffffff) | (b << 24);
      break;
    case 14:
      a[3] = (a[3] & 0xffff0000) | (b >> 16);
      a[4] = (a[4] & 0x0000ffff) | (b << 16);
      break;
    case 15:
      a[3] = (a[3] & 0xffffff00) | (b >> 24);
      a[4] = (a[4] & 0x000000ff) | (b << 8);
      break;
    case 16:
      a[4] = b;
      break;
    case 17:
      a[4] = (a[4] & 0xff000000) | (b >> 8);
      a[5] = (a[5] & 0x00ffffff) | (b << 24);
      break;
    case 18:
      a[4] = (a[4] & 0xffff0000) | (b >> 16);
      a[5] = (a[5] & 0x0000ffff) | (b << 16);
      break;
    case 19:
      a[4] = (a[4] & 0xffffff00) | (b >> 24);
      a[5] = (a[5] & 0x000000ff) | (b << 8);
      break;
    case 20:
      a[5] = b;
      break;
    case 21:
      a[5] = (a[5] & 0xff000000) | (b >> 8);
      a[6] = (a[6] & 0x00ffffff) | (b << 24);
      break;
    case 22:
      a[5] = (a[5] & 0xffff0000) | (b >> 16);
      a[6] = (a[6] & 0x0000ffff) | (b << 16);
      break;
    case 23:
      a[5] = (a[5] & 0xffffff00) | (b >> 24);
      a[6] = (a[6] & 0x000000ff) | (b << 8);
      break;
    case 24:
      a[6] = b;
      break;
    case 25:
      a[6] = (a[6] & 0xff000000) | (b >> 8);
      a[7] = (a[7] & 0x00ffffff) | (b << 24);
      break;
    case 26:
      a[6] = (a[6] & 0xffff0000) | (b >> 16);
      a[7] = (a[7] & 0x0000ffff) | (b << 16);
      break;
    case 27:
      a[6] = (a[6] & 0xffffff00) | (b >> 24);
      a[7] = (a[7] & 0x000000ff) | (b << 8);
      break;
    case 28:
      a[7] = b;
      break;
    case 29:
      a[7] = (a[7] & 0xff000000) | (b >> 8);
      a[8] = (a[8] & 0x00ffffff) | (b << 24);
      break;
    case 30:
      a[7] = (a[7] & 0xffff0000) | (b >> 16);
      a[8] = (a[8] & 0x0000ffff) | (b << 16);
      break;
    case 31:
      a[7] = (a[7] & 0xffffff00) | (b >> 24);
      a[8] = (a[8] & 0x000000ff) | (b << 8);
      break;
  }
}

inline void AY(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e, const u32 f) {
  switch (f) {
    case 0:
      a[0] = e;
      break;
    case 1:
      a[0] = (a[0] & 0x000000ff) | (e << 8);
      a[1] = (a[1] & 0xffffff00) | (e >> 24);
      break;
    case 2:
      a[0] = (a[0] & 0x0000ffff) | (e << 16);
      a[1] = (a[1] & 0xffff0000) | (e >> 16);
      break;
    case 3:
      a[0] = (a[0] & 0x00ffffff) | (e << 24);
      a[1] = (a[1] & 0xff000000) | (e >> 8);
      break;
    case 4:
      a[1] = e;
      break;
    case 5:
      a[1] = (a[1] & 0x000000ff) | (e << 8);
      a[2] = (a[2] & 0xffffff00) | (e >> 24);
      break;
    case 6:
      a[1] = (a[1] & 0x0000ffff) | (e << 16);
      a[2] = (a[2] & 0xffff0000) | (e >> 16);
      break;
    case 7:
      a[1] = (a[1] & 0x00ffffff) | (e << 24);
      a[2] = (a[2] & 0xff000000) | (e >> 8);
      break;
    case 8:
      a[2] = e;
      break;
    case 9:
      a[2] = (a[2] & 0x000000ff) | (e << 8);
      a[3] = (a[3] & 0xffffff00) | (e >> 24);
      break;
    case 10:
      a[2] = (a[2] & 0x0000ffff) | (e << 16);
      a[3] = (a[3] & 0xffff0000) | (e >> 16);
      break;
    case 11:
      a[2] = (a[2] & 0x00ffffff) | (e << 24);
      a[3] = (a[3] & 0xff000000) | (e >> 8);
      break;
    case 12:
      a[3] = e;
      break;
    case 13:
      a[3] = (a[3] & 0x000000ff) | (e << 8);
      b[0] = (b[0] & 0xffffff00) | (e >> 24);
      break;
    case 14:
      a[3] = (a[3] & 0x0000ffff) | (e << 16);
      b[0] = (b[0] & 0xffff0000) | (e >> 16);
      break;
    case 15:
      a[3] = (a[3] & 0x00ffffff) | (e << 24);
      b[0] = (b[0] & 0xff000000) | (e >> 8);
      break;
    case 16:
      b[0] = e;
      break;
    case 17:
      b[0] = (b[0] & 0x000000ff) | (e << 8);
      b[1] = (b[1] & 0xffffff00) | (e >> 24);
      break;
    case 18:
      b[0] = (b[0] & 0x0000ffff) | (e << 16);
      b[1] = (b[1] & 0xffff0000) | (e >> 16);
      break;
    case 19:
      b[0] = (b[0] & 0x00ffffff) | (e << 24);
      b[1] = (b[1] & 0xff000000) | (e >> 8);
      break;
    case 20:
      b[1] = e;
      break;
    case 21:
      b[1] = (b[1] & 0x000000ff) | (e << 8);
      b[2] = (b[2] & 0xffffff00) | (e >> 24);
      break;
    case 22:
      b[1] = (b[1] & 0x0000ffff) | (e << 16);
      b[2] = (b[2] & 0xffff0000) | (e >> 16);
      break;
    case 23:
      b[1] = (b[1] & 0x00ffffff) | (e << 24);
      b[2] = (b[2] & 0xff000000) | (e >> 8);
      break;
    case 24:
      b[2] = e;
      break;
    case 25:
      b[2] = (b[2] & 0x000000ff) | (e << 8);
      b[3] = (b[3] & 0xffffff00) | (e >> 24);
      break;
    case 26:
      b[2] = (b[2] & 0x0000ffff) | (e << 16);
      b[3] = (b[3] & 0xffff0000) | (e >> 16);
      break;
    case 27:
      b[2] = (b[2] & 0x00ffffff) | (e << 24);
      b[3] = (b[3] & 0xff000000) | (e >> 8);
      break;
    case 28:
      b[3] = e;
      break;
    case 29:
      b[3] = (b[3] & 0x000000ff) | (e << 8);
      c[0] = (c[0] & 0xffffff00) | (e >> 24);
      break;
    case 30:
      b[3] = (b[3] & 0x0000ffff) | (e << 16);
      c[0] = (c[0] & 0xffff0000) | (e >> 16);
      break;
    case 31:
      b[3] = (b[3] & 0x00ffffff) | (e << 24);
      c[0] = (c[0] & 0xff000000) | (e >> 8);
      break;
    case 32:
      c[0] = e;
      break;
    case 33:
      c[0] = (c[0] & 0x000000ff) | (e << 8);
      c[1] = (c[1] & 0xffffff00) | (e >> 24);
      break;
    case 34:
      c[0] = (c[0] & 0x0000ffff) | (e << 16);
      c[1] = (c[1] & 0xffff0000) | (e >> 16);
      break;
    case 35:
      c[0] = (c[0] & 0x00ffffff) | (e << 24);
      c[1] = (c[1] & 0xff000000) | (e >> 8);
      break;
    case 36:
      c[1] = e;
      break;
    case 37:
      c[1] = (c[1] & 0x000000ff) | (e << 8);
      c[2] = (c[2] & 0xffffff00) | (e >> 24);
      break;
    case 38:
      c[1] = (c[1] & 0x0000ffff) | (e << 16);
      c[2] = (c[2] & 0xffff0000) | (e >> 16);
      break;
    case 39:
      c[1] = (c[1] & 0x00ffffff) | (e << 24);
      c[2] = (c[2] & 0xff000000) | (e >> 8);
      break;
    case 40:
      c[2] = e;
      break;
    case 41:
      c[2] = (c[2] & 0x000000ff) | (e << 8);
      c[3] = (c[3] & 0xffffff00) | (e >> 24);
      break;
    case 42:
      c[2] = (c[2] & 0x0000ffff) | (e << 16);
      c[3] = (c[3] & 0xffff0000) | (e >> 16);
      break;
    case 43:
      c[2] = (c[2] & 0x00ffffff) | (e << 24);
      c[3] = (c[3] & 0xff000000) | (e >> 8);
      break;
    case 44:
      c[3] = e;
      break;
    case 45:
      c[3] = (c[3] & 0x000000ff) | (e << 8);
      d[0] = (d[0] & 0xffffff00) | (e >> 24);
      break;
    case 46:
      c[3] = (c[3] & 0x0000ffff) | (e << 16);
      d[0] = (d[0] & 0xffff0000) | (e >> 16);
      break;
    case 47:
      c[3] = (c[3] & 0x00ffffff) | (e << 24);
      d[0] = (d[0] & 0xff000000) | (e >> 8);
      break;
    case 48:
      d[0] = e;
      break;
    case 49:
      d[0] = (d[0] & 0x000000ff) | (e << 8);
      d[1] = (d[1] & 0xffffff00) | (e >> 24);
      break;
    case 50:
      d[0] = (d[0] & 0x0000ffff) | (e << 16);
      d[1] = (d[1] & 0xffff0000) | (e >> 16);
      break;
    case 51:
      d[0] = (d[0] & 0x00ffffff) | (e << 24);
      d[1] = (d[1] & 0xff000000) | (e >> 8);
      break;
    case 52:
      d[1] = e;
      break;
    case 53:
      d[1] = (d[1] & 0x000000ff) | (e << 8);
      d[2] = (d[2] & 0xffffff00) | (e >> 24);
      break;
    case 54:
      d[1] = (d[1] & 0x0000ffff) | (e << 16);
      d[2] = (d[2] & 0xffff0000) | (e >> 16);
      break;
    case 55:
      d[1] = (d[1] & 0x00ffffff) | (e << 24);
      d[2] = (d[2] & 0xff000000) | (e >> 8);
      break;
    case 56:
      d[2] = e;
      break;
    case 57:
      d[2] = (d[2] & 0x000000ff) | (e << 8);
      d[3] = (d[3] & 0xffffff00) | (e >> 24);
      break;
    case 58:
      d[2] = (d[2] & 0x0000ffff) | (e << 16);
      d[3] = (d[3] & 0xffff0000) | (e >> 16);
      break;
    case 59:
      d[2] = (d[2] & 0x00ffffff) | (e << 24);
      d[3] = (d[3] & 0xff000000) | (e >> 8);
      break;
    case 60:
      d[3] = e;
      break;
    case 61:
      d[3] = (d[3] & 0x000000ff) | (e << 8);

      break;
    case 62:
      d[3] = (d[3] & 0x0000ffff) | (e << 16);

      break;
    case 63:
      d[3] = (d[3] & 0x00ffffff) | (e << 24);

      break;
  }
}

inline void AZ(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e, const u32 f) {
  switch (f) {
    case 0:
      a[0] = e;
      break;
    case 1:
      a[0] = (a[0] & 0xff000000) | (e >> 8);
      a[1] = (a[1] & 0x00ffffff) | (e << 24);
      break;
    case 2:
      a[0] = (a[0] & 0xffff0000) | (e >> 16);
      a[1] = (a[1] & 0x0000ffff) | (e << 16);
      break;
    case 3:
      a[0] = (a[0] & 0xffffff00) | (e >> 24);
      a[1] = (a[1] & 0x000000ff) | (e << 8);
      break;
    case 4:
      a[1] = e;
      break;
    case 5:
      a[1] = (a[1] & 0xff000000) | (e >> 8);
      a[2] = (a[2] & 0x00ffffff) | (e << 24);
      break;
    case 6:
      a[1] = (a[1] & 0xffff0000) | (e >> 16);
      a[2] = (a[2] & 0x0000ffff) | (e << 16);
      break;
    case 7:
      a[1] = (a[1] & 0xffffff00) | (e >> 24);
      a[2] = (a[2] & 0x000000ff) | (e << 8);
      break;
    case 8:
      a[2] = e;
      break;
    case 9:
      a[2] = (a[2] & 0xff000000) | (e >> 8);
      a[3] = (a[3] & 0x00ffffff) | (e << 24);
      break;
    case 10:
      a[2] = (a[2] & 0xffff0000) | (e >> 16);
      a[3] = (a[3] & 0x0000ffff) | (e << 16);
      break;
    case 11:
      a[2] = (a[2] & 0xffffff00) | (e >> 24);
      a[3] = (a[3] & 0x000000ff) | (e << 8);
      break;
    case 12:
      a[3] = e;
      break;
    case 13:
      a[3] = (a[3] & 0xff000000) | (e >> 8);
      b[0] = (b[0] & 0x00ffffff) | (e << 24);
      break;
    case 14:
      a[3] = (a[3] & 0xffff0000) | (e >> 16);
      b[0] = (b[0] & 0x0000ffff) | (e << 16);
      break;
    case 15:
      a[3] = (a[3] & 0xffffff00) | (e >> 24);
      b[0] = (b[0] & 0x000000ff) | (e << 8);
      break;
    case 16:
      b[0] = e;
      break;
    case 17:
      b[0] = (b[0] & 0xff000000) | (e >> 8);
      b[1] = (b[1] & 0x00ffffff) | (e << 24);
      break;
    case 18:
      b[0] = (b[0] & 0xffff0000) | (e >> 16);
      b[1] = (b[1] & 0x0000ffff) | (e << 16);
      break;
    case 19:
      b[0] = (b[0] & 0xffffff00) | (e >> 24);
      b[1] = (b[1] & 0x000000ff) | (e << 8);
      break;
    case 20:
      b[1] = e;
      break;
    case 21:
      b[1] = (b[1] & 0xff000000) | (e >> 8);
      b[2] = (b[2] & 0x00ffffff) | (e << 24);
      break;
    case 22:
      b[1] = (b[1] & 0xffff0000) | (e >> 16);
      b[2] = (b[2] & 0x0000ffff) | (e << 16);
      break;
    case 23:
      b[1] = (b[1] & 0xffffff00) | (e >> 24);
      b[2] = (b[2] & 0x000000ff) | (e << 8);
      break;
    case 24:
      b[2] = e;
      break;
    case 25:
      b[2] = (b[2] & 0xff000000) | (e >> 8);
      b[3] = (b[3] & 0x00ffffff) | (e << 24);
      break;
    case 26:
      b[2] = (b[2] & 0xffff0000) | (e >> 16);
      b[3] = (b[3] & 0x0000ffff) | (e << 16);
      break;
    case 27:
      b[2] = (b[2] & 0xffffff00) | (e >> 24);
      b[3] = (b[3] & 0x000000ff) | (e << 8);
      break;
    case 28:
      b[3] = e;
      break;
    case 29:
      b[3] = (b[3] & 0xff000000) | (e >> 8);
      c[0] = (c[0] & 0x00ffffff) | (e << 24);
      break;
    case 30:
      b[3] = (b[3] & 0xffff0000) | (e >> 16);
      c[0] = (c[0] & 0x0000ffff) | (e << 16);
      break;
    case 31:
      b[3] = (b[3] & 0xffffff00) | (e >> 24);
      c[0] = (c[0] & 0x000000ff) | (e << 8);
      break;
    case 32:
      c[0] = e;
      break;
    case 33:
      c[0] = (c[0] & 0xff000000) | (e >> 8);
      c[1] = (c[1] & 0x00ffffff) | (e << 24);
      break;
    case 34:
      c[0] = (c[0] & 0xffff0000) | (e >> 16);
      c[1] = (c[1] & 0x0000ffff) | (e << 16);
      break;
    case 35:
      c[0] = (c[0] & 0xffffff00) | (e >> 24);
      c[1] = (c[1] & 0x000000ff) | (e << 8);
      break;
    case 36:
      c[1] = e;
      break;
    case 37:
      c[1] = (c[1] & 0xff000000) | (e >> 8);
      c[2] = (c[2] & 0x00ffffff) | (e << 24);
      break;
    case 38:
      c[1] = (c[1] & 0xffff0000) | (e >> 16);
      c[2] = (c[2] & 0x0000ffff) | (e << 16);
      break;
    case 39:
      c[1] = (c[1] & 0xffffff00) | (e >> 24);
      c[2] = (c[2] & 0x000000ff) | (e << 8);
      break;
    case 40:
      c[2] = e;
      break;
    case 41:
      c[2] = (c[2] & 0xff000000) | (e >> 8);
      c[3] = (c[3] & 0x00ffffff) | (e << 24);
      break;
    case 42:
      c[2] = (c[2] & 0xffff0000) | (e >> 16);
      c[3] = (c[3] & 0x0000ffff) | (e << 16);
      break;
    case 43:
      c[2] = (c[2] & 0xffffff00) | (e >> 24);
      c[3] = (c[3] & 0x000000ff) | (e << 8);
      break;
    case 44:
      c[3] = e;
      break;
    case 45:
      c[3] = (c[3] & 0xff000000) | (e >> 8);
      d[0] = (d[0] & 0x00ffffff) | (e << 24);
      break;
    case 46:
      c[3] = (c[3] & 0xffff0000) | (e >> 16);
      d[0] = (d[0] & 0x0000ffff) | (e << 16);
      break;
    case 47:
      c[3] = (c[3] & 0xffffff00) | (e >> 24);
      d[0] = (d[0] & 0x000000ff) | (e << 8);
      break;
    case 48:
      d[0] = e;
      break;
    case 49:
      d[0] = (d[0] & 0xff000000) | (e >> 8);
      d[1] = (d[1] & 0x00ffffff) | (e << 24);
      break;
    case 50:
      d[0] = (d[0] & 0xffff0000) | (e >> 16);
      d[1] = (d[1] & 0x0000ffff) | (e << 16);
      break;
    case 51:
      d[0] = (d[0] & 0xffffff00) | (e >> 24);
      d[1] = (d[1] & 0x000000ff) | (e << 8);
      break;
    case 52:
      d[1] = e;
      break;
    case 53:
      d[1] = (d[1] & 0xff000000) | (e >> 8);
      d[2] = (d[2] & 0x00ffffff) | (e << 24);
      break;
    case 54:
      d[1] = (d[1] & 0xffff0000) | (e >> 16);
      d[2] = (d[2] & 0x0000ffff) | (e << 16);
      break;
    case 55:
      d[1] = (d[1] & 0xffffff00) | (e >> 24);
      d[2] = (d[2] & 0x000000ff) | (e << 8);
      break;
    case 56:
      d[2] = e;
      break;
    case 57:
      d[2] = (d[2] & 0xff000000) | (e >> 8);
      d[3] = (d[3] & 0x00ffffff) | (e << 24);
      break;
    case 58:
      d[2] = (d[2] & 0xffff0000) | (e >> 16);
      d[3] = (d[3] & 0x0000ffff) | (e << 16);
      break;
    case 59:
      d[2] = (d[2] & 0xffffff00) | (e >> 24);
      d[3] = (d[3] & 0x000000ff) | (e << 8);
      break;
    case 60:
      d[3] = e;
      break;
    case 61:
      d[3] = (d[3] & 0xff000000) | (e >> 8);

      break;
    case 62:
      d[3] = (d[3] & 0xffff0000) | (e >> 16);

      break;
    case 63:
      d[3] = (d[3] & 0xffffff00) | (e >> 24);

      break;
  }
}

inline void BA(u32 a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;
  }
}

inline void BB(u32 a[4], u32 b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;
  }
}

inline void BC(u32 a[4], u32 b[4], u32 c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;
  }
}

inline void BD(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x01;
      break;

    case 1:
      a[0] = a[0] | 0x0100;
      break;

    case 2:
      a[0] = a[0] | 0x010000;
      break;

    case 3:
      a[0] = a[0] | 0x01000000;
      break;

    case 4:
      a[1] = 0x01;
      break;

    case 5:
      a[1] = a[1] | 0x0100;
      break;

    case 6:
      a[1] = a[1] | 0x010000;
      break;

    case 7:
      a[1] = a[1] | 0x01000000;
      break;

    case 8:
      a[2] = 0x01;
      break;

    case 9:
      a[2] = a[2] | 0x0100;
      break;

    case 10:
      a[2] = a[2] | 0x010000;
      break;

    case 11:
      a[2] = a[2] | 0x01000000;
      break;

    case 12:
      a[3] = 0x01;
      break;

    case 13:
      a[3] = a[3] | 0x0100;
      break;

    case 14:
      a[3] = a[3] | 0x010000;
      break;

    case 15:
      a[3] = a[3] | 0x01000000;
      break;

    case 16:
      b[0] = 0x01;
      break;

    case 17:
      b[0] = b[0] | 0x0100;
      break;

    case 18:
      b[0] = b[0] | 0x010000;
      break;

    case 19:
      b[0] = b[0] | 0x01000000;
      break;

    case 20:
      b[1] = 0x01;
      break;

    case 21:
      b[1] = b[1] | 0x0100;
      break;

    case 22:
      b[1] = b[1] | 0x010000;
      break;

    case 23:
      b[1] = b[1] | 0x01000000;
      break;

    case 24:
      b[2] = 0x01;
      break;

    case 25:
      b[2] = b[2] | 0x0100;
      break;

    case 26:
      b[2] = b[2] | 0x010000;
      break;

    case 27:
      b[2] = b[2] | 0x01000000;
      break;

    case 28:
      b[3] = 0x01;
      break;

    case 29:
      b[3] = b[3] | 0x0100;
      break;

    case 30:
      b[3] = b[3] | 0x010000;
      break;

    case 31:
      b[3] = b[3] | 0x01000000;
      break;

    case 32:
      c[0] = 0x01;
      break;

    case 33:
      c[0] = c[0] | 0x0100;
      break;

    case 34:
      c[0] = c[0] | 0x010000;
      break;

    case 35:
      c[0] = c[0] | 0x01000000;
      break;

    case 36:
      c[1] = 0x01;
      break;

    case 37:
      c[1] = c[1] | 0x0100;
      break;

    case 38:
      c[1] = c[1] | 0x010000;
      break;

    case 39:
      c[1] = c[1] | 0x01000000;
      break;

    case 40:
      c[2] = 0x01;
      break;

    case 41:
      c[2] = c[2] | 0x0100;
      break;

    case 42:
      c[2] = c[2] | 0x010000;
      break;

    case 43:
      c[2] = c[2] | 0x01000000;
      break;

    case 44:
      c[3] = 0x01;
      break;

    case 45:
      c[3] = c[3] | 0x0100;
      break;

    case 46:
      c[3] = c[3] | 0x010000;
      break;

    case 47:
      c[3] = c[3] | 0x01000000;
      break;

    case 48:
      d[0] = 0x01;
      break;

    case 49:
      d[0] = d[0] | 0x0100;
      break;

    case 50:
      d[0] = d[0] | 0x010000;
      break;

    case 51:
      d[0] = d[0] | 0x01000000;
      break;

    case 52:
      d[1] = 0x01;
      break;

    case 53:
      d[1] = d[1] | 0x0100;
      break;

    case 54:
      d[1] = d[1] | 0x010000;
      break;

    case 55:
      d[1] = d[1] | 0x01000000;
      break;

    case 56:
      d[2] = 0x01;
      break;

    case 57:
      d[2] = d[2] | 0x0100;
      break;

    case 58:
      d[2] = d[2] | 0x010000;
      break;

    case 59:
      d[2] = d[2] | 0x01000000;
      break;

    case 60:
      d[3] = 0x01;
      break;

    case 61:
      d[3] = d[3] | 0x0100;
      break;

    case 62:
      d[3] = d[3] | 0x010000;
      break;

    case 63:
      d[3] = d[3] | 0x01000000;
      break;
  }
}

inline void BE(u32 a[4], u32 b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;
  }
}

inline void BF(u32 a[4], u32 b[4], u32 c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x02;
      break;

    case 1:
      a[0] = a[0] | 0x0200;
      break;

    case 2:
      a[0] = a[0] | 0x020000;
      break;

    case 3:
      a[0] = a[0] | 0x02000000;
      break;

    case 4:
      a[1] = 0x02;
      break;

    case 5:
      a[1] = a[1] | 0x0200;
      break;

    case 6:
      a[1] = a[1] | 0x020000;
      break;

    case 7:
      a[1] = a[1] | 0x02000000;
      break;

    case 8:
      a[2] = 0x02;
      break;

    case 9:
      a[2] = a[2] | 0x0200;
      break;

    case 10:
      a[2] = a[2] | 0x020000;
      break;

    case 11:
      a[2] = a[2] | 0x02000000;
      break;

    case 12:
      a[3] = 0x02;
      break;

    case 13:
      a[3] = a[3] | 0x0200;
      break;

    case 14:
      a[3] = a[3] | 0x020000;
      break;

    case 15:
      a[3] = a[3] | 0x02000000;
      break;

    case 16:
      b[0] = 0x02;
      break;

    case 17:
      b[0] = b[0] | 0x0200;
      break;

    case 18:
      b[0] = b[0] | 0x020000;
      break;

    case 19:
      b[0] = b[0] | 0x02000000;
      break;

    case 20:
      b[1] = 0x02;
      break;

    case 21:
      b[1] = b[1] | 0x0200;
      break;

    case 22:
      b[1] = b[1] | 0x020000;
      break;

    case 23:
      b[1] = b[1] | 0x02000000;
      break;

    case 24:
      b[2] = 0x02;
      break;

    case 25:
      b[2] = b[2] | 0x0200;
      break;

    case 26:
      b[2] = b[2] | 0x020000;
      break;

    case 27:
      b[2] = b[2] | 0x02000000;
      break;

    case 28:
      b[3] = 0x02;
      break;

    case 29:
      b[3] = b[3] | 0x0200;
      break;

    case 30:
      b[3] = b[3] | 0x020000;
      break;

    case 31:
      b[3] = b[3] | 0x02000000;
      break;

    case 32:
      c[0] = 0x02;
      break;

    case 33:
      c[0] = c[0] | 0x0200;
      break;

    case 34:
      c[0] = c[0] | 0x020000;
      break;

    case 35:
      c[0] = c[0] | 0x02000000;
      break;

    case 36:
      c[1] = 0x02;
      break;

    case 37:
      c[1] = c[1] | 0x0200;
      break;

    case 38:
      c[1] = c[1] | 0x020000;
      break;

    case 39:
      c[1] = c[1] | 0x02000000;
      break;

    case 40:
      c[2] = 0x02;
      break;

    case 41:
      c[2] = c[2] | 0x0200;
      break;

    case 42:
      c[2] = c[2] | 0x020000;
      break;

    case 43:
      c[2] = c[2] | 0x02000000;
      break;

    case 44:
      c[3] = 0x02;
      break;

    case 45:
      c[3] = c[3] | 0x0200;
      break;

    case 46:
      c[3] = c[3] | 0x020000;
      break;

    case 47:
      c[3] = c[3] | 0x02000000;
      break;
  }
}

inline void BG(u32 a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;
  }
}

inline void BH(u32 a[4], u32 b[4], const u32 c) {
  switch (c) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;
  }
}

inline void BI(u32 a[4], u32 b[4], u32 c[4], const u32 d) {
  switch (d) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;
  }
}

inline void BJ(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      a[0] = 0x80;
      break;

    case 1:
      a[0] = a[0] | 0x8000;
      break;

    case 2:
      a[0] = a[0] | 0x800000;
      break;

    case 3:
      a[0] = a[0] | 0x80000000;
      break;

    case 4:
      a[1] = 0x80;
      break;

    case 5:
      a[1] = a[1] | 0x8000;
      break;

    case 6:
      a[1] = a[1] | 0x800000;
      break;

    case 7:
      a[1] = a[1] | 0x80000000;
      break;

    case 8:
      a[2] = 0x80;
      break;

    case 9:
      a[2] = a[2] | 0x8000;
      break;

    case 10:
      a[2] = a[2] | 0x800000;
      break;

    case 11:
      a[2] = a[2] | 0x80000000;
      break;

    case 12:
      a[3] = 0x80;
      break;

    case 13:
      a[3] = a[3] | 0x8000;
      break;

    case 14:
      a[3] = a[3] | 0x800000;
      break;

    case 15:
      a[3] = a[3] | 0x80000000;
      break;

    case 16:
      b[0] = 0x80;
      break;

    case 17:
      b[0] = b[0] | 0x8000;
      break;

    case 18:
      b[0] = b[0] | 0x800000;
      break;

    case 19:
      b[0] = b[0] | 0x80000000;
      break;

    case 20:
      b[1] = 0x80;
      break;

    case 21:
      b[1] = b[1] | 0x8000;
      break;

    case 22:
      b[1] = b[1] | 0x800000;
      break;

    case 23:
      b[1] = b[1] | 0x80000000;
      break;

    case 24:
      b[2] = 0x80;
      break;

    case 25:
      b[2] = b[2] | 0x8000;
      break;

    case 26:
      b[2] = b[2] | 0x800000;
      break;

    case 27:
      b[2] = b[2] | 0x80000000;
      break;

    case 28:
      b[3] = 0x80;
      break;

    case 29:
      b[3] = b[3] | 0x8000;
      break;

    case 30:
      b[3] = b[3] | 0x800000;
      break;

    case 31:
      b[3] = b[3] | 0x80000000;
      break;

    case 32:
      c[0] = 0x80;
      break;

    case 33:
      c[0] = c[0] | 0x8000;
      break;

    case 34:
      c[0] = c[0] | 0x800000;
      break;

    case 35:
      c[0] = c[0] | 0x80000000;
      break;

    case 36:
      c[1] = 0x80;
      break;

    case 37:
      c[1] = c[1] | 0x8000;
      break;

    case 38:
      c[1] = c[1] | 0x800000;
      break;

    case 39:
      c[1] = c[1] | 0x80000000;
      break;

    case 40:
      c[2] = 0x80;
      break;

    case 41:
      c[2] = c[2] | 0x8000;
      break;

    case 42:
      c[2] = c[2] | 0x800000;
      break;

    case 43:
      c[2] = c[2] | 0x80000000;
      break;

    case 44:
      c[3] = 0x80;
      break;

    case 45:
      c[3] = c[3] | 0x8000;
      break;

    case 46:
      c[3] = c[3] | 0x800000;
      break;

    case 47:
      c[3] = c[3] | 0x80000000;
      break;

    case 48:
      d[0] = 0x80;
      break;

    case 49:
      d[0] = d[0] | 0x8000;
      break;

    case 50:
      d[0] = d[0] | 0x800000;
      break;

    case 51:
      d[0] = d[0] | 0x80000000;
      break;

    case 52:
      d[1] = 0x80;
      break;

    case 53:
      d[1] = d[1] | 0x8000;
      break;

    case 54:
      d[1] = d[1] | 0x800000;
      break;

    case 55:
      d[1] = d[1] | 0x80000000;
      break;

    case 56:
      d[2] = 0x80;
      break;

    case 57:
      d[2] = d[2] | 0x8000;
      break;

    case 58:
      d[2] = d[2] | 0x800000;
      break;

    case 59:
      d[2] = d[2] | 0x80000000;
      break;

    case 60:
      d[3] = 0x80;
      break;

    case 61:
      d[3] = d[3] | 0x8000;
      break;

    case 62:
      d[3] = d[3] | 0x800000;
      break;

    case 63:
      d[3] = d[3] | 0x80000000;
      break;
  }
}

inline void BK(u32 a[4], const u32 b) {
  switch (b) {
    case 0:
      a[0] &= 0;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 1:
      a[0] &= 0x000000FF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 2:
      a[0] &= 0x0000FFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 3:
      a[0] &= 0x00FFFFFF;
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 4:
      a[1] &= 0;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 5:
      a[1] &= 0x000000FF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 6:
      a[1] &= 0x0000FFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 7:
      a[1] &= 0x00FFFFFF;
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 8:
      a[2] &= 0;
      a[3] &= 0;
      break;
    case 9:
      a[2] &= 0x000000FF;
      a[3] &= 0;
      break;
    case 10:
      a[2] &= 0x0000FFFF;
      a[3] &= 0;
      break;
    case 11:
      a[2] &= 0x00FFFFFF;
      a[3] &= 0;
      break;
    case 12:
      a[3] &= 0;
      break;
    case 13:
      a[3] &= 0x000000FF;
      break;
    case 14:
      a[3] &= 0x0000FFFF;
      break;
    case 15:
      a[3] &= 0x00FFFFFF;
      break;
  }
}

inline void BL(const u32 a[4], u32 b[4], u32 c[4]) {
  c[3] = ((a[3] >> 8) & 0x00FF0000) | ((a[3] >> 16) & 0x000000FF);
  c[2] = ((a[3] << 8) & 0x00FF0000) | ((a[3] >> 0) & 0x000000FF);
  c[1] = ((a[2] >> 8) & 0x00FF0000) | ((a[2] >> 16) & 0x000000FF);
  c[0] = ((a[2] << 8) & 0x00FF0000) | ((a[2] >> 0) & 0x000000FF);
  b[3] = ((a[1] >> 8) & 0x00FF0000) | ((a[1] >> 16) & 0x000000FF);
  b[2] = ((a[1] << 8) & 0x00FF0000) | ((a[1] >> 0) & 0x000000FF);
  b[1] = ((a[0] >> 8) & 0x00FF0000) | ((a[0] >> 16) & 0x000000FF);
  b[0] = ((a[0] << 8) & 0x00FF0000) | ((a[0] >> 0) & 0x000000FF);
}

inline void BM(const u32 a[4], const u32 b[4], u32 c[4]) {
  c[0] = ((a[0] & 0x000000ff) >> 0) | ((a[0] & 0x00ff0000) >> 8) | ((a[1] & 0x000000ff) << 16) | ((a[1] & 0x00ff0000) << 8);
  c[1] = ((a[2] & 0x000000ff) >> 0) | ((a[2] & 0x00ff0000) >> 8) | ((a[3] & 0x000000ff) << 16) | ((a[3] & 0x00ff0000) << 8);
  c[2] = ((b[0] & 0x000000ff) >> 0) | ((b[0] & 0x00ff0000) >> 8) | ((b[1] & 0x000000ff) << 16) | ((b[1] & 0x00ff0000) << 8);
  c[3] = ((b[2] & 0x000000ff) >> 0) | ((b[2] & 0x00ff0000) >> 8) | ((b[3] & 0x000000ff) << 16) | ((b[3] & 0x00ff0000) << 8);
}

inline void BN(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  const int f = e & 3;

  const int g = 4 - e;

  switch (e / 4) {
    case 0:
      d[2] = V(0, d[1], g);
      d[1] = V(d[1], d[0], g);
      d[0] = V(d[0], c[3], g);
      c[3] = V(c[3], c[2], g);
      c[2] = V(c[2], c[1], g);
      c[1] = V(c[1], c[0], g);
      c[0] = V(c[0], b[3], g);
      b[3] = V(b[3], b[2], g);
      b[2] = V(b[2], b[1], g);
      b[1] = V(b[1], b[0], g);
      b[0] = V(b[0], a[3], g);
      a[3] = V(a[3], a[2], g);
      a[2] = V(a[2], a[1], g);
      a[1] = V(a[1], a[0], g);
      a[0] = V(a[0], 0, g);

      if (f == 0) {
        a[0] = a[1];
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 1:
      d[2] = V(0, d[0], g);
      d[1] = V(d[0], c[3], g);
      d[0] = V(c[3], c[2], g);
      c[3] = V(c[2], c[1], g);
      c[2] = V(c[1], c[0], g);
      c[1] = V(c[0], b[3], g);
      c[0] = V(b[3], b[2], g);
      b[3] = V(b[2], b[1], g);
      b[2] = V(b[1], b[0], g);
      b[1] = V(b[0], a[3], g);
      b[0] = V(a[3], a[2], g);
      a[3] = V(a[2], a[1], g);
      a[2] = V(a[1], a[0], g);
      a[1] = V(a[0], 0, g);
      a[0] = 0;

      if (f == 0) {
        a[1] = a[2];
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 2:
      d[2] = V(0, c[3], g);
      d[1] = V(c[3], c[2], g);
      d[0] = V(c[2], c[1], g);
      c[3] = V(c[1], c[0], g);
      c[2] = V(c[0], b[3], g);
      c[1] = V(b[3], b[2], g);
      c[0] = V(b[2], b[1], g);
      b[3] = V(b[1], b[0], g);
      b[2] = V(b[0], a[3], g);
      b[1] = V(a[3], a[2], g);
      b[0] = V(a[2], a[1], g);
      a[3] = V(a[1], a[0], g);
      a[2] = V(a[0], 0, g);
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[2] = a[3];
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 3:
      d[2] = V(0, c[2], g);
      d[1] = V(c[2], c[1], g);
      d[0] = V(c[1], c[0], g);
      c[3] = V(c[0], b[3], g);
      c[2] = V(b[3], b[2], g);
      c[1] = V(b[2], b[1], g);
      c[0] = V(b[1], b[0], g);
      b[3] = V(b[0], a[3], g);
      b[2] = V(a[3], a[2], g);
      b[1] = V(a[2], a[1], g);
      b[0] = V(a[1], a[0], g);
      a[3] = V(a[0], 0, g);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        a[3] = b[0];
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 4:
      d[2] = V(0, c[1], g);
      d[1] = V(c[1], c[0], g);
      d[0] = V(c[0], b[3], g);
      c[3] = V(b[3], b[2], g);
      c[2] = V(b[2], b[1], g);
      c[1] = V(b[1], b[0], g);
      c[0] = V(b[0], a[3], g);
      b[3] = V(a[3], a[2], g);
      b[2] = V(a[2], a[1], g);
      b[1] = V(a[1], a[0], g);
      b[0] = V(a[0], 0, g);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[0] = b[1];
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 5:
      d[2] = V(0, c[0], g);
      d[1] = V(c[0], b[3], g);
      d[0] = V(b[3], b[2], g);
      c[3] = V(b[2], b[1], g);
      c[2] = V(b[1], b[0], g);
      c[1] = V(b[0], a[3], g);
      c[0] = V(a[3], a[2], g);
      b[3] = V(a[2], a[1], g);
      b[2] = V(a[1], a[0], g);
      b[1] = V(a[0], 0, g);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[1] = b[2];
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 6:
      d[2] = V(0, b[3], g);
      d[1] = V(b[3], b[2], g);
      d[0] = V(b[2], b[1], g);
      c[3] = V(b[1], b[0], g);
      c[2] = V(b[0], a[3], g);
      c[1] = V(a[3], a[2], g);
      c[0] = V(a[2], a[1], g);
      b[3] = V(a[1], a[0], g);
      b[2] = V(a[0], 0, g);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[2] = b[3];
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 7:
      d[2] = V(0, b[2], g);
      d[1] = V(b[2], b[1], g);
      d[0] = V(b[1], b[0], g);
      c[3] = V(b[0], a[3], g);
      c[2] = V(a[3], a[2], g);
      c[1] = V(a[2], a[1], g);
      c[0] = V(a[1], a[0], g);
      b[3] = V(a[0], 0, g);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        b[3] = c[0];
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 8:
      d[2] = V(0, b[1], g);
      d[1] = V(b[1], b[0], g);
      d[0] = V(b[0], a[3], g);
      c[3] = V(a[3], a[2], g);
      c[2] = V(a[2], a[1], g);
      c[1] = V(a[1], a[0], g);
      c[0] = V(a[0], 0, g);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[0] = c[1];
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 9:
      d[2] = V(0, b[0], g);
      d[1] = V(b[0], a[3], g);
      d[0] = V(a[3], a[2], g);
      c[3] = V(a[2], a[1], g);
      c[2] = V(a[1], a[0], g);
      c[1] = V(a[0], 0, g);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[1] = c[2];
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 10:
      d[2] = V(0, a[3], g);
      d[1] = V(a[3], a[2], g);
      d[0] = V(a[2], a[1], g);
      c[3] = V(a[1], a[0], g);
      c[2] = V(a[0], 0, g);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[2] = c[3];
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 11:
      d[2] = V(0, a[2], g);
      d[1] = V(a[2], a[1], g);
      d[0] = V(a[1], a[0], g);
      c[3] = V(a[0], 0, g);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        c[3] = d[0];
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 12:
      d[2] = V(0, a[1], g);
      d[1] = V(a[1], a[0], g);
      d[0] = V(a[0], 0, g);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[0] = d[1];
        d[1] = d[2];
        d[2] = 0;
      }

      break;

    case 13:
      d[2] = V(0, a[0], g);
      d[1] = V(a[0], 0, g);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;

      if (f == 0) {
        d[1] = d[2];
        d[2] = 0;
      }

      break;
  }
}

inline void BO(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e / 4) {
    case 0:
      d[2] = V(d[1], 0, e);
      d[1] = V(d[0], d[1], e);
      d[0] = V(c[3], d[0], e);
      c[3] = V(c[2], c[3], e);
      c[2] = V(c[1], c[2], e);
      c[1] = V(c[0], c[1], e);
      c[0] = V(b[3], c[0], e);
      b[3] = V(b[2], b[3], e);
      b[2] = V(b[1], b[2], e);
      b[1] = V(b[0], b[1], e);
      b[0] = V(a[3], b[0], e);
      a[3] = V(a[2], a[3], e);
      a[2] = V(a[1], a[2], e);
      a[1] = V(a[0], a[1], e);
      a[0] = V(0, a[0], e);
      break;

    case 1:
      d[2] = V(d[0], 0, e);
      d[1] = V(c[3], d[0], e);
      d[0] = V(c[2], c[3], e);
      c[3] = V(c[1], c[2], e);
      c[2] = V(c[0], c[1], e);
      c[1] = V(b[3], c[0], e);
      c[0] = V(b[2], b[3], e);
      b[3] = V(b[1], b[2], e);
      b[2] = V(b[0], b[1], e);
      b[1] = V(a[3], b[0], e);
      b[0] = V(a[2], a[3], e);
      a[3] = V(a[1], a[2], e);
      a[2] = V(a[0], a[1], e);
      a[1] = V(0, a[0], e);
      a[0] = 0;
      break;

    case 2:
      d[2] = V(c[3], 0, e);
      d[1] = V(c[2], c[3], e);
      d[0] = V(c[1], c[2], e);
      c[3] = V(c[0], c[1], e);
      c[2] = V(b[3], c[0], e);
      c[1] = V(b[2], b[3], e);
      c[0] = V(b[1], b[2], e);
      b[3] = V(b[0], b[1], e);
      b[2] = V(a[3], b[0], e);
      b[1] = V(a[2], a[3], e);
      b[0] = V(a[1], a[2], e);
      a[3] = V(a[0], a[1], e);
      a[2] = V(0, a[0], e);
      a[1] = 0;
      a[0] = 0;
      break;

    case 3:
      d[2] = V(c[2], 0, e);
      d[1] = V(c[1], c[2], e);
      d[0] = V(c[0], c[1], e);
      c[3] = V(b[3], c[0], e);
      c[2] = V(b[2], b[3], e);
      c[1] = V(b[1], b[2], e);
      c[0] = V(b[0], b[1], e);
      b[3] = V(a[3], b[0], e);
      b[2] = V(a[2], a[3], e);
      b[1] = V(a[1], a[2], e);
      b[0] = V(a[0], a[1], e);
      a[3] = V(0, a[0], e);
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 4:
      d[2] = V(c[1], 0, e);
      d[1] = V(c[0], c[1], e);
      d[0] = V(b[3], c[0], e);
      c[3] = V(b[2], b[3], e);
      c[2] = V(b[1], b[2], e);
      c[1] = V(b[0], b[1], e);
      c[0] = V(a[3], b[0], e);
      b[3] = V(a[2], a[3], e);
      b[2] = V(a[1], a[2], e);
      b[1] = V(a[0], a[1], e);
      b[0] = V(0, a[0], e);
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 5:
      d[2] = V(c[0], 0, e);
      d[1] = V(b[3], c[0], e);
      d[0] = V(b[2], b[3], e);
      c[3] = V(b[1], b[2], e);
      c[2] = V(b[0], b[1], e);
      c[1] = V(a[3], b[0], e);
      c[0] = V(a[2], a[3], e);
      b[3] = V(a[1], a[2], e);
      b[2] = V(a[0], a[1], e);
      b[1] = V(0, a[0], e);
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 6:
      d[2] = V(b[3], 0, e);
      d[1] = V(b[2], b[3], e);
      d[0] = V(b[1], b[2], e);
      c[3] = V(b[0], b[1], e);
      c[2] = V(a[3], b[0], e);
      c[1] = V(a[2], a[3], e);
      c[0] = V(a[1], a[2], e);
      b[3] = V(a[0], a[1], e);
      b[2] = V(0, a[0], e);
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 7:
      d[2] = V(b[2], 0, e);
      d[1] = V(b[1], b[2], e);
      d[0] = V(b[0], b[1], e);
      c[3] = V(a[3], b[0], e);
      c[2] = V(a[2], a[3], e);
      c[1] = V(a[1], a[2], e);
      c[0] = V(a[0], a[1], e);
      b[3] = V(0, a[0], e);
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 8:
      d[2] = V(b[1], 0, e);
      d[1] = V(b[0], b[1], e);
      d[0] = V(a[3], b[0], e);
      c[3] = V(a[2], a[3], e);
      c[2] = V(a[1], a[2], e);
      c[1] = V(a[0], a[1], e);
      c[0] = V(0, a[0], e);
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 9:
      d[2] = V(b[0], 0, e);
      d[1] = V(a[3], b[0], e);
      d[0] = V(a[2], a[3], e);
      c[3] = V(a[1], a[2], e);
      c[2] = V(a[0], a[1], e);
      c[1] = V(0, a[0], e);
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 10:
      d[2] = V(a[3], 0, e);
      d[1] = V(a[2], a[3], e);
      d[0] = V(a[1], a[2], e);
      c[3] = V(a[0], a[1], e);
      c[2] = V(0, a[0], e);
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 11:
      d[2] = V(a[2], 0, e);
      d[1] = V(a[1], a[2], e);
      d[0] = V(a[0], a[1], e);
      c[3] = V(0, a[0], e);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 12:
      d[2] = V(a[1], 0, e);
      d[1] = V(a[0], a[1], e);
      d[0] = V(0, a[0], e);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;

    case 13:
      d[2] = V(a[0], 0, e);
      d[1] = V(0, a[0], e);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      b[3] = 0;
      b[2] = 0;
      b[1] = 0;
      b[0] = 0;
      a[3] = 0;
      a[2] = 0;
      a[1] = 0;
      a[0] = 0;
      break;
  }
}
inline void BP(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e) {
  BN(a, b, c, d, e);
}

inline void BQ(u32x a[4], u32x b[4], const u32x c) {
  BB(a, b, c);
}

inline void BR(u32x a[4], u32x b[4], const u32x c) {
  BH(a, b, c);
}

inline void BS(u32x a[4], u32x b[4], u32x c[4], u32x d[4], const u32x e) {
  BJ(a, b, c, d, e);
}

__kernel void BT(__global uint4* a, const u32 b, const u32 c) {
  const u32 d = get_global_id(0);

  if (d >= c)
    return;

  a[d] = (uint4)(b);
}

__constant u32 Ga[256] = {
    0xc66363a5, 0xf87c7c84, 0xee777799, 0xf67b7b8d, 0xfff2f20d, 0xd66b6bbd, 0xde6f6fb1, 0x91c5c554, 0x60303050, 0x02010103, 0xce6767a9, 0x562b2b7d, 0xe7fefe19, 0xb5d7d762, 0x4dababe6, 0xec76769a, 0x8fcaca45, 0x1f82829d, 0x89c9c940, 0xfa7d7d87, 0xeffafa15, 0xb25959eb, 0x8e4747c9, 0xfbf0f00b, 0x41adadec, 0xb3d4d467, 0x5fa2a2fd, 0x45afafea, 0x239c9cbf, 0x53a4a4f7, 0xe4727296, 0x9bc0c05b, 0x75b7b7c2, 0xe1fdfd1c, 0x3d9393ae, 0x4c26266a, 0x6c36365a,
    0x7e3f3f41, 0xf5f7f702, 0x83cccc4f, 0x6834345c, 0x51a5a5f4, 0xd1e5e534, 0xf9f1f108, 0xe2717193, 0xabd8d873, 0x62313153, 0x2a15153f, 0x0804040c, 0x95c7c752, 0x46232365, 0x9dc3c35e, 0x30181828, 0x379696a1, 0x0a05050f, 0x2f9a9ab5, 0x0e070709, 0x24121236, 0x1b80809b, 0xdfe2e23d, 0xcdebeb26, 0x4e272769, 0x7fb2b2cd, 0xea75759f, 0x1209091b, 0x1d83839e, 0x582c2c74, 0x341a1a2e, 0x361b1b2d, 0xdc6e6eb2, 0xb45a5aee, 0x5ba0a0fb, 0xa45252f6, 0x763b3b4d,
    0xb7d6d661, 0x7db3b3ce, 0x5229297b, 0xdde3e33e, 0x5e2f2f71, 0x13848497, 0xa65353f5, 0xb9d1d168, 0x00000000, 0xc1eded2c, 0x40202060, 0xe3fcfc1f, 0x79b1b1c8, 0xb65b5bed, 0xd46a6abe, 0x8dcbcb46, 0x67bebed9, 0x7239394b, 0x944a4ade, 0x984c4cd4, 0xb05858e8, 0x85cfcf4a, 0xbbd0d06b, 0xc5efef2a, 0x4faaaae5, 0xedfbfb16, 0x864343c5, 0x9a4d4dd7, 0x66333355, 0x11858594, 0x8a4545cf, 0xe9f9f910, 0x04020206, 0xfe7f7f81, 0xa05050f0, 0x783c3c44, 0x259f9fba,
    0x4ba8a8e3, 0xa25151f3, 0x5da3a3fe, 0x804040c0, 0x058f8f8a, 0x3f9292ad, 0x219d9dbc, 0x70383848, 0xf1f5f504, 0x63bcbcdf, 0x77b6b6c1, 0xafdada75, 0x42212163, 0x20101030, 0xe5ffff1a, 0xfdf3f30e, 0xbfd2d26d, 0x81cdcd4c, 0x180c0c14, 0x26131335, 0xc3ecec2f, 0xbe5f5fe1, 0x359797a2, 0x884444cc, 0x2e171739, 0x93c4c457, 0x55a7a7f2, 0xfc7e7e82, 0x7a3d3d47, 0xc86464ac, 0xba5d5de7, 0x3219192b, 0xe6737395, 0xc06060a0, 0x19818198, 0x9e4f4fd1, 0xa3dcdc7f,
    0x44222266, 0x542a2a7e, 0x3b9090ab, 0x0b888883, 0x8c4646ca, 0xc7eeee29, 0x6bb8b8d3, 0x2814143c, 0xa7dede79, 0xbc5e5ee2, 0x160b0b1d, 0xaddbdb76, 0xdbe0e03b, 0x64323256, 0x743a3a4e, 0x140a0a1e, 0x924949db, 0x0c06060a, 0x4824246c, 0xb85c5ce4, 0x9fc2c25d, 0xbdd3d36e, 0x43acacef, 0xc46262a6, 0x399191a8, 0x319595a4, 0xd3e4e437, 0xf279798b, 0xd5e7e732, 0x8bc8c843, 0x6e373759, 0xda6d6db7, 0x018d8d8c, 0xb1d5d564, 0x9c4e4ed2, 0x49a9a9e0, 0xd86c6cb4,
    0xac5656fa, 0xf3f4f407, 0xcfeaea25, 0xca6565af, 0xf47a7a8e, 0x47aeaee9, 0x10080818, 0x6fbabad5, 0xf0787888, 0x4a25256f, 0x5c2e2e72, 0x381c1c24, 0x57a6a6f1, 0x73b4b4c7, 0x97c6c651, 0xcbe8e823, 0xa1dddd7c, 0xe874749c, 0x3e1f1f21, 0x964b4bdd, 0x61bdbddc, 0x0d8b8b86, 0x0f8a8a85, 0xe0707090, 0x7c3e3e42, 0x71b5b5c4, 0xcc6666aa, 0x904848d8, 0x06030305, 0xf7f6f601, 0x1c0e0e12, 0xc26161a3, 0x6a35355f, 0xae5757f9, 0x69b9b9d0, 0x17868691, 0x99c1c158,
    0x3a1d1d27, 0x279e9eb9, 0xd9e1e138, 0xebf8f813, 0x2b9898b3, 0x22111133, 0xd26969bb, 0xa9d9d970, 0x078e8e89, 0x339494a7, 0x2d9b9bb6, 0x3c1e1e22, 0x15878792, 0xc9e9e920, 0x87cece49, 0xaa5555ff, 0x50282878, 0xa5dfdf7a, 0x038c8c8f, 0x59a1a1f8, 0x09898980, 0x1a0d0d17, 0x65bfbfda, 0xd7e6e631, 0x844242c6, 0xd06868b8, 0x824141c3, 0x299999b0, 0x5a2d2d77, 0x1e0f0f11, 0x7bb0b0cb, 0xa85454fc, 0x6dbbbbd6, 0x2c16163a,
};

__constant u32 Gb[256] = {
    0xa5c66363, 0x84f87c7c, 0x99ee7777, 0x8df67b7b, 0x0dfff2f2, 0xbdd66b6b, 0xb1de6f6f, 0x5491c5c5, 0x50603030, 0x03020101, 0xa9ce6767, 0x7d562b2b, 0x19e7fefe, 0x62b5d7d7, 0xe64dabab, 0x9aec7676, 0x458fcaca, 0x9d1f8282, 0x4089c9c9, 0x87fa7d7d, 0x15effafa, 0xebb25959, 0xc98e4747, 0x0bfbf0f0, 0xec41adad, 0x67b3d4d4, 0xfd5fa2a2, 0xea45afaf, 0xbf239c9c, 0xf753a4a4, 0x96e47272, 0x5b9bc0c0, 0xc275b7b7, 0x1ce1fdfd, 0xae3d9393, 0x6a4c2626, 0x5a6c3636,
    0x417e3f3f, 0x02f5f7f7, 0x4f83cccc, 0x5c683434, 0xf451a5a5, 0x34d1e5e5, 0x08f9f1f1, 0x93e27171, 0x73abd8d8, 0x53623131, 0x3f2a1515, 0x0c080404, 0x5295c7c7, 0x65462323, 0x5e9dc3c3, 0x28301818, 0xa1379696, 0x0f0a0505, 0xb52f9a9a, 0x090e0707, 0x36241212, 0x9b1b8080, 0x3ddfe2e2, 0x26cdebeb, 0x694e2727, 0xcd7fb2b2, 0x9fea7575, 0x1b120909, 0x9e1d8383, 0x74582c2c, 0x2e341a1a, 0x2d361b1b, 0xb2dc6e6e, 0xeeb45a5a, 0xfb5ba0a0, 0xf6a45252, 0x4d763b3b,
    0x61b7d6d6, 0xce7db3b3, 0x7b522929, 0x3edde3e3, 0x715e2f2f, 0x97138484, 0xf5a65353, 0x68b9d1d1, 0x00000000, 0x2cc1eded, 0x60402020, 0x1fe3fcfc, 0xc879b1b1, 0xedb65b5b, 0xbed46a6a, 0x468dcbcb, 0xd967bebe, 0x4b723939, 0xde944a4a, 0xd4984c4c, 0xe8b05858, 0x4a85cfcf, 0x6bbbd0d0, 0x2ac5efef, 0xe54faaaa, 0x16edfbfb, 0xc5864343, 0xd79a4d4d, 0x55663333, 0x94118585, 0xcf8a4545, 0x10e9f9f9, 0x06040202, 0x81fe7f7f, 0xf0a05050, 0x44783c3c, 0xba259f9f,
    0xe34ba8a8, 0xf3a25151, 0xfe5da3a3, 0xc0804040, 0x8a058f8f, 0xad3f9292, 0xbc219d9d, 0x48703838, 0x04f1f5f5, 0xdf63bcbc, 0xc177b6b6, 0x75afdada, 0x63422121, 0x30201010, 0x1ae5ffff, 0x0efdf3f3, 0x6dbfd2d2, 0x4c81cdcd, 0x14180c0c, 0x35261313, 0x2fc3ecec, 0xe1be5f5f, 0xa2359797, 0xcc884444, 0x392e1717, 0x5793c4c4, 0xf255a7a7, 0x82fc7e7e, 0x477a3d3d, 0xacc86464, 0xe7ba5d5d, 0x2b321919, 0x95e67373, 0xa0c06060, 0x98198181, 0xd19e4f4f, 0x7fa3dcdc,
    0x66442222, 0x7e542a2a, 0xab3b9090, 0x830b8888, 0xca8c4646, 0x29c7eeee, 0xd36bb8b8, 0x3c281414, 0x79a7dede, 0xe2bc5e5e, 0x1d160b0b, 0x76addbdb, 0x3bdbe0e0, 0x56643232, 0x4e743a3a, 0x1e140a0a, 0xdb924949, 0x0a0c0606, 0x6c482424, 0xe4b85c5c, 0x5d9fc2c2, 0x6ebdd3d3, 0xef43acac, 0xa6c46262, 0xa8399191, 0xa4319595, 0x37d3e4e4, 0x8bf27979, 0x32d5e7e7, 0x438bc8c8, 0x596e3737, 0xb7da6d6d, 0x8c018d8d, 0x64b1d5d5, 0xd29c4e4e, 0xe049a9a9, 0xb4d86c6c,
    0xfaac5656, 0x07f3f4f4, 0x25cfeaea, 0xafca6565, 0x8ef47a7a, 0xe947aeae, 0x18100808, 0xd56fbaba, 0x88f07878, 0x6f4a2525, 0x725c2e2e, 0x24381c1c, 0xf157a6a6, 0xc773b4b4, 0x5197c6c6, 0x23cbe8e8, 0x7ca1dddd, 0x9ce87474, 0x213e1f1f, 0xdd964b4b, 0xdc61bdbd, 0x860d8b8b, 0x850f8a8a, 0x90e07070, 0x427c3e3e, 0xc471b5b5, 0xaacc6666, 0xd8904848, 0x05060303, 0x01f7f6f6, 0x121c0e0e, 0xa3c26161, 0x5f6a3535, 0xf9ae5757, 0xd069b9b9, 0x91178686, 0x5899c1c1,
    0x273a1d1d, 0xb9279e9e, 0x38d9e1e1, 0x13ebf8f8, 0xb32b9898, 0x33221111, 0xbbd26969, 0x70a9d9d9, 0x89078e8e, 0xa7339494, 0xb62d9b9b, 0x223c1e1e, 0x92158787, 0x20c9e9e9, 0x4987cece, 0xffaa5555, 0x78502828, 0x7aa5dfdf, 0x8f038c8c, 0xf859a1a1, 0x80098989, 0x171a0d0d, 0xda65bfbf, 0x31d7e6e6, 0xc6844242, 0xb8d06868, 0xc3824141, 0xb0299999, 0x775a2d2d, 0x111e0f0f, 0xcb7bb0b0, 0xfca85454, 0xd66dbbbb, 0x3a2c1616,
};

__constant u32 Gc[256] = {
    0x63a5c663, 0x7c84f87c, 0x7799ee77, 0x7b8df67b, 0xf20dfff2, 0x6bbdd66b, 0x6fb1de6f, 0xc55491c5, 0x30506030, 0x01030201, 0x67a9ce67, 0x2b7d562b, 0xfe19e7fe, 0xd762b5d7, 0xabe64dab, 0x769aec76, 0xca458fca, 0x829d1f82, 0xc94089c9, 0x7d87fa7d, 0xfa15effa, 0x59ebb259, 0x47c98e47, 0xf00bfbf0, 0xadec41ad, 0xd467b3d4, 0xa2fd5fa2, 0xafea45af, 0x9cbf239c, 0xa4f753a4, 0x7296e472, 0xc05b9bc0, 0xb7c275b7, 0xfd1ce1fd, 0x93ae3d93, 0x266a4c26, 0x365a6c36,
    0x3f417e3f, 0xf702f5f7, 0xcc4f83cc, 0x345c6834, 0xa5f451a5, 0xe534d1e5, 0xf108f9f1, 0x7193e271, 0xd873abd8, 0x31536231, 0x153f2a15, 0x040c0804, 0xc75295c7, 0x23654623, 0xc35e9dc3, 0x18283018, 0x96a13796, 0x050f0a05, 0x9ab52f9a, 0x07090e07, 0x12362412, 0x809b1b80, 0xe23ddfe2, 0xeb26cdeb, 0x27694e27, 0xb2cd7fb2, 0x759fea75, 0x091b1209, 0x839e1d83, 0x2c74582c, 0x1a2e341a, 0x1b2d361b, 0x6eb2dc6e, 0x5aeeb45a, 0xa0fb5ba0, 0x52f6a452, 0x3b4d763b,
    0xd661b7d6, 0xb3ce7db3, 0x297b5229, 0xe33edde3, 0x2f715e2f, 0x84971384, 0x53f5a653, 0xd168b9d1, 0x00000000, 0xed2cc1ed, 0x20604020, 0xfc1fe3fc, 0xb1c879b1, 0x5bedb65b, 0x6abed46a, 0xcb468dcb, 0xbed967be, 0x394b7239, 0x4ade944a, 0x4cd4984c, 0x58e8b058, 0xcf4a85cf, 0xd06bbbd0, 0xef2ac5ef, 0xaae54faa, 0xfb16edfb, 0x43c58643, 0x4dd79a4d, 0x33556633, 0x85941185, 0x45cf8a45, 0xf910e9f9, 0x02060402, 0x7f81fe7f, 0x50f0a050, 0x3c44783c, 0x9fba259f,
    0xa8e34ba8, 0x51f3a251, 0xa3fe5da3, 0x40c08040, 0x8f8a058f, 0x92ad3f92, 0x9dbc219d, 0x38487038, 0xf504f1f5, 0xbcdf63bc, 0xb6c177b6, 0xda75afda, 0x21634221, 0x10302010, 0xff1ae5ff, 0xf30efdf3, 0xd26dbfd2, 0xcd4c81cd, 0x0c14180c, 0x13352613, 0xec2fc3ec, 0x5fe1be5f, 0x97a23597, 0x44cc8844, 0x17392e17, 0xc45793c4, 0xa7f255a7, 0x7e82fc7e, 0x3d477a3d, 0x64acc864, 0x5de7ba5d, 0x192b3219, 0x7395e673, 0x60a0c060, 0x81981981, 0x4fd19e4f, 0xdc7fa3dc,
    0x22664422, 0x2a7e542a, 0x90ab3b90, 0x88830b88, 0x46ca8c46, 0xee29c7ee, 0xb8d36bb8, 0x143c2814, 0xde79a7de, 0x5ee2bc5e, 0x0b1d160b, 0xdb76addb, 0xe03bdbe0, 0x32566432, 0x3a4e743a, 0x0a1e140a, 0x49db9249, 0x060a0c06, 0x246c4824, 0x5ce4b85c, 0xc25d9fc2, 0xd36ebdd3, 0xacef43ac, 0x62a6c462, 0x91a83991, 0x95a43195, 0xe437d3e4, 0x798bf279, 0xe732d5e7, 0xc8438bc8, 0x37596e37, 0x6db7da6d, 0x8d8c018d, 0xd564b1d5, 0x4ed29c4e, 0xa9e049a9, 0x6cb4d86c,
    0x56faac56, 0xf407f3f4, 0xea25cfea, 0x65afca65, 0x7a8ef47a, 0xaee947ae, 0x08181008, 0xbad56fba, 0x7888f078, 0x256f4a25, 0x2e725c2e, 0x1c24381c, 0xa6f157a6, 0xb4c773b4, 0xc65197c6, 0xe823cbe8, 0xdd7ca1dd, 0x749ce874, 0x1f213e1f, 0x4bdd964b, 0xbddc61bd, 0x8b860d8b, 0x8a850f8a, 0x7090e070, 0x3e427c3e, 0xb5c471b5, 0x66aacc66, 0x48d89048, 0x03050603, 0xf601f7f6, 0x0e121c0e, 0x61a3c261, 0x355f6a35, 0x57f9ae57, 0xb9d069b9, 0x86911786, 0xc15899c1,
    0x1d273a1d, 0x9eb9279e, 0xe138d9e1, 0xf813ebf8, 0x98b32b98, 0x11332211, 0x69bbd269, 0xd970a9d9, 0x8e89078e, 0x94a73394, 0x9bb62d9b, 0x1e223c1e, 0x87921587, 0xe920c9e9, 0xce4987ce, 0x55ffaa55, 0x28785028, 0xdf7aa5df, 0x8c8f038c, 0xa1f859a1, 0x89800989, 0x0d171a0d, 0xbfda65bf, 0xe631d7e6, 0x42c68442, 0x68b8d068, 0x41c38241, 0x99b02999, 0x2d775a2d, 0x0f111e0f, 0xb0cb7bb0, 0x54fca854, 0xbbd66dbb, 0x163a2c16,
};

__constant u32 Gd[256] = {
    0x6363a5c6, 0x7c7c84f8, 0x777799ee, 0x7b7b8df6, 0xf2f20dff, 0x6b6bbdd6, 0x6f6fb1de, 0xc5c55491, 0x30305060, 0x01010302, 0x6767a9ce, 0x2b2b7d56, 0xfefe19e7, 0xd7d762b5, 0xababe64d, 0x76769aec, 0xcaca458f, 0x82829d1f, 0xc9c94089, 0x7d7d87fa, 0xfafa15ef, 0x5959ebb2, 0x4747c98e, 0xf0f00bfb, 0xadadec41, 0xd4d467b3, 0xa2a2fd5f, 0xafafea45, 0x9c9cbf23, 0xa4a4f753, 0x727296e4, 0xc0c05b9b, 0xb7b7c275, 0xfdfd1ce1, 0x9393ae3d, 0x26266a4c, 0x36365a6c,
    0x3f3f417e, 0xf7f702f5, 0xcccc4f83, 0x34345c68, 0xa5a5f451, 0xe5e534d1, 0xf1f108f9, 0x717193e2, 0xd8d873ab, 0x31315362, 0x15153f2a, 0x04040c08, 0xc7c75295, 0x23236546, 0xc3c35e9d, 0x18182830, 0x9696a137, 0x05050f0a, 0x9a9ab52f, 0x0707090e, 0x12123624, 0x80809b1b, 0xe2e23ddf, 0xebeb26cd, 0x2727694e, 0xb2b2cd7f, 0x75759fea, 0x09091b12, 0x83839e1d, 0x2c2c7458, 0x1a1a2e34, 0x1b1b2d36, 0x6e6eb2dc, 0x5a5aeeb4, 0xa0a0fb5b, 0x5252f6a4, 0x3b3b4d76,
    0xd6d661b7, 0xb3b3ce7d, 0x29297b52, 0xe3e33edd, 0x2f2f715e, 0x84849713, 0x5353f5a6, 0xd1d168b9, 0x00000000, 0xeded2cc1, 0x20206040, 0xfcfc1fe3, 0xb1b1c879, 0x5b5bedb6, 0x6a6abed4, 0xcbcb468d, 0xbebed967, 0x39394b72, 0x4a4ade94, 0x4c4cd498, 0x5858e8b0, 0xcfcf4a85, 0xd0d06bbb, 0xefef2ac5, 0xaaaae54f, 0xfbfb16ed, 0x4343c586, 0x4d4dd79a, 0x33335566, 0x85859411, 0x4545cf8a, 0xf9f910e9, 0x02020604, 0x7f7f81fe, 0x5050f0a0, 0x3c3c4478, 0x9f9fba25,
    0xa8a8e34b, 0x5151f3a2, 0xa3a3fe5d, 0x4040c080, 0x8f8f8a05, 0x9292ad3f, 0x9d9dbc21, 0x38384870, 0xf5f504f1, 0xbcbcdf63, 0xb6b6c177, 0xdada75af, 0x21216342, 0x10103020, 0xffff1ae5, 0xf3f30efd, 0xd2d26dbf, 0xcdcd4c81, 0x0c0c1418, 0x13133526, 0xecec2fc3, 0x5f5fe1be, 0x9797a235, 0x4444cc88, 0x1717392e, 0xc4c45793, 0xa7a7f255, 0x7e7e82fc, 0x3d3d477a, 0x6464acc8, 0x5d5de7ba, 0x19192b32, 0x737395e6, 0x6060a0c0, 0x81819819, 0x4f4fd19e, 0xdcdc7fa3,
    0x22226644, 0x2a2a7e54, 0x9090ab3b, 0x8888830b, 0x4646ca8c, 0xeeee29c7, 0xb8b8d36b, 0x14143c28, 0xdede79a7, 0x5e5ee2bc, 0x0b0b1d16, 0xdbdb76ad, 0xe0e03bdb, 0x32325664, 0x3a3a4e74, 0x0a0a1e14, 0x4949db92, 0x06060a0c, 0x24246c48, 0x5c5ce4b8, 0xc2c25d9f, 0xd3d36ebd, 0xacacef43, 0x6262a6c4, 0x9191a839, 0x9595a431, 0xe4e437d3, 0x79798bf2, 0xe7e732d5, 0xc8c8438b, 0x3737596e, 0x6d6db7da, 0x8d8d8c01, 0xd5d564b1, 0x4e4ed29c, 0xa9a9e049, 0x6c6cb4d8,
    0x5656faac, 0xf4f407f3, 0xeaea25cf, 0x6565afca, 0x7a7a8ef4, 0xaeaee947, 0x08081810, 0xbabad56f, 0x787888f0, 0x25256f4a, 0x2e2e725c, 0x1c1c2438, 0xa6a6f157, 0xb4b4c773, 0xc6c65197, 0xe8e823cb, 0xdddd7ca1, 0x74749ce8, 0x1f1f213e, 0x4b4bdd96, 0xbdbddc61, 0x8b8b860d, 0x8a8a850f, 0x707090e0, 0x3e3e427c, 0xb5b5c471, 0x6666aacc, 0x4848d890, 0x03030506, 0xf6f601f7, 0x0e0e121c, 0x6161a3c2, 0x35355f6a, 0x5757f9ae, 0xb9b9d069, 0x86869117, 0xc1c15899,
    0x1d1d273a, 0x9e9eb927, 0xe1e138d9, 0xf8f813eb, 0x9898b32b, 0x11113322, 0x6969bbd2, 0xd9d970a9, 0x8e8e8907, 0x9494a733, 0x9b9bb62d, 0x1e1e223c, 0x87879215, 0xe9e920c9, 0xcece4987, 0x5555ffaa, 0x28287850, 0xdfdf7aa5, 0x8c8c8f03, 0xa1a1f859, 0x89898009, 0x0d0d171a, 0xbfbfda65, 0xe6e631d7, 0x4242c684, 0x6868b8d0, 0x4141c382, 0x9999b029, 0x2d2d775a, 0x0f0f111e, 0xb0b0cb7b, 0x5454fca8, 0xbbbbd66d, 0x16163a2c,
};

__constant u32 Ge[256] = {
    0x63636363, 0x7c7c7c7c, 0x77777777, 0x7b7b7b7b, 0xf2f2f2f2, 0x6b6b6b6b, 0x6f6f6f6f, 0xc5c5c5c5, 0x30303030, 0x01010101, 0x67676767, 0x2b2b2b2b, 0xfefefefe, 0xd7d7d7d7, 0xabababab, 0x76767676, 0xcacacaca, 0x82828282, 0xc9c9c9c9, 0x7d7d7d7d, 0xfafafafa, 0x59595959, 0x47474747, 0xf0f0f0f0, 0xadadadad, 0xd4d4d4d4, 0xa2a2a2a2, 0xafafafaf, 0x9c9c9c9c, 0xa4a4a4a4, 0x72727272, 0xc0c0c0c0, 0xb7b7b7b7, 0xfdfdfdfd, 0x93939393, 0x26262626, 0x36363636,
    0x3f3f3f3f, 0xf7f7f7f7, 0xcccccccc, 0x34343434, 0xa5a5a5a5, 0xe5e5e5e5, 0xf1f1f1f1, 0x71717171, 0xd8d8d8d8, 0x31313131, 0x15151515, 0x04040404, 0xc7c7c7c7, 0x23232323, 0xc3c3c3c3, 0x18181818, 0x96969696, 0x05050505, 0x9a9a9a9a, 0x07070707, 0x12121212, 0x80808080, 0xe2e2e2e2, 0xebebebeb, 0x27272727, 0xb2b2b2b2, 0x75757575, 0x09090909, 0x83838383, 0x2c2c2c2c, 0x1a1a1a1a, 0x1b1b1b1b, 0x6e6e6e6e, 0x5a5a5a5a, 0xa0a0a0a0, 0x52525252, 0x3b3b3b3b,
    0xd6d6d6d6, 0xb3b3b3b3, 0x29292929, 0xe3e3e3e3, 0x2f2f2f2f, 0x84848484, 0x53535353, 0xd1d1d1d1, 0x00000000, 0xedededed, 0x20202020, 0xfcfcfcfc, 0xb1b1b1b1, 0x5b5b5b5b, 0x6a6a6a6a, 0xcbcbcbcb, 0xbebebebe, 0x39393939, 0x4a4a4a4a, 0x4c4c4c4c, 0x58585858, 0xcfcfcfcf, 0xd0d0d0d0, 0xefefefef, 0xaaaaaaaa, 0xfbfbfbfb, 0x43434343, 0x4d4d4d4d, 0x33333333, 0x85858585, 0x45454545, 0xf9f9f9f9, 0x02020202, 0x7f7f7f7f, 0x50505050, 0x3c3c3c3c, 0x9f9f9f9f,
    0xa8a8a8a8, 0x51515151, 0xa3a3a3a3, 0x40404040, 0x8f8f8f8f, 0x92929292, 0x9d9d9d9d, 0x38383838, 0xf5f5f5f5, 0xbcbcbcbc, 0xb6b6b6b6, 0xdadadada, 0x21212121, 0x10101010, 0xffffffff, 0xf3f3f3f3, 0xd2d2d2d2, 0xcdcdcdcd, 0x0c0c0c0c, 0x13131313, 0xecececec, 0x5f5f5f5f, 0x97979797, 0x44444444, 0x17171717, 0xc4c4c4c4, 0xa7a7a7a7, 0x7e7e7e7e, 0x3d3d3d3d, 0x64646464, 0x5d5d5d5d, 0x19191919, 0x73737373, 0x60606060, 0x81818181, 0x4f4f4f4f, 0xdcdcdcdc,
    0x22222222, 0x2a2a2a2a, 0x90909090, 0x88888888, 0x46464646, 0xeeeeeeee, 0xb8b8b8b8, 0x14141414, 0xdededede, 0x5e5e5e5e, 0x0b0b0b0b, 0xdbdbdbdb, 0xe0e0e0e0, 0x32323232, 0x3a3a3a3a, 0x0a0a0a0a, 0x49494949, 0x06060606, 0x24242424, 0x5c5c5c5c, 0xc2c2c2c2, 0xd3d3d3d3, 0xacacacac, 0x62626262, 0x91919191, 0x95959595, 0xe4e4e4e4, 0x79797979, 0xe7e7e7e7, 0xc8c8c8c8, 0x37373737, 0x6d6d6d6d, 0x8d8d8d8d, 0xd5d5d5d5, 0x4e4e4e4e, 0xa9a9a9a9, 0x6c6c6c6c,
    0x56565656, 0xf4f4f4f4, 0xeaeaeaea, 0x65656565, 0x7a7a7a7a, 0xaeaeaeae, 0x08080808, 0xbabababa, 0x78787878, 0x25252525, 0x2e2e2e2e, 0x1c1c1c1c, 0xa6a6a6a6, 0xb4b4b4b4, 0xc6c6c6c6, 0xe8e8e8e8, 0xdddddddd, 0x74747474, 0x1f1f1f1f, 0x4b4b4b4b, 0xbdbdbdbd, 0x8b8b8b8b, 0x8a8a8a8a, 0x70707070, 0x3e3e3e3e, 0xb5b5b5b5, 0x66666666, 0x48484848, 0x03030303, 0xf6f6f6f6, 0x0e0e0e0e, 0x61616161, 0x35353535, 0x57575757, 0xb9b9b9b9, 0x86868686, 0xc1c1c1c1,
    0x1d1d1d1d, 0x9e9e9e9e, 0xe1e1e1e1, 0xf8f8f8f8, 0x98989898, 0x11111111, 0x69696969, 0xd9d9d9d9, 0x8e8e8e8e, 0x94949494, 0x9b9b9b9b, 0x1e1e1e1e, 0x87878787, 0xe9e9e9e9, 0xcececece, 0x55555555, 0x28282828, 0xdfdfdfdf, 0x8c8c8c8c, 0xa1a1a1a1, 0x89898989, 0x0d0d0d0d, 0xbfbfbfbf, 0xe6e6e6e6, 0x42424242, 0x68686868, 0x41414141, 0x99999999, 0x2d2d2d2d, 0x0f0f0f0f, 0xb0b0b0b0, 0x54545454, 0xbbbbbbbb, 0x16161616,
};

__constant u32 Gf[256] = {
    0x51f4a750, 0x7e416553, 0x1a17a4c3, 0x3a275e96, 0x3bab6bcb, 0x1f9d45f1, 0xacfa58ab, 0x4be30393, 0x2030fa55, 0xad766df6, 0x88cc7691, 0xf5024c25, 0x4fe5d7fc, 0xc52acbd7, 0x26354480, 0xb562a38f, 0xdeb15a49, 0x25ba1b67, 0x45ea0e98, 0x5dfec0e1, 0xc32f7502, 0x814cf012, 0x8d4697a3, 0x6bd3f9c6, 0x038f5fe7, 0x15929c95, 0xbf6d7aeb, 0x955259da, 0xd4be832d, 0x587421d3, 0x49e06929, 0x8ec9c844, 0x75c2896a, 0xf48e7978, 0x99583e6b, 0x27b971dd, 0xbee14fb6,
    0xf088ad17, 0xc920ac66, 0x7dce3ab4, 0x63df4a18, 0xe51a3182, 0x97513360, 0x62537f45, 0xb16477e0, 0xbb6bae84, 0xfe81a01c, 0xf9082b94, 0x70486858, 0x8f45fd19, 0x94de6c87, 0x527bf8b7, 0xab73d323, 0x724b02e2, 0xe31f8f57, 0x6655ab2a, 0xb2eb2807, 0x2fb5c203, 0x86c57b9a, 0xd33708a5, 0x302887f2, 0x23bfa5b2, 0x02036aba, 0xed16825c, 0x8acf1c2b, 0xa779b492, 0xf307f2f0, 0x4e69e2a1, 0x65daf4cd, 0x0605bed5, 0xd134621f, 0xc4a6fe8a, 0x342e539d, 0xa2f355a0,
    0x058ae132, 0xa4f6eb75, 0x0b83ec39, 0x4060efaa, 0x5e719f06, 0xbd6e1051, 0x3e218af9, 0x96dd063d, 0xdd3e05ae, 0x4de6bd46, 0x91548db5, 0x71c45d05, 0x0406d46f, 0x605015ff, 0x1998fb24, 0xd6bde997, 0x894043cc, 0x67d99e77, 0xb0e842bd, 0x07898b88, 0xe7195b38, 0x79c8eedb, 0xa17c0a47, 0x7c420fe9, 0xf8841ec9, 0x00000000, 0x09808683, 0x322bed48, 0x1e1170ac, 0x6c5a724e, 0xfd0efffb, 0x0f853856, 0x3daed51e, 0x362d3927, 0x0a0fd964, 0x685ca621, 0x9b5b54d1,
    0x24362e3a, 0x0c0a67b1, 0x9357e70f, 0xb4ee96d2, 0x1b9b919e, 0x80c0c54f, 0x61dc20a2, 0x5a774b69, 0x1c121a16, 0xe293ba0a, 0xc0a02ae5, 0x3c22e043, 0x121b171d, 0x0e090d0b, 0xf28bc7ad, 0x2db6a8b9, 0x141ea9c8, 0x57f11985, 0xaf75074c, 0xee99ddbb, 0xa37f60fd, 0xf701269f, 0x5c72f5bc, 0x44663bc5, 0x5bfb7e34, 0x8b432976, 0xcb23c6dc, 0xb6edfc68, 0xb8e4f163, 0xd731dcca, 0x42638510, 0x13972240, 0x84c61120, 0x854a247d, 0xd2bb3df8, 0xaef93211, 0xc729a16d,
    0x1d9e2f4b, 0xdcb230f3, 0x0d8652ec, 0x77c1e3d0, 0x2bb3166c, 0xa970b999, 0x119448fa, 0x47e96422, 0xa8fc8cc4, 0xa0f03f1a, 0x567d2cd8, 0x223390ef, 0x87494ec7, 0xd938d1c1, 0x8ccaa2fe, 0x98d40b36, 0xa6f581cf, 0xa57ade28, 0xdab78e26, 0x3fadbfa4, 0x2c3a9de4, 0x5078920d, 0x6a5fcc9b, 0x547e4662, 0xf68d13c2, 0x90d8b8e8, 0x2e39f75e, 0x82c3aff5, 0x9f5d80be, 0x69d0937c, 0x6fd52da9, 0xcf2512b3, 0xc8ac993b, 0x10187da7, 0xe89c636e, 0xdb3bbb7b, 0xcd267809,
    0x6e5918f4, 0xec9ab701, 0x834f9aa8, 0xe6956e65, 0xaaffe67e, 0x21bccf08, 0xef15e8e6, 0xbae79bd9, 0x4a6f36ce, 0xea9f09d4, 0x29b07cd6, 0x31a4b2af, 0x2a3f2331, 0xc6a59430, 0x35a266c0, 0x744ebc37, 0xfc82caa6, 0xe090d0b0, 0x33a7d815, 0xf104984a, 0x41ecdaf7, 0x7fcd500e, 0x1791f62f, 0x764dd68d, 0x43efb04d, 0xccaa4d54, 0xe49604df, 0x9ed1b5e3, 0x4c6a881b, 0xc12c1fb8, 0x4665517f, 0x9d5eea04, 0x018c355d, 0xfa877473, 0xfb0b412e, 0xb3671d5a, 0x92dbd252,
    0xe9105633, 0x6dd64713, 0x9ad7618c, 0x37a10c7a, 0x59f8148e, 0xeb133c89, 0xcea927ee, 0xb761c935, 0xe11ce5ed, 0x7a47b13c, 0x9cd2df59, 0x55f2733f, 0x1814ce79, 0x73c737bf, 0x53f7cdea, 0x5ffdaa5b, 0xdf3d6f14, 0x7844db86, 0xcaaff381, 0xb968c43e, 0x3824342c, 0xc2a3405f, 0x161dc372, 0xbce2250c, 0x283c498b, 0xff0d9541, 0x39a80171, 0x080cb3de, 0xd8b4e49c, 0x6456c190, 0x7bcb8461, 0xd532b670, 0x486c5c74, 0xd0b85742,
};

__constant u32 Gg[256] = {
    0x5051f4a7, 0x537e4165, 0xc31a17a4, 0x963a275e, 0xcb3bab6b, 0xf11f9d45, 0xabacfa58, 0x934be303, 0x552030fa, 0xf6ad766d, 0x9188cc76, 0x25f5024c, 0xfc4fe5d7, 0xd7c52acb, 0x80263544, 0x8fb562a3, 0x49deb15a, 0x6725ba1b, 0x9845ea0e, 0xe15dfec0, 0x02c32f75, 0x12814cf0, 0xa38d4697, 0xc66bd3f9, 0xe7038f5f, 0x9515929c, 0xebbf6d7a, 0xda955259, 0x2dd4be83, 0xd3587421, 0x2949e069, 0x448ec9c8, 0x6a75c289, 0x78f48e79, 0x6b99583e, 0xdd27b971, 0xb6bee14f,
    0x17f088ad, 0x66c920ac, 0xb47dce3a, 0x1863df4a, 0x82e51a31, 0x60975133, 0x4562537f, 0xe0b16477, 0x84bb6bae, 0x1cfe81a0, 0x94f9082b, 0x58704868, 0x198f45fd, 0x8794de6c, 0xb7527bf8, 0x23ab73d3, 0xe2724b02, 0x57e31f8f, 0x2a6655ab, 0x07b2eb28, 0x032fb5c2, 0x9a86c57b, 0xa5d33708, 0xf2302887, 0xb223bfa5, 0xba02036a, 0x5ced1682, 0x2b8acf1c, 0x92a779b4, 0xf0f307f2, 0xa14e69e2, 0xcd65daf4, 0xd50605be, 0x1fd13462, 0x8ac4a6fe, 0x9d342e53, 0xa0a2f355,
    0x32058ae1, 0x75a4f6eb, 0x390b83ec, 0xaa4060ef, 0x065e719f, 0x51bd6e10, 0xf93e218a, 0x3d96dd06, 0xaedd3e05, 0x464de6bd, 0xb591548d, 0x0571c45d, 0x6f0406d4, 0xff605015, 0x241998fb, 0x97d6bde9, 0xcc894043, 0x7767d99e, 0xbdb0e842, 0x8807898b, 0x38e7195b, 0xdb79c8ee, 0x47a17c0a, 0xe97c420f, 0xc9f8841e, 0x00000000, 0x83098086, 0x48322bed, 0xac1e1170, 0x4e6c5a72, 0xfbfd0eff, 0x560f8538, 0x1e3daed5, 0x27362d39, 0x640a0fd9, 0x21685ca6, 0xd19b5b54,
    0x3a24362e, 0xb10c0a67, 0x0f9357e7, 0xd2b4ee96, 0x9e1b9b91, 0x4f80c0c5, 0xa261dc20, 0x695a774b, 0x161c121a, 0x0ae293ba, 0xe5c0a02a, 0x433c22e0, 0x1d121b17, 0x0b0e090d, 0xadf28bc7, 0xb92db6a8, 0xc8141ea9, 0x8557f119, 0x4caf7507, 0xbbee99dd, 0xfda37f60, 0x9ff70126, 0xbc5c72f5, 0xc544663b, 0x345bfb7e, 0x768b4329, 0xdccb23c6, 0x68b6edfc, 0x63b8e4f1, 0xcad731dc, 0x10426385, 0x40139722, 0x2084c611, 0x7d854a24, 0xf8d2bb3d, 0x11aef932, 0x6dc729a1,
    0x4b1d9e2f, 0xf3dcb230, 0xec0d8652, 0xd077c1e3, 0x6c2bb316, 0x99a970b9, 0xfa119448, 0x2247e964, 0xc4a8fc8c, 0x1aa0f03f, 0xd8567d2c, 0xef223390, 0xc787494e, 0xc1d938d1, 0xfe8ccaa2, 0x3698d40b, 0xcfa6f581, 0x28a57ade, 0x26dab78e, 0xa43fadbf, 0xe42c3a9d, 0x0d507892, 0x9b6a5fcc, 0x62547e46, 0xc2f68d13, 0xe890d8b8, 0x5e2e39f7, 0xf582c3af, 0xbe9f5d80, 0x7c69d093, 0xa96fd52d, 0xb3cf2512, 0x3bc8ac99, 0xa710187d, 0x6ee89c63, 0x7bdb3bbb, 0x09cd2678,
    0xf46e5918, 0x01ec9ab7, 0xa8834f9a, 0x65e6956e, 0x7eaaffe6, 0x0821bccf, 0xe6ef15e8, 0xd9bae79b, 0xce4a6f36, 0xd4ea9f09, 0xd629b07c, 0xaf31a4b2, 0x312a3f23, 0x30c6a594, 0xc035a266, 0x37744ebc, 0xa6fc82ca, 0xb0e090d0, 0x1533a7d8, 0x4af10498, 0xf741ecda, 0x0e7fcd50, 0x2f1791f6, 0x8d764dd6, 0x4d43efb0, 0x54ccaa4d, 0xdfe49604, 0xe39ed1b5, 0x1b4c6a88, 0xb8c12c1f, 0x7f466551, 0x049d5eea, 0x5d018c35, 0x73fa8774, 0x2efb0b41, 0x5ab3671d, 0x5292dbd2,
    0x33e91056, 0x136dd647, 0x8c9ad761, 0x7a37a10c, 0x8e59f814, 0x89eb133c, 0xeecea927, 0x35b761c9, 0xede11ce5, 0x3c7a47b1, 0x599cd2df, 0x3f55f273, 0x791814ce, 0xbf73c737, 0xea53f7cd, 0x5b5ffdaa, 0x14df3d6f, 0x867844db, 0x81caaff3, 0x3eb968c4, 0x2c382434, 0x5fc2a340, 0x72161dc3, 0x0cbce225, 0x8b283c49, 0x41ff0d95, 0x7139a801, 0xde080cb3, 0x9cd8b4e4, 0x906456c1, 0x617bcb84, 0x70d532b6, 0x74486c5c, 0x42d0b857,
};

__constant u32 Gh[256] = {
    0xa75051f4, 0x65537e41, 0xa4c31a17, 0x5e963a27, 0x6bcb3bab, 0x45f11f9d, 0x58abacfa, 0x03934be3, 0xfa552030, 0x6df6ad76, 0x769188cc, 0x4c25f502, 0xd7fc4fe5, 0xcbd7c52a, 0x44802635, 0xa38fb562, 0x5a49deb1, 0x1b6725ba, 0x0e9845ea, 0xc0e15dfe, 0x7502c32f, 0xf012814c, 0x97a38d46, 0xf9c66bd3, 0x5fe7038f, 0x9c951592, 0x7aebbf6d, 0x59da9552, 0x832dd4be, 0x21d35874, 0x692949e0, 0xc8448ec9, 0x896a75c2, 0x7978f48e, 0x3e6b9958, 0x71dd27b9, 0x4fb6bee1,
    0xad17f088, 0xac66c920, 0x3ab47dce, 0x4a1863df, 0x3182e51a, 0x33609751, 0x7f456253, 0x77e0b164, 0xae84bb6b, 0xa01cfe81, 0x2b94f908, 0x68587048, 0xfd198f45, 0x6c8794de, 0xf8b7527b, 0xd323ab73, 0x02e2724b, 0x8f57e31f, 0xab2a6655, 0x2807b2eb, 0xc2032fb5, 0x7b9a86c5, 0x08a5d337, 0x87f23028, 0xa5b223bf, 0x6aba0203, 0x825ced16, 0x1c2b8acf, 0xb492a779, 0xf2f0f307, 0xe2a14e69, 0xf4cd65da, 0xbed50605, 0x621fd134, 0xfe8ac4a6, 0x539d342e, 0x55a0a2f3,
    0xe132058a, 0xeb75a4f6, 0xec390b83, 0xefaa4060, 0x9f065e71, 0x1051bd6e, 0x8af93e21, 0x063d96dd, 0x05aedd3e, 0xbd464de6, 0x8db59154, 0x5d0571c4, 0xd46f0406, 0x15ff6050, 0xfb241998, 0xe997d6bd, 0x43cc8940, 0x9e7767d9, 0x42bdb0e8, 0x8b880789, 0x5b38e719, 0xeedb79c8, 0x0a47a17c, 0x0fe97c42, 0x1ec9f884, 0x00000000, 0x86830980, 0xed48322b, 0x70ac1e11, 0x724e6c5a, 0xfffbfd0e, 0x38560f85, 0xd51e3dae, 0x3927362d, 0xd9640a0f, 0xa621685c, 0x54d19b5b,
    0x2e3a2436, 0x67b10c0a, 0xe70f9357, 0x96d2b4ee, 0x919e1b9b, 0xc54f80c0, 0x20a261dc, 0x4b695a77, 0x1a161c12, 0xba0ae293, 0x2ae5c0a0, 0xe0433c22, 0x171d121b, 0x0d0b0e09, 0xc7adf28b, 0xa8b92db6, 0xa9c8141e, 0x198557f1, 0x074caf75, 0xddbbee99, 0x60fda37f, 0x269ff701, 0xf5bc5c72, 0x3bc54466, 0x7e345bfb, 0x29768b43, 0xc6dccb23, 0xfc68b6ed, 0xf163b8e4, 0xdccad731, 0x85104263, 0x22401397, 0x112084c6, 0x247d854a, 0x3df8d2bb, 0x3211aef9, 0xa16dc729,
    0x2f4b1d9e, 0x30f3dcb2, 0x52ec0d86, 0xe3d077c1, 0x166c2bb3, 0xb999a970, 0x48fa1194, 0x642247e9, 0x8cc4a8fc, 0x3f1aa0f0, 0x2cd8567d, 0x90ef2233, 0x4ec78749, 0xd1c1d938, 0xa2fe8cca, 0x0b3698d4, 0x81cfa6f5, 0xde28a57a, 0x8e26dab7, 0xbfa43fad, 0x9de42c3a, 0x920d5078, 0xcc9b6a5f, 0x4662547e, 0x13c2f68d, 0xb8e890d8, 0xf75e2e39, 0xaff582c3, 0x80be9f5d, 0x937c69d0, 0x2da96fd5, 0x12b3cf25, 0x993bc8ac, 0x7da71018, 0x636ee89c, 0xbb7bdb3b, 0x7809cd26,
    0x18f46e59, 0xb701ec9a, 0x9aa8834f, 0x6e65e695, 0xe67eaaff, 0xcf0821bc, 0xe8e6ef15, 0x9bd9bae7, 0x36ce4a6f, 0x09d4ea9f, 0x7cd629b0, 0xb2af31a4, 0x23312a3f, 0x9430c6a5, 0x66c035a2, 0xbc37744e, 0xcaa6fc82, 0xd0b0e090, 0xd81533a7, 0x984af104, 0xdaf741ec, 0x500e7fcd, 0xf62f1791, 0xd68d764d, 0xb04d43ef, 0x4d54ccaa, 0x04dfe496, 0xb5e39ed1, 0x881b4c6a, 0x1fb8c12c, 0x517f4665, 0xea049d5e, 0x355d018c, 0x7473fa87, 0x412efb0b, 0x1d5ab367, 0xd25292db,
    0x5633e910, 0x47136dd6, 0x618c9ad7, 0x0c7a37a1, 0x148e59f8, 0x3c89eb13, 0x27eecea9, 0xc935b761, 0xe5ede11c, 0xb13c7a47, 0xdf599cd2, 0x733f55f2, 0xce791814, 0x37bf73c7, 0xcdea53f7, 0xaa5b5ffd, 0x6f14df3d, 0xdb867844, 0xf381caaf, 0xc43eb968, 0x342c3824, 0x405fc2a3, 0xc372161d, 0x250cbce2, 0x498b283c, 0x9541ff0d, 0x017139a8, 0xb3de080c, 0xe49cd8b4, 0xc1906456, 0x84617bcb, 0xb670d532, 0x5c74486c, 0x5742d0b8,
};

__constant u32 Gi[256] = {
    0xf4a75051, 0x4165537e, 0x17a4c31a, 0x275e963a, 0xab6bcb3b, 0x9d45f11f, 0xfa58abac, 0xe303934b, 0x30fa5520, 0x766df6ad, 0xcc769188, 0x024c25f5, 0xe5d7fc4f, 0x2acbd7c5, 0x35448026, 0x62a38fb5, 0xb15a49de, 0xba1b6725, 0xea0e9845, 0xfec0e15d, 0x2f7502c3, 0x4cf01281, 0x4697a38d, 0xd3f9c66b, 0x8f5fe703, 0x929c9515, 0x6d7aebbf, 0x5259da95, 0xbe832dd4, 0x7421d358, 0xe0692949, 0xc9c8448e, 0xc2896a75, 0x8e7978f4, 0x583e6b99, 0xb971dd27, 0xe14fb6be,
    0x88ad17f0, 0x20ac66c9, 0xce3ab47d, 0xdf4a1863, 0x1a3182e5, 0x51336097, 0x537f4562, 0x6477e0b1, 0x6bae84bb, 0x81a01cfe, 0x082b94f9, 0x48685870, 0x45fd198f, 0xde6c8794, 0x7bf8b752, 0x73d323ab, 0x4b02e272, 0x1f8f57e3, 0x55ab2a66, 0xeb2807b2, 0xb5c2032f, 0xc57b9a86, 0x3708a5d3, 0x2887f230, 0xbfa5b223, 0x036aba02, 0x16825ced, 0xcf1c2b8a, 0x79b492a7, 0x07f2f0f3, 0x69e2a14e, 0xdaf4cd65, 0x05bed506, 0x34621fd1, 0xa6fe8ac4, 0x2e539d34, 0xf355a0a2,
    0x8ae13205, 0xf6eb75a4, 0x83ec390b, 0x60efaa40, 0x719f065e, 0x6e1051bd, 0x218af93e, 0xdd063d96, 0x3e05aedd, 0xe6bd464d, 0x548db591, 0xc45d0571, 0x06d46f04, 0x5015ff60, 0x98fb2419, 0xbde997d6, 0x4043cc89, 0xd99e7767, 0xe842bdb0, 0x898b8807, 0x195b38e7, 0xc8eedb79, 0x7c0a47a1, 0x420fe97c, 0x841ec9f8, 0x00000000, 0x80868309, 0x2bed4832, 0x1170ac1e, 0x5a724e6c, 0x0efffbfd, 0x8538560f, 0xaed51e3d, 0x2d392736, 0x0fd9640a, 0x5ca62168, 0x5b54d19b,
    0x362e3a24, 0x0a67b10c, 0x57e70f93, 0xee96d2b4, 0x9b919e1b, 0xc0c54f80, 0xdc20a261, 0x774b695a, 0x121a161c, 0x93ba0ae2, 0xa02ae5c0, 0x22e0433c, 0x1b171d12, 0x090d0b0e, 0x8bc7adf2, 0xb6a8b92d, 0x1ea9c814, 0xf1198557, 0x75074caf, 0x99ddbbee, 0x7f60fda3, 0x01269ff7, 0x72f5bc5c, 0x663bc544, 0xfb7e345b, 0x4329768b, 0x23c6dccb, 0xedfc68b6, 0xe4f163b8, 0x31dccad7, 0x63851042, 0x97224013, 0xc6112084, 0x4a247d85, 0xbb3df8d2, 0xf93211ae, 0x29a16dc7,
    0x9e2f4b1d, 0xb230f3dc, 0x8652ec0d, 0xc1e3d077, 0xb3166c2b, 0x70b999a9, 0x9448fa11, 0xe9642247, 0xfc8cc4a8, 0xf03f1aa0, 0x7d2cd856, 0x3390ef22, 0x494ec787, 0x38d1c1d9, 0xcaa2fe8c, 0xd40b3698, 0xf581cfa6, 0x7ade28a5, 0xb78e26da, 0xadbfa43f, 0x3a9de42c, 0x78920d50, 0x5fcc9b6a, 0x7e466254, 0x8d13c2f6, 0xd8b8e890, 0x39f75e2e, 0xc3aff582, 0x5d80be9f, 0xd0937c69, 0xd52da96f, 0x2512b3cf, 0xac993bc8, 0x187da710, 0x9c636ee8, 0x3bbb7bdb, 0x267809cd,
    0x5918f46e, 0x9ab701ec, 0x4f9aa883, 0x956e65e6, 0xffe67eaa, 0xbccf0821, 0x15e8e6ef, 0xe79bd9ba, 0x6f36ce4a, 0x9f09d4ea, 0xb07cd629, 0xa4b2af31, 0x3f23312a, 0xa59430c6, 0xa266c035, 0x4ebc3774, 0x82caa6fc, 0x90d0b0e0, 0xa7d81533, 0x04984af1, 0xecdaf741, 0xcd500e7f, 0x91f62f17, 0x4dd68d76, 0xefb04d43, 0xaa4d54cc, 0x9604dfe4, 0xd1b5e39e, 0x6a881b4c, 0x2c1fb8c1, 0x65517f46, 0x5eea049d, 0x8c355d01, 0x877473fa, 0x0b412efb, 0x671d5ab3, 0xdbd25292,
    0x105633e9, 0xd647136d, 0xd7618c9a, 0xa10c7a37, 0xf8148e59, 0x133c89eb, 0xa927eece, 0x61c935b7, 0x1ce5ede1, 0x47b13c7a, 0xd2df599c, 0xf2733f55, 0x14ce7918, 0xc737bf73, 0xf7cdea53, 0xfdaa5b5f, 0x3d6f14df, 0x44db8678, 0xaff381ca, 0x68c43eb9, 0x24342c38, 0xa3405fc2, 0x1dc37216, 0xe2250cbc, 0x3c498b28, 0x0d9541ff, 0xa8017139, 0x0cb3de08, 0xb4e49cd8, 0x56c19064, 0xcb84617b, 0x32b670d5, 0x6c5c7448, 0xb85742d0,
};

__constant u32 Gj[256] = {
    0x52525252, 0x09090909, 0x6a6a6a6a, 0xd5d5d5d5, 0x30303030, 0x36363636, 0xa5a5a5a5, 0x38383838, 0xbfbfbfbf, 0x40404040, 0xa3a3a3a3, 0x9e9e9e9e, 0x81818181, 0xf3f3f3f3, 0xd7d7d7d7, 0xfbfbfbfb, 0x7c7c7c7c, 0xe3e3e3e3, 0x39393939, 0x82828282, 0x9b9b9b9b, 0x2f2f2f2f, 0xffffffff, 0x87878787, 0x34343434, 0x8e8e8e8e, 0x43434343, 0x44444444, 0xc4c4c4c4, 0xdededede, 0xe9e9e9e9, 0xcbcbcbcb, 0x54545454, 0x7b7b7b7b, 0x94949494, 0x32323232, 0xa6a6a6a6,
    0xc2c2c2c2, 0x23232323, 0x3d3d3d3d, 0xeeeeeeee, 0x4c4c4c4c, 0x95959595, 0x0b0b0b0b, 0x42424242, 0xfafafafa, 0xc3c3c3c3, 0x4e4e4e4e, 0x08080808, 0x2e2e2e2e, 0xa1a1a1a1, 0x66666666, 0x28282828, 0xd9d9d9d9, 0x24242424, 0xb2b2b2b2, 0x76767676, 0x5b5b5b5b, 0xa2a2a2a2, 0x49494949, 0x6d6d6d6d, 0x8b8b8b8b, 0xd1d1d1d1, 0x25252525, 0x72727272, 0xf8f8f8f8, 0xf6f6f6f6, 0x64646464, 0x86868686, 0x68686868, 0x98989898, 0x16161616, 0xd4d4d4d4, 0xa4a4a4a4,
    0x5c5c5c5c, 0xcccccccc, 0x5d5d5d5d, 0x65656565, 0xb6b6b6b6, 0x92929292, 0x6c6c6c6c, 0x70707070, 0x48484848, 0x50505050, 0xfdfdfdfd, 0xedededed, 0xb9b9b9b9, 0xdadadada, 0x5e5e5e5e, 0x15151515, 0x46464646, 0x57575757, 0xa7a7a7a7, 0x8d8d8d8d, 0x9d9d9d9d, 0x84848484, 0x90909090, 0xd8d8d8d8, 0xabababab, 0x00000000, 0x8c8c8c8c, 0xbcbcbcbc, 0xd3d3d3d3, 0x0a0a0a0a, 0xf7f7f7f7, 0xe4e4e4e4, 0x58585858, 0x05050505, 0xb8b8b8b8, 0xb3b3b3b3, 0x45454545,
    0x06060606, 0xd0d0d0d0, 0x2c2c2c2c, 0x1e1e1e1e, 0x8f8f8f8f, 0xcacacaca, 0x3f3f3f3f, 0x0f0f0f0f, 0x02020202, 0xc1c1c1c1, 0xafafafaf, 0xbdbdbdbd, 0x03030303, 0x01010101, 0x13131313, 0x8a8a8a8a, 0x6b6b6b6b, 0x3a3a3a3a, 0x91919191, 0x11111111, 0x41414141, 0x4f4f4f4f, 0x67676767, 0xdcdcdcdc, 0xeaeaeaea, 0x97979797, 0xf2f2f2f2, 0xcfcfcfcf, 0xcececece, 0xf0f0f0f0, 0xb4b4b4b4, 0xe6e6e6e6, 0x73737373, 0x96969696, 0xacacacac, 0x74747474, 0x22222222,
    0xe7e7e7e7, 0xadadadad, 0x35353535, 0x85858585, 0xe2e2e2e2, 0xf9f9f9f9, 0x37373737, 0xe8e8e8e8, 0x1c1c1c1c, 0x75757575, 0xdfdfdfdf, 0x6e6e6e6e, 0x47474747, 0xf1f1f1f1, 0x1a1a1a1a, 0x71717171, 0x1d1d1d1d, 0x29292929, 0xc5c5c5c5, 0x89898989, 0x6f6f6f6f, 0xb7b7b7b7, 0x62626262, 0x0e0e0e0e, 0xaaaaaaaa, 0x18181818, 0xbebebebe, 0x1b1b1b1b, 0xfcfcfcfc, 0x56565656, 0x3e3e3e3e, 0x4b4b4b4b, 0xc6c6c6c6, 0xd2d2d2d2, 0x79797979, 0x20202020, 0x9a9a9a9a,
    0xdbdbdbdb, 0xc0c0c0c0, 0xfefefefe, 0x78787878, 0xcdcdcdcd, 0x5a5a5a5a, 0xf4f4f4f4, 0x1f1f1f1f, 0xdddddddd, 0xa8a8a8a8, 0x33333333, 0x88888888, 0x07070707, 0xc7c7c7c7, 0x31313131, 0xb1b1b1b1, 0x12121212, 0x10101010, 0x59595959, 0x27272727, 0x80808080, 0xecececec, 0x5f5f5f5f, 0x60606060, 0x51515151, 0x7f7f7f7f, 0xa9a9a9a9, 0x19191919, 0xb5b5b5b5, 0x4a4a4a4a, 0x0d0d0d0d, 0x2d2d2d2d, 0xe5e5e5e5, 0x7a7a7a7a, 0x9f9f9f9f, 0x93939393, 0xc9c9c9c9,
    0x9c9c9c9c, 0xefefefef, 0xa0a0a0a0, 0xe0e0e0e0, 0x3b3b3b3b, 0x4d4d4d4d, 0xaeaeaeae, 0x2a2a2a2a, 0xf5f5f5f5, 0xb0b0b0b0, 0xc8c8c8c8, 0xebebebeb, 0xbbbbbbbb, 0x3c3c3c3c, 0x83838383, 0x53535353, 0x99999999, 0x61616161, 0x17171717, 0x2b2b2b2b, 0x04040404, 0x7e7e7e7e, 0xbabababa, 0x77777777, 0xd6d6d6d6, 0x26262626, 0xe1e1e1e1, 0x69696969, 0x14141414, 0x63636363, 0x55555555, 0x21212121, 0x0c0c0c0c, 0x7d7d7d7d,
};

__constant u32 Gk[] = {
    0x01000000, 0x02000000, 0x04000000, 0x08000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000, 0x1b000000, 0x36000000,
};

void BU(u32* a, const u32* b) {
  a[0] = b[0];
  a[1] = b[1];
  a[2] = b[2];
  a[3] = b[3];
  a[4] = b[4];
  a[5] = b[5];
  a[6] = b[6];
  a[7] = b[7];

  int c;
  int d;

  c = 0;
  d = 0;

  while (1) {
    u32 e = a[d + 7];

    a[d + 8] = a[d + 0] ^ (Gc[(e >> 16) & 0xff] & 0xff000000) ^ (Gd[(e >> 8) & 0xff] & 0x00ff0000) ^ (Ga[(e >> 0) & 0xff] & 0x0000ff00) ^ (Gb[(e >> 24) & 0xff] & 0x000000ff) ^ Gk[c];

    a[d + 9] = a[d + 1] ^ a[d + 8];
    a[d + 10] = a[d + 2] ^ a[d + 9];
    a[d + 11] = a[d + 3] ^ a[d + 10];

    if (++c == 7)
      break;

    e = a[d + 11];

    a[d + 12] = a[d + 4] ^ (Gc[(e >> 24) & 0xff] & 0xff000000) ^ (Gd[(e >> 16) & 0xff] & 0x00ff0000) ^ (Ga[(e >> 8) & 0xff] & 0x0000ff00) ^ (Gb[(e >> 0) & 0xff] & 0x000000ff);

    a[d + 13] = a[d + 5] ^ a[d + 12];
    a[d + 14] = a[d + 6] ^ a[d + 13];
    a[d + 15] = a[d + 7] ^ a[d + 14];

    d += 8;
  }
}

void BV(u32* a) {
  for (u32 b = 0, c = 56; b < c; b += 4, c -= 4) {
    u32 d;

    d = a[b + 0];
    a[b + 0] = a[c + 0];
    a[c + 0] = d;
    d = a[b + 1];
    a[b + 1] = a[c + 1];
    a[c + 1] = d;
    d = a[b + 2];
    a[b + 2] = a[c + 2];
    a[c + 2] = d;
    d = a[b + 3];
    a[b + 3] = a[c + 3];
    a[c + 3] = d;
  }

  for (u32 b = 1, c = 4; b < 14; b += 1, c += 4) {
    a[c + 0] = Gf[Gb[(a[c + 0] >> 24) & 0xff] & 0xff] ^ Gg[Gb[(a[c + 0] >> 16) & 0xff] & 0xff] ^ Gh[Gb[(a[c + 0] >> 8) & 0xff] & 0xff] ^ Gi[Gb[(a[c + 0] >> 0) & 0xff] & 0xff];

    a[c + 1] = Gf[Gb[(a[c + 1] >> 24) & 0xff] & 0xff] ^ Gg[Gb[(a[c + 1] >> 16) & 0xff] & 0xff] ^ Gh[Gb[(a[c + 1] >> 8) & 0xff] & 0xff] ^ Gi[Gb[(a[c + 1] >> 0) & 0xff] & 0xff];

    a[c + 2] = Gf[Gb[(a[c + 2] >> 24) & 0xff] & 0xff] ^ Gg[Gb[(a[c + 2] >> 16) & 0xff] & 0xff] ^ Gh[Gb[(a[c + 2] >> 8) & 0xff] & 0xff] ^ Gi[Gb[(a[c + 2] >> 0) & 0xff] & 0xff];

    a[c + 3] = Gf[Gb[(a[c + 3] >> 24) & 0xff] & 0xff] ^ Gg[Gb[(a[c + 3] >> 16) & 0xff] & 0xff] ^ Gh[Gb[(a[c + 3] >> 8) & 0xff] & 0xff] ^ Gi[Gb[(a[c + 3] >> 0) & 0xff] & 0xff];
  }
}

void BW(u32* a, const u32* b) {
  u32 c[8];

  c[0] = M(b[0]);
  c[1] = M(b[1]);
  c[2] = M(b[2]);
  c[3] = M(b[3]);
  c[4] = M(b[4]);
  c[5] = M(b[5]);
  c[6] = M(b[6]);
  c[7] = M(b[7]);

  BU(a, c);
}

void BX(u32* a, const u32* b) {
  u32 c[8];

  c[0] = M(b[0]);
  c[1] = M(b[1]);
  c[2] = M(b[2]);
  c[3] = M(b[3]);
  c[4] = M(b[4]);
  c[5] = M(b[5]);
  c[6] = M(b[6]);
  c[7] = M(b[7]);

  BU(a, c);

  BV(a);
}

void BY(const u32* a, const u32* b, u32* c) {
  u32 d[4];

  d[0] = M(b[0]);
  d[1] = M(b[1]);
  d[2] = M(b[2]);
  d[3] = M(b[3]);

  u32 e = d[0] ^ a[0];
  u32 f = d[1] ^ a[1];
  u32 g = d[2] ^ a[2];
  u32 h = d[3] ^ a[3];

  u32 i;
  u32 j;
  u32 k;
  u32 l;

  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[4];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[5];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[6];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[7];
  e = Gf[i >> 24] ^ Gg[(l >> 16) & 0xff] ^ Gh[(k >> 8) & 0xff] ^ Gi[j & 0xff] ^ a[8];
  f = Gf[j >> 24] ^ Gg[(i >> 16) & 0xff] ^ Gh[(l >> 8) & 0xff] ^ Gi[k & 0xff] ^ a[9];
  g = Gf[k >> 24] ^ Gg[(j >> 16) & 0xff] ^ Gh[(i >> 8) & 0xff] ^ Gi[l & 0xff] ^ a[10];
  h = Gf[l >> 24] ^ Gg[(k >> 16) & 0xff] ^ Gh[(j >> 8) & 0xff] ^ Gi[i & 0xff] ^ a[11];
  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[12];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[13];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[14];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[15];
  e = Gf[i >> 24] ^ Gg[(l >> 16) & 0xff] ^ Gh[(k >> 8) & 0xff] ^ Gi[j & 0xff] ^ a[16];
  f = Gf[j >> 24] ^ Gg[(i >> 16) & 0xff] ^ Gh[(l >> 8) & 0xff] ^ Gi[k & 0xff] ^ a[17];
  g = Gf[k >> 24] ^ Gg[(j >> 16) & 0xff] ^ Gh[(i >> 8) & 0xff] ^ Gi[l & 0xff] ^ a[18];
  h = Gf[l >> 24] ^ Gg[(k >> 16) & 0xff] ^ Gh[(j >> 8) & 0xff] ^ Gi[i & 0xff] ^ a[19];
  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[20];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[21];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[22];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[23];
  e = Gf[i >> 24] ^ Gg[(l >> 16) & 0xff] ^ Gh[(k >> 8) & 0xff] ^ Gi[j & 0xff] ^ a[24];
  f = Gf[j >> 24] ^ Gg[(i >> 16) & 0xff] ^ Gh[(l >> 8) & 0xff] ^ Gi[k & 0xff] ^ a[25];
  g = Gf[k >> 24] ^ Gg[(j >> 16) & 0xff] ^ Gh[(i >> 8) & 0xff] ^ Gi[l & 0xff] ^ a[26];
  h = Gf[l >> 24] ^ Gg[(k >> 16) & 0xff] ^ Gh[(j >> 8) & 0xff] ^ Gi[i & 0xff] ^ a[27];
  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[28];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[29];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[30];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[31];
  e = Gf[i >> 24] ^ Gg[(l >> 16) & 0xff] ^ Gh[(k >> 8) & 0xff] ^ Gi[j & 0xff] ^ a[32];
  f = Gf[j >> 24] ^ Gg[(i >> 16) & 0xff] ^ Gh[(l >> 8) & 0xff] ^ Gi[k & 0xff] ^ a[33];
  g = Gf[k >> 24] ^ Gg[(j >> 16) & 0xff] ^ Gh[(i >> 8) & 0xff] ^ Gi[l & 0xff] ^ a[34];
  h = Gf[l >> 24] ^ Gg[(k >> 16) & 0xff] ^ Gh[(j >> 8) & 0xff] ^ Gi[i & 0xff] ^ a[35];
  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[36];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[37];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[38];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[39];
  e = Gf[i >> 24] ^ Gg[(l >> 16) & 0xff] ^ Gh[(k >> 8) & 0xff] ^ Gi[j & 0xff] ^ a[40];
  f = Gf[j >> 24] ^ Gg[(i >> 16) & 0xff] ^ Gh[(l >> 8) & 0xff] ^ Gi[k & 0xff] ^ a[41];
  g = Gf[k >> 24] ^ Gg[(j >> 16) & 0xff] ^ Gh[(i >> 8) & 0xff] ^ Gi[l & 0xff] ^ a[42];
  h = Gf[l >> 24] ^ Gg[(k >> 16) & 0xff] ^ Gh[(j >> 8) & 0xff] ^ Gi[i & 0xff] ^ a[43];
  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[44];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[45];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[46];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[47];
  e = Gf[i >> 24] ^ Gg[(l >> 16) & 0xff] ^ Gh[(k >> 8) & 0xff] ^ Gi[j & 0xff] ^ a[48];
  f = Gf[j >> 24] ^ Gg[(i >> 16) & 0xff] ^ Gh[(l >> 8) & 0xff] ^ Gi[k & 0xff] ^ a[49];
  g = Gf[k >> 24] ^ Gg[(j >> 16) & 0xff] ^ Gh[(i >> 8) & 0xff] ^ Gi[l & 0xff] ^ a[50];
  h = Gf[l >> 24] ^ Gg[(k >> 16) & 0xff] ^ Gh[(j >> 8) & 0xff] ^ Gi[i & 0xff] ^ a[51];
  i = Gf[e >> 24] ^ Gg[(h >> 16) & 0xff] ^ Gh[(g >> 8) & 0xff] ^ Gi[f & 0xff] ^ a[52];
  j = Gf[f >> 24] ^ Gg[(e >> 16) & 0xff] ^ Gh[(h >> 8) & 0xff] ^ Gi[g & 0xff] ^ a[53];
  k = Gf[g >> 24] ^ Gg[(f >> 16) & 0xff] ^ Gh[(e >> 8) & 0xff] ^ Gi[h & 0xff] ^ a[54];
  l = Gf[h >> 24] ^ Gg[(g >> 16) & 0xff] ^ Gh[(f >> 8) & 0xff] ^ Gi[e & 0xff] ^ a[55];

  c[0] = (Gj[(i >> 24) & 0xff] & 0xff000000) ^ (Gj[(l >> 16) & 0xff] & 0x00ff0000) ^ (Gj[(k >> 8) & 0xff] & 0x0000ff00) ^ (Gj[(j >> 0) & 0xff] & 0x000000ff) ^ a[56];

  c[1] = (Gj[(j >> 24) & 0xff] & 0xff000000) ^ (Gj[(i >> 16) & 0xff] & 0x00ff0000) ^ (Gj[(l >> 8) & 0xff] & 0x0000ff00) ^ (Gj[(k >> 0) & 0xff] & 0x000000ff) ^ a[57];

  c[2] = (Gj[(k >> 24) & 0xff] & 0xff000000) ^ (Gj[(j >> 16) & 0xff] & 0x00ff0000) ^ (Gj[(i >> 8) & 0xff] & 0x0000ff00) ^ (Gj[(l >> 0) & 0xff] & 0x000000ff) ^ a[58];

  c[3] = (Gj[(l >> 24) & 0xff] & 0xff000000) ^ (Gj[(k >> 16) & 0xff] & 0x00ff0000) ^ (Gj[(j >> 8) & 0xff] & 0x0000ff00) ^ (Gj[(i >> 0) & 0xff] & 0x000000ff) ^ a[59];

  c[0] = M(c[0]);
  c[1] = M(c[1]);
  c[2] = M(c[2]);
  c[3] = M(c[3]);
}

void BZ(const u32* a, const u32* b, u32* c) {
  u32 d[4];

  d[0] = M(b[0]);
  d[1] = M(b[1]);
  d[2] = M(b[2]);
  d[3] = M(b[3]);

  u32 e = d[0] ^ a[0];
  u32 f = d[1] ^ a[1];
  u32 g = d[2] ^ a[2];
  u32 h = d[3] ^ a[3];

  u32 i;
  u32 j;
  u32 k;
  u32 l;

  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[4];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[5];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[6];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[7];
  e = Ga[i >> 24] ^ Gb[(j >> 16) & 0xff] ^ Gc[(k >> 8) & 0xff] ^ Gd[l & 0xff] ^ a[8];
  f = Ga[j >> 24] ^ Gb[(k >> 16) & 0xff] ^ Gc[(l >> 8) & 0xff] ^ Gd[i & 0xff] ^ a[9];
  g = Ga[k >> 24] ^ Gb[(l >> 16) & 0xff] ^ Gc[(i >> 8) & 0xff] ^ Gd[j & 0xff] ^ a[10];
  h = Ga[l >> 24] ^ Gb[(i >> 16) & 0xff] ^ Gc[(j >> 8) & 0xff] ^ Gd[k & 0xff] ^ a[11];
  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[12];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[13];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[14];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[15];
  e = Ga[i >> 24] ^ Gb[(j >> 16) & 0xff] ^ Gc[(k >> 8) & 0xff] ^ Gd[l & 0xff] ^ a[16];
  f = Ga[j >> 24] ^ Gb[(k >> 16) & 0xff] ^ Gc[(l >> 8) & 0xff] ^ Gd[i & 0xff] ^ a[17];
  g = Ga[k >> 24] ^ Gb[(l >> 16) & 0xff] ^ Gc[(i >> 8) & 0xff] ^ Gd[j & 0xff] ^ a[18];
  h = Ga[l >> 24] ^ Gb[(i >> 16) & 0xff] ^ Gc[(j >> 8) & 0xff] ^ Gd[k & 0xff] ^ a[19];
  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[20];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[21];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[22];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[23];
  e = Ga[i >> 24] ^ Gb[(j >> 16) & 0xff] ^ Gc[(k >> 8) & 0xff] ^ Gd[l & 0xff] ^ a[24];
  f = Ga[j >> 24] ^ Gb[(k >> 16) & 0xff] ^ Gc[(l >> 8) & 0xff] ^ Gd[i & 0xff] ^ a[25];
  g = Ga[k >> 24] ^ Gb[(l >> 16) & 0xff] ^ Gc[(i >> 8) & 0xff] ^ Gd[j & 0xff] ^ a[26];
  h = Ga[l >> 24] ^ Gb[(i >> 16) & 0xff] ^ Gc[(j >> 8) & 0xff] ^ Gd[k & 0xff] ^ a[27];
  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[28];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[29];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[30];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[31];
  e = Ga[i >> 24] ^ Gb[(j >> 16) & 0xff] ^ Gc[(k >> 8) & 0xff] ^ Gd[l & 0xff] ^ a[32];
  f = Ga[j >> 24] ^ Gb[(k >> 16) & 0xff] ^ Gc[(l >> 8) & 0xff] ^ Gd[i & 0xff] ^ a[33];
  g = Ga[k >> 24] ^ Gb[(l >> 16) & 0xff] ^ Gc[(i >> 8) & 0xff] ^ Gd[j & 0xff] ^ a[34];
  h = Ga[l >> 24] ^ Gb[(i >> 16) & 0xff] ^ Gc[(j >> 8) & 0xff] ^ Gd[k & 0xff] ^ a[35];
  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[36];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[37];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[38];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[39];
  e = Ga[i >> 24] ^ Gb[(j >> 16) & 0xff] ^ Gc[(k >> 8) & 0xff] ^ Gd[l & 0xff] ^ a[40];
  f = Ga[j >> 24] ^ Gb[(k >> 16) & 0xff] ^ Gc[(l >> 8) & 0xff] ^ Gd[i & 0xff] ^ a[41];
  g = Ga[k >> 24] ^ Gb[(l >> 16) & 0xff] ^ Gc[(i >> 8) & 0xff] ^ Gd[j & 0xff] ^ a[42];
  h = Ga[l >> 24] ^ Gb[(i >> 16) & 0xff] ^ Gc[(j >> 8) & 0xff] ^ Gd[k & 0xff] ^ a[43];
  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[44];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[45];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[46];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[47];
  e = Ga[i >> 24] ^ Gb[(j >> 16) & 0xff] ^ Gc[(k >> 8) & 0xff] ^ Gd[l & 0xff] ^ a[48];
  f = Ga[j >> 24] ^ Gb[(k >> 16) & 0xff] ^ Gc[(l >> 8) & 0xff] ^ Gd[i & 0xff] ^ a[49];
  g = Ga[k >> 24] ^ Gb[(l >> 16) & 0xff] ^ Gc[(i >> 8) & 0xff] ^ Gd[j & 0xff] ^ a[50];
  h = Ga[l >> 24] ^ Gb[(i >> 16) & 0xff] ^ Gc[(j >> 8) & 0xff] ^ Gd[k & 0xff] ^ a[51];
  i = Ga[e >> 24] ^ Gb[(f >> 16) & 0xff] ^ Gc[(g >> 8) & 0xff] ^ Gd[h & 0xff] ^ a[52];
  j = Ga[f >> 24] ^ Gb[(g >> 16) & 0xff] ^ Gc[(h >> 8) & 0xff] ^ Gd[e & 0xff] ^ a[53];
  k = Ga[g >> 24] ^ Gb[(h >> 16) & 0xff] ^ Gc[(e >> 8) & 0xff] ^ Gd[f & 0xff] ^ a[54];
  l = Ga[h >> 24] ^ Gb[(e >> 16) & 0xff] ^ Gc[(f >> 8) & 0xff] ^ Gd[g & 0xff] ^ a[55];

  c[0] = (Ge[(i >> 24) & 0xff] & 0xff000000) ^ (Ge[(j >> 16) & 0xff] & 0x00ff0000) ^ (Ge[(k >> 8) & 0xff] & 0x0000ff00) ^ (Ge[(l >> 0) & 0xff] & 0x000000ff) ^ a[56];

  c[1] = (Ge[(j >> 24) & 0xff] & 0xff000000) ^ (Ge[(k >> 16) & 0xff] & 0x00ff0000) ^ (Ge[(l >> 8) & 0xff] & 0x0000ff00) ^ (Ge[(i >> 0) & 0xff] & 0x000000ff) ^ a[57];

  c[2] = (Ge[(k >> 24) & 0xff] & 0xff000000) ^ (Ge[(l >> 16) & 0xff] & 0x00ff0000) ^ (Ge[(i >> 8) & 0xff] & 0x0000ff00) ^ (Ge[(j >> 0) & 0xff] & 0x000000ff) ^ a[58];

  c[3] = (Ge[(l >> 24) & 0xff] & 0xff000000) ^ (Ge[(i >> 16) & 0xff] & 0x00ff0000) ^ (Ge[(j >> 8) & 0xff] & 0x0000ff00) ^ (Ge[(k >> 0) & 0xff] & 0x000000ff) ^ a[59];

  c[0] = M(c[0]);
  c[1] = M(c[1]);
  c[2] = M(c[2]);
  c[3] = M(c[3]);
}

void CA(const u32* a, const u32* b, const u32* c, u32* d) {
  u32 e[4] = {0};
  u32 f[4] = {0};

  d[0] = c[0];
  d[1] = c[1];
  d[2] = c[2];
  d[3] = c[3];

  u32 g[60];

  BW(g, b);
  BZ(g, f, e);

  d[0] ^= e[0];
  d[1] ^= e[1];
  d[2] ^= e[2];
  d[3] ^= e[3];

  BX(g, a);
  BY(g, d, d);

  d[0] ^= e[0];
  d[1] ^= e[1];
  d[2] ^= e[2];
  d[3] ^= e[3];
}
__constant u32 Gl[2][256] = {{0xA9, 0x67, 0xB3, 0xE8, 0x04, 0xFD, 0xA3, 0x76, 0x9A, 0x92, 0x80, 0x78, 0xE4, 0xDD, 0xD1, 0x38, 0x0D, 0xC6, 0x35, 0x98, 0x18, 0xF7, 0xEC, 0x6C, 0x43, 0x75, 0x37, 0x26, 0xFA, 0x13, 0x94, 0x48, 0xF2, 0xD0, 0x8B, 0x30, 0x84, 0x54, 0xDF, 0x23, 0x19, 0x5B, 0x3D, 0x59, 0xF3, 0xAE, 0xA2, 0x82, 0x63, 0x01, 0x83, 0x2E, 0xD9, 0x51, 0x9B, 0x7C, 0xA6, 0xEB, 0xA5, 0xBE, 0x16, 0x0C, 0xE3, 0x61,
                              0xC0, 0x8C, 0x3A, 0xF5, 0x73, 0x2C, 0x25, 0x0B, 0xBB, 0x4E, 0x89, 0x6B, 0x53, 0x6A, 0xB4, 0xF1, 0xE1, 0xE6, 0xBD, 0x45, 0xE2, 0xF4, 0xB6, 0x66, 0xCC, 0x95, 0x03, 0x56, 0xD4, 0x1C, 0x1E, 0xD7, 0xFB, 0xC3, 0x8E, 0xB5, 0xE9, 0xCF, 0xBF, 0xBA, 0xEA, 0x77, 0x39, 0xAF, 0x33, 0xC9, 0x62, 0x71, 0x81, 0x79, 0x09, 0xAD, 0x24, 0xCD, 0xF9, 0xD8, 0xE5, 0xC5, 0xB9, 0x4D, 0x44, 0x08, 0x86, 0xE7,
                              0xA1, 0x1D, 0xAA, 0xED, 0x06, 0x70, 0xB2, 0xD2, 0x41, 0x7B, 0xA0, 0x11, 0x31, 0xC2, 0x27, 0x90, 0x20, 0xF6, 0x60, 0xFF, 0x96, 0x5C, 0xB1, 0xAB, 0x9E, 0x9C, 0x52, 0x1B, 0x5F, 0x93, 0x0A, 0xEF, 0x91, 0x85, 0x49, 0xEE, 0x2D, 0x4F, 0x8F, 0x3B, 0x47, 0x87, 0x6D, 0x46, 0xD6, 0x3E, 0x69, 0x64, 0x2A, 0xCE, 0xCB, 0x2F, 0xFC, 0x97, 0x05, 0x7A, 0xAC, 0x7F, 0xD5, 0x1A, 0x4B, 0x0E, 0xA7, 0x5A,
                              0x28, 0x14, 0x3F, 0x29, 0x88, 0x3C, 0x4C, 0x02, 0xB8, 0xDA, 0xB0, 0x17, 0x55, 0x1F, 0x8A, 0x7D, 0x57, 0xC7, 0x8D, 0x74, 0xB7, 0xC4, 0x9F, 0x72, 0x7E, 0x15, 0x22, 0x12, 0x58, 0x07, 0x99, 0x34, 0x6E, 0x50, 0xDE, 0x68, 0x65, 0xBC, 0xDB, 0xF8, 0xC8, 0xA8, 0x2B, 0x40, 0xDC, 0xFE, 0x32, 0xA4, 0xCA, 0x10, 0x21, 0xF0, 0xD3, 0x5D, 0x0F, 0x00, 0x6F, 0x9D, 0x36, 0x42, 0x4A, 0x5E, 0xC1, 0xE0},
                             {0x75, 0xF3, 0xC6, 0xF4, 0xDB, 0x7B, 0xFB, 0xC8, 0x4A, 0xD3, 0xE6, 0x6B, 0x45, 0x7D, 0xE8, 0x4B, 0xD6, 0x32, 0xD8, 0xFD, 0x37, 0x71, 0xF1, 0xE1, 0x30, 0x0F, 0xF8, 0x1B, 0x87, 0xFA, 0x06, 0x3F, 0x5E, 0xBA, 0xAE, 0x5B, 0x8A, 0x00, 0xBC, 0x9D, 0x6D, 0xC1, 0xB1, 0x0E, 0x80, 0x5D, 0xD2, 0xD5, 0xA0, 0x84, 0x07, 0x14, 0xB5, 0x90, 0x2C, 0xA3, 0xB2, 0x73, 0x4C, 0x54, 0x92, 0x74, 0x36, 0x51,
                              0x38, 0xB0, 0xBD, 0x5A, 0xFC, 0x60, 0x62, 0x96, 0x6C, 0x42, 0xF7, 0x10, 0x7C, 0x28, 0x27, 0x8C, 0x13, 0x95, 0x9C, 0xC7, 0x24, 0x46, 0x3B, 0x70, 0xCA, 0xE3, 0x85, 0xCB, 0x11, 0xD0, 0x93, 0xB8, 0xA6, 0x83, 0x20, 0xFF, 0x9F, 0x77, 0xC3, 0xCC, 0x03, 0x6F, 0x08, 0xBF, 0x40, 0xE7, 0x2B, 0xE2, 0x79, 0x0C, 0xAA, 0x82, 0x41, 0x3A, 0xEA, 0xB9, 0xE4, 0x9A, 0xA4, 0x97, 0x7E, 0xDA, 0x7A, 0x17,
                              0x66, 0x94, 0xA1, 0x1D, 0x3D, 0xF0, 0xDE, 0xB3, 0x0B, 0x72, 0xA7, 0x1C, 0xEF, 0xD1, 0x53, 0x3E, 0x8F, 0x33, 0x26, 0x5F, 0xEC, 0x76, 0x2A, 0x49, 0x81, 0x88, 0xEE, 0x21, 0xC4, 0x1A, 0xEB, 0xD9, 0xC5, 0x39, 0x99, 0xCD, 0xAD, 0x31, 0x8B, 0x01, 0x18, 0x23, 0xDD, 0x1F, 0x4E, 0x2D, 0xF9, 0x48, 0x4F, 0xF2, 0x65, 0x8E, 0x78, 0x5C, 0x58, 0x19, 0x8D, 0xE5, 0x98, 0x57, 0x67, 0x7F, 0x05, 0x64,
                              0xAF, 0x63, 0xB6, 0xFE, 0xF5, 0xB7, 0x3C, 0xA5, 0xCE, 0xE9, 0x68, 0x44, 0xE0, 0x4D, 0x43, 0x69, 0x29, 0x2E, 0xAC, 0x15, 0x59, 0xA8, 0x0A, 0x9E, 0x6E, 0x47, 0xDF, 0x34, 0x35, 0x6A, 0xCF, 0xDC, 0x22, 0xC9, 0xC0, 0x9B, 0x89, 0xD4, 0xED, 0xAB, 0x12, 0xA2, 0x0D, 0x52, 0xBB, 0x02, 0x2F, 0xA9, 0xD7, 0x61, 0x1E, 0xB4, 0x50, 0x04, 0xF6, 0xC2, 0x16, 0x25, 0x86, 0x56, 0x55, 0x09, 0xBE, 0x91}};

__constant u32 Gm[4][256] = {{0xBCBC3275, 0xECEC21F3, 0x202043C6, 0xB3B3C9F4, 0xDADA03DB, 0x02028B7B, 0xE2E22BFB, 0x9E9EFAC8, 0xC9C9EC4A, 0xD4D409D3, 0x18186BE6, 0x1E1E9F6B, 0x98980E45, 0xB2B2387D, 0xA6A6D2E8, 0x2626B74B, 0x3C3C57D6, 0x93938A32, 0x8282EED8, 0x525298FD, 0x7B7BD437, 0xBBBB3771, 0x5B5B97F1, 0x474783E1, 0x24243C30, 0x5151E20F, 0xBABAC6F8, 0x4A4AF31B, 0xBFBF4887, 0x0D0D70FA, 0xB0B0B306, 0x7575DE3F, 0xD2D2FD5E, 0x7D7D20BA, 0x666631AE, 0x3A3AA35B, 0x59591C8A,
                              0x00000000, 0xCDCD93BC, 0x1A1AE09D, 0xAEAE2C6D, 0x7F7FABC1, 0x2B2BC7B1, 0xBEBEB90E, 0xE0E0A080, 0x8A8A105D, 0x3B3B52D2, 0x6464BAD5, 0xD8D888A0, 0xE7E7A584, 0x5F5FE807, 0x1B1B1114, 0x2C2CC2B5, 0xFCFCB490, 0x3131272C, 0x808065A3, 0x73732AB2, 0x0C0C8173, 0x79795F4C, 0x6B6B4154, 0x4B4B0292, 0x53536974, 0x94948F36, 0x83831F51, 0x2A2A3638, 0xC4C49CB0, 0x2222C8BD, 0xD5D5F85A, 0xBDBDC3FC, 0x48487860, 0xFFFFCE62, 0x4C4C0796, 0x4141776C, 0xC7C7E642,
                              0xEBEB24F7, 0x1C1C1410, 0x5D5D637C, 0x36362228, 0x6767C027, 0xE9E9AF8C, 0x4444F913, 0x1414EA95, 0xF5F5BB9C, 0xCFCF18C7, 0x3F3F2D24, 0xC0C0E346, 0x7272DB3B, 0x54546C70, 0x29294CCA, 0xF0F035E3, 0x0808FE85, 0xC6C617CB, 0xF3F34F11, 0x8C8CE4D0, 0xA4A45993, 0xCACA96B8, 0x68683BA6, 0xB8B84D83, 0x38382820, 0xE5E52EFF, 0xADAD569F, 0x0B0B8477, 0xC8C81DC3, 0x9999FFCC, 0x5858ED03, 0x19199A6F, 0x0E0E0A08, 0x95957EBF, 0x70705040, 0xF7F730E7, 0x6E6ECF2B,
                              0x1F1F6EE2, 0xB5B53D79, 0x09090F0C, 0x616134AA, 0x57571682, 0x9F9F0B41, 0x9D9D803A, 0x111164EA, 0x2525CDB9, 0xAFAFDDE4, 0x4545089A, 0xDFDF8DA4, 0xA3A35C97, 0xEAEAD57E, 0x353558DA, 0xEDEDD07A, 0x4343FC17, 0xF8F8CB66, 0xFBFBB194, 0x3737D3A1, 0xFAFA401D, 0xC2C2683D, 0xB4B4CCF0, 0x32325DDE, 0x9C9C71B3, 0x5656E70B, 0xE3E3DA72, 0x878760A7, 0x15151B1C, 0xF9F93AEF, 0x6363BFD1, 0x3434A953, 0x9A9A853E, 0xB1B1428F, 0x7C7CD133, 0x88889B26, 0x3D3DA65F,
                              0xA1A1D7EC, 0xE4E4DF76, 0x8181942A, 0x91910149, 0x0F0FFB81, 0xEEEEAA88, 0x161661EE, 0xD7D77321, 0x9797F5C4, 0xA5A5A81A, 0xFEFE3FEB, 0x6D6DB5D9, 0x7878AEC5, 0xC5C56D39, 0x1D1DE599, 0x7676A4CD, 0x3E3EDCAD, 0xCBCB6731, 0xB6B6478B, 0xEFEF5B01, 0x12121E18, 0x6060C523, 0x6A6AB0DD, 0x4D4DF61F, 0xCECEE94E, 0xDEDE7C2D, 0x55559DF9, 0x7E7E5A48, 0x2121B24F, 0x03037AF2, 0xA0A02665, 0x5E5E198E, 0x5A5A6678, 0x65654B5C, 0x62624E58, 0xFDFD4519, 0x0606F48D,
                              0x404086E5, 0xF2F2BE98, 0x3333AC57, 0x17179067, 0x05058E7F, 0xE8E85E05, 0x4F4F7D64, 0x89896AAF, 0x10109563, 0x74742FB6, 0x0A0A75FE, 0x5C5C92F5, 0x9B9B74B7, 0x2D2D333C, 0x3030D6A5, 0x2E2E49CE, 0x494989E9, 0x46467268, 0x77775544, 0xA8A8D8E0, 0x9696044D, 0x2828BD43, 0xA9A92969, 0xD9D97929, 0x8686912E, 0xD1D187AC, 0xF4F44A15, 0x8D8D1559, 0xD6D682A8, 0xB9B9BC0A, 0x42420D9E, 0xF6F6C16E, 0x2F2FB847, 0xDDDD06DF, 0x23233934, 0xCCCC6235, 0xF1F1C46A,
                              0xC1C112CF, 0x8585EBDC, 0x8F8F9E22, 0x7171A1C9, 0x9090F0C0, 0xAAAA539B, 0x0101F189, 0x8B8BE1D4, 0x4E4E8CED, 0x8E8E6FAB, 0xABABA212, 0x6F6F3EA2, 0xE6E6540D, 0xDBDBF252, 0x92927BBB, 0xB7B7B602, 0x6969CA2F, 0x3939D9A9, 0xD3D30CD7, 0xA7A72361, 0xA2A2AD1E, 0xC3C399B4, 0x6C6C4450, 0x07070504, 0x04047FF6, 0x272746C2, 0xACACA716, 0xD0D07625, 0x50501386, 0xDCDCF756, 0x84841A55, 0xE1E15109, 0x7A7A25BE, 0x1313EF91},

                             {0xA9D93939, 0x67901717, 0xB3719C9C, 0xE8D2A6A6, 0x04050707, 0xFD985252, 0xA3658080, 0x76DFE4E4, 0x9A084545, 0x92024B4B, 0x80A0E0E0, 0x78665A5A, 0xE4DDAFAF, 0xDDB06A6A, 0xD1BF6363, 0x38362A2A, 0x0D54E6E6, 0xC6432020, 0x3562CCCC, 0x98BEF2F2, 0x181E1212, 0xF724EBEB, 0xECD7A1A1, 0x6C774141, 0x43BD2828, 0x7532BCBC, 0x37D47B7B, 0x269B8888, 0xFA700D0D, 0x13F94444, 0x94B1FBFB, 0x485A7E7E, 0xF27A0303, 0xD0E48C8C, 0x8B47B6B6, 0x303C2424, 0x84A5E7E7,
                              0x54416B6B, 0xDF06DDDD, 0x23C56060, 0x1945FDFD, 0x5BA33A3A, 0x3D68C2C2, 0x59158D8D, 0xF321ECEC, 0xAE316666, 0xA23E6F6F, 0x82165757, 0x63951010, 0x015BEFEF, 0x834DB8B8, 0x2E918686, 0xD9B56D6D, 0x511F8383, 0x9B53AAAA, 0x7C635D5D, 0xA63B6868, 0xEB3FFEFE, 0xA5D63030, 0xBE257A7A, 0x16A7ACAC, 0x0C0F0909, 0xE335F0F0, 0x6123A7A7, 0xC0F09090, 0x8CAFE9E9, 0x3A809D9D, 0xF5925C5C, 0x73810C0C, 0x2C273131, 0x2576D0D0, 0x0BE75656, 0xBB7B9292, 0x4EE9CECE,
                              0x89F10101, 0x6B9F1E1E, 0x53A93434, 0x6AC4F1F1, 0xB499C3C3, 0xF1975B5B, 0xE1834747, 0xE66B1818, 0xBDC82222, 0x450E9898, 0xE26E1F1F, 0xF4C9B3B3, 0xB62F7474, 0x66CBF8F8, 0xCCFF9999, 0x95EA1414, 0x03ED5858, 0x56F7DCDC, 0xD4E18B8B, 0x1C1B1515, 0x1EADA2A2, 0xD70CD3D3, 0xFB2BE2E2, 0xC31DC8C8, 0x8E195E5E, 0xB5C22C2C, 0xE9894949, 0xCF12C1C1, 0xBF7E9595, 0xBA207D7D, 0xEA641111, 0x77840B0B, 0x396DC5C5, 0xAF6A8989, 0x33D17C7C, 0xC9A17171, 0x62CEFFFF,
                              0x7137BBBB, 0x81FB0F0F, 0x793DB5B5, 0x0951E1E1, 0xADDC3E3E, 0x242D3F3F, 0xCDA47676, 0xF99D5555, 0xD8EE8282, 0xE5864040, 0xC5AE7878, 0xB9CD2525, 0x4D049696, 0x44557777, 0x080A0E0E, 0x86135050, 0xE730F7F7, 0xA1D33737, 0x1D40FAFA, 0xAA346161, 0xED8C4E4E, 0x06B3B0B0, 0x706C5454, 0xB22A7373, 0xD2523B3B, 0x410B9F9F, 0x7B8B0202, 0xA088D8D8, 0x114FF3F3, 0x3167CBCB, 0xC2462727, 0x27C06767, 0x90B4FCFC, 0x20283838, 0xF67F0404, 0x60784848, 0xFF2EE5E5,
                              0x96074C4C, 0x5C4B6565, 0xB1C72B2B, 0xAB6F8E8E, 0x9E0D4242, 0x9CBBF5F5, 0x52F2DBDB, 0x1BF34A4A, 0x5FA63D3D, 0x9359A4A4, 0x0ABCB9B9, 0xEF3AF9F9, 0x91EF1313, 0x85FE0808, 0x49019191, 0xEE611616, 0x2D7CDEDE, 0x4FB22121, 0x8F42B1B1, 0x3BDB7272, 0x47B82F2F, 0x8748BFBF, 0x6D2CAEAE, 0x46E3C0C0, 0xD6573C3C, 0x3E859A9A, 0x6929A9A9, 0x647D4F4F, 0x2A948181, 0xCE492E2E, 0xCB17C6C6, 0x2FCA6969, 0xFCC3BDBD, 0x975CA3A3, 0x055EE8E8, 0x7AD0EDED, 0xAC87D1D1,
                              0x7F8E0505, 0xD5BA6464, 0x1AA8A5A5, 0x4BB72626, 0x0EB9BEBE, 0xA7608787, 0x5AF8D5D5, 0x28223636, 0x14111B1B, 0x3FDE7575, 0x2979D9D9, 0x88AAEEEE, 0x3C332D2D, 0x4C5F7979, 0x02B6B7B7, 0xB896CACA, 0xDA583535, 0xB09CC4C4, 0x17FC4343, 0x551A8484, 0x1FF64D4D, 0x8A1C5959, 0x7D38B2B2, 0x57AC3333, 0xC718CFCF, 0x8DF40606, 0x74695353, 0xB7749B9B, 0xC4F59797, 0x9F56ADAD, 0x72DAE3E3, 0x7ED5EAEA, 0x154AF4F4, 0x229E8F8F, 0x12A2ABAB, 0x584E6262, 0x07E85F5F,
                              0x99E51D1D, 0x34392323, 0x6EC1F6F6, 0x50446C6C, 0xDE5D3232, 0x68724646, 0x6526A0A0, 0xBC93CDCD, 0xDB03DADA, 0xF8C6BABA, 0xC8FA9E9E, 0xA882D6D6, 0x2BCF6E6E, 0x40507070, 0xDCEB8585, 0xFE750A0A, 0x328A9393, 0xA48DDFDF, 0xCA4C2929, 0x10141C1C, 0x2173D7D7, 0xF0CCB4B4, 0xD309D4D4, 0x5D108A8A, 0x0FE25151, 0x00000000, 0x6F9A1919, 0x9DE01A1A, 0x368F9494, 0x42E6C7C7, 0x4AECC9C9, 0x5EFDD2D2, 0xC1AB7F7F, 0xE0D8A8A8},

                             {0xBC75BC32, 0xECF3EC21, 0x20C62043, 0xB3F4B3C9, 0xDADBDA03, 0x027B028B, 0xE2FBE22B, 0x9EC89EFA, 0xC94AC9EC, 0xD4D3D409, 0x18E6186B, 0x1E6B1E9F, 0x9845980E, 0xB27DB238, 0xA6E8A6D2, 0x264B26B7, 0x3CD63C57, 0x9332938A, 0x82D882EE, 0x52FD5298, 0x7B377BD4, 0xBB71BB37, 0x5BF15B97, 0x47E14783, 0x2430243C, 0x510F51E2, 0xBAF8BAC6, 0x4A1B4AF3, 0xBF87BF48, 0x0DFA0D70, 0xB006B0B3, 0x753F75DE, 0xD25ED2FD, 0x7DBA7D20, 0x66AE6631, 0x3A5B3AA3, 0x598A591C,
                              0x00000000, 0xCDBCCD93, 0x1A9D1AE0, 0xAE6DAE2C, 0x7FC17FAB, 0x2BB12BC7, 0xBE0EBEB9, 0xE080E0A0, 0x8A5D8A10, 0x3BD23B52, 0x64D564BA, 0xD8A0D888, 0xE784E7A5, 0x5F075FE8, 0x1B141B11, 0x2CB52CC2, 0xFC90FCB4, 0x312C3127, 0x80A38065, 0x73B2732A, 0x0C730C81, 0x794C795F, 0x6B546B41, 0x4B924B02, 0x53745369, 0x9436948F, 0x8351831F, 0x2A382A36, 0xC4B0C49C, 0x22BD22C8, 0xD55AD5F8, 0xBDFCBDC3, 0x48604878, 0xFF62FFCE, 0x4C964C07, 0x416C4177, 0xC742C7E6,
                              0xEBF7EB24, 0x1C101C14, 0x5D7C5D63, 0x36283622, 0x672767C0, 0xE98CE9AF, 0x441344F9, 0x149514EA, 0xF59CF5BB, 0xCFC7CF18, 0x3F243F2D, 0xC046C0E3, 0x723B72DB, 0x5470546C, 0x29CA294C, 0xF0E3F035, 0x088508FE, 0xC6CBC617, 0xF311F34F, 0x8CD08CE4, 0xA493A459, 0xCAB8CA96, 0x68A6683B, 0xB883B84D, 0x38203828, 0xE5FFE52E, 0xAD9FAD56, 0x0B770B84, 0xC8C3C81D, 0x99CC99FF, 0x580358ED, 0x196F199A, 0x0E080E0A, 0x95BF957E, 0x70407050, 0xF7E7F730, 0x6E2B6ECF,
                              0x1FE21F6E, 0xB579B53D, 0x090C090F, 0x61AA6134, 0x57825716, 0x9F419F0B, 0x9D3A9D80, 0x11EA1164, 0x25B925CD, 0xAFE4AFDD, 0x459A4508, 0xDFA4DF8D, 0xA397A35C, 0xEA7EEAD5, 0x35DA3558, 0xED7AEDD0, 0x431743FC, 0xF866F8CB, 0xFB94FBB1, 0x37A137D3, 0xFA1DFA40, 0xC23DC268, 0xB4F0B4CC, 0x32DE325D, 0x9CB39C71, 0x560B56E7, 0xE372E3DA, 0x87A78760, 0x151C151B, 0xF9EFF93A, 0x63D163BF, 0x345334A9, 0x9A3E9A85, 0xB18FB142, 0x7C337CD1, 0x8826889B, 0x3D5F3DA6,
                              0xA1ECA1D7, 0xE476E4DF, 0x812A8194, 0x91499101, 0x0F810FFB, 0xEE88EEAA, 0x16EE1661, 0xD721D773, 0x97C497F5, 0xA51AA5A8, 0xFEEBFE3F, 0x6DD96DB5, 0x78C578AE, 0xC539C56D, 0x1D991DE5, 0x76CD76A4, 0x3EAD3EDC, 0xCB31CB67, 0xB68BB647, 0xEF01EF5B, 0x1218121E, 0x602360C5, 0x6ADD6AB0, 0x4D1F4DF6, 0xCE4ECEE9, 0xDE2DDE7C, 0x55F9559D, 0x7E487E5A, 0x214F21B2, 0x03F2037A, 0xA065A026, 0x5E8E5E19, 0x5A785A66, 0x655C654B, 0x6258624E, 0xFD19FD45, 0x068D06F4,
                              0x40E54086, 0xF298F2BE, 0x335733AC, 0x17671790, 0x057F058E, 0xE805E85E, 0x4F644F7D, 0x89AF896A, 0x10631095, 0x74B6742F, 0x0AFE0A75, 0x5CF55C92, 0x9BB79B74, 0x2D3C2D33, 0x30A530D6, 0x2ECE2E49, 0x49E94989, 0x46684672, 0x77447755, 0xA8E0A8D8, 0x964D9604, 0x284328BD, 0xA969A929, 0xD929D979, 0x862E8691, 0xD1ACD187, 0xF415F44A, 0x8D598D15, 0xD6A8D682, 0xB90AB9BC, 0x429E420D, 0xF66EF6C1, 0x2F472FB8, 0xDDDFDD06, 0x23342339, 0xCC35CC62, 0xF16AF1C4,
                              0xC1CFC112, 0x85DC85EB, 0x8F228F9E, 0x71C971A1, 0x90C090F0, 0xAA9BAA53, 0x018901F1, 0x8BD48BE1, 0x4EED4E8C, 0x8EAB8E6F, 0xAB12ABA2, 0x6FA26F3E, 0xE60DE654, 0xDB52DBF2, 0x92BB927B, 0xB702B7B6, 0x692F69CA, 0x39A939D9, 0xD3D7D30C, 0xA761A723, 0xA21EA2AD, 0xC3B4C399, 0x6C506C44, 0x07040705, 0x04F6047F, 0x27C22746, 0xAC16ACA7, 0xD025D076, 0x50865013, 0xDC56DCF7, 0x8455841A, 0xE109E151, 0x7ABE7A25, 0x139113EF},

                             {0xD939A9D9, 0x90176790, 0x719CB371, 0xD2A6E8D2, 0x05070405, 0x9852FD98, 0x6580A365, 0xDFE476DF, 0x08459A08, 0x024B9202, 0xA0E080A0, 0x665A7866, 0xDDAFE4DD, 0xB06ADDB0, 0xBF63D1BF, 0x362A3836, 0x54E60D54, 0x4320C643, 0x62CC3562, 0xBEF298BE, 0x1E12181E, 0x24EBF724, 0xD7A1ECD7, 0x77416C77, 0xBD2843BD, 0x32BC7532, 0xD47B37D4, 0x9B88269B, 0x700DFA70, 0xF94413F9, 0xB1FB94B1, 0x5A7E485A, 0x7A03F27A, 0xE48CD0E4, 0x47B68B47, 0x3C24303C, 0xA5E784A5,
                              0x416B5441, 0x06DDDF06, 0xC56023C5, 0x45FD1945, 0xA33A5BA3, 0x68C23D68, 0x158D5915, 0x21ECF321, 0x3166AE31, 0x3E6FA23E, 0x16578216, 0x95106395, 0x5BEF015B, 0x4DB8834D, 0x91862E91, 0xB56DD9B5, 0x1F83511F, 0x53AA9B53, 0x635D7C63, 0x3B68A63B, 0x3FFEEB3F, 0xD630A5D6, 0x257ABE25, 0xA7AC16A7, 0x0F090C0F, 0x35F0E335, 0x23A76123, 0xF090C0F0, 0xAFE98CAF, 0x809D3A80, 0x925CF592, 0x810C7381, 0x27312C27, 0x76D02576, 0xE7560BE7, 0x7B92BB7B, 0xE9CE4EE9,
                              0xF10189F1, 0x9F1E6B9F, 0xA93453A9, 0xC4F16AC4, 0x99C3B499, 0x975BF197, 0x8347E183, 0x6B18E66B, 0xC822BDC8, 0x0E98450E, 0x6E1FE26E, 0xC9B3F4C9, 0x2F74B62F, 0xCBF866CB, 0xFF99CCFF, 0xEA1495EA, 0xED5803ED, 0xF7DC56F7, 0xE18BD4E1, 0x1B151C1B, 0xADA21EAD, 0x0CD3D70C, 0x2BE2FB2B, 0x1DC8C31D, 0x195E8E19, 0xC22CB5C2, 0x8949E989, 0x12C1CF12, 0x7E95BF7E, 0x207DBA20, 0x6411EA64, 0x840B7784, 0x6DC5396D, 0x6A89AF6A, 0xD17C33D1, 0xA171C9A1, 0xCEFF62CE,
                              0x37BB7137, 0xFB0F81FB, 0x3DB5793D, 0x51E10951, 0xDC3EADDC, 0x2D3F242D, 0xA476CDA4, 0x9D55F99D, 0xEE82D8EE, 0x8640E586, 0xAE78C5AE, 0xCD25B9CD, 0x04964D04, 0x55774455, 0x0A0E080A, 0x13508613, 0x30F7E730, 0xD337A1D3, 0x40FA1D40, 0x3461AA34, 0x8C4EED8C, 0xB3B006B3, 0x6C54706C, 0x2A73B22A, 0x523BD252, 0x0B9F410B, 0x8B027B8B, 0x88D8A088, 0x4FF3114F, 0x67CB3167, 0x4627C246, 0xC06727C0, 0xB4FC90B4, 0x28382028, 0x7F04F67F, 0x78486078, 0x2EE5FF2E,
                              0x074C9607, 0x4B655C4B, 0xC72BB1C7, 0x6F8EAB6F, 0x0D429E0D, 0xBBF59CBB, 0xF2DB52F2, 0xF34A1BF3, 0xA63D5FA6, 0x59A49359, 0xBCB90ABC, 0x3AF9EF3A, 0xEF1391EF, 0xFE0885FE, 0x01914901, 0x6116EE61, 0x7CDE2D7C, 0xB2214FB2, 0x42B18F42, 0xDB723BDB, 0xB82F47B8, 0x48BF8748, 0x2CAE6D2C, 0xE3C046E3, 0x573CD657, 0x859A3E85, 0x29A96929, 0x7D4F647D, 0x94812A94, 0x492ECE49, 0x17C6CB17, 0xCA692FCA, 0xC3BDFCC3, 0x5CA3975C, 0x5EE8055E, 0xD0ED7AD0, 0x87D1AC87,
                              0x8E057F8E, 0xBA64D5BA, 0xA8A51AA8, 0xB7264BB7, 0xB9BE0EB9, 0x6087A760, 0xF8D55AF8, 0x22362822, 0x111B1411, 0xDE753FDE, 0x79D92979, 0xAAEE88AA, 0x332D3C33, 0x5F794C5F, 0xB6B702B6, 0x96CAB896, 0x5835DA58, 0x9CC4B09C, 0xFC4317FC, 0x1A84551A, 0xF64D1FF6, 0x1C598A1C, 0x38B27D38, 0xAC3357AC, 0x18CFC718, 0xF4068DF4, 0x69537469, 0x749BB774, 0xF597C4F5, 0x56AD9F56, 0xDAE372DA, 0xD5EA7ED5, 0x4AF4154A, 0x9E8F229E, 0xA2AB12A2, 0x4E62584E, 0xE85F07E8,
                              0xE51D99E5, 0x39233439, 0xC1F66EC1, 0x446C5044, 0x5D32DE5D, 0x72466872, 0x26A06526, 0x93CDBC93, 0x03DADB03, 0xC6BAF8C6, 0xFA9EC8FA, 0x82D6A882, 0xCF6E2BCF, 0x50704050, 0xEB85DCEB, 0x750AFE75, 0x8A93328A, 0x8DDFA48D, 0x4C29CA4C, 0x141C1014, 0x73D72173, 0xCCB4F0CC, 0x09D4D309, 0x108A5D10, 0xE2510FE2, 0x00000000, 0x9A196F9A, 0xE01A9DE0, 0x8F94368F, 0xE6C742E6, 0xECC94AEC, 0xFDD25EFD, 0xAB7FC1AB, 0xD8A8E0D8}};

u32 CB(u32* a, u32* b, const u32 c, const u32* d) {
  u32 e, f, g, h;

  e = (((c) >> (8 * (0))) & 0xff);
  f = (((c) >> (8 * (1))) & 0xff);
  g = (((c) >> (8 * (2))) & 0xff);
  h = (((c) >> (8 * (3))) & 0xff);

  e = Gl[1][e] ^ (((d[3]) >> (8 * (0))) & 0xff);
  f = Gl[0][f] ^ (((d[3]) >> (8 * (1))) & 0xff);
  g = Gl[0][g] ^ (((d[3]) >> (8 * (2))) & 0xff);
  h = Gl[1][h] ^ (((d[3]) >> (8 * (3))) & 0xff);

  e = Gl[1][e] ^ (((d[2]) >> (8 * (0))) & 0xff);
  f = Gl[1][f] ^ (((d[2]) >> (8 * (1))) & 0xff);
  g = Gl[0][g] ^ (((d[2]) >> (8 * (2))) & 0xff);
  h = Gl[0][h] ^ (((d[2]) >> (8 * (3))) & 0xff);

  e = Gl[0][(Gl[0][e] ^ (((d[1]) >> (8 * (0))) & 0xff))] ^ (((d[0]) >> (8 * (0))) & 0xff);
  f = Gl[0][(Gl[1][f] ^ (((d[1]) >> (8 * (1))) & 0xff))] ^ (((d[0]) >> (8 * (1))) & 0xff);
  g = Gl[1][(Gl[0][g] ^ (((d[1]) >> (8 * (2))) & 0xff))] ^ (((d[0]) >> (8 * (2))) & 0xff);
  h = Gl[1][(Gl[1][h] ^ (((d[1]) >> (8 * (3))) & 0xff))] ^ (((d[0]) >> (8 * (3))) & 0xff);

  return Gm[0][e] ^ Gm[1][f] ^ Gm[2][g] ^ Gm[3][h];
}
u32 CC(u32 a, u32 b) {
  for (int c = 0; c < 8; c++) {
    u32 d = b >> 24;

    b = (b << 8) | (a >> 24);

    a <<= 8;

    u32 e = (d << 1);

    if (d & 0x80)
      e ^= 0x14d;

    b ^= d ^ (e << 16);

    e ^= (d >> 1);

    if (d & 0x01)
      e ^= 0x14d >> 1;

    b ^= (e << 24) | (e << 8);
  }

  return b;
}

void CD(u32* a, u32* b, const u32* c) {
  u32 d[4];

  d[0] = c[0];
  d[1] = c[2];
  d[2] = c[4];
  d[3] = c[6];

  u32 e[4];

  e[0] = c[1];
  e[1] = c[3];
  e[2] = c[5];
  e[3] = c[7];

  a[3] = CC(d[0], e[0]);
  a[2] = CC(d[1], e[1]);
  a[1] = CC(d[2], e[2]);
  a[0] = CC(d[3], e[3]);

  for (int f = 0; f < 40; f += 2) {
    u32 g = 0x01010101 * f;
    u32 h = 0x01010101 + g;

    g = CB(a, b, g, d);
    h = CB(a, b, h, e);

    h = P(h, 8);

    b[f + 0] = g + h;
    b[f + 1] = P(g + 2 * h, 9);
  }
}
void CE(const u32* a, const u32* b, const u32* c, u32* d) {
  u32 e[4];

  e[0] = c[0] ^ b[0];
  e[1] = c[1] ^ b[1];
  e[2] = c[2] ^ b[2];
  e[3] = c[3] ^ b[3];

  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (0) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (0) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (0) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (0) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (1) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (1) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (1) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (1) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (2) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (2) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (2) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (2) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (3) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (3) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (3) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (3) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (4) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (4) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (4) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (4) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (5) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (5) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (5) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (5) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (6) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (6) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (6) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (6) + 11]);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = O(e[2] ^ (f + g + b[4 * (7) + 8]), 1);
    e[3] = P(e[3], 1) ^ (f + 2 * g + b[4 * (7) + 9]);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = O(e[0] ^ (h + i + b[4 * (7) + 10]), 1);
    e[1] = P(e[1], 1) ^ (h + 2 * i + b[4 * (7) + 11]);
  };

  d[0] = e[2] ^ b[4];
  d[1] = e[3] ^ b[5];
  d[2] = e[0] ^ b[6];
  d[3] = e[1] ^ b[7];
}
void CF(const u32* a, const u32* b, const u32* c, u32* d) {
  u32 e[4];

  e[0] = c[0] ^ b[4];
  e[1] = c[1] ^ b[5];
  e[2] = c[2] ^ b[6];
  e[3] = c[3] ^ b[7];

  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (7) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (7) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (7) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (7) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (6) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (6) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (6) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (6) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (5) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (5) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (5) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (5) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (4) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (4) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (4) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (4) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (3) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (3) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (3) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (3) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (2) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (2) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (2) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (2) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (1) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (1) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (1) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (1) + 9]), 1);
  };
  {
    u32 f = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[0]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[0]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[0]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[0]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 g = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[1]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[1]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[1]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[1]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[2] = P(e[2], 1) ^ (f + g + b[4 * (0) + 10]);
    e[3] = O(e[3] ^ (f + 2 * g + b[4 * (0) + 11]), 1);
    u32 h = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[2]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[2]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[2]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[2]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    u32 i = (Gm[0][Gl[0][Gl[0][Gl[1][Gl[1][(((e[3]) >> (8 * (3))) & 0xff)] ^ (((a[3]) >> (8 * (0))) & 0xff)] ^ (((a[2]) >> (8 * (0))) & 0xff)] ^ (((a[1]) >> (8 * (0))) & 0xff)] ^ (((a[0]) >> (8 * (0))) & 0xff)] ^ Gm[1][Gl[0][Gl[1][Gl[1][Gl[0][(((e[3]) >> (8 * (0))) & 0xff)] ^ (((a[3]) >> (8 * (1))) & 0xff)] ^ (((a[2]) >> (8 * (1))) & 0xff)] ^ (((a[1]) >> (8 * (1))) & 0xff)] ^ (((a[0]) >> (8 * (1))) & 0xff)] ^
             Gm[2][Gl[1][Gl[0][Gl[0][Gl[0][(((e[3]) >> (8 * (1))) & 0xff)] ^ (((a[3]) >> (8 * (2))) & 0xff)] ^ (((a[2]) >> (8 * (2))) & 0xff)] ^ (((a[1]) >> (8 * (2))) & 0xff)] ^ (((a[0]) >> (8 * (2))) & 0xff)] ^ Gm[3][Gl[1][Gl[1][Gl[0][Gl[1][(((e[3]) >> (8 * (2))) & 0xff)] ^ (((a[3]) >> (8 * (3))) & 0xff)] ^ (((a[2]) >> (8 * (3))) & 0xff)] ^ (((a[1]) >> (8 * (3))) & 0xff)] ^ (((a[0]) >> (8 * (3))) & 0xff)]);
    e[0] = P(e[0], 1) ^ (h + i + b[4 * (0) + 8]);
    e[1] = O(e[1] ^ (h + 2 * i + b[4 * (0) + 9]), 1);
  };

  d[0] = e[2] ^ b[0];
  d[1] = e[3] ^ b[1];
  d[2] = e[0] ^ b[2];
  d[3] = e[1] ^ b[3];
}

void CG(const u32* a, const u32* b, const u32* c, u32* d) {
  u32 e[4] = {0};
  u32 f[4] = {0};

  d[0] = c[0];
  d[1] = c[1];
  d[2] = c[2];
  d[3] = c[3];

  u32 g[4];
  u32 h[40];

  CD(g, h, b);
  CE(g, h, f, e);

  d[0] ^= e[0];
  d[1] ^= e[1];
  d[2] ^= e[2];
  d[3] ^= e[3];

  CD(g, h, a);
  CF(g, h, d, d);

  d[0] ^= e[0];
  d[1] ^= e[1];
  d[2] ^= e[2];
  d[3] ^= e[3];
}
void CH(u32* a, const u32* b) {
  for (int c = 0; c < 8; c++) {
    a[c] = b[c];
  }

  for (int c = 0; c < 132; c++) {
    a[c + 8] = P(a[c + 7] ^ a[c + 5] ^ a[c + 3] ^ a[c + 0] ^ 0x9e3779b9 ^ c, 11);
  }

  u32 d, e, f, g, h, i, j, k;
  u32 l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa;

  d = a[4 * 0 + 8];
  e = a[4 * 0 + 9];
  f = a[4 * 0 + 10];
  g = a[4 * 0 + 11];
  l = d ^ f;
  m = g ^ l;
  n = d & m;
  o = g ^ n;
  p = e & o;
  j = m ^ p;
  r = d | j;
  s = e | g;
  v = d | g;
  t = o & r;
  i = s ^ t;
  w = e ^ v;
  x = j ^ t;
  z = n ^ s;
  k = w ^ x;
  aa = f & z;
  h = w ^ aa;
  a[4 * 0 + 8] = h;
  a[4 * 0 + 9] = i;
  a[4 * 0 + 10] = j;
  a[4 * 0 + 11] = k;
  d = a[4 * 1 + 8];
  e = a[4 * 1 + 9];
  f = a[4 * 1 + 10];
  g = a[4 * 1 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  a[4 * 1 + 8] = h;
  a[4 * 1 + 9] = i;
  a[4 * 1 + 10] = j;
  a[4 * 1 + 11] = k;
  d = a[4 * 2 + 8];
  e = a[4 * 2 + 9];
  f = a[4 * 2 + 10];
  g = a[4 * 2 + 11];
  l = ~d;
  m = e ^ l;
  n = d | m;
  o = g | m;
  p = f ^ n;
  j = g ^ p;
  r = e ^ o;
  s = m ^ j;
  t = p & r;
  k = s ^ t;
  v = p ^ r;
  i = k ^ v;
  x = s & v;
  h = p ^ x;
  a[4 * 2 + 8] = h;
  a[4 * 2 + 9] = i;
  a[4 * 2 + 10] = j;
  a[4 * 2 + 11] = k;
  d = a[4 * 3 + 8];
  e = a[4 * 3 + 9];
  f = a[4 * 3 + 10];
  g = a[4 * 3 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  a[4 * 3 + 8] = h;
  a[4 * 3 + 9] = i;
  a[4 * 3 + 10] = j;
  a[4 * 3 + 11] = k;
  d = a[4 * 4 + 8];
  e = a[4 * 4 + 9];
  f = a[4 * 4 + 10];
  g = a[4 * 4 + 11];
  l = ~f;
  m = e ^ f;
  n = e | l;
  o = g ^ n;
  p = d & o;
  r = d ^ g;
  k = m ^ p;
  s = e ^ p;
  t = m | s;
  v = g & n;
  i = r ^ t;
  w = p ^ i;
  z = l | o;
  x = k & w;
  j = v ^ x;
  aa = w ^ j;
  h = z ^ aa;
  a[4 * 4 + 8] = h;
  a[4 * 4 + 9] = i;
  a[4 * 4 + 10] = j;
  a[4 * 4 + 11] = k;
  d = a[4 * 5 + 8];
  e = a[4 * 5 + 9];
  f = a[4 * 5 + 10];
  g = a[4 * 5 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  a[4 * 5 + 8] = h;
  a[4 * 5 + 9] = i;
  a[4 * 5 + 10] = j;
  a[4 * 5 + 11] = k;
  d = a[4 * 6 + 8];
  e = a[4 * 6 + 9];
  f = a[4 * 6 + 10];
  g = a[4 * 6 + 11];
  l = ~d;
  m = d ^ e;
  n = d ^ g;
  o = f ^ l;
  p = m | n;
  h = o ^ p;
  r = g & h;
  s = m ^ h;
  u = l | h;
  i = r ^ s;
  v = m | r;
  w = n ^ u;
  y = e ^ r;
  j = v ^ w;
  z = i & w;
  k = y ^ z;
  a[4 * 6 + 8] = h;
  a[4 * 6 + 9] = i;
  a[4 * 6 + 10] = j;
  a[4 * 6 + 11] = k;
  d = a[4 * 7 + 8];
  e = a[4 * 7 + 9];
  f = a[4 * 7 + 10];
  g = a[4 * 7 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  a[4 * 7 + 8] = h;
  a[4 * 7 + 9] = i;
  a[4 * 7 + 10] = j;
  a[4 * 7 + 11] = k;
  d = a[4 * 8 + 8];
  e = a[4 * 8 + 9];
  f = a[4 * 8 + 10];
  g = a[4 * 8 + 11];
  l = d ^ f;
  m = g ^ l;
  n = d & m;
  o = g ^ n;
  p = e & o;
  j = m ^ p;
  r = d | j;
  s = e | g;
  v = d | g;
  t = o & r;
  i = s ^ t;
  w = e ^ v;
  x = j ^ t;
  z = n ^ s;
  k = w ^ x;
  aa = f & z;
  h = w ^ aa;
  a[4 * 8 + 8] = h;
  a[4 * 8 + 9] = i;
  a[4 * 8 + 10] = j;
  a[4 * 8 + 11] = k;
  d = a[4 * 9 + 8];
  e = a[4 * 9 + 9];
  f = a[4 * 9 + 10];
  g = a[4 * 9 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  a[4 * 9 + 8] = h;
  a[4 * 9 + 9] = i;
  a[4 * 9 + 10] = j;
  a[4 * 9 + 11] = k;
  d = a[4 * 10 + 8];
  e = a[4 * 10 + 9];
  f = a[4 * 10 + 10];
  g = a[4 * 10 + 11];
  l = ~d;
  m = e ^ l;
  n = d | m;
  o = g | m;
  p = f ^ n;
  j = g ^ p;
  r = e ^ o;
  s = m ^ j;
  t = p & r;
  k = s ^ t;
  v = p ^ r;
  i = k ^ v;
  x = s & v;
  h = p ^ x;
  a[4 * 10 + 8] = h;
  a[4 * 10 + 9] = i;
  a[4 * 10 + 10] = j;
  a[4 * 10 + 11] = k;
  d = a[4 * 11 + 8];
  e = a[4 * 11 + 9];
  f = a[4 * 11 + 10];
  g = a[4 * 11 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  a[4 * 11 + 8] = h;
  a[4 * 11 + 9] = i;
  a[4 * 11 + 10] = j;
  a[4 * 11 + 11] = k;
  d = a[4 * 12 + 8];
  e = a[4 * 12 + 9];
  f = a[4 * 12 + 10];
  g = a[4 * 12 + 11];
  l = ~f;
  m = e ^ f;
  n = e | l;
  o = g ^ n;
  p = d & o;
  r = d ^ g;
  k = m ^ p;
  s = e ^ p;
  t = m | s;
  v = g & n;
  i = r ^ t;
  w = p ^ i;
  z = l | o;
  x = k & w;
  j = v ^ x;
  aa = w ^ j;
  h = z ^ aa;
  a[4 * 12 + 8] = h;
  a[4 * 12 + 9] = i;
  a[4 * 12 + 10] = j;
  a[4 * 12 + 11] = k;
  d = a[4 * 13 + 8];
  e = a[4 * 13 + 9];
  f = a[4 * 13 + 10];
  g = a[4 * 13 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  a[4 * 13 + 8] = h;
  a[4 * 13 + 9] = i;
  a[4 * 13 + 10] = j;
  a[4 * 13 + 11] = k;
  d = a[4 * 14 + 8];
  e = a[4 * 14 + 9];
  f = a[4 * 14 + 10];
  g = a[4 * 14 + 11];
  l = ~d;
  m = d ^ e;
  n = d ^ g;
  o = f ^ l;
  p = m | n;
  h = o ^ p;
  r = g & h;
  s = m ^ h;
  u = l | h;
  i = r ^ s;
  v = m | r;
  w = n ^ u;
  y = e ^ r;
  j = v ^ w;
  z = i & w;
  k = y ^ z;
  a[4 * 14 + 8] = h;
  a[4 * 14 + 9] = i;
  a[4 * 14 + 10] = j;
  a[4 * 14 + 11] = k;
  d = a[4 * 15 + 8];
  e = a[4 * 15 + 9];
  f = a[4 * 15 + 10];
  g = a[4 * 15 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  a[4 * 15 + 8] = h;
  a[4 * 15 + 9] = i;
  a[4 * 15 + 10] = j;
  a[4 * 15 + 11] = k;
  d = a[4 * 16 + 8];
  e = a[4 * 16 + 9];
  f = a[4 * 16 + 10];
  g = a[4 * 16 + 11];
  l = d ^ f;
  m = g ^ l;
  n = d & m;
  o = g ^ n;
  p = e & o;
  j = m ^ p;
  r = d | j;
  s = e | g;
  v = d | g;
  t = o & r;
  i = s ^ t;
  w = e ^ v;
  x = j ^ t;
  z = n ^ s;
  k = w ^ x;
  aa = f & z;
  h = w ^ aa;
  a[4 * 16 + 8] = h;
  a[4 * 16 + 9] = i;
  a[4 * 16 + 10] = j;
  a[4 * 16 + 11] = k;
  d = a[4 * 17 + 8];
  e = a[4 * 17 + 9];
  f = a[4 * 17 + 10];
  g = a[4 * 17 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  a[4 * 17 + 8] = h;
  a[4 * 17 + 9] = i;
  a[4 * 17 + 10] = j;
  a[4 * 17 + 11] = k;
  d = a[4 * 18 + 8];
  e = a[4 * 18 + 9];
  f = a[4 * 18 + 10];
  g = a[4 * 18 + 11];
  l = ~d;
  m = e ^ l;
  n = d | m;
  o = g | m;
  p = f ^ n;
  j = g ^ p;
  r = e ^ o;
  s = m ^ j;
  t = p & r;
  k = s ^ t;
  v = p ^ r;
  i = k ^ v;
  x = s & v;
  h = p ^ x;
  a[4 * 18 + 8] = h;
  a[4 * 18 + 9] = i;
  a[4 * 18 + 10] = j;
  a[4 * 18 + 11] = k;
  d = a[4 * 19 + 8];
  e = a[4 * 19 + 9];
  f = a[4 * 19 + 10];
  g = a[4 * 19 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  a[4 * 19 + 8] = h;
  a[4 * 19 + 9] = i;
  a[4 * 19 + 10] = j;
  a[4 * 19 + 11] = k;
  d = a[4 * 20 + 8];
  e = a[4 * 20 + 9];
  f = a[4 * 20 + 10];
  g = a[4 * 20 + 11];
  l = ~f;
  m = e ^ f;
  n = e | l;
  o = g ^ n;
  p = d & o;
  r = d ^ g;
  k = m ^ p;
  s = e ^ p;
  t = m | s;
  v = g & n;
  i = r ^ t;
  w = p ^ i;
  z = l | o;
  x = k & w;
  j = v ^ x;
  aa = w ^ j;
  h = z ^ aa;
  a[4 * 20 + 8] = h;
  a[4 * 20 + 9] = i;
  a[4 * 20 + 10] = j;
  a[4 * 20 + 11] = k;
  d = a[4 * 21 + 8];
  e = a[4 * 21 + 9];
  f = a[4 * 21 + 10];
  g = a[4 * 21 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  a[4 * 21 + 8] = h;
  a[4 * 21 + 9] = i;
  a[4 * 21 + 10] = j;
  a[4 * 21 + 11] = k;
  d = a[4 * 22 + 8];
  e = a[4 * 22 + 9];
  f = a[4 * 22 + 10];
  g = a[4 * 22 + 11];
  l = ~d;
  m = d ^ e;
  n = d ^ g;
  o = f ^ l;
  p = m | n;
  h = o ^ p;
  r = g & h;
  s = m ^ h;
  u = l | h;
  i = r ^ s;
  v = m | r;
  w = n ^ u;
  y = e ^ r;
  j = v ^ w;
  z = i & w;
  k = y ^ z;
  a[4 * 22 + 8] = h;
  a[4 * 22 + 9] = i;
  a[4 * 22 + 10] = j;
  a[4 * 22 + 11] = k;
  d = a[4 * 23 + 8];
  e = a[4 * 23 + 9];
  f = a[4 * 23 + 10];
  g = a[4 * 23 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  a[4 * 23 + 8] = h;
  a[4 * 23 + 9] = i;
  a[4 * 23 + 10] = j;
  a[4 * 23 + 11] = k;
  d = a[4 * 24 + 8];
  e = a[4 * 24 + 9];
  f = a[4 * 24 + 10];
  g = a[4 * 24 + 11];
  l = d ^ f;
  m = g ^ l;
  n = d & m;
  o = g ^ n;
  p = e & o;
  j = m ^ p;
  r = d | j;
  s = e | g;
  v = d | g;
  t = o & r;
  i = s ^ t;
  w = e ^ v;
  x = j ^ t;
  z = n ^ s;
  k = w ^ x;
  aa = f & z;
  h = w ^ aa;
  a[4 * 24 + 8] = h;
  a[4 * 24 + 9] = i;
  a[4 * 24 + 10] = j;
  a[4 * 24 + 11] = k;
  d = a[4 * 25 + 8];
  e = a[4 * 25 + 9];
  f = a[4 * 25 + 10];
  g = a[4 * 25 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  a[4 * 25 + 8] = h;
  a[4 * 25 + 9] = i;
  a[4 * 25 + 10] = j;
  a[4 * 25 + 11] = k;
  d = a[4 * 26 + 8];
  e = a[4 * 26 + 9];
  f = a[4 * 26 + 10];
  g = a[4 * 26 + 11];
  l = ~d;
  m = e ^ l;
  n = d | m;
  o = g | m;
  p = f ^ n;
  j = g ^ p;
  r = e ^ o;
  s = m ^ j;
  t = p & r;
  k = s ^ t;
  v = p ^ r;
  i = k ^ v;
  x = s & v;
  h = p ^ x;
  a[4 * 26 + 8] = h;
  a[4 * 26 + 9] = i;
  a[4 * 26 + 10] = j;
  a[4 * 26 + 11] = k;
  d = a[4 * 27 + 8];
  e = a[4 * 27 + 9];
  f = a[4 * 27 + 10];
  g = a[4 * 27 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  a[4 * 27 + 8] = h;
  a[4 * 27 + 9] = i;
  a[4 * 27 + 10] = j;
  a[4 * 27 + 11] = k;
  d = a[4 * 28 + 8];
  e = a[4 * 28 + 9];
  f = a[4 * 28 + 10];
  g = a[4 * 28 + 11];
  l = ~f;
  m = e ^ f;
  n = e | l;
  o = g ^ n;
  p = d & o;
  r = d ^ g;
  k = m ^ p;
  s = e ^ p;
  t = m | s;
  v = g & n;
  i = r ^ t;
  w = p ^ i;
  z = l | o;
  x = k & w;
  j = v ^ x;
  aa = w ^ j;
  h = z ^ aa;
  a[4 * 28 + 8] = h;
  a[4 * 28 + 9] = i;
  a[4 * 28 + 10] = j;
  a[4 * 28 + 11] = k;
  d = a[4 * 29 + 8];
  e = a[4 * 29 + 9];
  f = a[4 * 29 + 10];
  g = a[4 * 29 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  a[4 * 29 + 8] = h;
  a[4 * 29 + 9] = i;
  a[4 * 29 + 10] = j;
  a[4 * 29 + 11] = k;
  d = a[4 * 30 + 8];
  e = a[4 * 30 + 9];
  f = a[4 * 30 + 10];
  g = a[4 * 30 + 11];
  l = ~d;
  m = d ^ e;
  n = d ^ g;
  o = f ^ l;
  p = m | n;
  h = o ^ p;
  r = g & h;
  s = m ^ h;
  u = l | h;
  i = r ^ s;
  v = m | r;
  w = n ^ u;
  y = e ^ r;
  j = v ^ w;
  z = i & w;
  k = y ^ z;
  a[4 * 30 + 8] = h;
  a[4 * 30 + 9] = i;
  a[4 * 30 + 10] = j;
  a[4 * 30 + 11] = k;
  d = a[4 * 31 + 8];
  e = a[4 * 31 + 9];
  f = a[4 * 31 + 10];
  g = a[4 * 31 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  a[4 * 31 + 8] = h;
  a[4 * 31 + 9] = i;
  a[4 * 31 + 10] = j;
  a[4 * 31 + 11] = k;
  d = a[4 * 32 + 8];
  e = a[4 * 32 + 9];
  f = a[4 * 32 + 10];
  g = a[4 * 32 + 11];
  l = d ^ f;
  m = g ^ l;
  n = d & m;
  o = g ^ n;
  p = e & o;
  j = m ^ p;
  r = d | j;
  s = e | g;
  v = d | g;
  t = o & r;
  i = s ^ t;
  w = e ^ v;
  x = j ^ t;
  z = n ^ s;
  k = w ^ x;
  aa = f & z;
  h = w ^ aa;
  a[4 * 32 + 8] = h;
  a[4 * 32 + 9] = i;
  a[4 * 32 + 10] = j;
  a[4 * 32 + 11] = k;
}

void CI(const u32* a, const u32* b, u32* c) {
  u32 d, e, f, g, h, i, j, k;
  u32 l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa;

  d = b[0];
  e = b[1];
  f = b[2];
  g = b[3];

  d ^= a[4 * 0 + 8];
  e ^= a[4 * 0 + 9];
  f ^= a[4 * 0 + 10];
  g ^= a[4 * 0 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 1 + 8];
  i ^= a[4 * 1 + 9];
  j ^= a[4 * 1 + 10];
  k ^= a[4 * 1 + 11];
  l = ~h;
  m = i ^ l;
  n = h | m;
  o = k | m;
  p = j ^ n;
  f = k ^ p;
  r = i ^ o;
  s = m ^ f;
  t = p & r;
  g = s ^ t;
  v = p ^ r;
  e = g ^ v;
  x = s & v;
  d = p ^ x;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 2 + 8];
  e ^= a[4 * 2 + 9];
  f ^= a[4 * 2 + 10];
  g ^= a[4 * 2 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 3 + 8];
  i ^= a[4 * 3 + 9];
  j ^= a[4 * 3 + 10];
  k ^= a[4 * 3 + 11];
  l = h ^ j;
  m = k ^ l;
  n = h & m;
  o = k ^ n;
  p = i & o;
  f = m ^ p;
  r = h | f;
  s = i | k;
  v = h | k;
  t = o & r;
  e = s ^ t;
  w = i ^ v;
  x = f ^ t;
  z = n ^ s;
  g = w ^ x;
  aa = j & z;
  d = w ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 4 + 8];
  e ^= a[4 * 4 + 9];
  f ^= a[4 * 4 + 10];
  g ^= a[4 * 4 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 5 + 8];
  i ^= a[4 * 5 + 9];
  j ^= a[4 * 5 + 10];
  k ^= a[4 * 5 + 11];
  l = ~h;
  m = h ^ i;
  n = h ^ k;
  o = j ^ l;
  p = m | n;
  d = o ^ p;
  r = k & d;
  s = m ^ d;
  u = l | d;
  e = r ^ s;
  v = m | r;
  w = n ^ u;
  y = i ^ r;
  f = v ^ w;
  z = e & w;
  g = y ^ z;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 6 + 8];
  e ^= a[4 * 6 + 9];
  f ^= a[4 * 6 + 10];
  g ^= a[4 * 6 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 7 + 8];
  i ^= a[4 * 7 + 9];
  j ^= a[4 * 7 + 10];
  k ^= a[4 * 7 + 11];
  l = ~j;
  m = i ^ j;
  n = i | l;
  o = k ^ n;
  p = h & o;
  r = h ^ k;
  g = m ^ p;
  s = i ^ p;
  t = m | s;
  v = k & n;
  e = r ^ t;
  w = p ^ e;
  z = l | o;
  x = g & w;
  f = v ^ x;
  aa = w ^ f;
  d = z ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 8 + 8];
  e ^= a[4 * 8 + 9];
  f ^= a[4 * 8 + 10];
  g ^= a[4 * 8 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 9 + 8];
  i ^= a[4 * 9 + 9];
  j ^= a[4 * 9 + 10];
  k ^= a[4 * 9 + 11];
  l = ~h;
  m = i ^ l;
  n = h | m;
  o = k | m;
  p = j ^ n;
  f = k ^ p;
  r = i ^ o;
  s = m ^ f;
  t = p & r;
  g = s ^ t;
  v = p ^ r;
  e = g ^ v;
  x = s & v;
  d = p ^ x;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 10 + 8];
  e ^= a[4 * 10 + 9];
  f ^= a[4 * 10 + 10];
  g ^= a[4 * 10 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 11 + 8];
  i ^= a[4 * 11 + 9];
  j ^= a[4 * 11 + 10];
  k ^= a[4 * 11 + 11];
  l = h ^ j;
  m = k ^ l;
  n = h & m;
  o = k ^ n;
  p = i & o;
  f = m ^ p;
  r = h | f;
  s = i | k;
  v = h | k;
  t = o & r;
  e = s ^ t;
  w = i ^ v;
  x = f ^ t;
  z = n ^ s;
  g = w ^ x;
  aa = j & z;
  d = w ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 12 + 8];
  e ^= a[4 * 12 + 9];
  f ^= a[4 * 12 + 10];
  g ^= a[4 * 12 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 13 + 8];
  i ^= a[4 * 13 + 9];
  j ^= a[4 * 13 + 10];
  k ^= a[4 * 13 + 11];
  l = ~h;
  m = h ^ i;
  n = h ^ k;
  o = j ^ l;
  p = m | n;
  d = o ^ p;
  r = k & d;
  s = m ^ d;
  u = l | d;
  e = r ^ s;
  v = m | r;
  w = n ^ u;
  y = i ^ r;
  f = v ^ w;
  z = e & w;
  g = y ^ z;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 14 + 8];
  e ^= a[4 * 14 + 9];
  f ^= a[4 * 14 + 10];
  g ^= a[4 * 14 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 15 + 8];
  i ^= a[4 * 15 + 9];
  j ^= a[4 * 15 + 10];
  k ^= a[4 * 15 + 11];
  l = ~j;
  m = i ^ j;
  n = i | l;
  o = k ^ n;
  p = h & o;
  r = h ^ k;
  g = m ^ p;
  s = i ^ p;
  t = m | s;
  v = k & n;
  e = r ^ t;
  w = p ^ e;
  z = l | o;
  x = g & w;
  f = v ^ x;
  aa = w ^ f;
  d = z ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 16 + 8];
  e ^= a[4 * 16 + 9];
  f ^= a[4 * 16 + 10];
  g ^= a[4 * 16 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 17 + 8];
  i ^= a[4 * 17 + 9];
  j ^= a[4 * 17 + 10];
  k ^= a[4 * 17 + 11];
  l = ~h;
  m = i ^ l;
  n = h | m;
  o = k | m;
  p = j ^ n;
  f = k ^ p;
  r = i ^ o;
  s = m ^ f;
  t = p & r;
  g = s ^ t;
  v = p ^ r;
  e = g ^ v;
  x = s & v;
  d = p ^ x;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 18 + 8];
  e ^= a[4 * 18 + 9];
  f ^= a[4 * 18 + 10];
  g ^= a[4 * 18 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 19 + 8];
  i ^= a[4 * 19 + 9];
  j ^= a[4 * 19 + 10];
  k ^= a[4 * 19 + 11];
  l = h ^ j;
  m = k ^ l;
  n = h & m;
  o = k ^ n;
  p = i & o;
  f = m ^ p;
  r = h | f;
  s = i | k;
  v = h | k;
  t = o & r;
  e = s ^ t;
  w = i ^ v;
  x = f ^ t;
  z = n ^ s;
  g = w ^ x;
  aa = j & z;
  d = w ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 20 + 8];
  e ^= a[4 * 20 + 9];
  f ^= a[4 * 20 + 10];
  g ^= a[4 * 20 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 21 + 8];
  i ^= a[4 * 21 + 9];
  j ^= a[4 * 21 + 10];
  k ^= a[4 * 21 + 11];
  l = ~h;
  m = h ^ i;
  n = h ^ k;
  o = j ^ l;
  p = m | n;
  d = o ^ p;
  r = k & d;
  s = m ^ d;
  u = l | d;
  e = r ^ s;
  v = m | r;
  w = n ^ u;
  y = i ^ r;
  f = v ^ w;
  z = e & w;
  g = y ^ z;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 22 + 8];
  e ^= a[4 * 22 + 9];
  f ^= a[4 * 22 + 10];
  g ^= a[4 * 22 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 23 + 8];
  i ^= a[4 * 23 + 9];
  j ^= a[4 * 23 + 10];
  k ^= a[4 * 23 + 11];
  l = ~j;
  m = i ^ j;
  n = i | l;
  o = k ^ n;
  p = h & o;
  r = h ^ k;
  g = m ^ p;
  s = i ^ p;
  t = m | s;
  v = k & n;
  e = r ^ t;
  w = p ^ e;
  z = l | o;
  x = g & w;
  f = v ^ x;
  aa = w ^ f;
  d = z ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 24 + 8];
  e ^= a[4 * 24 + 9];
  f ^= a[4 * 24 + 10];
  g ^= a[4 * 24 + 11];
  l = d ^ g;
  m = d & g;
  n = f ^ l;
  q = e & l;
  o = e ^ n;
  u = ~n;
  k = m ^ o;
  r = d ^ q;
  y = ~r;
  s = f | r;
  v = n ^ r;
  j = o ^ s;
  w = k & v;
  i = u ^ w;
  h = w ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 25 + 8];
  i ^= a[4 * 25 + 9];
  j ^= a[4 * 25 + 10];
  k ^= a[4 * 25 + 11];
  l = ~h;
  m = i ^ l;
  n = h | m;
  o = k | m;
  p = j ^ n;
  f = k ^ p;
  r = i ^ o;
  s = m ^ f;
  t = p & r;
  g = s ^ t;
  v = p ^ r;
  e = g ^ v;
  x = s & v;
  d = p ^ x;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 26 + 8];
  e ^= a[4 * 26 + 9];
  f ^= a[4 * 26 + 10];
  g ^= a[4 * 26 + 11];
  l = ~d;
  m = e ^ g;
  n = f & l;
  x = g | l;
  h = m ^ n;
  p = f ^ l;
  q = f ^ h;
  r = e & q;
  u = h | p;
  k = p ^ r;
  t = g | r;
  v = t & u;
  y = m ^ k;
  j = d ^ v;
  z = j ^ x;
  i = y ^ z;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 27 + 8];
  i ^= a[4 * 27 + 9];
  j ^= a[4 * 27 + 10];
  k ^= a[4 * 27 + 11];
  l = h ^ j;
  m = k ^ l;
  n = h & m;
  o = k ^ n;
  p = i & o;
  f = m ^ p;
  r = h | f;
  s = i | k;
  v = h | k;
  t = o & r;
  e = s ^ t;
  w = i ^ v;
  x = f ^ t;
  z = n ^ s;
  g = w ^ x;
  aa = j & z;
  d = w ^ aa;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 28 + 8];
  e ^= a[4 * 28 + 9];
  f ^= a[4 * 28 + 10];
  g ^= a[4 * 28 + 11];
  l = d ^ g;
  m = g & l;
  n = f ^ m;
  o = e | n;
  k = l ^ o;
  q = ~e;
  r = l | q;
  h = n ^ r;
  t = d & h;
  u = l ^ q;
  v = o & u;
  j = t ^ v;
  x = d ^ n;
  y = u & j;
  i = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 29 + 8];
  i ^= a[4 * 29 + 9];
  j ^= a[4 * 29 + 10];
  k ^= a[4 * 29 + 11];
  l = ~h;
  m = h ^ i;
  n = h ^ k;
  o = j ^ l;
  p = m | n;
  d = o ^ p;
  r = k & d;
  s = m ^ d;
  u = l | d;
  e = r ^ s;
  v = m | r;
  w = n ^ u;
  y = i ^ r;
  f = v ^ w;
  z = e & w;
  g = y ^ z;
  d = P(d, 13);
  f = P(f, 3);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  g = P(g, 7);
  e = P(e, 1);
  d ^= e ^ g;
  f ^= g ^ (e << 7);
  d = P(d, 5);
  f = P(f, 22);
  d ^= a[4 * 30 + 8];
  e ^= a[4 * 30 + 9];
  f ^= a[4 * 30 + 10];
  g ^= a[4 * 30 + 11];
  l = ~d;
  m = d ^ g;
  n = e ^ m;
  o = l | m;
  p = f ^ o;
  i = e ^ p;
  x = ~p;
  r = m | i;
  s = g ^ r;
  t = p & s;
  j = n ^ t;
  v = p ^ s;
  h = j ^ v;
  y = n & v;
  k = x ^ y;
  h = P(h, 13);
  j = P(j, 3);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  k = P(k, 7);
  i = P(i, 1);
  h ^= i ^ k;
  j ^= k ^ (i << 7);
  h = P(h, 5);
  j = P(j, 22);
  h ^= a[4 * 31 + 8];
  i ^= a[4 * 31 + 9];
  j ^= a[4 * 31 + 10];
  k ^= a[4 * 31 + 11];
  l = ~j;
  m = i ^ j;
  n = i | l;
  o = k ^ n;
  p = h & o;
  r = h ^ k;
  g = m ^ p;
  s = i ^ p;
  t = m | s;
  v = k & n;
  e = r ^ t;
  w = p ^ e;
  z = l | o;
  x = g & w;
  f = v ^ x;
  aa = w ^ f;
  d = z ^ aa;
  d ^= a[4 * 32 + 8];
  e ^= a[4 * 32 + 9];
  f ^= a[4 * 32 + 10];
  g ^= a[4 * 32 + 11];

  c[0] = d;
  c[1] = e;
  c[2] = f;
  c[3] = g;
}

void CJ(const u32* a, const u32* b, u32* c) {
  u32 d, e, f, g, h, i, j, k;
  u32 l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa;

  d = b[0];
  e = b[1];
  f = b[2];
  g = b[3];

  d ^= a[4 * 32 + 8];
  e ^= a[4 * 32 + 9];
  f ^= a[4 * 32 + 10];
  g ^= a[4 * 32 + 11];
  l = d & e;
  m = d | e;
  n = f | l;
  o = g & m;
  k = n ^ o;
  q = ~g;
  r = e ^ o;
  s = k ^ q;
  v = f ^ r;
  t = r | s;
  i = d ^ t;
  w = g | i;
  h = v ^ w;
  y = d & k;
  z = n ^ i;
  aa = h ^ y;
  j = z ^ aa;
  h ^= a[4 * 31 + 8];
  i ^= a[4 * 31 + 9];
  j ^= a[4 * 31 + 10];
  k ^= a[4 * 31 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = j ^ m;
  o = j | l;
  p = k ^ o;
  x = k & l;
  e = n ^ p;
  r = n & p;
  s = m ^ r;
  t = i | s;
  g = p ^ t;
  v = i | g;
  d = s ^ v;
  y = n ^ v;
  f = x ^ y;
  d ^= a[4 * 30 + 8];
  e ^= a[4 * 30 + 9];
  f ^= a[4 * 30 + 10];
  g ^= a[4 * 30 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = ~f;
  m = e & l;
  n = g ^ m;
  o = d & n;
  p = e ^ l;
  k = o ^ p;
  r = e | k;
  s = d & r;
  i = n ^ s;
  u = d | g;
  v = l ^ r;
  h = u ^ v;
  x = d ^ f;
  y = e & u;
  z = o | x;
  j = y ^ z;
  h ^= a[4 * 29 + 8];
  i ^= a[4 * 29 + 9];
  j ^= a[4 * 29 + 10];
  k ^= a[4 * 29 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = j ^ k;
  m = j | k;
  n = i ^ m;
  o = h & n;
  e = l ^ o;
  q = h ^ k;
  r = i | k;
  s = q & r;
  g = n ^ s;
  u = ~h;
  v = j ^ g;
  w = u | v;
  d = n ^ w;
  y = j | o;
  z = r ^ y;
  aa = g | u;
  f = z ^ aa;
  d ^= a[4 * 28 + 8];
  e ^= a[4 * 28 + 9];
  f ^= a[4 * 28 + 10];
  g ^= a[4 * 28 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = e ^ f;
  m = e | f;
  n = d ^ f;
  r = d ^ g;
  o = m ^ n;
  p = g | o;
  t = m ^ r;
  h = l ^ p;
  s = l | p;
  v = d & o;
  j = s ^ t;
  w = h | t;
  i = v ^ w;
  y = d & j;
  z = m ^ y;
  aa = h & z;
  k = o ^ aa;
  h ^= a[4 * 27 + 8];
  i ^= a[4 * 27 + 9];
  j ^= a[4 * 27 + 10];
  k ^= a[4 * 27 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = i ^ k;
  m = ~l;
  n = h ^ j;
  o = j ^ l;
  r = h | m;
  p = i & o;
  s = k ^ r;
  v = ~o;
  d = n ^ p;
  t = n | s;
  y = k & v;
  g = l ^ t;
  w = d | g;
  e = v ^ w;
  z = n ^ w;
  f = y ^ z;
  d ^= a[4 * 26 + 8];
  e ^= a[4 * 26 + 9];
  f ^= a[4 * 26 + 10];
  g ^= a[4 * 26 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d ^ g;
  m = d & e;
  n = e ^ f;
  o = d ^ n;
  p = e | g;
  r = f | l;
  k = o ^ p;
  s = e ^ r;
  v = ~m;
  t = o & s;
  i = l ^ t;
  x = t ^ v;
  w = k & i;
  j = w ^ x;
  z = d & g;
  aa = f ^ x;
  h = z ^ aa;
  h ^= a[4 * 25 + 8];
  i ^= a[4 * 25 + 9];
  j ^= a[4 * 25 + 10];
  k ^= a[4 * 25 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = l | m;
  o = k ^ n;
  r = k & m;
  p = j ^ o;
  s = l ^ r;
  f = m ^ p;
  v = h & o;
  t = f & s;
  y = p ^ s;
  e = o ^ t;
  w = p | e;
  g = v ^ w;
  d = g ^ y;
  d ^= a[4 * 24 + 8];
  e ^= a[4 * 24 + 9];
  f ^= a[4 * 24 + 10];
  g ^= a[4 * 24 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d & e;
  m = d | e;
  n = f | l;
  o = g & m;
  k = n ^ o;
  q = ~g;
  r = e ^ o;
  s = k ^ q;
  v = f ^ r;
  t = r | s;
  i = d ^ t;
  w = g | i;
  h = v ^ w;
  y = d & k;
  z = n ^ i;
  aa = h ^ y;
  j = z ^ aa;
  h ^= a[4 * 23 + 8];
  i ^= a[4 * 23 + 9];
  j ^= a[4 * 23 + 10];
  k ^= a[4 * 23 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = j ^ m;
  o = j | l;
  p = k ^ o;
  x = k & l;
  e = n ^ p;
  r = n & p;
  s = m ^ r;
  t = i | s;
  g = p ^ t;
  v = i | g;
  d = s ^ v;
  y = n ^ v;
  f = x ^ y;
  d ^= a[4 * 22 + 8];
  e ^= a[4 * 22 + 9];
  f ^= a[4 * 22 + 10];
  g ^= a[4 * 22 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = ~f;
  m = e & l;
  n = g ^ m;
  o = d & n;
  p = e ^ l;
  k = o ^ p;
  r = e | k;
  s = d & r;
  i = n ^ s;
  u = d | g;
  v = l ^ r;
  h = u ^ v;
  x = d ^ f;
  y = e & u;
  z = o | x;
  j = y ^ z;
  h ^= a[4 * 21 + 8];
  i ^= a[4 * 21 + 9];
  j ^= a[4 * 21 + 10];
  k ^= a[4 * 21 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = j ^ k;
  m = j | k;
  n = i ^ m;
  o = h & n;
  e = l ^ o;
  q = h ^ k;
  r = i | k;
  s = q & r;
  g = n ^ s;
  u = ~h;
  v = j ^ g;
  w = u | v;
  d = n ^ w;
  y = j | o;
  z = r ^ y;
  aa = g | u;
  f = z ^ aa;
  d ^= a[4 * 20 + 8];
  e ^= a[4 * 20 + 9];
  f ^= a[4 * 20 + 10];
  g ^= a[4 * 20 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = e ^ f;
  m = e | f;
  n = d ^ f;
  r = d ^ g;
  o = m ^ n;
  p = g | o;
  t = m ^ r;
  h = l ^ p;
  s = l | p;
  v = d & o;
  j = s ^ t;
  w = h | t;
  i = v ^ w;
  y = d & j;
  z = m ^ y;
  aa = h & z;
  k = o ^ aa;
  h ^= a[4 * 19 + 8];
  i ^= a[4 * 19 + 9];
  j ^= a[4 * 19 + 10];
  k ^= a[4 * 19 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = i ^ k;
  m = ~l;
  n = h ^ j;
  o = j ^ l;
  r = h | m;
  p = i & o;
  s = k ^ r;
  v = ~o;
  d = n ^ p;
  t = n | s;
  y = k & v;
  g = l ^ t;
  w = d | g;
  e = v ^ w;
  z = n ^ w;
  f = y ^ z;
  d ^= a[4 * 18 + 8];
  e ^= a[4 * 18 + 9];
  f ^= a[4 * 18 + 10];
  g ^= a[4 * 18 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d ^ g;
  m = d & e;
  n = e ^ f;
  o = d ^ n;
  p = e | g;
  r = f | l;
  k = o ^ p;
  s = e ^ r;
  v = ~m;
  t = o & s;
  i = l ^ t;
  x = t ^ v;
  w = k & i;
  j = w ^ x;
  z = d & g;
  aa = f ^ x;
  h = z ^ aa;
  h ^= a[4 * 17 + 8];
  i ^= a[4 * 17 + 9];
  j ^= a[4 * 17 + 10];
  k ^= a[4 * 17 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = l | m;
  o = k ^ n;
  r = k & m;
  p = j ^ o;
  s = l ^ r;
  f = m ^ p;
  v = h & o;
  t = f & s;
  y = p ^ s;
  e = o ^ t;
  w = p | e;
  g = v ^ w;
  d = g ^ y;
  d ^= a[4 * 16 + 8];
  e ^= a[4 * 16 + 9];
  f ^= a[4 * 16 + 10];
  g ^= a[4 * 16 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d & e;
  m = d | e;
  n = f | l;
  o = g & m;
  k = n ^ o;
  q = ~g;
  r = e ^ o;
  s = k ^ q;
  v = f ^ r;
  t = r | s;
  i = d ^ t;
  w = g | i;
  h = v ^ w;
  y = d & k;
  z = n ^ i;
  aa = h ^ y;
  j = z ^ aa;
  h ^= a[4 * 15 + 8];
  i ^= a[4 * 15 + 9];
  j ^= a[4 * 15 + 10];
  k ^= a[4 * 15 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = j ^ m;
  o = j | l;
  p = k ^ o;
  x = k & l;
  e = n ^ p;
  r = n & p;
  s = m ^ r;
  t = i | s;
  g = p ^ t;
  v = i | g;
  d = s ^ v;
  y = n ^ v;
  f = x ^ y;
  d ^= a[4 * 14 + 8];
  e ^= a[4 * 14 + 9];
  f ^= a[4 * 14 + 10];
  g ^= a[4 * 14 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = ~f;
  m = e & l;
  n = g ^ m;
  o = d & n;
  p = e ^ l;
  k = o ^ p;
  r = e | k;
  s = d & r;
  i = n ^ s;
  u = d | g;
  v = l ^ r;
  h = u ^ v;
  x = d ^ f;
  y = e & u;
  z = o | x;
  j = y ^ z;
  h ^= a[4 * 13 + 8];
  i ^= a[4 * 13 + 9];
  j ^= a[4 * 13 + 10];
  k ^= a[4 * 13 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = j ^ k;
  m = j | k;
  n = i ^ m;
  o = h & n;
  e = l ^ o;
  q = h ^ k;
  r = i | k;
  s = q & r;
  g = n ^ s;
  u = ~h;
  v = j ^ g;
  w = u | v;
  d = n ^ w;
  y = j | o;
  z = r ^ y;
  aa = g | u;
  f = z ^ aa;
  d ^= a[4 * 12 + 8];
  e ^= a[4 * 12 + 9];
  f ^= a[4 * 12 + 10];
  g ^= a[4 * 12 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = e ^ f;
  m = e | f;
  n = d ^ f;
  r = d ^ g;
  o = m ^ n;
  p = g | o;
  t = m ^ r;
  h = l ^ p;
  s = l | p;
  v = d & o;
  j = s ^ t;
  w = h | t;
  i = v ^ w;
  y = d & j;
  z = m ^ y;
  aa = h & z;
  k = o ^ aa;
  h ^= a[4 * 11 + 8];
  i ^= a[4 * 11 + 9];
  j ^= a[4 * 11 + 10];
  k ^= a[4 * 11 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = i ^ k;
  m = ~l;
  n = h ^ j;
  o = j ^ l;
  r = h | m;
  p = i & o;
  s = k ^ r;
  v = ~o;
  d = n ^ p;
  t = n | s;
  y = k & v;
  g = l ^ t;
  w = d | g;
  e = v ^ w;
  z = n ^ w;
  f = y ^ z;
  d ^= a[4 * 10 + 8];
  e ^= a[4 * 10 + 9];
  f ^= a[4 * 10 + 10];
  g ^= a[4 * 10 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d ^ g;
  m = d & e;
  n = e ^ f;
  o = d ^ n;
  p = e | g;
  r = f | l;
  k = o ^ p;
  s = e ^ r;
  v = ~m;
  t = o & s;
  i = l ^ t;
  x = t ^ v;
  w = k & i;
  j = w ^ x;
  z = d & g;
  aa = f ^ x;
  h = z ^ aa;
  h ^= a[4 * 9 + 8];
  i ^= a[4 * 9 + 9];
  j ^= a[4 * 9 + 10];
  k ^= a[4 * 9 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = l | m;
  o = k ^ n;
  r = k & m;
  p = j ^ o;
  s = l ^ r;
  f = m ^ p;
  v = h & o;
  t = f & s;
  y = p ^ s;
  e = o ^ t;
  w = p | e;
  g = v ^ w;
  d = g ^ y;
  d ^= a[4 * 8 + 8];
  e ^= a[4 * 8 + 9];
  f ^= a[4 * 8 + 10];
  g ^= a[4 * 8 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d & e;
  m = d | e;
  n = f | l;
  o = g & m;
  k = n ^ o;
  q = ~g;
  r = e ^ o;
  s = k ^ q;
  v = f ^ r;
  t = r | s;
  i = d ^ t;
  w = g | i;
  h = v ^ w;
  y = d & k;
  z = n ^ i;
  aa = h ^ y;
  j = z ^ aa;
  h ^= a[4 * 7 + 8];
  i ^= a[4 * 7 + 9];
  j ^= a[4 * 7 + 10];
  k ^= a[4 * 7 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = j ^ m;
  o = j | l;
  p = k ^ o;
  x = k & l;
  e = n ^ p;
  r = n & p;
  s = m ^ r;
  t = i | s;
  g = p ^ t;
  v = i | g;
  d = s ^ v;
  y = n ^ v;
  f = x ^ y;
  d ^= a[4 * 6 + 8];
  e ^= a[4 * 6 + 9];
  f ^= a[4 * 6 + 10];
  g ^= a[4 * 6 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = ~f;
  m = e & l;
  n = g ^ m;
  o = d & n;
  p = e ^ l;
  k = o ^ p;
  r = e | k;
  s = d & r;
  i = n ^ s;
  u = d | g;
  v = l ^ r;
  h = u ^ v;
  x = d ^ f;
  y = e & u;
  z = o | x;
  j = y ^ z;
  h ^= a[4 * 5 + 8];
  i ^= a[4 * 5 + 9];
  j ^= a[4 * 5 + 10];
  k ^= a[4 * 5 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = j ^ k;
  m = j | k;
  n = i ^ m;
  o = h & n;
  e = l ^ o;
  q = h ^ k;
  r = i | k;
  s = q & r;
  g = n ^ s;
  u = ~h;
  v = j ^ g;
  w = u | v;
  d = n ^ w;
  y = j | o;
  z = r ^ y;
  aa = g | u;
  f = z ^ aa;
  d ^= a[4 * 4 + 8];
  e ^= a[4 * 4 + 9];
  f ^= a[4 * 4 + 10];
  g ^= a[4 * 4 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = e ^ f;
  m = e | f;
  n = d ^ f;
  r = d ^ g;
  o = m ^ n;
  p = g | o;
  t = m ^ r;
  h = l ^ p;
  s = l | p;
  v = d & o;
  j = s ^ t;
  w = h | t;
  i = v ^ w;
  y = d & j;
  z = m ^ y;
  aa = h & z;
  k = o ^ aa;
  h ^= a[4 * 3 + 8];
  i ^= a[4 * 3 + 9];
  j ^= a[4 * 3 + 10];
  k ^= a[4 * 3 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = i ^ k;
  m = ~l;
  n = h ^ j;
  o = j ^ l;
  r = h | m;
  p = i & o;
  s = k ^ r;
  v = ~o;
  d = n ^ p;
  t = n | s;
  y = k & v;
  g = l ^ t;
  w = d | g;
  e = v ^ w;
  z = n ^ w;
  f = y ^ z;
  d ^= a[4 * 2 + 8];
  e ^= a[4 * 2 + 9];
  f ^= a[4 * 2 + 10];
  g ^= a[4 * 2 + 11];
  f = O(f, 22);
  d = O(d, 5);
  f ^= g ^ (e << 7);
  d ^= e ^ g;
  g = O(g, 7);
  e = O(e, 1);
  g ^= f ^ (d << 3);
  e ^= d ^ f;
  f = O(f, 3);
  d = O(d, 13);
  l = d ^ g;
  m = d & e;
  n = e ^ f;
  o = d ^ n;
  p = e | g;
  r = f | l;
  k = o ^ p;
  s = e ^ r;
  v = ~m;
  t = o & s;
  i = l ^ t;
  x = t ^ v;
  w = k & i;
  j = w ^ x;
  z = d & g;
  aa = f ^ x;
  h = z ^ aa;
  h ^= a[4 * 1 + 8];
  i ^= a[4 * 1 + 9];
  j ^= a[4 * 1 + 10];
  k ^= a[4 * 1 + 11];
  j = O(j, 22);
  h = O(h, 5);
  j ^= k ^ (i << 7);
  h ^= i ^ k;
  k = O(k, 7);
  i = O(i, 1);
  k ^= j ^ (h << 3);
  i ^= h ^ j;
  j = O(j, 3);
  h = O(h, 13);
  l = ~h;
  m = h ^ i;
  n = l | m;
  o = k ^ n;
  r = k & m;
  p = j ^ o;
  s = l ^ r;
  f = m ^ p;
  v = h & o;
  t = f & s;
  y = p ^ s;
  e = o ^ t;
  w = p | e;
  g = v ^ w;
  d = g ^ y;
  d ^= a[4 * 0 + 8];
  e ^= a[4 * 0 + 9];
  f ^= a[4 * 0 + 10];
  g ^= a[4 * 0 + 11];

  c[0] = d;
  c[1] = e;
  c[2] = f;
  c[3] = g;
}

void CK(const u32* a, const u32* b, const u32* c, u32* d) {
  u32 e[4] = {0};
  u32 f[4] = {0};

  d[0] = c[0];
  d[1] = c[1];
  d[2] = c[2];
  d[3] = c[3];

  u32 g[140];

  CH(g, b);
  CI(g, f, e);

  d[0] ^= e[0];
  d[1] ^= e[1];
  d[2] ^= e[2];
  d[3] ^= e[3];

  CH(g, a);
  CJ(g, d, d);

  d[0] ^= e[0];
  d[1] ^= e[1];
  d[2] ^= e[2];
  d[3] ^= e[3];
}

__constant u32 Gn[8][256] = {{
                                 0x18186018, 0x23238c23, 0xc6c63fc6, 0xe8e887e8, 0x87872687, 0xb8b8dab8, 0x01010401, 0x4f4f214f, 0x3636d836, 0xa6a6a2a6, 0xd2d26fd2, 0xf5f5f3f5, 0x7979f979, 0x6f6fa16f, 0x91917e91, 0x52525552, 0x60609d60, 0xbcbccabc, 0x9b9b569b, 0x8e8e028e, 0xa3a3b6a3, 0x0c0c300c, 0x7b7bf17b, 0x3535d435, 0x1d1d741d, 0xe0e0a7e0, 0xd7d77bd7, 0xc2c22fc2, 0x2e2eb82e, 0x4b4b314b, 0xfefedffe, 0x57574157, 0x15155415, 0x7777c177, 0x3737dc37, 0xe5e5b3e5, 0x9f9f469f,
                                 0xf0f0e7f0, 0x4a4a354a, 0xdada4fda, 0x58587d58, 0xc9c903c9, 0x2929a429, 0x0a0a280a, 0xb1b1feb1, 0xa0a0baa0, 0x6b6bb16b, 0x85852e85, 0xbdbdcebd, 0x5d5d695d, 0x10104010, 0xf4f4f7f4, 0xcbcb0bcb, 0x3e3ef83e, 0x05051405, 0x67678167, 0xe4e4b7e4, 0x27279c27, 0x41411941, 0x8b8b168b, 0xa7a7a6a7, 0x7d7de97d, 0x95956e95, 0xd8d847d8, 0xfbfbcbfb, 0xeeee9fee, 0x7c7ced7c, 0x66668566, 0xdddd53dd, 0x17175c17, 0x47470147, 0x9e9e429e, 0xcaca0fca, 0x2d2db42d,
                                 0xbfbfc6bf, 0x07071c07, 0xadad8ead, 0x5a5a755a, 0x83833683, 0x3333cc33, 0x63639163, 0x02020802, 0xaaaa92aa, 0x7171d971, 0xc8c807c8, 0x19196419, 0x49493949, 0xd9d943d9, 0xf2f2eff2, 0xe3e3abe3, 0x5b5b715b, 0x88881a88, 0x9a9a529a, 0x26269826, 0x3232c832, 0xb0b0fab0, 0xe9e983e9, 0x0f0f3c0f, 0xd5d573d5, 0x80803a80, 0xbebec2be, 0xcdcd13cd, 0x3434d034, 0x48483d48, 0xffffdbff, 0x7a7af57a, 0x90907a90, 0x5f5f615f, 0x20208020, 0x6868bd68, 0x1a1a681a,
                                 0xaeae82ae, 0xb4b4eab4, 0x54544d54, 0x93937693, 0x22228822, 0x64648d64, 0xf1f1e3f1, 0x7373d173, 0x12124812, 0x40401d40, 0x08082008, 0xc3c32bc3, 0xecec97ec, 0xdbdb4bdb, 0xa1a1bea1, 0x8d8d0e8d, 0x3d3df43d, 0x97976697, 0x00000000, 0xcfcf1bcf, 0x2b2bac2b, 0x7676c576, 0x82823282, 0xd6d67fd6, 0x1b1b6c1b, 0xb5b5eeb5, 0xafaf86af, 0x6a6ab56a, 0x50505d50, 0x45450945, 0xf3f3ebf3, 0x3030c030, 0xefef9bef, 0x3f3ffc3f, 0x55554955, 0xa2a2b2a2, 0xeaea8fea,
                                 0x65658965, 0xbabad2ba, 0x2f2fbc2f, 0xc0c027c0, 0xdede5fde, 0x1c1c701c, 0xfdfdd3fd, 0x4d4d294d, 0x92927292, 0x7575c975, 0x06061806, 0x8a8a128a, 0xb2b2f2b2, 0xe6e6bfe6, 0x0e0e380e, 0x1f1f7c1f, 0x62629562, 0xd4d477d4, 0xa8a89aa8, 0x96966296, 0xf9f9c3f9, 0xc5c533c5, 0x25259425, 0x59597959, 0x84842a84, 0x7272d572, 0x3939e439, 0x4c4c2d4c, 0x5e5e655e, 0x7878fd78, 0x3838e038, 0x8c8c0a8c, 0xd1d163d1, 0xa5a5aea5, 0xe2e2afe2, 0x61619961, 0xb3b3f6b3,
                                 0x21218421, 0x9c9c4a9c, 0x1e1e781e, 0x43431143, 0xc7c73bc7, 0xfcfcd7fc, 0x04041004, 0x51515951, 0x99995e99, 0x6d6da96d, 0x0d0d340d, 0xfafacffa, 0xdfdf5bdf, 0x7e7ee57e, 0x24249024, 0x3b3bec3b, 0xabab96ab, 0xcece1fce, 0x11114411, 0x8f8f068f, 0x4e4e254e, 0xb7b7e6b7, 0xebeb8beb, 0x3c3cf03c, 0x81813e81, 0x94946a94, 0xf7f7fbf7, 0xb9b9deb9, 0x13134c13, 0x2c2cb02c, 0xd3d36bd3, 0xe7e7bbe7, 0x6e6ea56e, 0xc4c437c4, 0x03030c03, 0x56564556, 0x44440d44,
                                 0x7f7fe17f, 0xa9a99ea9, 0x2a2aa82a, 0xbbbbd6bb, 0xc1c123c1, 0x53535153, 0xdcdc57dc, 0x0b0b2c0b, 0x9d9d4e9d, 0x6c6cad6c, 0x3131c431, 0x7474cd74, 0xf6f6fff6, 0x46460546, 0xacac8aac, 0x89891e89, 0x14145014, 0xe1e1a3e1, 0x16165816, 0x3a3ae83a, 0x6969b969, 0x09092409, 0x7070dd70, 0xb6b6e2b6, 0xd0d067d0, 0xeded93ed, 0xcccc17cc, 0x42421542, 0x98985a98, 0xa4a4aaa4, 0x2828a028, 0x5c5c6d5c, 0xf8f8c7f8, 0x86862286,
                             },
                             {
                                 0xd8181860, 0x2623238c, 0xb8c6c63f, 0xfbe8e887, 0xcb878726, 0x11b8b8da, 0x09010104, 0x0d4f4f21, 0x9b3636d8, 0xffa6a6a2, 0x0cd2d26f, 0x0ef5f5f3, 0x967979f9, 0x306f6fa1, 0x6d91917e, 0xf8525255, 0x4760609d, 0x35bcbcca, 0x379b9b56, 0x8a8e8e02, 0xd2a3a3b6, 0x6c0c0c30, 0x847b7bf1, 0x803535d4, 0xf51d1d74, 0xb3e0e0a7, 0x21d7d77b, 0x9cc2c22f, 0x432e2eb8, 0x294b4b31, 0x5dfefedf, 0xd5575741, 0xbd151554, 0xe87777c1, 0x923737dc, 0x9ee5e5b3, 0x139f9f46,
                                 0x23f0f0e7, 0x204a4a35, 0x44dada4f, 0xa258587d, 0xcfc9c903, 0x7c2929a4, 0x5a0a0a28, 0x50b1b1fe, 0xc9a0a0ba, 0x146b6bb1, 0xd985852e, 0x3cbdbdce, 0x8f5d5d69, 0x90101040, 0x07f4f4f7, 0xddcbcb0b, 0xd33e3ef8, 0x2d050514, 0x78676781, 0x97e4e4b7, 0x0227279c, 0x73414119, 0xa78b8b16, 0xf6a7a7a6, 0xb27d7de9, 0x4995956e, 0x56d8d847, 0x70fbfbcb, 0xcdeeee9f, 0xbb7c7ced, 0x71666685, 0x7bdddd53, 0xaf17175c, 0x45474701, 0x1a9e9e42, 0xd4caca0f, 0x582d2db4,
                                 0x2ebfbfc6, 0x3f07071c, 0xacadad8e, 0xb05a5a75, 0xef838336, 0xb63333cc, 0x5c636391, 0x12020208, 0x93aaaa92, 0xde7171d9, 0xc6c8c807, 0xd1191964, 0x3b494939, 0x5fd9d943, 0x31f2f2ef, 0xa8e3e3ab, 0xb95b5b71, 0xbc88881a, 0x3e9a9a52, 0x0b262698, 0xbf3232c8, 0x59b0b0fa, 0xf2e9e983, 0x770f0f3c, 0x33d5d573, 0xf480803a, 0x27bebec2, 0xebcdcd13, 0x893434d0, 0x3248483d, 0x54ffffdb, 0x8d7a7af5, 0x6490907a, 0x9d5f5f61, 0x3d202080, 0x0f6868bd, 0xca1a1a68,
                                 0xb7aeae82, 0x7db4b4ea, 0xce54544d, 0x7f939376, 0x2f222288, 0x6364648d, 0x2af1f1e3, 0xcc7373d1, 0x82121248, 0x7a40401d, 0x48080820, 0x95c3c32b, 0xdfecec97, 0x4ddbdb4b, 0xc0a1a1be, 0x918d8d0e, 0xc83d3df4, 0x5b979766, 0x00000000, 0xf9cfcf1b, 0x6e2b2bac, 0xe17676c5, 0xe6828232, 0x28d6d67f, 0xc31b1b6c, 0x74b5b5ee, 0xbeafaf86, 0x1d6a6ab5, 0xea50505d, 0x57454509, 0x38f3f3eb, 0xad3030c0, 0xc4efef9b, 0xda3f3ffc, 0xc7555549, 0xdba2a2b2, 0xe9eaea8f,
                                 0x6a656589, 0x03babad2, 0x4a2f2fbc, 0x8ec0c027, 0x60dede5f, 0xfc1c1c70, 0x46fdfdd3, 0x1f4d4d29, 0x76929272, 0xfa7575c9, 0x36060618, 0xae8a8a12, 0x4bb2b2f2, 0x85e6e6bf, 0x7e0e0e38, 0xe71f1f7c, 0x55626295, 0x3ad4d477, 0x81a8a89a, 0x52969662, 0x62f9f9c3, 0xa3c5c533, 0x10252594, 0xab595979, 0xd084842a, 0xc57272d5, 0xec3939e4, 0x164c4c2d, 0x945e5e65, 0x9f7878fd, 0xe53838e0, 0x988c8c0a, 0x17d1d163, 0xe4a5a5ae, 0xa1e2e2af, 0x4e616199, 0x42b3b3f6,
                                 0x34212184, 0x089c9c4a, 0xee1e1e78, 0x61434311, 0xb1c7c73b, 0x4ffcfcd7, 0x24040410, 0xe3515159, 0x2599995e, 0x226d6da9, 0x650d0d34, 0x79fafacf, 0x69dfdf5b, 0xa97e7ee5, 0x19242490, 0xfe3b3bec, 0x9aabab96, 0xf0cece1f, 0x99111144, 0x838f8f06, 0x044e4e25, 0x66b7b7e6, 0xe0ebeb8b, 0xc13c3cf0, 0xfd81813e, 0x4094946a, 0x1cf7f7fb, 0x18b9b9de, 0x8b13134c, 0x512c2cb0, 0x05d3d36b, 0x8ce7e7bb, 0x396e6ea5, 0xaac4c437, 0x1b03030c, 0xdc565645, 0x5e44440d,
                                 0xa07f7fe1, 0x88a9a99e, 0x672a2aa8, 0x0abbbbd6, 0x87c1c123, 0xf1535351, 0x72dcdc57, 0x530b0b2c, 0x019d9d4e, 0x2b6c6cad, 0xa43131c4, 0xf37474cd, 0x15f6f6ff, 0x4c464605, 0xa5acac8a, 0xb589891e, 0xb4141450, 0xbae1e1a3, 0xa6161658, 0xf73a3ae8, 0x066969b9, 0x41090924, 0xd77070dd, 0x6fb6b6e2, 0x1ed0d067, 0xd6eded93, 0xe2cccc17, 0x68424215, 0x2c98985a, 0xeda4a4aa, 0x752828a0, 0x865c5c6d, 0x6bf8f8c7, 0xc2868622,
                             },
                             {
                                 0x30d81818, 0x46262323, 0x91b8c6c6, 0xcdfbe8e8, 0x13cb8787, 0x6d11b8b8, 0x02090101, 0x9e0d4f4f, 0x6c9b3636, 0x51ffa6a6, 0xb90cd2d2, 0xf70ef5f5, 0xf2967979, 0xde306f6f, 0x3f6d9191, 0xa4f85252, 0xc0476060, 0x6535bcbc, 0x2b379b9b, 0x018a8e8e, 0x5bd2a3a3, 0x186c0c0c, 0xf6847b7b, 0x6a803535, 0x3af51d1d, 0xddb3e0e0, 0xb321d7d7, 0x999cc2c2, 0x5c432e2e, 0x96294b4b, 0xe15dfefe, 0xaed55757, 0x2abd1515, 0xeee87777, 0x6e923737, 0xd79ee5e5, 0x23139f9f,
                                 0xfd23f0f0, 0x94204a4a, 0xa944dada, 0xb0a25858, 0x8fcfc9c9, 0x527c2929, 0x145a0a0a, 0x7f50b1b1, 0x5dc9a0a0, 0xd6146b6b, 0x17d98585, 0x673cbdbd, 0xba8f5d5d, 0x20901010, 0xf507f4f4, 0x8bddcbcb, 0x7cd33e3e, 0x0a2d0505, 0xce786767, 0xd597e4e4, 0x4e022727, 0x82734141, 0x0ba78b8b, 0x53f6a7a7, 0xfab27d7d, 0x37499595, 0xad56d8d8, 0xeb70fbfb, 0xc1cdeeee, 0xf8bb7c7c, 0xcc716666, 0xa77bdddd, 0x2eaf1717, 0x8e454747, 0x211a9e9e, 0x89d4caca, 0x5a582d2d,
                                 0x632ebfbf, 0x0e3f0707, 0x47acadad, 0xb4b05a5a, 0x1bef8383, 0x66b63333, 0xc65c6363, 0x04120202, 0x4993aaaa, 0xe2de7171, 0x8dc6c8c8, 0x32d11919, 0x923b4949, 0xaf5fd9d9, 0xf931f2f2, 0xdba8e3e3, 0xb6b95b5b, 0x0dbc8888, 0x293e9a9a, 0x4c0b2626, 0x64bf3232, 0x7d59b0b0, 0xcff2e9e9, 0x1e770f0f, 0xb733d5d5, 0x1df48080, 0x6127bebe, 0x87ebcdcd, 0x68893434, 0x90324848, 0xe354ffff, 0xf48d7a7a, 0x3d649090, 0xbe9d5f5f, 0x403d2020, 0xd00f6868, 0x34ca1a1a,
                                 0x41b7aeae, 0x757db4b4, 0xa8ce5454, 0x3b7f9393, 0x442f2222, 0xc8636464, 0xff2af1f1, 0xe6cc7373, 0x24821212, 0x807a4040, 0x10480808, 0x9b95c3c3, 0xc5dfecec, 0xab4ddbdb, 0x5fc0a1a1, 0x07918d8d, 0x7ac83d3d, 0x335b9797, 0x00000000, 0x83f9cfcf, 0x566e2b2b, 0xece17676, 0x19e68282, 0xb128d6d6, 0x36c31b1b, 0x7774b5b5, 0x43beafaf, 0xd41d6a6a, 0xa0ea5050, 0x8a574545, 0xfb38f3f3, 0x60ad3030, 0xc3c4efef, 0x7eda3f3f, 0xaac75555, 0x59dba2a2, 0xc9e9eaea,
                                 0xca6a6565, 0x6903baba, 0x5e4a2f2f, 0x9d8ec0c0, 0xa160dede, 0x38fc1c1c, 0xe746fdfd, 0x9a1f4d4d, 0x39769292, 0xeafa7575, 0x0c360606, 0x09ae8a8a, 0x794bb2b2, 0xd185e6e6, 0x1c7e0e0e, 0x3ee71f1f, 0xc4556262, 0xb53ad4d4, 0x4d81a8a8, 0x31529696, 0xef62f9f9, 0x97a3c5c5, 0x4a102525, 0xb2ab5959, 0x15d08484, 0xe4c57272, 0x72ec3939, 0x98164c4c, 0xbc945e5e, 0xf09f7878, 0x70e53838, 0x05988c8c, 0xbf17d1d1, 0x57e4a5a5, 0xd9a1e2e2, 0xc24e6161, 0x7b42b3b3,
                                 0x42342121, 0x25089c9c, 0x3cee1e1e, 0x86614343, 0x93b1c7c7, 0xe54ffcfc, 0x08240404, 0xa2e35151, 0x2f259999, 0xda226d6d, 0x1a650d0d, 0xe979fafa, 0xa369dfdf, 0xfca97e7e, 0x48192424, 0x76fe3b3b, 0x4b9aabab, 0x81f0cece, 0x22991111, 0x03838f8f, 0x9c044e4e, 0x7366b7b7, 0xcbe0ebeb, 0x78c13c3c, 0x1ffd8181, 0x35409494, 0xf31cf7f7, 0x6f18b9b9, 0x268b1313, 0x58512c2c, 0xbb05d3d3, 0xd38ce7e7, 0xdc396e6e, 0x95aac4c4, 0x061b0303, 0xacdc5656, 0x885e4444,
                                 0xfea07f7f, 0x4f88a9a9, 0x54672a2a, 0x6b0abbbb, 0x9f87c1c1, 0xa6f15353, 0xa572dcdc, 0x16530b0b, 0x27019d9d, 0xd82b6c6c, 0x62a43131, 0xe8f37474, 0xf115f6f6, 0x8c4c4646, 0x45a5acac, 0x0fb58989, 0x28b41414, 0xdfbae1e1, 0x2ca61616, 0x74f73a3a, 0xd2066969, 0x12410909, 0xe0d77070, 0x716fb6b6, 0xbd1ed0d0, 0xc7d6eded, 0x85e2cccc, 0x84684242, 0x2d2c9898, 0x55eda4a4, 0x50752828, 0xb8865c5c, 0xed6bf8f8, 0x11c28686,
                             },
                             {
                                 0x7830d818, 0xaf462623, 0xf991b8c6, 0x6fcdfbe8, 0xa113cb87, 0x626d11b8, 0x05020901, 0x6e9e0d4f, 0xee6c9b36, 0x0451ffa6, 0xbdb90cd2, 0x06f70ef5, 0x80f29679, 0xcede306f, 0xef3f6d91, 0x07a4f852, 0xfdc04760, 0x766535bc, 0xcd2b379b, 0x8c018a8e, 0x155bd2a3, 0x3c186c0c, 0x8af6847b, 0xe16a8035, 0x693af51d, 0x47ddb3e0, 0xacb321d7, 0xed999cc2, 0x965c432e, 0x7a96294b, 0x21e15dfe, 0x16aed557, 0x412abd15, 0xb6eee877, 0xeb6e9237, 0x56d79ee5, 0xd923139f,
                                 0x17fd23f0, 0x7f94204a, 0x95a944da, 0x25b0a258, 0xca8fcfc9, 0x8d527c29, 0x22145a0a, 0x4f7f50b1, 0x1a5dc9a0, 0xdad6146b, 0xab17d985, 0x73673cbd, 0x34ba8f5d, 0x50209010, 0x03f507f4, 0xc08bddcb, 0xc67cd33e, 0x110a2d05, 0xe6ce7867, 0x53d597e4, 0xbb4e0227, 0x58827341, 0x9d0ba78b, 0x0153f6a7, 0x94fab27d, 0xfb374995, 0x9fad56d8, 0x30eb70fb, 0x71c1cdee, 0x91f8bb7c, 0xe3cc7166, 0x8ea77bdd, 0x4b2eaf17, 0x468e4547, 0xdc211a9e, 0xc589d4ca, 0x995a582d,
                                 0x79632ebf, 0x1b0e3f07, 0x2347acad, 0x2fb4b05a, 0xb51bef83, 0xff66b633, 0xf2c65c63, 0x0a041202, 0x384993aa, 0xa8e2de71, 0xcf8dc6c8, 0x7d32d119, 0x70923b49, 0x9aaf5fd9, 0x1df931f2, 0x48dba8e3, 0x2ab6b95b, 0x920dbc88, 0xc8293e9a, 0xbe4c0b26, 0xfa64bf32, 0x4a7d59b0, 0x6acff2e9, 0x331e770f, 0xa6b733d5, 0xba1df480, 0x7c6127be, 0xde87ebcd, 0xe4688934, 0x75903248, 0x24e354ff, 0x8ff48d7a, 0xea3d6490, 0x3ebe9d5f, 0xa0403d20, 0xd5d00f68, 0x7234ca1a,
                                 0x2c41b7ae, 0x5e757db4, 0x19a8ce54, 0xe53b7f93, 0xaa442f22, 0xe9c86364, 0x12ff2af1, 0xa2e6cc73, 0x5a248212, 0x5d807a40, 0x28104808, 0xe89b95c3, 0x7bc5dfec, 0x90ab4ddb, 0x1f5fc0a1, 0x8307918d, 0xc97ac83d, 0xf1335b97, 0x00000000, 0xd483f9cf, 0x87566e2b, 0xb3ece176, 0xb019e682, 0xa9b128d6, 0x7736c31b, 0x5b7774b5, 0x2943beaf, 0xdfd41d6a, 0x0da0ea50, 0x4c8a5745, 0x18fb38f3, 0xf060ad30, 0x74c3c4ef, 0xc37eda3f, 0x1caac755, 0x1059dba2, 0x65c9e9ea,
                                 0xecca6a65, 0x686903ba, 0x935e4a2f, 0xe79d8ec0, 0x81a160de, 0x6c38fc1c, 0x2ee746fd, 0x649a1f4d, 0xe0397692, 0xbceafa75, 0x1e0c3606, 0x9809ae8a, 0x40794bb2, 0x59d185e6, 0x361c7e0e, 0x633ee71f, 0xf7c45562, 0xa3b53ad4, 0x324d81a8, 0xf4315296, 0x3aef62f9, 0xf697a3c5, 0xb14a1025, 0x20b2ab59, 0xae15d084, 0xa7e4c572, 0xdd72ec39, 0x6198164c, 0x3bbc945e, 0x85f09f78, 0xd870e538, 0x8605988c, 0xb2bf17d1, 0x0b57e4a5, 0x4dd9a1e2, 0xf8c24e61, 0x457b42b3,
                                 0xa5423421, 0xd625089c, 0x663cee1e, 0x52866143, 0xfc93b1c7, 0x2be54ffc, 0x14082404, 0x08a2e351, 0xc72f2599, 0xc4da226d, 0x391a650d, 0x35e979fa, 0x84a369df, 0x9bfca97e, 0xb4481924, 0xd776fe3b, 0x3d4b9aab, 0xd181f0ce, 0x55229911, 0x8903838f, 0x6b9c044e, 0x517366b7, 0x60cbe0eb, 0xcc78c13c, 0xbf1ffd81, 0xfe354094, 0x0cf31cf7, 0x676f18b9, 0x5f268b13, 0x9c58512c, 0xb8bb05d3, 0x5cd38ce7, 0xcbdc396e, 0xf395aac4, 0x0f061b03, 0x13acdc56, 0x49885e44,
                                 0x9efea07f, 0x374f88a9, 0x8254672a, 0x6d6b0abb, 0xe29f87c1, 0x02a6f153, 0x8ba572dc, 0x2716530b, 0xd327019d, 0xc1d82b6c, 0xf562a431, 0xb9e8f374, 0x09f115f6, 0x438c4c46, 0x2645a5ac, 0x970fb589, 0x4428b414, 0x42dfbae1, 0x4e2ca616, 0xd274f73a, 0xd0d20669, 0x2d124109, 0xade0d770, 0x54716fb6, 0xb7bd1ed0, 0x7ec7d6ed, 0xdb85e2cc, 0x57846842, 0xc22d2c98, 0x0e55eda4, 0x88507528, 0x31b8865c, 0x3fed6bf8, 0xa411c286,
                             },
                             {
                                 0xc07830d8, 0x05af4626, 0x7ef991b8, 0x136fcdfb, 0x4ca113cb, 0xa9626d11, 0x08050209, 0x426e9e0d, 0xadee6c9b, 0x590451ff, 0xdebdb90c, 0xfb06f70e, 0xef80f296, 0x5fcede30, 0xfcef3f6d, 0xaa07a4f8, 0x27fdc047, 0x89766535, 0xaccd2b37, 0x048c018a, 0x71155bd2, 0x603c186c, 0xff8af684, 0xb5e16a80, 0xe8693af5, 0x5347ddb3, 0xf6acb321, 0x5eed999c, 0x6d965c43, 0x627a9629, 0xa321e15d, 0x8216aed5, 0xa8412abd, 0x9fb6eee8, 0xa5eb6e92, 0x7b56d79e, 0x8cd92313,
                                 0xd317fd23, 0x6a7f9420, 0x9e95a944, 0xfa25b0a2, 0x06ca8fcf, 0x558d527c, 0x5022145a, 0xe14f7f50, 0x691a5dc9, 0x7fdad614, 0x5cab17d9, 0x8173673c, 0xd234ba8f, 0x80502090, 0xf303f507, 0x16c08bdd, 0xedc67cd3, 0x28110a2d, 0x1fe6ce78, 0x7353d597, 0x25bb4e02, 0x32588273, 0x2c9d0ba7, 0x510153f6, 0xcf94fab2, 0xdcfb3749, 0x8e9fad56, 0x8b30eb70, 0x2371c1cd, 0xc791f8bb, 0x17e3cc71, 0xa68ea77b, 0xb84b2eaf, 0x02468e45, 0x84dc211a, 0x1ec589d4, 0x75995a58,
                                 0x9179632e, 0x381b0e3f, 0x012347ac, 0xea2fb4b0, 0x6cb51bef, 0x85ff66b6, 0x3ff2c65c, 0x100a0412, 0x39384993, 0xafa8e2de, 0x0ecf8dc6, 0xc87d32d1, 0x7270923b, 0x869aaf5f, 0xc31df931, 0x4b48dba8, 0xe22ab6b9, 0x34920dbc, 0xa4c8293e, 0x2dbe4c0b, 0x8dfa64bf, 0xe94a7d59, 0x1b6acff2, 0x78331e77, 0xe6a6b733, 0x74ba1df4, 0x997c6127, 0x26de87eb, 0xbde46889, 0x7a759032, 0xab24e354, 0xf78ff48d, 0xf4ea3d64, 0xc23ebe9d, 0x1da0403d, 0x67d5d00f, 0xd07234ca,
                                 0x192c41b7, 0xc95e757d, 0x9a19a8ce, 0xece53b7f, 0x0daa442f, 0x07e9c863, 0xdb12ff2a, 0xbfa2e6cc, 0x905a2482, 0x3a5d807a, 0x40281048, 0x56e89b95, 0x337bc5df, 0x9690ab4d, 0x611f5fc0, 0x1c830791, 0xf5c97ac8, 0xccf1335b, 0x00000000, 0x36d483f9, 0x4587566e, 0x97b3ece1, 0x64b019e6, 0xfea9b128, 0xd87736c3, 0xc15b7774, 0x112943be, 0x77dfd41d, 0xba0da0ea, 0x124c8a57, 0xcb18fb38, 0x9df060ad, 0x2b74c3c4, 0xe5c37eda, 0x921caac7, 0x791059db, 0x0365c9e9,
                                 0x0fecca6a, 0xb9686903, 0x65935e4a, 0x4ee79d8e, 0xbe81a160, 0xe06c38fc, 0xbb2ee746, 0x52649a1f, 0xe4e03976, 0x8fbceafa, 0x301e0c36, 0x249809ae, 0xf940794b, 0x6359d185, 0x70361c7e, 0xf8633ee7, 0x37f7c455, 0xeea3b53a, 0x29324d81, 0xc4f43152, 0x9b3aef62, 0x66f697a3, 0x35b14a10, 0xf220b2ab, 0x54ae15d0, 0xb7a7e4c5, 0xd5dd72ec, 0x5a619816, 0xca3bbc94, 0xe785f09f, 0xddd870e5, 0x14860598, 0xc6b2bf17, 0x410b57e4, 0x434dd9a1, 0x2ff8c24e, 0xf1457b42,
                                 0x15a54234, 0x94d62508, 0xf0663cee, 0x22528661, 0x76fc93b1, 0xb32be54f, 0x20140824, 0xb208a2e3, 0xbcc72f25, 0x4fc4da22, 0x68391a65, 0x8335e979, 0xb684a369, 0xd79bfca9, 0x3db44819, 0xc5d776fe, 0x313d4b9a, 0x3ed181f0, 0x88552299, 0x0c890383, 0x4a6b9c04, 0xd1517366, 0x0b60cbe0, 0xfdcc78c1, 0x7cbf1ffd, 0xd4fe3540, 0xeb0cf31c, 0xa1676f18, 0x985f268b, 0x7d9c5851, 0xd6b8bb05, 0x6b5cd38c, 0x57cbdc39, 0x6ef395aa, 0x180f061b, 0x8a13acdc, 0x1a49885e,
                                 0xdf9efea0, 0x21374f88, 0x4d825467, 0xb16d6b0a, 0x46e29f87, 0xa202a6f1, 0xae8ba572, 0x58271653, 0x9cd32701, 0x47c1d82b, 0x95f562a4, 0x87b9e8f3, 0xe309f115, 0x0a438c4c, 0x092645a5, 0x3c970fb5, 0xa04428b4, 0x5b42dfba, 0xb04e2ca6, 0xcdd274f7, 0x6fd0d206, 0x482d1241, 0xa7ade0d7, 0xd954716f, 0xceb7bd1e, 0x3b7ec7d6, 0x2edb85e2, 0x2a578468, 0xb4c22d2c, 0x490e55ed, 0x5d885075, 0xda31b886, 0x933fed6b, 0x44a411c2,
                             },
                             {
                                 0x18c07830, 0x2305af46, 0xc67ef991, 0xe8136fcd, 0x874ca113, 0xb8a9626d, 0x01080502, 0x4f426e9e, 0x36adee6c, 0xa6590451, 0xd2debdb9, 0xf5fb06f7, 0x79ef80f2, 0x6f5fcede, 0x91fcef3f, 0x52aa07a4, 0x6027fdc0, 0xbc897665, 0x9baccd2b, 0x8e048c01, 0xa371155b, 0x0c603c18, 0x7bff8af6, 0x35b5e16a, 0x1de8693a, 0xe05347dd, 0xd7f6acb3, 0xc25eed99, 0x2e6d965c, 0x4b627a96, 0xfea321e1, 0x578216ae, 0x15a8412a, 0x779fb6ee, 0x37a5eb6e, 0xe57b56d7, 0x9f8cd923,
                                 0xf0d317fd, 0x4a6a7f94, 0xda9e95a9, 0x58fa25b0, 0xc906ca8f, 0x29558d52, 0x0a502214, 0xb1e14f7f, 0xa0691a5d, 0x6b7fdad6, 0x855cab17, 0xbd817367, 0x5dd234ba, 0x10805020, 0xf4f303f5, 0xcb16c08b, 0x3eedc67c, 0x0528110a, 0x671fe6ce, 0xe47353d5, 0x2725bb4e, 0x41325882, 0x8b2c9d0b, 0xa7510153, 0x7dcf94fa, 0x95dcfb37, 0xd88e9fad, 0xfb8b30eb, 0xee2371c1, 0x7cc791f8, 0x6617e3cc, 0xdda68ea7, 0x17b84b2e, 0x4702468e, 0x9e84dc21, 0xca1ec589, 0x2d75995a,
                                 0xbf917963, 0x07381b0e, 0xad012347, 0x5aea2fb4, 0x836cb51b, 0x3385ff66, 0x633ff2c6, 0x02100a04, 0xaa393849, 0x71afa8e2, 0xc80ecf8d, 0x19c87d32, 0x49727092, 0xd9869aaf, 0xf2c31df9, 0xe34b48db, 0x5be22ab6, 0x8834920d, 0x9aa4c829, 0x262dbe4c, 0x328dfa64, 0xb0e94a7d, 0xe91b6acf, 0x0f78331e, 0xd5e6a6b7, 0x8074ba1d, 0xbe997c61, 0xcd26de87, 0x34bde468, 0x487a7590, 0xffab24e3, 0x7af78ff4, 0x90f4ea3d, 0x5fc23ebe, 0x201da040, 0x6867d5d0, 0x1ad07234,
                                 0xae192c41, 0xb4c95e75, 0x549a19a8, 0x93ece53b, 0x220daa44, 0x6407e9c8, 0xf1db12ff, 0x73bfa2e6, 0x12905a24, 0x403a5d80, 0x08402810, 0xc356e89b, 0xec337bc5, 0xdb9690ab, 0xa1611f5f, 0x8d1c8307, 0x3df5c97a, 0x97ccf133, 0x00000000, 0xcf36d483, 0x2b458756, 0x7697b3ec, 0x8264b019, 0xd6fea9b1, 0x1bd87736, 0xb5c15b77, 0xaf112943, 0x6a77dfd4, 0x50ba0da0, 0x45124c8a, 0xf3cb18fb, 0x309df060, 0xef2b74c3, 0x3fe5c37e, 0x55921caa, 0xa2791059, 0xea0365c9,
                                 0x650fecca, 0xbab96869, 0x2f65935e, 0xc04ee79d, 0xdebe81a1, 0x1ce06c38, 0xfdbb2ee7, 0x4d52649a, 0x92e4e039, 0x758fbcea, 0x06301e0c, 0x8a249809, 0xb2f94079, 0xe66359d1, 0x0e70361c, 0x1ff8633e, 0x6237f7c4, 0xd4eea3b5, 0xa829324d, 0x96c4f431, 0xf99b3aef, 0xc566f697, 0x2535b14a, 0x59f220b2, 0x8454ae15, 0x72b7a7e4, 0x39d5dd72, 0x4c5a6198, 0x5eca3bbc, 0x78e785f0, 0x38ddd870, 0x8c148605, 0xd1c6b2bf, 0xa5410b57, 0xe2434dd9, 0x612ff8c2, 0xb3f1457b,
                                 0x2115a542, 0x9c94d625, 0x1ef0663c, 0x43225286, 0xc776fc93, 0xfcb32be5, 0x04201408, 0x51b208a2, 0x99bcc72f, 0x6d4fc4da, 0x0d68391a, 0xfa8335e9, 0xdfb684a3, 0x7ed79bfc, 0x243db448, 0x3bc5d776, 0xab313d4b, 0xce3ed181, 0x11885522, 0x8f0c8903, 0x4e4a6b9c, 0xb7d15173, 0xeb0b60cb, 0x3cfdcc78, 0x817cbf1f, 0x94d4fe35, 0xf7eb0cf3, 0xb9a1676f, 0x13985f26, 0x2c7d9c58, 0xd3d6b8bb, 0xe76b5cd3, 0x6e57cbdc, 0xc46ef395, 0x03180f06, 0x568a13ac, 0x441a4988,
                                 0x7fdf9efe, 0xa921374f, 0x2a4d8254, 0xbbb16d6b, 0xc146e29f, 0x53a202a6, 0xdcae8ba5, 0x0b582716, 0x9d9cd327, 0x6c47c1d8, 0x3195f562, 0x7487b9e8, 0xf6e309f1, 0x460a438c, 0xac092645, 0x893c970f, 0x14a04428, 0xe15b42df, 0x16b04e2c, 0x3acdd274, 0x696fd0d2, 0x09482d12, 0x70a7ade0, 0xb6d95471, 0xd0ceb7bd, 0xed3b7ec7, 0xcc2edb85, 0x422a5784, 0x98b4c22d, 0xa4490e55, 0x285d8850, 0x5cda31b8, 0xf8933fed, 0x8644a411,
                             },
                             {
                                 0x6018c078, 0x8c2305af, 0x3fc67ef9, 0x87e8136f, 0x26874ca1, 0xdab8a962, 0x04010805, 0x214f426e, 0xd836adee, 0xa2a65904, 0x6fd2debd, 0xf3f5fb06, 0xf979ef80, 0xa16f5fce, 0x7e91fcef, 0x5552aa07, 0x9d6027fd, 0xcabc8976, 0x569baccd, 0x028e048c, 0xb6a37115, 0x300c603c, 0xf17bff8a, 0xd435b5e1, 0x741de869, 0xa7e05347, 0x7bd7f6ac, 0x2fc25eed, 0xb82e6d96, 0x314b627a, 0xdffea321, 0x41578216, 0x5415a841, 0xc1779fb6, 0xdc37a5eb, 0xb3e57b56, 0x469f8cd9,
                                 0xe7f0d317, 0x354a6a7f, 0x4fda9e95, 0x7d58fa25, 0x03c906ca, 0xa429558d, 0x280a5022, 0xfeb1e14f, 0xbaa0691a, 0xb16b7fda, 0x2e855cab, 0xcebd8173, 0x695dd234, 0x40108050, 0xf7f4f303, 0x0bcb16c0, 0xf83eedc6, 0x14052811, 0x81671fe6, 0xb7e47353, 0x9c2725bb, 0x19413258, 0x168b2c9d, 0xa6a75101, 0xe97dcf94, 0x6e95dcfb, 0x47d88e9f, 0xcbfb8b30, 0x9fee2371, 0xed7cc791, 0x856617e3, 0x53dda68e, 0x5c17b84b, 0x01470246, 0x429e84dc, 0x0fca1ec5, 0xb42d7599,
                                 0xc6bf9179, 0x1c07381b, 0x8ead0123, 0x755aea2f, 0x36836cb5, 0xcc3385ff, 0x91633ff2, 0x0802100a, 0x92aa3938, 0xd971afa8, 0x07c80ecf, 0x6419c87d, 0x39497270, 0x43d9869a, 0xeff2c31d, 0xabe34b48, 0x715be22a, 0x1a883492, 0x529aa4c8, 0x98262dbe, 0xc8328dfa, 0xfab0e94a, 0x83e91b6a, 0x3c0f7833, 0x73d5e6a6, 0x3a8074ba, 0xc2be997c, 0x13cd26de, 0xd034bde4, 0x3d487a75, 0xdbffab24, 0xf57af78f, 0x7a90f4ea, 0x615fc23e, 0x80201da0, 0xbd6867d5, 0x681ad072,
                                 0x82ae192c, 0xeab4c95e, 0x4d549a19, 0x7693ece5, 0x88220daa, 0x8d6407e9, 0xe3f1db12, 0xd173bfa2, 0x4812905a, 0x1d403a5d, 0x20084028, 0x2bc356e8, 0x97ec337b, 0x4bdb9690, 0xbea1611f, 0x0e8d1c83, 0xf43df5c9, 0x6697ccf1, 0x00000000, 0x1bcf36d4, 0xac2b4587, 0xc57697b3, 0x328264b0, 0x7fd6fea9, 0x6c1bd877, 0xeeb5c15b, 0x86af1129, 0xb56a77df, 0x5d50ba0d, 0x0945124c, 0xebf3cb18, 0xc0309df0, 0x9bef2b74, 0xfc3fe5c3, 0x4955921c, 0xb2a27910, 0x8fea0365,
                                 0x89650fec, 0xd2bab968, 0xbc2f6593, 0x27c04ee7, 0x5fdebe81, 0x701ce06c, 0xd3fdbb2e, 0x294d5264, 0x7292e4e0, 0xc9758fbc, 0x1806301e, 0x128a2498, 0xf2b2f940, 0xbfe66359, 0x380e7036, 0x7c1ff863, 0x956237f7, 0x77d4eea3, 0x9aa82932, 0x6296c4f4, 0xc3f99b3a, 0x33c566f6, 0x942535b1, 0x7959f220, 0x2a8454ae, 0xd572b7a7, 0xe439d5dd, 0x2d4c5a61, 0x655eca3b, 0xfd78e785, 0xe038ddd8, 0x0a8c1486, 0x63d1c6b2, 0xaea5410b, 0xafe2434d, 0x99612ff8, 0xf6b3f145,
                                 0x842115a5, 0x4a9c94d6, 0x781ef066, 0x11432252, 0x3bc776fc, 0xd7fcb32b, 0x10042014, 0x5951b208, 0x5e99bcc7, 0xa96d4fc4, 0x340d6839, 0xcffa8335, 0x5bdfb684, 0xe57ed79b, 0x90243db4, 0xec3bc5d7, 0x96ab313d, 0x1fce3ed1, 0x44118855, 0x068f0c89, 0x254e4a6b, 0xe6b7d151, 0x8beb0b60, 0xf03cfdcc, 0x3e817cbf, 0x6a94d4fe, 0xfbf7eb0c, 0xdeb9a167, 0x4c13985f, 0xb02c7d9c, 0x6bd3d6b8, 0xbbe76b5c, 0xa56e57cb, 0x37c46ef3, 0x0c03180f, 0x45568a13, 0x0d441a49,
                                 0xe17fdf9e, 0x9ea92137, 0xa82a4d82, 0xd6bbb16d, 0x23c146e2, 0x5153a202, 0x57dcae8b, 0x2c0b5827, 0x4e9d9cd3, 0xad6c47c1, 0xc43195f5, 0xcd7487b9, 0xfff6e309, 0x05460a43, 0x8aac0926, 0x1e893c97, 0x5014a044, 0xa3e15b42, 0x5816b04e, 0xe83acdd2, 0xb9696fd0, 0x2409482d, 0xdd70a7ad, 0xe2b6d954, 0x67d0ceb7, 0x93ed3b7e, 0x17cc2edb, 0x15422a57, 0x5a98b4c2, 0xaaa4490e, 0xa0285d88, 0x6d5cda31, 0xc7f8933f, 0x228644a4,
                             },
                             {
                                 0x186018c0, 0x238c2305, 0xc63fc67e, 0xe887e813, 0x8726874c, 0xb8dab8a9, 0x01040108, 0x4f214f42, 0x36d836ad, 0xa6a2a659, 0xd26fd2de, 0xf5f3f5fb, 0x79f979ef, 0x6fa16f5f, 0x917e91fc, 0x525552aa, 0x609d6027, 0xbccabc89, 0x9b569bac, 0x8e028e04, 0xa3b6a371, 0x0c300c60, 0x7bf17bff, 0x35d435b5, 0x1d741de8, 0xe0a7e053, 0xd77bd7f6, 0xc22fc25e, 0x2eb82e6d, 0x4b314b62, 0xfedffea3, 0x57415782, 0x155415a8, 0x77c1779f, 0x37dc37a5, 0xe5b3e57b, 0x9f469f8c,
                                 0xf0e7f0d3, 0x4a354a6a, 0xda4fda9e, 0x587d58fa, 0xc903c906, 0x29a42955, 0x0a280a50, 0xb1feb1e1, 0xa0baa069, 0x6bb16b7f, 0x852e855c, 0xbdcebd81, 0x5d695dd2, 0x10401080, 0xf4f7f4f3, 0xcb0bcb16, 0x3ef83eed, 0x05140528, 0x6781671f, 0xe4b7e473, 0x279c2725, 0x41194132, 0x8b168b2c, 0xa7a6a751, 0x7de97dcf, 0x956e95dc, 0xd847d88e, 0xfbcbfb8b, 0xee9fee23, 0x7ced7cc7, 0x66856617, 0xdd53dda6, 0x175c17b8, 0x47014702, 0x9e429e84, 0xca0fca1e, 0x2db42d75,
                                 0xbfc6bf91, 0x071c0738, 0xad8ead01, 0x5a755aea, 0x8336836c, 0x33cc3385, 0x6391633f, 0x02080210, 0xaa92aa39, 0x71d971af, 0xc807c80e, 0x196419c8, 0x49394972, 0xd943d986, 0xf2eff2c3, 0xe3abe34b, 0x5b715be2, 0x881a8834, 0x9a529aa4, 0x2698262d, 0x32c8328d, 0xb0fab0e9, 0xe983e91b, 0x0f3c0f78, 0xd573d5e6, 0x803a8074, 0xbec2be99, 0xcd13cd26, 0x34d034bd, 0x483d487a, 0xffdbffab, 0x7af57af7, 0x907a90f4, 0x5f615fc2, 0x2080201d, 0x68bd6867, 0x1a681ad0,
                                 0xae82ae19, 0xb4eab4c9, 0x544d549a, 0x937693ec, 0x2288220d, 0x648d6407, 0xf1e3f1db, 0x73d173bf, 0x12481290, 0x401d403a, 0x08200840, 0xc32bc356, 0xec97ec33, 0xdb4bdb96, 0xa1bea161, 0x8d0e8d1c, 0x3df43df5, 0x976697cc, 0x00000000, 0xcf1bcf36, 0x2bac2b45, 0x76c57697, 0x82328264, 0xd67fd6fe, 0x1b6c1bd8, 0xb5eeb5c1, 0xaf86af11, 0x6ab56a77, 0x505d50ba, 0x45094512, 0xf3ebf3cb, 0x30c0309d, 0xef9bef2b, 0x3ffc3fe5, 0x55495592, 0xa2b2a279, 0xea8fea03,
                                 0x6589650f, 0xbad2bab9, 0x2fbc2f65, 0xc027c04e, 0xde5fdebe, 0x1c701ce0, 0xfdd3fdbb, 0x4d294d52, 0x927292e4, 0x75c9758f, 0x06180630, 0x8a128a24, 0xb2f2b2f9, 0xe6bfe663, 0x0e380e70, 0x1f7c1ff8, 0x62956237, 0xd477d4ee, 0xa89aa829, 0x966296c4, 0xf9c3f99b, 0xc533c566, 0x25942535, 0x597959f2, 0x842a8454, 0x72d572b7, 0x39e439d5, 0x4c2d4c5a, 0x5e655eca, 0x78fd78e7, 0x38e038dd, 0x8c0a8c14, 0xd163d1c6, 0xa5aea541, 0xe2afe243, 0x6199612f, 0xb3f6b3f1,
                                 0x21842115, 0x9c4a9c94, 0x1e781ef0, 0x43114322, 0xc73bc776, 0xfcd7fcb3, 0x04100420, 0x515951b2, 0x995e99bc, 0x6da96d4f, 0x0d340d68, 0xfacffa83, 0xdf5bdfb6, 0x7ee57ed7, 0x2490243d, 0x3bec3bc5, 0xab96ab31, 0xce1fce3e, 0x11441188, 0x8f068f0c, 0x4e254e4a, 0xb7e6b7d1, 0xeb8beb0b, 0x3cf03cfd, 0x813e817c, 0x946a94d4, 0xf7fbf7eb, 0xb9deb9a1, 0x134c1398, 0x2cb02c7d, 0xd36bd3d6, 0xe7bbe76b, 0x6ea56e57, 0xc437c46e, 0x030c0318, 0x5645568a, 0x440d441a,
                                 0x7fe17fdf, 0xa99ea921, 0x2aa82a4d, 0xbbd6bbb1, 0xc123c146, 0x535153a2, 0xdc57dcae, 0x0b2c0b58, 0x9d4e9d9c, 0x6cad6c47, 0x31c43195, 0x74cd7487, 0xf6fff6e3, 0x4605460a, 0xac8aac09, 0x891e893c, 0x145014a0, 0xe1a3e15b, 0x165816b0, 0x3ae83acd, 0x69b9696f, 0x09240948, 0x70dd70a7, 0xb6e2b6d9, 0xd067d0ce, 0xed93ed3b, 0xcc17cc2e, 0x4215422a, 0x985a98b4, 0xa4aaa449, 0x28a0285d, 0x5c6d5cda, 0xf8c7f893, 0x86228644,
                             }};

__constant u32 Go[8][256] = {
    {
        0xc07830d8, 0x05af4626, 0x7ef991b8, 0x136fcdfb, 0x4ca113cb, 0xa9626d11, 0x08050209, 0x426e9e0d, 0xadee6c9b, 0x590451ff, 0xdebdb90c, 0xfb06f70e, 0xef80f296, 0x5fcede30, 0xfcef3f6d, 0xaa07a4f8, 0x27fdc047, 0x89766535, 0xaccd2b37, 0x048c018a, 0x71155bd2, 0x603c186c, 0xff8af684, 0xb5e16a80, 0xe8693af5, 0x5347ddb3, 0xf6acb321, 0x5eed999c, 0x6d965c43, 0x627a9629, 0xa321e15d, 0x8216aed5, 0xa8412abd, 0x9fb6eee8, 0xa5eb6e92, 0x7b56d79e, 0x8cd92313,
        0xd317fd23, 0x6a7f9420, 0x9e95a944, 0xfa25b0a2, 0x06ca8fcf, 0x558d527c, 0x5022145a, 0xe14f7f50, 0x691a5dc9, 0x7fdad614, 0x5cab17d9, 0x8173673c, 0xd234ba8f, 0x80502090, 0xf303f507, 0x16c08bdd, 0xedc67cd3, 0x28110a2d, 0x1fe6ce78, 0x7353d597, 0x25bb4e02, 0x32588273, 0x2c9d0ba7, 0x510153f6, 0xcf94fab2, 0xdcfb3749, 0x8e9fad56, 0x8b30eb70, 0x2371c1cd, 0xc791f8bb, 0x17e3cc71, 0xa68ea77b, 0xb84b2eaf, 0x02468e45, 0x84dc211a, 0x1ec589d4, 0x75995a58,
        0x9179632e, 0x381b0e3f, 0x012347ac, 0xea2fb4b0, 0x6cb51bef, 0x85ff66b6, 0x3ff2c65c, 0x100a0412, 0x39384993, 0xafa8e2de, 0x0ecf8dc6, 0xc87d32d1, 0x7270923b, 0x869aaf5f, 0xc31df931, 0x4b48dba8, 0xe22ab6b9, 0x34920dbc, 0xa4c8293e, 0x2dbe4c0b, 0x8dfa64bf, 0xe94a7d59, 0x1b6acff2, 0x78331e77, 0xe6a6b733, 0x74ba1df4, 0x997c6127, 0x26de87eb, 0xbde46889, 0x7a759032, 0xab24e354, 0xf78ff48d, 0xf4ea3d64, 0xc23ebe9d, 0x1da0403d, 0x67d5d00f, 0xd07234ca,
        0x192c41b7, 0xc95e757d, 0x9a19a8ce, 0xece53b7f, 0x0daa442f, 0x07e9c863, 0xdb12ff2a, 0xbfa2e6cc, 0x905a2482, 0x3a5d807a, 0x40281048, 0x56e89b95, 0x337bc5df, 0x9690ab4d, 0x611f5fc0, 0x1c830791, 0xf5c97ac8, 0xccf1335b, 0x00000000, 0x36d483f9, 0x4587566e, 0x97b3ece1, 0x64b019e6, 0xfea9b128, 0xd87736c3, 0xc15b7774, 0x112943be, 0x77dfd41d, 0xba0da0ea, 0x124c8a57, 0xcb18fb38, 0x9df060ad, 0x2b74c3c4, 0xe5c37eda, 0x921caac7, 0x791059db, 0x0365c9e9,
        0x0fecca6a, 0xb9686903, 0x65935e4a, 0x4ee79d8e, 0xbe81a160, 0xe06c38fc, 0xbb2ee746, 0x52649a1f, 0xe4e03976, 0x8fbceafa, 0x301e0c36, 0x249809ae, 0xf940794b, 0x6359d185, 0x70361c7e, 0xf8633ee7, 0x37f7c455, 0xeea3b53a, 0x29324d81, 0xc4f43152, 0x9b3aef62, 0x66f697a3, 0x35b14a10, 0xf220b2ab, 0x54ae15d0, 0xb7a7e4c5, 0xd5dd72ec, 0x5a619816, 0xca3bbc94, 0xe785f09f, 0xddd870e5, 0x14860598, 0xc6b2bf17, 0x410b57e4, 0x434dd9a1, 0x2ff8c24e, 0xf1457b42,
        0x15a54234, 0x94d62508, 0xf0663cee, 0x22528661, 0x76fc93b1, 0xb32be54f, 0x20140824, 0xb208a2e3, 0xbcc72f25, 0x4fc4da22, 0x68391a65, 0x8335e979, 0xb684a369, 0xd79bfca9, 0x3db44819, 0xc5d776fe, 0x313d4b9a, 0x3ed181f0, 0x88552299, 0x0c890383, 0x4a6b9c04, 0xd1517366, 0x0b60cbe0, 0xfdcc78c1, 0x7cbf1ffd, 0xd4fe3540, 0xeb0cf31c, 0xa1676f18, 0x985f268b, 0x7d9c5851, 0xd6b8bb05, 0x6b5cd38c, 0x57cbdc39, 0x6ef395aa, 0x180f061b, 0x8a13acdc, 0x1a49885e,
        0xdf9efea0, 0x21374f88, 0x4d825467, 0xb16d6b0a, 0x46e29f87, 0xa202a6f1, 0xae8ba572, 0x58271653, 0x9cd32701, 0x47c1d82b, 0x95f562a4, 0x87b9e8f3, 0xe309f115, 0x0a438c4c, 0x092645a5, 0x3c970fb5, 0xa04428b4, 0x5b42dfba, 0xb04e2ca6, 0xcdd274f7, 0x6fd0d206, 0x482d1241, 0xa7ade0d7, 0xd954716f, 0xceb7bd1e, 0x3b7ec7d6, 0x2edb85e2, 0x2a578468, 0xb4c22d2c, 0x490e55ed, 0x5d885075, 0xda31b886, 0x933fed6b, 0x44a411c2,
    },
    {
        0x18c07830, 0x2305af46, 0xc67ef991, 0xe8136fcd, 0x874ca113, 0xb8a9626d, 0x01080502, 0x4f426e9e, 0x36adee6c, 0xa6590451, 0xd2debdb9, 0xf5fb06f7, 0x79ef80f2, 0x6f5fcede, 0x91fcef3f, 0x52aa07a4, 0x6027fdc0, 0xbc897665, 0x9baccd2b, 0x8e048c01, 0xa371155b, 0x0c603c18, 0x7bff8af6, 0x35b5e16a, 0x1de8693a, 0xe05347dd, 0xd7f6acb3, 0xc25eed99, 0x2e6d965c, 0x4b627a96, 0xfea321e1, 0x578216ae, 0x15a8412a, 0x779fb6ee, 0x37a5eb6e, 0xe57b56d7, 0x9f8cd923,
        0xf0d317fd, 0x4a6a7f94, 0xda9e95a9, 0x58fa25b0, 0xc906ca8f, 0x29558d52, 0x0a502214, 0xb1e14f7f, 0xa0691a5d, 0x6b7fdad6, 0x855cab17, 0xbd817367, 0x5dd234ba, 0x10805020, 0xf4f303f5, 0xcb16c08b, 0x3eedc67c, 0x0528110a, 0x671fe6ce, 0xe47353d5, 0x2725bb4e, 0x41325882, 0x8b2c9d0b, 0xa7510153, 0x7dcf94fa, 0x95dcfb37, 0xd88e9fad, 0xfb8b30eb, 0xee2371c1, 0x7cc791f8, 0x6617e3cc, 0xdda68ea7, 0x17b84b2e, 0x4702468e, 0x9e84dc21, 0xca1ec589, 0x2d75995a,
        0xbf917963, 0x07381b0e, 0xad012347, 0x5aea2fb4, 0x836cb51b, 0x3385ff66, 0x633ff2c6, 0x02100a04, 0xaa393849, 0x71afa8e2, 0xc80ecf8d, 0x19c87d32, 0x49727092, 0xd9869aaf, 0xf2c31df9, 0xe34b48db, 0x5be22ab6, 0x8834920d, 0x9aa4c829, 0x262dbe4c, 0x328dfa64, 0xb0e94a7d, 0xe91b6acf, 0x0f78331e, 0xd5e6a6b7, 0x8074ba1d, 0xbe997c61, 0xcd26de87, 0x34bde468, 0x487a7590, 0xffab24e3, 0x7af78ff4, 0x90f4ea3d, 0x5fc23ebe, 0x201da040, 0x6867d5d0, 0x1ad07234,
        0xae192c41, 0xb4c95e75, 0x549a19a8, 0x93ece53b, 0x220daa44, 0x6407e9c8, 0xf1db12ff, 0x73bfa2e6, 0x12905a24, 0x403a5d80, 0x08402810, 0xc356e89b, 0xec337bc5, 0xdb9690ab, 0xa1611f5f, 0x8d1c8307, 0x3df5c97a, 0x97ccf133, 0x00000000, 0xcf36d483, 0x2b458756, 0x7697b3ec, 0x8264b019, 0xd6fea9b1, 0x1bd87736, 0xb5c15b77, 0xaf112943, 0x6a77dfd4, 0x50ba0da0, 0x45124c8a, 0xf3cb18fb, 0x309df060, 0xef2b74c3, 0x3fe5c37e, 0x55921caa, 0xa2791059, 0xea0365c9,
        0x650fecca, 0xbab96869, 0x2f65935e, 0xc04ee79d, 0xdebe81a1, 0x1ce06c38, 0xfdbb2ee7, 0x4d52649a, 0x92e4e039, 0x758fbcea, 0x06301e0c, 0x8a249809, 0xb2f94079, 0xe66359d1, 0x0e70361c, 0x1ff8633e, 0x6237f7c4, 0xd4eea3b5, 0xa829324d, 0x96c4f431, 0xf99b3aef, 0xc566f697, 0x2535b14a, 0x59f220b2, 0x8454ae15, 0x72b7a7e4, 0x39d5dd72, 0x4c5a6198, 0x5eca3bbc, 0x78e785f0, 0x38ddd870, 0x8c148605, 0xd1c6b2bf, 0xa5410b57, 0xe2434dd9, 0x612ff8c2, 0xb3f1457b,
        0x2115a542, 0x9c94d625, 0x1ef0663c, 0x43225286, 0xc776fc93, 0xfcb32be5, 0x04201408, 0x51b208a2, 0x99bcc72f, 0x6d4fc4da, 0x0d68391a, 0xfa8335e9, 0xdfb684a3, 0x7ed79bfc, 0x243db448, 0x3bc5d776, 0xab313d4b, 0xce3ed181, 0x11885522, 0x8f0c8903, 0x4e4a6b9c, 0xb7d15173, 0xeb0b60cb, 0x3cfdcc78, 0x817cbf1f, 0x94d4fe35, 0xf7eb0cf3, 0xb9a1676f, 0x13985f26, 0x2c7d9c58, 0xd3d6b8bb, 0xe76b5cd3, 0x6e57cbdc, 0xc46ef395, 0x03180f06, 0x568a13ac, 0x441a4988,
        0x7fdf9efe, 0xa921374f, 0x2a4d8254, 0xbbb16d6b, 0xc146e29f, 0x53a202a6, 0xdcae8ba5, 0x0b582716, 0x9d9cd327, 0x6c47c1d8, 0x3195f562, 0x7487b9e8, 0xf6e309f1, 0x460a438c, 0xac092645, 0x893c970f, 0x14a04428, 0xe15b42df, 0x16b04e2c, 0x3acdd274, 0x696fd0d2, 0x09482d12, 0x70a7ade0, 0xb6d95471, 0xd0ceb7bd, 0xed3b7ec7, 0xcc2edb85, 0x422a5784, 0x98b4c22d, 0xa4490e55, 0x285d8850, 0x5cda31b8, 0xf8933fed, 0x8644a411,
    },
    {
        0x6018c078, 0x8c2305af, 0x3fc67ef9, 0x87e8136f, 0x26874ca1, 0xdab8a962, 0x04010805, 0x214f426e, 0xd836adee, 0xa2a65904, 0x6fd2debd, 0xf3f5fb06, 0xf979ef80, 0xa16f5fce, 0x7e91fcef, 0x5552aa07, 0x9d6027fd, 0xcabc8976, 0x569baccd, 0x028e048c, 0xb6a37115, 0x300c603c, 0xf17bff8a, 0xd435b5e1, 0x741de869, 0xa7e05347, 0x7bd7f6ac, 0x2fc25eed, 0xb82e6d96, 0x314b627a, 0xdffea321, 0x41578216, 0x5415a841, 0xc1779fb6, 0xdc37a5eb, 0xb3e57b56, 0x469f8cd9,
        0xe7f0d317, 0x354a6a7f, 0x4fda9e95, 0x7d58fa25, 0x03c906ca, 0xa429558d, 0x280a5022, 0xfeb1e14f, 0xbaa0691a, 0xb16b7fda, 0x2e855cab, 0xcebd8173, 0x695dd234, 0x40108050, 0xf7f4f303, 0x0bcb16c0, 0xf83eedc6, 0x14052811, 0x81671fe6, 0xb7e47353, 0x9c2725bb, 0x19413258, 0x168b2c9d, 0xa6a75101, 0xe97dcf94, 0x6e95dcfb, 0x47d88e9f, 0xcbfb8b30, 0x9fee2371, 0xed7cc791, 0x856617e3, 0x53dda68e, 0x5c17b84b, 0x01470246, 0x429e84dc, 0x0fca1ec5, 0xb42d7599,
        0xc6bf9179, 0x1c07381b, 0x8ead0123, 0x755aea2f, 0x36836cb5, 0xcc3385ff, 0x91633ff2, 0x0802100a, 0x92aa3938, 0xd971afa8, 0x07c80ecf, 0x6419c87d, 0x39497270, 0x43d9869a, 0xeff2c31d, 0xabe34b48, 0x715be22a, 0x1a883492, 0x529aa4c8, 0x98262dbe, 0xc8328dfa, 0xfab0e94a, 0x83e91b6a, 0x3c0f7833, 0x73d5e6a6, 0x3a8074ba, 0xc2be997c, 0x13cd26de, 0xd034bde4, 0x3d487a75, 0xdbffab24, 0xf57af78f, 0x7a90f4ea, 0x615fc23e, 0x80201da0, 0xbd6867d5, 0x681ad072,
        0x82ae192c, 0xeab4c95e, 0x4d549a19, 0x7693ece5, 0x88220daa, 0x8d6407e9, 0xe3f1db12, 0xd173bfa2, 0x4812905a, 0x1d403a5d, 0x20084028, 0x2bc356e8, 0x97ec337b, 0x4bdb9690, 0xbea1611f, 0x0e8d1c83, 0xf43df5c9, 0x6697ccf1, 0x00000000, 0x1bcf36d4, 0xac2b4587, 0xc57697b3, 0x328264b0, 0x7fd6fea9, 0x6c1bd877, 0xeeb5c15b, 0x86af1129, 0xb56a77df, 0x5d50ba0d, 0x0945124c, 0xebf3cb18, 0xc0309df0, 0x9bef2b74, 0xfc3fe5c3, 0x4955921c, 0xb2a27910, 0x8fea0365,
        0x89650fec, 0xd2bab968, 0xbc2f6593, 0x27c04ee7, 0x5fdebe81, 0x701ce06c, 0xd3fdbb2e, 0x294d5264, 0x7292e4e0, 0xc9758fbc, 0x1806301e, 0x128a2498, 0xf2b2f940, 0xbfe66359, 0x380e7036, 0x7c1ff863, 0x956237f7, 0x77d4eea3, 0x9aa82932, 0x6296c4f4, 0xc3f99b3a, 0x33c566f6, 0x942535b1, 0x7959f220, 0x2a8454ae, 0xd572b7a7, 0xe439d5dd, 0x2d4c5a61, 0x655eca3b, 0xfd78e785, 0xe038ddd8, 0x0a8c1486, 0x63d1c6b2, 0xaea5410b, 0xafe2434d, 0x99612ff8, 0xf6b3f145,
        0x842115a5, 0x4a9c94d6, 0x781ef066, 0x11432252, 0x3bc776fc, 0xd7fcb32b, 0x10042014, 0x5951b208, 0x5e99bcc7, 0xa96d4fc4, 0x340d6839, 0xcffa8335, 0x5bdfb684, 0xe57ed79b, 0x90243db4, 0xec3bc5d7, 0x96ab313d, 0x1fce3ed1, 0x44118855, 0x068f0c89, 0x254e4a6b, 0xe6b7d151, 0x8beb0b60, 0xf03cfdcc, 0x3e817cbf, 0x6a94d4fe, 0xfbf7eb0c, 0xdeb9a167, 0x4c13985f, 0xb02c7d9c, 0x6bd3d6b8, 0xbbe76b5c, 0xa56e57cb, 0x37c46ef3, 0x0c03180f, 0x45568a13, 0x0d441a49,
        0xe17fdf9e, 0x9ea92137, 0xa82a4d82, 0xd6bbb16d, 0x23c146e2, 0x5153a202, 0x57dcae8b, 0x2c0b5827, 0x4e9d9cd3, 0xad6c47c1, 0xc43195f5, 0xcd7487b9, 0xfff6e309, 0x05460a43, 0x8aac0926, 0x1e893c97, 0x5014a044, 0xa3e15b42, 0x5816b04e, 0xe83acdd2, 0xb9696fd0, 0x2409482d, 0xdd70a7ad, 0xe2b6d954, 0x67d0ceb7, 0x93ed3b7e, 0x17cc2edb, 0x15422a57, 0x5a98b4c2, 0xaaa4490e, 0xa0285d88, 0x6d5cda31, 0xc7f8933f, 0x228644a4,
    },
    {
        0x186018c0, 0x238c2305, 0xc63fc67e, 0xe887e813, 0x8726874c, 0xb8dab8a9, 0x01040108, 0x4f214f42, 0x36d836ad, 0xa6a2a659, 0xd26fd2de, 0xf5f3f5fb, 0x79f979ef, 0x6fa16f5f, 0x917e91fc, 0x525552aa, 0x609d6027, 0xbccabc89, 0x9b569bac, 0x8e028e04, 0xa3b6a371, 0x0c300c60, 0x7bf17bff, 0x35d435b5, 0x1d741de8, 0xe0a7e053, 0xd77bd7f6, 0xc22fc25e, 0x2eb82e6d, 0x4b314b62, 0xfedffea3, 0x57415782, 0x155415a8, 0x77c1779f, 0x37dc37a5, 0xe5b3e57b, 0x9f469f8c,
        0xf0e7f0d3, 0x4a354a6a, 0xda4fda9e, 0x587d58fa, 0xc903c906, 0x29a42955, 0x0a280a50, 0xb1feb1e1, 0xa0baa069, 0x6bb16b7f, 0x852e855c, 0xbdcebd81, 0x5d695dd2, 0x10401080, 0xf4f7f4f3, 0xcb0bcb16, 0x3ef83eed, 0x05140528, 0x6781671f, 0xe4b7e473, 0x279c2725, 0x41194132, 0x8b168b2c, 0xa7a6a751, 0x7de97dcf, 0x956e95dc, 0xd847d88e, 0xfbcbfb8b, 0xee9fee23, 0x7ced7cc7, 0x66856617, 0xdd53dda6, 0x175c17b8, 0x47014702, 0x9e429e84, 0xca0fca1e, 0x2db42d75,
        0xbfc6bf91, 0x071c0738, 0xad8ead01, 0x5a755aea, 0x8336836c, 0x33cc3385, 0x6391633f, 0x02080210, 0xaa92aa39, 0x71d971af, 0xc807c80e, 0x196419c8, 0x49394972, 0xd943d986, 0xf2eff2c3, 0xe3abe34b, 0x5b715be2, 0x881a8834, 0x9a529aa4, 0x2698262d, 0x32c8328d, 0xb0fab0e9, 0xe983e91b, 0x0f3c0f78, 0xd573d5e6, 0x803a8074, 0xbec2be99, 0xcd13cd26, 0x34d034bd, 0x483d487a, 0xffdbffab, 0x7af57af7, 0x907a90f4, 0x5f615fc2, 0x2080201d, 0x68bd6867, 0x1a681ad0,
        0xae82ae19, 0xb4eab4c9, 0x544d549a, 0x937693ec, 0x2288220d, 0x648d6407, 0xf1e3f1db, 0x73d173bf, 0x12481290, 0x401d403a, 0x08200840, 0xc32bc356, 0xec97ec33, 0xdb4bdb96, 0xa1bea161, 0x8d0e8d1c, 0x3df43df5, 0x976697cc, 0x00000000, 0xcf1bcf36, 0x2bac2b45, 0x76c57697, 0x82328264, 0xd67fd6fe, 0x1b6c1bd8, 0xb5eeb5c1, 0xaf86af11, 0x6ab56a77, 0x505d50ba, 0x45094512, 0xf3ebf3cb, 0x30c0309d, 0xef9bef2b, 0x3ffc3fe5, 0x55495592, 0xa2b2a279, 0xea8fea03,
        0x6589650f, 0xbad2bab9, 0x2fbc2f65, 0xc027c04e, 0xde5fdebe, 0x1c701ce0, 0xfdd3fdbb, 0x4d294d52, 0x927292e4, 0x75c9758f, 0x06180630, 0x8a128a24, 0xb2f2b2f9, 0xe6bfe663, 0x0e380e70, 0x1f7c1ff8, 0x62956237, 0xd477d4ee, 0xa89aa829, 0x966296c4, 0xf9c3f99b, 0xc533c566, 0x25942535, 0x597959f2, 0x842a8454, 0x72d572b7, 0x39e439d5, 0x4c2d4c5a, 0x5e655eca, 0x78fd78e7, 0x38e038dd, 0x8c0a8c14, 0xd163d1c6, 0xa5aea541, 0xe2afe243, 0x6199612f, 0xb3f6b3f1,
        0x21842115, 0x9c4a9c94, 0x1e781ef0, 0x43114322, 0xc73bc776, 0xfcd7fcb3, 0x04100420, 0x515951b2, 0x995e99bc, 0x6da96d4f, 0x0d340d68, 0xfacffa83, 0xdf5bdfb6, 0x7ee57ed7, 0x2490243d, 0x3bec3bc5, 0xab96ab31, 0xce1fce3e, 0x11441188, 0x8f068f0c, 0x4e254e4a, 0xb7e6b7d1, 0xeb8beb0b, 0x3cf03cfd, 0x813e817c, 0x946a94d4, 0xf7fbf7eb, 0xb9deb9a1, 0x134c1398, 0x2cb02c7d, 0xd36bd3d6, 0xe7bbe76b, 0x6ea56e57, 0xc437c46e, 0x030c0318, 0x5645568a, 0x440d441a,
        0x7fe17fdf, 0xa99ea921, 0x2aa82a4d, 0xbbd6bbb1, 0xc123c146, 0x535153a2, 0xdc57dcae, 0x0b2c0b58, 0x9d4e9d9c, 0x6cad6c47, 0x31c43195, 0x74cd7487, 0xf6fff6e3, 0x4605460a, 0xac8aac09, 0x891e893c, 0x145014a0, 0xe1a3e15b, 0x165816b0, 0x3ae83acd, 0x69b9696f, 0x09240948, 0x70dd70a7, 0xb6e2b6d9, 0xd067d0ce, 0xed93ed3b, 0xcc17cc2e, 0x4215422a, 0x985a98b4, 0xa4aaa449, 0x28a0285d, 0x5c6d5cda, 0xf8c7f893, 0x86228644,
    },
    {
        0x18186018, 0x23238c23, 0xc6c63fc6, 0xe8e887e8, 0x87872687, 0xb8b8dab8, 0x01010401, 0x4f4f214f, 0x3636d836, 0xa6a6a2a6, 0xd2d26fd2, 0xf5f5f3f5, 0x7979f979, 0x6f6fa16f, 0x91917e91, 0x52525552, 0x60609d60, 0xbcbccabc, 0x9b9b569b, 0x8e8e028e, 0xa3a3b6a3, 0x0c0c300c, 0x7b7bf17b, 0x3535d435, 0x1d1d741d, 0xe0e0a7e0, 0xd7d77bd7, 0xc2c22fc2, 0x2e2eb82e, 0x4b4b314b, 0xfefedffe, 0x57574157, 0x15155415, 0x7777c177, 0x3737dc37, 0xe5e5b3e5, 0x9f9f469f,
        0xf0f0e7f0, 0x4a4a354a, 0xdada4fda, 0x58587d58, 0xc9c903c9, 0x2929a429, 0x0a0a280a, 0xb1b1feb1, 0xa0a0baa0, 0x6b6bb16b, 0x85852e85, 0xbdbdcebd, 0x5d5d695d, 0x10104010, 0xf4f4f7f4, 0xcbcb0bcb, 0x3e3ef83e, 0x05051405, 0x67678167, 0xe4e4b7e4, 0x27279c27, 0x41411941, 0x8b8b168b, 0xa7a7a6a7, 0x7d7de97d, 0x95956e95, 0xd8d847d8, 0xfbfbcbfb, 0xeeee9fee, 0x7c7ced7c, 0x66668566, 0xdddd53dd, 0x17175c17, 0x47470147, 0x9e9e429e, 0xcaca0fca, 0x2d2db42d,
        0xbfbfc6bf, 0x07071c07, 0xadad8ead, 0x5a5a755a, 0x83833683, 0x3333cc33, 0x63639163, 0x02020802, 0xaaaa92aa, 0x7171d971, 0xc8c807c8, 0x19196419, 0x49493949, 0xd9d943d9, 0xf2f2eff2, 0xe3e3abe3, 0x5b5b715b, 0x88881a88, 0x9a9a529a, 0x26269826, 0x3232c832, 0xb0b0fab0, 0xe9e983e9, 0x0f0f3c0f, 0xd5d573d5, 0x80803a80, 0xbebec2be, 0xcdcd13cd, 0x3434d034, 0x48483d48, 0xffffdbff, 0x7a7af57a, 0x90907a90, 0x5f5f615f, 0x20208020, 0x6868bd68, 0x1a1a681a,
        0xaeae82ae, 0xb4b4eab4, 0x54544d54, 0x93937693, 0x22228822, 0x64648d64, 0xf1f1e3f1, 0x7373d173, 0x12124812, 0x40401d40, 0x08082008, 0xc3c32bc3, 0xecec97ec, 0xdbdb4bdb, 0xa1a1bea1, 0x8d8d0e8d, 0x3d3df43d, 0x97976697, 0x00000000, 0xcfcf1bcf, 0x2b2bac2b, 0x7676c576, 0x82823282, 0xd6d67fd6, 0x1b1b6c1b, 0xb5b5eeb5, 0xafaf86af, 0x6a6ab56a, 0x50505d50, 0x45450945, 0xf3f3ebf3, 0x3030c030, 0xefef9bef, 0x3f3ffc3f, 0x55554955, 0xa2a2b2a2, 0xeaea8fea,
        0x65658965, 0xbabad2ba, 0x2f2fbc2f, 0xc0c027c0, 0xdede5fde, 0x1c1c701c, 0xfdfdd3fd, 0x4d4d294d, 0x92927292, 0x7575c975, 0x06061806, 0x8a8a128a, 0xb2b2f2b2, 0xe6e6bfe6, 0x0e0e380e, 0x1f1f7c1f, 0x62629562, 0xd4d477d4, 0xa8a89aa8, 0x96966296, 0xf9f9c3f9, 0xc5c533c5, 0x25259425, 0x59597959, 0x84842a84, 0x7272d572, 0x3939e439, 0x4c4c2d4c, 0x5e5e655e, 0x7878fd78, 0x3838e038, 0x8c8c0a8c, 0xd1d163d1, 0xa5a5aea5, 0xe2e2afe2, 0x61619961, 0xb3b3f6b3,
        0x21218421, 0x9c9c4a9c, 0x1e1e781e, 0x43431143, 0xc7c73bc7, 0xfcfcd7fc, 0x04041004, 0x51515951, 0x99995e99, 0x6d6da96d, 0x0d0d340d, 0xfafacffa, 0xdfdf5bdf, 0x7e7ee57e, 0x24249024, 0x3b3bec3b, 0xabab96ab, 0xcece1fce, 0x11114411, 0x8f8f068f, 0x4e4e254e, 0xb7b7e6b7, 0xebeb8beb, 0x3c3cf03c, 0x81813e81, 0x94946a94, 0xf7f7fbf7, 0xb9b9deb9, 0x13134c13, 0x2c2cb02c, 0xd3d36bd3, 0xe7e7bbe7, 0x6e6ea56e, 0xc4c437c4, 0x03030c03, 0x56564556, 0x44440d44,
        0x7f7fe17f, 0xa9a99ea9, 0x2a2aa82a, 0xbbbbd6bb, 0xc1c123c1, 0x53535153, 0xdcdc57dc, 0x0b0b2c0b, 0x9d9d4e9d, 0x6c6cad6c, 0x3131c431, 0x7474cd74, 0xf6f6fff6, 0x46460546, 0xacac8aac, 0x89891e89, 0x14145014, 0xe1e1a3e1, 0x16165816, 0x3a3ae83a, 0x6969b969, 0x09092409, 0x7070dd70, 0xb6b6e2b6, 0xd0d067d0, 0xeded93ed, 0xcccc17cc, 0x42421542, 0x98985a98, 0xa4a4aaa4, 0x2828a028, 0x5c5c6d5c, 0xf8f8c7f8, 0x86862286,
    },
    {
        0xd8181860, 0x2623238c, 0xb8c6c63f, 0xfbe8e887, 0xcb878726, 0x11b8b8da, 0x09010104, 0x0d4f4f21, 0x9b3636d8, 0xffa6a6a2, 0x0cd2d26f, 0x0ef5f5f3, 0x967979f9, 0x306f6fa1, 0x6d91917e, 0xf8525255, 0x4760609d, 0x35bcbcca, 0x379b9b56, 0x8a8e8e02, 0xd2a3a3b6, 0x6c0c0c30, 0x847b7bf1, 0x803535d4, 0xf51d1d74, 0xb3e0e0a7, 0x21d7d77b, 0x9cc2c22f, 0x432e2eb8, 0x294b4b31, 0x5dfefedf, 0xd5575741, 0xbd151554, 0xe87777c1, 0x923737dc, 0x9ee5e5b3, 0x139f9f46,
        0x23f0f0e7, 0x204a4a35, 0x44dada4f, 0xa258587d, 0xcfc9c903, 0x7c2929a4, 0x5a0a0a28, 0x50b1b1fe, 0xc9a0a0ba, 0x146b6bb1, 0xd985852e, 0x3cbdbdce, 0x8f5d5d69, 0x90101040, 0x07f4f4f7, 0xddcbcb0b, 0xd33e3ef8, 0x2d050514, 0x78676781, 0x97e4e4b7, 0x0227279c, 0x73414119, 0xa78b8b16, 0xf6a7a7a6, 0xb27d7de9, 0x4995956e, 0x56d8d847, 0x70fbfbcb, 0xcdeeee9f, 0xbb7c7ced, 0x71666685, 0x7bdddd53, 0xaf17175c, 0x45474701, 0x1a9e9e42, 0xd4caca0f, 0x582d2db4,
        0x2ebfbfc6, 0x3f07071c, 0xacadad8e, 0xb05a5a75, 0xef838336, 0xb63333cc, 0x5c636391, 0x12020208, 0x93aaaa92, 0xde7171d9, 0xc6c8c807, 0xd1191964, 0x3b494939, 0x5fd9d943, 0x31f2f2ef, 0xa8e3e3ab, 0xb95b5b71, 0xbc88881a, 0x3e9a9a52, 0x0b262698, 0xbf3232c8, 0x59b0b0fa, 0xf2e9e983, 0x770f0f3c, 0x33d5d573, 0xf480803a, 0x27bebec2, 0xebcdcd13, 0x893434d0, 0x3248483d, 0x54ffffdb, 0x8d7a7af5, 0x6490907a, 0x9d5f5f61, 0x3d202080, 0x0f6868bd, 0xca1a1a68,
        0xb7aeae82, 0x7db4b4ea, 0xce54544d, 0x7f939376, 0x2f222288, 0x6364648d, 0x2af1f1e3, 0xcc7373d1, 0x82121248, 0x7a40401d, 0x48080820, 0x95c3c32b, 0xdfecec97, 0x4ddbdb4b, 0xc0a1a1be, 0x918d8d0e, 0xc83d3df4, 0x5b979766, 0x00000000, 0xf9cfcf1b, 0x6e2b2bac, 0xe17676c5, 0xe6828232, 0x28d6d67f, 0xc31b1b6c, 0x74b5b5ee, 0xbeafaf86, 0x1d6a6ab5, 0xea50505d, 0x57454509, 0x38f3f3eb, 0xad3030c0, 0xc4efef9b, 0xda3f3ffc, 0xc7555549, 0xdba2a2b2, 0xe9eaea8f,
        0x6a656589, 0x03babad2, 0x4a2f2fbc, 0x8ec0c027, 0x60dede5f, 0xfc1c1c70, 0x46fdfdd3, 0x1f4d4d29, 0x76929272, 0xfa7575c9, 0x36060618, 0xae8a8a12, 0x4bb2b2f2, 0x85e6e6bf, 0x7e0e0e38, 0xe71f1f7c, 0x55626295, 0x3ad4d477, 0x81a8a89a, 0x52969662, 0x62f9f9c3, 0xa3c5c533, 0x10252594, 0xab595979, 0xd084842a, 0xc57272d5, 0xec3939e4, 0x164c4c2d, 0x945e5e65, 0x9f7878fd, 0xe53838e0, 0x988c8c0a, 0x17d1d163, 0xe4a5a5ae, 0xa1e2e2af, 0x4e616199, 0x42b3b3f6,
        0x34212184, 0x089c9c4a, 0xee1e1e78, 0x61434311, 0xb1c7c73b, 0x4ffcfcd7, 0x24040410, 0xe3515159, 0x2599995e, 0x226d6da9, 0x650d0d34, 0x79fafacf, 0x69dfdf5b, 0xa97e7ee5, 0x19242490, 0xfe3b3bec, 0x9aabab96, 0xf0cece1f, 0x99111144, 0x838f8f06, 0x044e4e25, 0x66b7b7e6, 0xe0ebeb8b, 0xc13c3cf0, 0xfd81813e, 0x4094946a, 0x1cf7f7fb, 0x18b9b9de, 0x8b13134c, 0x512c2cb0, 0x05d3d36b, 0x8ce7e7bb, 0x396e6ea5, 0xaac4c437, 0x1b03030c, 0xdc565645, 0x5e44440d,
        0xa07f7fe1, 0x88a9a99e, 0x672a2aa8, 0x0abbbbd6, 0x87c1c123, 0xf1535351, 0x72dcdc57, 0x530b0b2c, 0x019d9d4e, 0x2b6c6cad, 0xa43131c4, 0xf37474cd, 0x15f6f6ff, 0x4c464605, 0xa5acac8a, 0xb589891e, 0xb4141450, 0xbae1e1a3, 0xa6161658, 0xf73a3ae8, 0x066969b9, 0x41090924, 0xd77070dd, 0x6fb6b6e2, 0x1ed0d067, 0xd6eded93, 0xe2cccc17, 0x68424215, 0x2c98985a, 0xeda4a4aa, 0x752828a0, 0x865c5c6d, 0x6bf8f8c7, 0xc2868622,
    },
    {
        0x30d81818, 0x46262323, 0x91b8c6c6, 0xcdfbe8e8, 0x13cb8787, 0x6d11b8b8, 0x02090101, 0x9e0d4f4f, 0x6c9b3636, 0x51ffa6a6, 0xb90cd2d2, 0xf70ef5f5, 0xf2967979, 0xde306f6f, 0x3f6d9191, 0xa4f85252, 0xc0476060, 0x6535bcbc, 0x2b379b9b, 0x018a8e8e, 0x5bd2a3a3, 0x186c0c0c, 0xf6847b7b, 0x6a803535, 0x3af51d1d, 0xddb3e0e0, 0xb321d7d7, 0x999cc2c2, 0x5c432e2e, 0x96294b4b, 0xe15dfefe, 0xaed55757, 0x2abd1515, 0xeee87777, 0x6e923737, 0xd79ee5e5, 0x23139f9f,
        0xfd23f0f0, 0x94204a4a, 0xa944dada, 0xb0a25858, 0x8fcfc9c9, 0x527c2929, 0x145a0a0a, 0x7f50b1b1, 0x5dc9a0a0, 0xd6146b6b, 0x17d98585, 0x673cbdbd, 0xba8f5d5d, 0x20901010, 0xf507f4f4, 0x8bddcbcb, 0x7cd33e3e, 0x0a2d0505, 0xce786767, 0xd597e4e4, 0x4e022727, 0x82734141, 0x0ba78b8b, 0x53f6a7a7, 0xfab27d7d, 0x37499595, 0xad56d8d8, 0xeb70fbfb, 0xc1cdeeee, 0xf8bb7c7c, 0xcc716666, 0xa77bdddd, 0x2eaf1717, 0x8e454747, 0x211a9e9e, 0x89d4caca, 0x5a582d2d,
        0x632ebfbf, 0x0e3f0707, 0x47acadad, 0xb4b05a5a, 0x1bef8383, 0x66b63333, 0xc65c6363, 0x04120202, 0x4993aaaa, 0xe2de7171, 0x8dc6c8c8, 0x32d11919, 0x923b4949, 0xaf5fd9d9, 0xf931f2f2, 0xdba8e3e3, 0xb6b95b5b, 0x0dbc8888, 0x293e9a9a, 0x4c0b2626, 0x64bf3232, 0x7d59b0b0, 0xcff2e9e9, 0x1e770f0f, 0xb733d5d5, 0x1df48080, 0x6127bebe, 0x87ebcdcd, 0x68893434, 0x90324848, 0xe354ffff, 0xf48d7a7a, 0x3d649090, 0xbe9d5f5f, 0x403d2020, 0xd00f6868, 0x34ca1a1a,
        0x41b7aeae, 0x757db4b4, 0xa8ce5454, 0x3b7f9393, 0x442f2222, 0xc8636464, 0xff2af1f1, 0xe6cc7373, 0x24821212, 0x807a4040, 0x10480808, 0x9b95c3c3, 0xc5dfecec, 0xab4ddbdb, 0x5fc0a1a1, 0x07918d8d, 0x7ac83d3d, 0x335b9797, 0x00000000, 0x83f9cfcf, 0x566e2b2b, 0xece17676, 0x19e68282, 0xb128d6d6, 0x36c31b1b, 0x7774b5b5, 0x43beafaf, 0xd41d6a6a, 0xa0ea5050, 0x8a574545, 0xfb38f3f3, 0x60ad3030, 0xc3c4efef, 0x7eda3f3f, 0xaac75555, 0x59dba2a2, 0xc9e9eaea,
        0xca6a6565, 0x6903baba, 0x5e4a2f2f, 0x9d8ec0c0, 0xa160dede, 0x38fc1c1c, 0xe746fdfd, 0x9a1f4d4d, 0x39769292, 0xeafa7575, 0x0c360606, 0x09ae8a8a, 0x794bb2b2, 0xd185e6e6, 0x1c7e0e0e, 0x3ee71f1f, 0xc4556262, 0xb53ad4d4, 0x4d81a8a8, 0x31529696, 0xef62f9f9, 0x97a3c5c5, 0x4a102525, 0xb2ab5959, 0x15d08484, 0xe4c57272, 0x72ec3939, 0x98164c4c, 0xbc945e5e, 0xf09f7878, 0x70e53838, 0x05988c8c, 0xbf17d1d1, 0x57e4a5a5, 0xd9a1e2e2, 0xc24e6161, 0x7b42b3b3,
        0x42342121, 0x25089c9c, 0x3cee1e1e, 0x86614343, 0x93b1c7c7, 0xe54ffcfc, 0x08240404, 0xa2e35151, 0x2f259999, 0xda226d6d, 0x1a650d0d, 0xe979fafa, 0xa369dfdf, 0xfca97e7e, 0x48192424, 0x76fe3b3b, 0x4b9aabab, 0x81f0cece, 0x22991111, 0x03838f8f, 0x9c044e4e, 0x7366b7b7, 0xcbe0ebeb, 0x78c13c3c, 0x1ffd8181, 0x35409494, 0xf31cf7f7, 0x6f18b9b9, 0x268b1313, 0x58512c2c, 0xbb05d3d3, 0xd38ce7e7, 0xdc396e6e, 0x95aac4c4, 0x061b0303, 0xacdc5656, 0x885e4444,
        0xfea07f7f, 0x4f88a9a9, 0x54672a2a, 0x6b0abbbb, 0x9f87c1c1, 0xa6f15353, 0xa572dcdc, 0x16530b0b, 0x27019d9d, 0xd82b6c6c, 0x62a43131, 0xe8f37474, 0xf115f6f6, 0x8c4c4646, 0x45a5acac, 0x0fb58989, 0x28b41414, 0xdfbae1e1, 0x2ca61616, 0x74f73a3a, 0xd2066969, 0x12410909, 0xe0d77070, 0x716fb6b6, 0xbd1ed0d0, 0xc7d6eded, 0x85e2cccc, 0x84684242, 0x2d2c9898, 0x55eda4a4, 0x50752828, 0xb8865c5c, 0xed6bf8f8, 0x11c28686,
    },
    {
        0x7830d818, 0xaf462623, 0xf991b8c6, 0x6fcdfbe8, 0xa113cb87, 0x626d11b8, 0x05020901, 0x6e9e0d4f, 0xee6c9b36, 0x0451ffa6, 0xbdb90cd2, 0x06f70ef5, 0x80f29679, 0xcede306f, 0xef3f6d91, 0x07a4f852, 0xfdc04760, 0x766535bc, 0xcd2b379b, 0x8c018a8e, 0x155bd2a3, 0x3c186c0c, 0x8af6847b, 0xe16a8035, 0x693af51d, 0x47ddb3e0, 0xacb321d7, 0xed999cc2, 0x965c432e, 0x7a96294b, 0x21e15dfe, 0x16aed557, 0x412abd15, 0xb6eee877, 0xeb6e9237, 0x56d79ee5, 0xd923139f,
        0x17fd23f0, 0x7f94204a, 0x95a944da, 0x25b0a258, 0xca8fcfc9, 0x8d527c29, 0x22145a0a, 0x4f7f50b1, 0x1a5dc9a0, 0xdad6146b, 0xab17d985, 0x73673cbd, 0x34ba8f5d, 0x50209010, 0x03f507f4, 0xc08bddcb, 0xc67cd33e, 0x110a2d05, 0xe6ce7867, 0x53d597e4, 0xbb4e0227, 0x58827341, 0x9d0ba78b, 0x0153f6a7, 0x94fab27d, 0xfb374995, 0x9fad56d8, 0x30eb70fb, 0x71c1cdee, 0x91f8bb7c, 0xe3cc7166, 0x8ea77bdd, 0x4b2eaf17, 0x468e4547, 0xdc211a9e, 0xc589d4ca, 0x995a582d,
        0x79632ebf, 0x1b0e3f07, 0x2347acad, 0x2fb4b05a, 0xb51bef83, 0xff66b633, 0xf2c65c63, 0x0a041202, 0x384993aa, 0xa8e2de71, 0xcf8dc6c8, 0x7d32d119, 0x70923b49, 0x9aaf5fd9, 0x1df931f2, 0x48dba8e3, 0x2ab6b95b, 0x920dbc88, 0xc8293e9a, 0xbe4c0b26, 0xfa64bf32, 0x4a7d59b0, 0x6acff2e9, 0x331e770f, 0xa6b733d5, 0xba1df480, 0x7c6127be, 0xde87ebcd, 0xe4688934, 0x75903248, 0x24e354ff, 0x8ff48d7a, 0xea3d6490, 0x3ebe9d5f, 0xa0403d20, 0xd5d00f68, 0x7234ca1a,
        0x2c41b7ae, 0x5e757db4, 0x19a8ce54, 0xe53b7f93, 0xaa442f22, 0xe9c86364, 0x12ff2af1, 0xa2e6cc73, 0x5a248212, 0x5d807a40, 0x28104808, 0xe89b95c3, 0x7bc5dfec, 0x90ab4ddb, 0x1f5fc0a1, 0x8307918d, 0xc97ac83d, 0xf1335b97, 0x00000000, 0xd483f9cf, 0x87566e2b, 0xb3ece176, 0xb019e682, 0xa9b128d6, 0x7736c31b, 0x5b7774b5, 0x2943beaf, 0xdfd41d6a, 0x0da0ea50, 0x4c8a5745, 0x18fb38f3, 0xf060ad30, 0x74c3c4ef, 0xc37eda3f, 0x1caac755, 0x1059dba2, 0x65c9e9ea,
        0xecca6a65, 0x686903ba, 0x935e4a2f, 0xe79d8ec0, 0x81a160de, 0x6c38fc1c, 0x2ee746fd, 0x649a1f4d, 0xe0397692, 0xbceafa75, 0x1e0c3606, 0x9809ae8a, 0x40794bb2, 0x59d185e6, 0x361c7e0e, 0x633ee71f, 0xf7c45562, 0xa3b53ad4, 0x324d81a8, 0xf4315296, 0x3aef62f9, 0xf697a3c5, 0xb14a1025, 0x20b2ab59, 0xae15d084, 0xa7e4c572, 0xdd72ec39, 0x6198164c, 0x3bbc945e, 0x85f09f78, 0xd870e538, 0x8605988c, 0xb2bf17d1, 0x0b57e4a5, 0x4dd9a1e2, 0xf8c24e61, 0x457b42b3,
        0xa5423421, 0xd625089c, 0x663cee1e, 0x52866143, 0xfc93b1c7, 0x2be54ffc, 0x14082404, 0x08a2e351, 0xc72f2599, 0xc4da226d, 0x391a650d, 0x35e979fa, 0x84a369df, 0x9bfca97e, 0xb4481924, 0xd776fe3b, 0x3d4b9aab, 0xd181f0ce, 0x55229911, 0x8903838f, 0x6b9c044e, 0x517366b7, 0x60cbe0eb, 0xcc78c13c, 0xbf1ffd81, 0xfe354094, 0x0cf31cf7, 0x676f18b9, 0x5f268b13, 0x9c58512c, 0xb8bb05d3, 0x5cd38ce7, 0xcbdc396e, 0xf395aac4, 0x0f061b03, 0x13acdc56, 0x49885e44,
        0x9efea07f, 0x374f88a9, 0x8254672a, 0x6d6b0abb, 0xe29f87c1, 0x02a6f153, 0x8ba572dc, 0x2716530b, 0xd327019d, 0xc1d82b6c, 0xf562a431, 0xb9e8f374, 0x09f115f6, 0x438c4c46, 0x2645a5ac, 0x970fb589, 0x4428b414, 0x42dfbae1, 0x4e2ca616, 0xd274f73a, 0xd0d20669, 0x2d124109, 0xade0d770, 0x54716fb6, 0xb7bd1ed0, 0x7ec7d6ed, 0xdb85e2cc, 0x57846842, 0xc22d2c98, 0x0e55eda4, 0x88507528, 0x31b8865c, 0x3fed6bf8, 0xa411c286,
    },
};

void CL(const u32 a[16], u32 b[16], __local u32 (*c)[256], __local u32 (*d)[256]) {
  const u32 e[10 + 1] = {
      0x00000000, 0x1823c6e8, 0x36a6d2f5, 0x60bc9b8e, 0x1de0d7c2, 0x157737e5, 0x58c9290a, 0xbd5d10f4, 0xe427418b, 0xfbee7c66, 0xca2dbf07,
  };

  const u32 f[10 + 1] = {
      0x00000000, 0x87b8014f, 0x796f9152, 0xa30c7b35, 0x2e4bfe57, 0x9ff04ada, 0xb1a06b85, 0xcb3e0567, 0xa77d95d8, 0xdd17479e, 0xad5a8333,
  };

  u32 g[8];
  u32 h[8];

  g[0] = b[0];
  h[0] = b[1];
  g[1] = b[2];
  h[1] = b[3];
  g[2] = b[4];
  h[2] = b[5];
  g[3] = b[6];
  h[3] = b[7];
  g[4] = b[8];
  h[4] = b[9];
  g[5] = b[10];
  h[5] = b[11];
  g[6] = b[12];
  h[6] = b[13];
  g[7] = b[14];
  h[7] = b[15];

  u32 i[8];
  u32 j[8];

  i[0] = a[0] ^ g[0];
  j[0] = a[1] ^ h[0];
  i[1] = a[2] ^ g[1];
  j[1] = a[3] ^ h[1];
  i[2] = a[4] ^ g[2];
  j[2] = a[5] ^ h[2];
  i[3] = a[6] ^ g[3];
  j[3] = a[7] ^ h[3];
  i[4] = a[8] ^ g[4];
  j[4] = a[9] ^ h[4];
  i[5] = a[10] ^ g[5];
  j[5] = a[11] ^ h[5];
  i[6] = a[12] ^ g[6];
  j[6] = a[13] ^ h[6];
  i[7] = a[14] ^ g[7];
  j[7] = a[15] ^ h[7];

  u32 k;

  for (k = 1; k <= 10; k++) {
    u32 l[8];
    u32 m[8];

    u32 n;

    for (n = 0; n < 8; n++) {
      const u8 o = g[(n + 8) & 7] >> 24;
      const u8 p = g[(n + 7) & 7] >> 16;
      const u8 q = g[(n + 6) & 7] >> 8;
      const u8 r = g[(n + 5) & 7] >> 0;
      const u8 s = h[(n + 4) & 7] >> 24;
      const u8 t = h[(n + 3) & 7] >> 16;
      const u8 u = h[(n + 2) & 7] >> 8;
      const u8 v = h[(n + 1) & 7] >> 0;

      l[n] = (c)[(0)][(o & 0xff)] ^ (c)[(1)][(p & 0xff)] ^ (c)[(2)][(q & 0xff)] ^ (c)[(3)][(r & 0xff)] ^ (c)[(4)][(s & 0xff)] ^ (c)[(5)][(t & 0xff)] ^ (c)[(6)][(u & 0xff)] ^ (c)[(7)][(v & 0xff)];

      m[n] = (d)[(0)][(o & 0xff)] ^ (d)[(1)][(p & 0xff)] ^ (d)[(2)][(q & 0xff)] ^ (d)[(3)][(r & 0xff)] ^ (d)[(4)][(s & 0xff)] ^ (d)[(5)][(t & 0xff)] ^ (d)[(6)][(u & 0xff)] ^ (d)[(7)][(v & 0xff)];
    }

    g[0] = l[0] ^ e[k];
    h[0] = m[0] ^ f[k];
    g[1] = l[1];
    h[1] = m[1];
    g[2] = l[2];
    h[2] = m[2];
    g[3] = l[3];
    h[3] = m[3];
    g[4] = l[4];
    h[4] = m[4];
    g[5] = l[5];
    h[5] = m[5];
    g[6] = l[6];
    h[6] = m[6];
    g[7] = l[7];
    h[7] = m[7];

    for (n = 0; n < 8; n++) {
      const u8 o = i[(n + 8) & 7] >> 24;
      const u8 p = i[(n + 7) & 7] >> 16;
      const u8 q = i[(n + 6) & 7] >> 8;
      const u8 r = i[(n + 5) & 7] >> 0;
      const u8 s = j[(n + 4) & 7] >> 24;
      const u8 t = j[(n + 3) & 7] >> 16;
      const u8 u = j[(n + 2) & 7] >> 8;
      const u8 v = j[(n + 1) & 7] >> 0;

      l[n] = (c)[(0)][(o & 0xff)] ^ (c)[(1)][(p & 0xff)] ^ (c)[(2)][(q & 0xff)] ^ (c)[(3)][(r & 0xff)] ^ (c)[(4)][(s & 0xff)] ^ (c)[(5)][(t & 0xff)] ^ (c)[(6)][(u & 0xff)] ^ (c)[(7)][(v & 0xff)];

      m[n] = (d)[(0)][(o & 0xff)] ^ (d)[(1)][(p & 0xff)] ^ (d)[(2)][(q & 0xff)] ^ (d)[(3)][(r & 0xff)] ^ (d)[(4)][(s & 0xff)] ^ (d)[(5)][(t & 0xff)] ^ (d)[(6)][(u & 0xff)] ^ (d)[(7)][(v & 0xff)];
    }

    i[0] = l[0] ^ g[0];
    j[0] = m[0] ^ h[0];
    i[1] = l[1] ^ g[1];
    j[1] = m[1] ^ h[1];
    i[2] = l[2] ^ g[2];
    j[2] = m[2] ^ h[2];
    i[3] = l[3] ^ g[3];
    j[3] = m[3] ^ h[3];
    i[4] = l[4] ^ g[4];
    j[4] = m[4] ^ h[4];
    i[5] = l[5] ^ g[5];
    j[5] = m[5] ^ h[5];
    i[6] = l[6] ^ g[6];
    j[6] = m[6] ^ h[6];
    i[7] = l[7] ^ g[7];
    j[7] = m[7] ^ h[7];
  }

  b[0] ^= i[0] ^ a[0];
  b[1] ^= j[0] ^ a[1];
  b[2] ^= i[1] ^ a[2];
  b[3] ^= j[1] ^ a[3];
  b[4] ^= i[2] ^ a[4];
  b[5] ^= j[2] ^ a[5];
  b[6] ^= i[3] ^ a[6];
  b[7] ^= j[3] ^ a[7];
  b[8] ^= i[4] ^ a[8];
  b[9] ^= j[4] ^ a[9];
  b[10] ^= i[5] ^ a[10];
  b[11] ^= j[5] ^ a[11];
  b[12] ^= i[6] ^ a[12];
  b[13] ^= j[6] ^ a[13];
  b[14] ^= i[7] ^ a[14];
  b[15] ^= j[7] ^ a[15];
}

void CM(const u32 a[16], const u32 b[16], const u32 c[16], const u32 d[16], u32 e[16], __local u32 (*f)[256], __local u32 (*g)[256]) {
  e[0] = c[0];
  e[1] = c[1];
  e[2] = c[2];
  e[3] = c[3];
  e[4] = c[4];
  e[5] = c[5];
  e[6] = c[6];
  e[7] = c[7];
  e[8] = c[8];
  e[9] = c[9];
  e[10] = c[10];
  e[11] = c[11];
  e[12] = c[12];
  e[13] = c[13];
  e[14] = c[14];
  e[15] = c[15];

  CL(a, e, f, g);
  CL(b, e, f, g);

  u32 h[16];

  h[0] = e[0];
  h[1] = e[1];
  h[2] = e[2];
  h[3] = e[3];
  h[4] = e[4];
  h[5] = e[5];
  h[6] = e[6];
  h[7] = e[7];
  h[8] = e[8];
  h[9] = e[9];
  h[10] = e[10];
  h[11] = e[11];
  h[12] = e[12];
  h[13] = e[13];
  h[14] = e[14];
  h[15] = e[15];

  e[0] = d[0];
  e[1] = d[1];
  e[2] = d[2];
  e[3] = d[3];
  e[4] = d[4];
  e[5] = d[5];
  e[6] = d[6];
  e[7] = d[7];
  e[8] = d[8];
  e[9] = d[9];
  e[10] = d[10];
  e[11] = d[11];
  e[12] = d[12];
  e[13] = d[13];
  e[14] = d[14];
  e[15] = d[15];

  CL(h, e, f, g);

  h[0] = 0x80000000;
  h[1] = 0;
  h[2] = 0;
  h[3] = 0;
  h[4] = 0;
  h[5] = 0;
  h[6] = 0;
  h[7] = 0;
  h[8] = 0;
  h[9] = 0;
  h[10] = 0;
  h[11] = 0;
  h[12] = 0;
  h[13] = 0;
  h[14] = 0;
  h[15] = (64 + 64) * 8;

  CL(h, e, f, g);
}

void CN(u32 a[16], u32 b[16], u32 c[16], __local u32 (*d)[256], __local u32 (*e)[256]) {
  a[0] ^= 0x36363636;
  a[1] ^= 0x36363636;
  a[2] ^= 0x36363636;
  a[3] ^= 0x36363636;
  a[4] ^= 0x36363636;
  a[5] ^= 0x36363636;
  a[6] ^= 0x36363636;
  a[7] ^= 0x36363636;
  a[8] ^= 0x36363636;
  a[9] ^= 0x36363636;
  a[10] ^= 0x36363636;
  a[11] ^= 0x36363636;
  a[12] ^= 0x36363636;
  a[13] ^= 0x36363636;
  a[14] ^= 0x36363636;
  a[15] ^= 0x36363636;

  b[0] = 0;
  b[1] = 0;
  b[2] = 0;
  b[3] = 0;
  b[4] = 0;
  b[5] = 0;
  b[6] = 0;
  b[7] = 0;
  b[8] = 0;
  b[9] = 0;
  b[10] = 0;
  b[11] = 0;
  b[12] = 0;
  b[13] = 0;
  b[14] = 0;
  b[15] = 0;

  CL(a, b, d, e);

  a[0] ^= 0x6a6a6a6a;
  a[1] ^= 0x6a6a6a6a;
  a[2] ^= 0x6a6a6a6a;
  a[3] ^= 0x6a6a6a6a;
  a[4] ^= 0x6a6a6a6a;
  a[5] ^= 0x6a6a6a6a;
  a[6] ^= 0x6a6a6a6a;
  a[7] ^= 0x6a6a6a6a;
  a[8] ^= 0x6a6a6a6a;
  a[9] ^= 0x6a6a6a6a;
  a[10] ^= 0x6a6a6a6a;
  a[11] ^= 0x6a6a6a6a;
  a[12] ^= 0x6a6a6a6a;
  a[13] ^= 0x6a6a6a6a;
  a[14] ^= 0x6a6a6a6a;
  a[15] ^= 0x6a6a6a6a;

  c[0] = 0;
  c[1] = 0;
  c[2] = 0;
  c[3] = 0;
  c[4] = 0;
  c[5] = 0;
  c[6] = 0;
  c[7] = 0;
  c[8] = 0;
  c[9] = 0;
  c[10] = 0;
  c[11] = 0;
  c[12] = 0;
  c[13] = 0;
  c[14] = 0;
  c[15] = 0;

  CL(a, c, d, e);
}

u32 CO(const u32 a, const u32 b) {
  const u32 c = (a >> 0) & 0xff;
  const u32 d = (a >> 8) & 0xff;
  const u32 e = (a >> 16) & 0xff;
  const u32 f = (a >> 24) & 0xff;

  const u32 g = (b >> 0) & 0xff;
  const u32 h = (b >> 8) & 0xff;
  const u32 i = (b >> 16) & 0xff;
  const u32 j = (b >> 24) & 0xff;

  const u32 k = (c + g) & 0xff;
  const u32 l = (d + h) & 0xff;
  const u32 m = (e + i) & 0xff;
  const u32 n = (f + j) & 0xff;

  const u32 o = k << 0 | l << 8 | m << 16 | n << 24;

  return o;
}

__kernel void CP(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global tc_tmp_t* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global tc_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[8][256];
  __local u32 ak[8][256];

  for (u32 al = ah; al < 256; al += ai) {
    aj[0][al] = Gn[0][al];
    aj[1][al] = Gn[1][al];
    aj[2][al] = Gn[2][al];
    aj[3][al] = Gn[3][al];
    aj[4][al] = Gn[4][al];
    aj[5][al] = Gn[5][al];
    aj[6][al] = Gn[6][al];
    aj[7][al] = Gn[7][al];

    ak[0][al] = Go[0][al];
    ak[1][al] = Go[1][al];
    ak[2][al] = Go[2][al];
    ak[3][al] = Go[3][al];
    ak[4][al] = Go[4][al];
    ak[5][al] = Go[5][al];
    ak[6][al] = Go[6][al];
    ak[7][al] = Go[7][al];
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 am[4];

  am[0] = a[ag].i[0];
  am[1] = a[ag].i[1];
  am[2] = a[ag].i[2];
  am[3] = a[ag].i[3];

  u32 an[4];

  an[0] = a[ag].i[4];
  an[1] = a[ag].i[5];
  an[2] = a[ag].i[6];
  an[3] = a[ag].i[7];

  u32 ao[4];

  ao[0] = a[ag].i[8];
  ao[1] = a[ag].i[9];
  ao[2] = a[ag].i[10];
  ao[3] = a[ag].i[11];

  u32 ap[4];

  ap[0] = a[ag].i[12];
  ap[1] = a[ag].i[13];
  ap[2] = a[ag].i[14];
  ap[3] = a[ag].i[15];

  am[0] = CO(am[0], s[y].keyfile_buf[0]);
  am[1] = CO(am[1], s[y].keyfile_buf[1]);
  am[2] = CO(am[2], s[y].keyfile_buf[2]);
  am[3] = CO(am[3], s[y].keyfile_buf[3]);
  an[0] = CO(an[0], s[y].keyfile_buf[4]);
  an[1] = CO(an[1], s[y].keyfile_buf[5]);
  an[2] = CO(an[2], s[y].keyfile_buf[6]);
  an[3] = CO(an[3], s[y].keyfile_buf[7]);
  ao[0] = CO(ao[0], s[y].keyfile_buf[8]);
  ao[1] = CO(ao[1], s[y].keyfile_buf[9]);
  ao[2] = CO(ao[2], s[y].keyfile_buf[10]);
  ao[3] = CO(ao[3], s[y].keyfile_buf[11]);
  ap[0] = CO(ap[0], s[y].keyfile_buf[12]);
  ap[1] = CO(ap[1], s[y].keyfile_buf[13]);
  ap[2] = CO(ap[2], s[y].keyfile_buf[14]);
  ap[3] = CO(ap[3], s[y].keyfile_buf[15]);

  u32 aq[16];

  aq[0] = M(s[y].salt_buf[0]);
  aq[1] = M(s[y].salt_buf[1]);
  aq[2] = M(s[y].salt_buf[2]);
  aq[3] = M(s[y].salt_buf[3]);
  aq[4] = M(s[y].salt_buf[4]);
  aq[5] = M(s[y].salt_buf[5]);
  aq[6] = M(s[y].salt_buf[6]);
  aq[7] = M(s[y].salt_buf[7]);
  aq[8] = M(s[y].salt_buf[8]);
  aq[9] = M(s[y].salt_buf[9]);
  aq[10] = M(s[y].salt_buf[10]);
  aq[11] = M(s[y].salt_buf[11]);
  aq[12] = M(s[y].salt_buf[12]);
  aq[13] = M(s[y].salt_buf[13]);
  aq[14] = M(s[y].salt_buf[14]);
  aq[15] = M(s[y].salt_buf[15]);

  u32 ar[16];

  ar[0] = 0;
  ar[1] = 0x80000000;
  ar[2] = 0;
  ar[3] = 0;
  ar[4] = 0;
  ar[5] = 0;
  ar[6] = 0;
  ar[7] = 0;
  ar[8] = 0;
  ar[9] = 0;
  ar[10] = 0;
  ar[11] = 0;
  ar[12] = 0;
  ar[13] = 0;
  ar[14] = 0;
  ar[15] = (64 + 64 + 4) * 8;

  const u32 as = r[0].truecrypt_mdlen;

  u32 at[16];

  at[0] = M(am[0]);
  at[1] = M(am[1]);
  at[2] = M(am[2]);
  at[3] = M(am[3]);
  at[4] = M(an[0]);
  at[5] = M(an[1]);
  at[6] = M(an[2]);
  at[7] = M(an[3]);
  at[8] = M(ao[0]);
  at[9] = M(ao[1]);
  at[10] = M(ao[2]);
  at[11] = M(ao[3]);
  at[12] = M(ap[0]);
  at[13] = M(ap[1]);
  at[14] = M(ap[2]);
  at[15] = M(ap[3]);

  u32 au[16];
  u32 av[16];

  CN(at, au, av, aj, ak);

  e[ag].ipad[0] = au[0];
  e[ag].ipad[1] = au[1];
  e[ag].ipad[2] = au[2];
  e[ag].ipad[3] = au[3];
  e[ag].ipad[4] = au[4];
  e[ag].ipad[5] = au[5];
  e[ag].ipad[6] = au[6];
  e[ag].ipad[7] = au[7];
  e[ag].ipad[8] = au[8];
  e[ag].ipad[9] = au[9];
  e[ag].ipad[10] = au[10];
  e[ag].ipad[11] = au[11];
  e[ag].ipad[12] = au[12];
  e[ag].ipad[13] = au[13];
  e[ag].ipad[14] = au[14];
  e[ag].ipad[15] = au[15];

  e[ag].opad[0] = av[0];
  e[ag].opad[1] = av[1];
  e[ag].opad[2] = av[2];
  e[ag].opad[3] = av[3];
  e[ag].opad[4] = av[4];
  e[ag].opad[5] = av[5];
  e[ag].opad[6] = av[6];
  e[ag].opad[7] = av[7];
  e[ag].opad[8] = av[8];
  e[ag].opad[9] = av[9];
  e[ag].opad[10] = av[10];
  e[ag].opad[11] = av[11];
  e[ag].opad[12] = av[12];
  e[ag].opad[13] = av[13];
  e[ag].opad[14] = av[14];
  e[ag].opad[15] = av[15];

  for (u32 al = 0, aw = 1; al < (as / 8 / 4); al += 16, aw += 1) {
    ar[0] = aw;

    u32 ax[16];

    CM(aq, ar, au, av, ax, aj, ak);

    e[ag].dgst[al + 0] = ax[0];
    e[ag].dgst[al + 1] = ax[1];
    e[ag].dgst[al + 2] = ax[2];
    e[ag].dgst[al + 3] = ax[3];
    e[ag].dgst[al + 4] = ax[4];
    e[ag].dgst[al + 5] = ax[5];
    e[ag].dgst[al + 6] = ax[6];
    e[ag].dgst[al + 7] = ax[7];
    e[ag].dgst[al + 8] = ax[8];
    e[ag].dgst[al + 9] = ax[9];
    e[ag].dgst[al + 10] = ax[10];
    e[ag].dgst[al + 11] = ax[11];
    e[ag].dgst[al + 12] = ax[12];
    e[ag].dgst[al + 13] = ax[13];
    e[ag].dgst[al + 14] = ax[14];
    e[ag].dgst[al + 15] = ax[15];

    e[ag].out[al + 0] = ax[0];
    e[ag].out[al + 1] = ax[1];
    e[ag].out[al + 2] = ax[2];
    e[ag].out[al + 3] = ax[3];
    e[ag].out[al + 4] = ax[4];
    e[ag].out[al + 5] = ax[5];
    e[ag].out[al + 6] = ax[6];
    e[ag].out[al + 7] = ax[7];
    e[ag].out[al + 8] = ax[8];
    e[ag].out[al + 9] = ax[9];
    e[ag].out[al + 10] = ax[10];
    e[ag].out[al + 11] = ax[11];
    e[ag].out[al + 12] = ax[12];
    e[ag].out[al + 13] = ax[13];
    e[ag].out[al + 14] = ax[14];
    e[ag].out[al + 15] = ax[15];
  }
}

__kernel void CQ(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global tc_tmp_t* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global tc_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[8][256];
  __local u32 ak[8][256];

  for (u32 al = ah; al < 256; al += ai) {
    aj[0][al] = Gn[0][al];
    aj[1][al] = Gn[1][al];
    aj[2][al] = Gn[2][al];
    aj[3][al] = Gn[3][al];
    aj[4][al] = Gn[4][al];
    aj[5][al] = Gn[5][al];
    aj[6][al] = Gn[6][al];
    aj[7][al] = Gn[7][al];

    ak[0][al] = Go[0][al];
    ak[1][al] = Go[1][al];
    ak[2][al] = Go[2][al];
    ak[3][al] = Go[3][al];
    ak[4][al] = Go[4][al];
    ak[5][al] = Go[5][al];
    ak[6][al] = Go[6][al];
    ak[7][al] = Go[7][al];
  }

  barrier(1);

  if (ag >= af)
    return;

  const u32 am = r[0].truecrypt_mdlen;

  u32 an[16];

  an[0] = e[ag].ipad[0];
  an[1] = e[ag].ipad[1], an[2] = e[ag].ipad[2];
  an[3] = e[ag].ipad[3];
  an[4] = e[ag].ipad[4];
  an[5] = e[ag].ipad[5];
  an[6] = e[ag].ipad[6], an[7] = e[ag].ipad[7];
  an[8] = e[ag].ipad[8];
  an[9] = e[ag].ipad[9];
  an[10] = e[ag].ipad[10];
  an[11] = e[ag].ipad[11], an[12] = e[ag].ipad[12];
  an[13] = e[ag].ipad[13];
  an[14] = e[ag].ipad[14];
  an[15] = e[ag].ipad[15];

  u32 ao[16];

  ao[0] = e[ag].opad[0];
  ao[1] = e[ag].opad[1], ao[2] = e[ag].opad[2];
  ao[3] = e[ag].opad[3];
  ao[4] = e[ag].opad[4];
  ao[5] = e[ag].opad[5];
  ao[6] = e[ag].opad[6], ao[7] = e[ag].opad[7];
  ao[8] = e[ag].opad[8];
  ao[9] = e[ag].opad[9];
  ao[10] = e[ag].opad[10];
  ao[11] = e[ag].opad[11], ao[12] = e[ag].opad[12];
  ao[13] = e[ag].opad[13];
  ao[14] = e[ag].opad[14];
  ao[15] = e[ag].opad[15];

  for (u32 al = 0; al < (am / 8 / 4); al += 16) {
    u32 ap[16];

    ap[0] = e[ag].dgst[al + 0];
    ap[1] = e[ag].dgst[al + 1];
    ap[2] = e[ag].dgst[al + 2];
    ap[3] = e[ag].dgst[al + 3];
    ap[4] = e[ag].dgst[al + 4];
    ap[5] = e[ag].dgst[al + 5];
    ap[6] = e[ag].dgst[al + 6];
    ap[7] = e[ag].dgst[al + 7];
    ap[8] = e[ag].dgst[al + 8];
    ap[9] = e[ag].dgst[al + 9];
    ap[10] = e[ag].dgst[al + 10];
    ap[11] = e[ag].dgst[al + 11];
    ap[12] = e[ag].dgst[al + 12];
    ap[13] = e[ag].dgst[al + 13];
    ap[14] = e[ag].dgst[al + 14];
    ap[15] = e[ag].dgst[al + 15];

    u32 aq[16];

    aq[0] = e[ag].out[al + 0];
    aq[1] = e[ag].out[al + 1];
    aq[2] = e[ag].out[al + 2];
    aq[3] = e[ag].out[al + 3];
    aq[4] = e[ag].out[al + 4];
    aq[5] = e[ag].out[al + 5];
    aq[6] = e[ag].out[al + 6];
    aq[7] = e[ag].out[al + 7];
    aq[8] = e[ag].out[al + 8];
    aq[9] = e[ag].out[al + 9];
    aq[10] = e[ag].out[al + 10];
    aq[11] = e[ag].out[al + 11];
    aq[12] = e[ag].out[al + 12];
    aq[13] = e[ag].out[al + 13];
    aq[14] = e[ag].out[al + 14];
    aq[15] = e[ag].out[al + 15];

    for (u32 ar = 0; ar < aa; ar++) {
      u32 as[16];

      as[0] = ap[0];
      as[1] = ap[1];
      as[2] = ap[2];
      as[3] = ap[3];
      as[4] = ap[4];
      as[5] = ap[5];
      as[6] = ap[6];
      as[7] = ap[7];
      as[8] = ap[8];
      as[9] = ap[9];
      as[10] = ap[10];
      as[11] = ap[11];
      as[12] = ap[12];
      as[13] = ap[13];
      as[14] = ap[14];
      as[15] = ap[15];

      u32 at[16];

      at[0] = 0x80000000;
      at[1] = 0;
      at[2] = 0;
      at[3] = 0;
      at[4] = 0;
      at[5] = 0;
      at[6] = 0;
      at[7] = 0;
      at[8] = 0;
      at[9] = 0;
      at[10] = 0;
      at[11] = 0;
      at[12] = 0;
      at[13] = 0;
      at[14] = 0;
      at[15] = (64 + 64) * 8;

      CM(as, at, an, ao, ap, aj, ak);

      aq[0] ^= ap[0];
      aq[1] ^= ap[1];
      aq[2] ^= ap[2];
      aq[3] ^= ap[3];
      aq[4] ^= ap[4];
      aq[5] ^= ap[5];
      aq[6] ^= ap[6];
      aq[7] ^= ap[7];
      aq[8] ^= ap[8];
      aq[9] ^= ap[9];
      aq[10] ^= ap[10];
      aq[11] ^= ap[11];
      aq[12] ^= ap[12];
      aq[13] ^= ap[13];
      aq[14] ^= ap[14];
      aq[15] ^= ap[15];
    }

    e[ag].dgst[al + 0] = ap[0];
    e[ag].dgst[al + 1] = ap[1];
    e[ag].dgst[al + 2] = ap[2];
    e[ag].dgst[al + 3] = ap[3];
    e[ag].dgst[al + 4] = ap[4];
    e[ag].dgst[al + 5] = ap[5];
    e[ag].dgst[al + 6] = ap[6];
    e[ag].dgst[al + 7] = ap[7];
    e[ag].dgst[al + 8] = ap[8];
    e[ag].dgst[al + 9] = ap[9];
    e[ag].dgst[al + 10] = ap[10];
    e[ag].dgst[al + 11] = ap[11];
    e[ag].dgst[al + 12] = ap[12];
    e[ag].dgst[al + 13] = ap[13];
    e[ag].dgst[al + 14] = ap[14];
    e[ag].dgst[al + 15] = ap[15];

    e[ag].out[al + 0] = aq[0];
    e[ag].out[al + 1] = aq[1];
    e[ag].out[al + 2] = aq[2];
    e[ag].out[al + 3] = aq[3];
    e[ag].out[al + 4] = aq[4];
    e[ag].out[al + 5] = aq[5];
    e[ag].out[al + 6] = aq[6];
    e[ag].out[al + 7] = aq[7];
    e[ag].out[al + 8] = aq[8];
    e[ag].out[al + 9] = aq[9];
    e[ag].out[al + 10] = aq[10];
    e[ag].out[al + 11] = aq[11];
    e[ag].out[al + 12] = aq[12];
    e[ag].out[al + 13] = aq[13];
    e[ag].out[al + 14] = aq[14];
    e[ag].out[al + 15] = aq[15];
  }
}

__kernel void CR(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global tc_tmp_t* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global tc_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);

  if (ag >= af)
    return;

  u32 ai[8];

  ai[0] = M(e[ag].out[0]);
  ai[1] = M(e[ag].out[1]);
  ai[2] = M(e[ag].out[2]);
  ai[3] = M(e[ag].out[3]);
  ai[4] = M(e[ag].out[4]);
  ai[5] = M(e[ag].out[5]);
  ai[6] = M(e[ag].out[6]);
  ai[7] = M(e[ag].out[7]);

  u32 aj[8];

  aj[0] = M(e[ag].out[8]);
  aj[1] = M(e[ag].out[9]);
  aj[2] = M(e[ag].out[10]);
  aj[3] = M(e[ag].out[11]);
  aj[4] = M(e[ag].out[12]);
  aj[5] = M(e[ag].out[13]);
  aj[6] = M(e[ag].out[14]);
  aj[7] = M(e[ag].out[15]);

  u32 ak[4];

  ak[0] = s[0].data_buf[0];
  ak[1] = s[0].data_buf[1];
  ak[2] = s[0].data_buf[2];
  ak[3] = s[0].data_buf[3];

  const u32 al = s[0].signature;

  u32 am[4];

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CA(ai, aj, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CK(ai, aj, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CG(ai, aj, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  u32 an[8];

  an[0] = M(e[ag].out[16]);
  an[1] = M(e[ag].out[17]);
  an[2] = M(e[ag].out[18]);
  an[3] = M(e[ag].out[19]);
  an[4] = M(e[ag].out[20]);
  an[5] = M(e[ag].out[21]);
  an[6] = M(e[ag].out[22]);
  an[7] = M(e[ag].out[23]);

  u32 ao[8];

  ao[0] = M(e[ag].out[24]);
  ao[1] = M(e[ag].out[25]);
  ao[2] = M(e[ag].out[26]);
  ao[3] = M(e[ag].out[27]);
  ao[4] = M(e[ag].out[28]);
  ao[5] = M(e[ag].out[29]);
  ao[6] = M(e[ag].out[30]);
  ao[7] = M(e[ag].out[31]);

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CA(aj, ao, am, am);
    CG(ai, an, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CK(aj, ao, am, am);
    CA(ai, an, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CG(aj, ao, am, am);
    CK(ai, an, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  u32 ap[8];

  ap[0] = M(e[ag].out[32]);
  ap[1] = M(e[ag].out[33]);
  ap[2] = M(e[ag].out[34]);
  ap[3] = M(e[ag].out[35]);
  ap[4] = M(e[ag].out[36]);
  ap[5] = M(e[ag].out[37]);
  ap[6] = M(e[ag].out[38]);
  ap[7] = M(e[ag].out[39]);

  u32 aq[8];

  aq[0] = M(e[ag].out[40]);
  aq[1] = M(e[ag].out[41]);
  aq[2] = M(e[ag].out[42]);
  aq[3] = M(e[ag].out[43]);
  aq[4] = M(e[ag].out[44]);
  aq[5] = M(e[ag].out[45]);
  aq[6] = M(e[ag].out[46]);
  aq[7] = M(e[ag].out[47]);

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CA(an, aq, am, am);
    CG(aj, ap, am, am);
    CK(ai, ao, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }

  {
    am[0] = ak[0];
    am[1] = ak[1];
    am[2] = ak[2];
    am[3] = ak[3];

    CK(an, aq, am, am);
    CG(aj, ap, am, am);
    CA(ai, ao, am, am);

    if (((am[0] == al) && (am[3] == 0)) || ((am[0] == al) && ((am[1] >> 16) <= 5))) {
      AA(o, t, y, 0, 0, ag, 0);
    }
  }
}