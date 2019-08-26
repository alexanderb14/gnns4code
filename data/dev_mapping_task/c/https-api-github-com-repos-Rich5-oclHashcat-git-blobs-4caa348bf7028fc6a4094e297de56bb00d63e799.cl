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

typedef struct { u32 digest_buf[4]; } digest_t;

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
  if (a[3] > b[1])
    return (1);
  if (a[3] < b[1])
    return (-1);
  if (a[2] > b[2])
    return (1);
  if (a[2] < b[2])
    return (-1);
  if (a[1] > b[3])
    return (1);
  if (a[1] < b[3])
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
inline u32x BU(__global bf_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].i);
  return c;
}

inline u32x BV(__global comb_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].pw_len);
  return c;
}

inline u32x BW(__global comb_t* a, const u32 b, const int c) {
  const u32x d = (u32x)(a[b + 0].i[c]);
  return d;
}
u32 BX(u32x a[16], u32x b[16], const u32 c, const u32x d[4], const u32x e[4], const u32x f[4], const u32x g[4], const u32 h) {
  const u32 i = c & 3;
  const u32 j = c / 4;

  const int k = 4 - i;

  u32x l[4];

  l[0] = U(d[0], 0, k);
  l[1] = U(d[1], d[0], k);
  l[2] = U(d[2], d[1], k);
  l[3] = U(d[3], d[2], k);

  u32x m[4];

  m[0] = U(e[0], d[3], k);
  m[1] = U(e[1], e[0], k);
  m[2] = U(e[2], e[1], k);
  m[3] = U(e[3], e[2], k);

  u32x n[4];

  n[0] = U(f[0], e[3], k);
  n[1] = U(f[1], f[0], k);
  n[2] = U(f[2], f[1], k);
  n[3] = U(f[3], f[2], k);

  u32x o[4];

  o[0] = U(g[0], f[3], k);
  o[1] = U(g[1], g[0], k);
  o[2] = U(g[2], g[1], k);
  o[3] = U(g[3], g[2], k);

  u32x p[4];

  p[0] = U(0, g[3], k);
  p[1] = 0;
  p[2] = 0;
  p[3] = 0;

  if (i == 0) {
    l[0] = d[0];
    l[1] = d[1];
    l[2] = d[2];
    l[3] = d[3];

    m[0] = e[0];
    m[1] = e[1];
    m[2] = e[2];
    m[3] = e[3];

    n[0] = f[0];
    n[1] = f[1];
    n[2] = f[2];
    n[3] = f[3];

    o[0] = g[0];
    o[1] = g[1];
    o[2] = g[2];
    o[3] = g[3];

    p[0] = 0;
    p[1] = 0;
    p[2] = 0;
    p[3] = 0;
  }
  switch (j) {
    case 0:
      a[0] |= l[0];
      a[1] = l[1];
      a[2] = l[2];
      a[3] = l[3];

      a[4] = m[0];
      a[5] = m[1];
      a[6] = m[2];
      a[7] = m[3];

      a[8] = n[0];
      a[9] = n[1];
      a[10] = n[2];
      a[11] = n[3];

      a[12] = o[0];
      a[13] = o[1];
      a[14] = o[2];
      a[15] = o[3];

      b[0] = p[0];
      b[1] = p[1];
      b[2] = p[2];
      b[3] = p[3];
      break;

    case 1:
      a[1] |= l[0];
      a[2] = l[1];
      a[3] = l[2];
      a[4] = l[3];

      a[5] = m[0];
      a[6] = m[1];
      a[7] = m[2];
      a[8] = m[3];

      a[9] = n[0];
      a[10] = n[1];
      a[11] = n[2];
      a[12] = n[3];

      a[13] = o[0];
      a[14] = o[1];
      a[15] = o[2];
      b[0] = o[3];

      b[1] = p[0];
      b[2] = p[1];
      b[3] = p[2];
      b[4] = p[3];
      break;

    case 2:
      a[2] |= l[0];
      a[3] = l[1];
      a[4] = l[2];
      a[5] = l[3];

      a[6] = m[0];
      a[7] = m[1];
      a[8] = m[2];
      a[9] = m[3];

      a[10] = n[0];
      a[11] = n[1];
      a[12] = n[2];
      a[13] = n[3];

      a[14] = o[0];
      a[15] = o[1];
      b[0] = o[2];
      b[1] = o[3];

      b[2] = p[0];
      b[3] = p[1];
      b[4] = p[2];
      b[5] = p[3];
      break;

    case 3:
      a[3] |= l[0];
      a[4] = l[1];
      a[5] = l[2];
      a[6] = l[3];

      a[7] = m[0];
      a[8] = m[1];
      a[9] = m[2];
      a[10] = m[3];

      a[11] = n[0];
      a[12] = n[1];
      a[13] = n[2];
      a[14] = n[3];

      a[15] = o[0];
      b[0] = o[1];
      b[1] = o[2];
      b[2] = o[3];

      b[3] = p[0];
      b[4] = p[1];
      b[5] = p[2];
      b[6] = p[3];
      break;

    case 4:
      a[4] |= l[0];
      a[5] = l[1];
      a[6] = l[2];
      a[7] = l[3];

      a[8] = m[0];
      a[9] = m[1];
      a[10] = m[2];
      a[11] = m[3];

      a[12] = n[0];
      a[13] = n[1];
      a[14] = n[2];
      a[15] = n[3];

      b[0] = o[0];
      b[1] = o[1];
      b[2] = o[2];
      b[3] = o[3];

      b[4] = p[0];
      b[5] = p[1];
      b[6] = p[2];
      b[7] = p[3];
      break;

    case 5:
      a[5] |= l[0];
      a[6] = l[1];
      a[7] = l[2];
      a[8] = l[3];

      a[9] = m[0];
      a[10] = m[1];
      a[11] = m[2];
      a[12] = m[3];

      a[13] = n[0];
      a[14] = n[1];
      a[15] = n[2];
      b[0] = n[3];

      b[1] = o[0];
      b[2] = o[1];
      b[3] = o[2];
      b[4] = o[3];

      b[5] = p[0];
      b[6] = p[1];
      b[7] = p[2];
      b[8] = p[3];
      break;

    case 6:
      a[6] |= l[0];
      a[7] = l[1];
      a[8] = l[2];
      a[9] = l[3];

      a[10] = m[0];
      a[11] = m[1];
      a[12] = m[2];
      a[13] = m[3];

      a[14] = n[0];
      a[15] = n[1];
      b[0] = n[2];
      b[1] = n[3];

      b[2] = o[0];
      b[3] = o[1];
      b[4] = o[2];
      b[5] = o[3];

      b[6] = p[0];
      b[7] = p[1];
      b[8] = p[2];
      b[9] = p[3];
      break;

    case 7:
      a[7] |= l[0];
      a[8] = l[1];
      a[9] = l[2];
      a[10] = l[3];

      a[11] = m[0];
      a[12] = m[1];
      a[13] = m[2];
      a[14] = m[3];

      a[15] = n[0];
      b[0] = n[1];
      b[1] = n[2];
      b[2] = n[3];

      b[3] = o[0];
      b[4] = o[1];
      b[5] = o[2];
      b[6] = o[3];

      b[7] = p[0];
      b[8] = p[1];
      b[9] = p[2];
      b[10] = p[3];
      break;

    case 8:
      a[8] |= l[0];
      a[9] = l[1];
      a[10] = l[2];
      a[11] = l[3];

      a[12] = m[0];
      a[13] = m[1];
      a[14] = m[2];
      a[15] = m[3];

      b[0] = n[0];
      b[1] = n[1];
      b[2] = n[2];
      b[3] = n[3];

      b[4] = o[0];
      b[5] = o[1];
      b[6] = o[2];
      b[7] = o[3];

      b[8] = p[0];
      b[9] = p[1];
      b[10] = p[2];
      b[11] = p[3];
      break;

    case 9:
      a[9] |= l[0];
      a[10] = l[1];
      a[11] = l[2];
      a[12] = l[3];

      a[13] = m[0];
      a[14] = m[1];
      a[15] = m[2];
      b[0] = m[3];

      b[1] = n[0];
      b[2] = n[1];
      b[3] = n[2];
      b[4] = n[3];

      b[5] = o[0];
      b[6] = o[1];
      b[7] = o[2];
      b[8] = o[3];

      b[9] = p[0];
      b[10] = p[1];
      b[11] = p[2];
      b[12] = p[3];
      break;

    case 10:
      a[10] |= l[0];
      a[11] = l[1];
      a[12] = l[2];
      a[13] = l[3];

      a[14] = m[0];
      a[15] = m[1];
      b[0] = m[2];
      b[1] = m[3];

      b[2] = n[0];
      b[3] = n[1];
      b[4] = n[2];
      b[5] = n[3];

      b[6] = o[0];
      b[7] = o[1];
      b[8] = o[2];
      b[9] = o[3];

      b[10] = p[0];
      b[11] = p[1];
      b[12] = p[2];
      b[13] = p[3];
      break;

    case 11:
      a[11] |= l[0];
      a[12] = l[1];
      a[13] = l[2];
      a[14] = l[3];

      a[15] = m[0];
      b[0] = m[1];
      b[1] = m[2];
      b[2] = m[3];

      b[3] = n[0];
      b[4] = n[1];
      b[5] = n[2];
      b[6] = n[3];

      b[7] = o[0];
      b[8] = o[1];
      b[9] = o[2];
      b[10] = o[3];

      b[11] = p[0];
      b[12] = p[1];
      b[13] = p[2];
      b[14] = p[3];
      break;

    case 12:
      a[12] |= l[0];
      a[13] = l[1];
      a[14] = l[2];
      a[15] = l[3];

      b[0] = m[0];
      b[1] = m[1];
      b[2] = m[2];
      b[3] = m[3];

      b[4] = n[0];
      b[5] = n[1];
      b[6] = n[2];
      b[7] = n[3];

      b[8] = o[0];
      b[9] = o[1];
      b[10] = o[2];
      b[11] = o[3];

      b[12] = p[0];
      b[13] = p[1];
      b[14] = p[2];
      b[15] = p[3];
      break;

    case 13:
      a[13] |= l[0];
      a[14] = l[1];
      a[15] = l[2];
      b[0] = l[3];

      b[1] = m[0];
      b[2] = m[1];
      b[3] = m[2];
      b[4] = m[3];

      b[5] = n[0];
      b[6] = n[1];
      b[7] = n[2];
      b[8] = n[3];

      b[9] = o[0];
      b[10] = o[1];
      b[11] = o[2];
      b[12] = o[3];

      b[13] = p[0];
      b[14] = p[1];
      b[15] = p[2];
      break;

    case 14:
      a[14] |= l[0];
      a[15] = l[1];
      b[0] = l[2];
      b[1] = l[3];

      b[2] = m[0];
      b[3] = m[1];
      b[4] = m[2];
      b[5] = m[3];

      b[6] = n[0];
      b[7] = n[1];
      b[8] = n[2];
      b[9] = n[3];

      b[10] = o[0];
      b[11] = o[1];
      b[12] = o[2];
      b[13] = o[3];

      b[14] = p[0];
      b[15] = p[1];
      break;

    case 15:
      a[15] |= l[0];
      b[0] = l[1];
      b[1] = l[2];
      b[2] = l[3];

      b[3] = m[1];
      b[4] = m[2];
      b[5] = m[3];
      b[6] = m[0];

      b[7] = n[0];
      b[8] = n[1];
      b[9] = n[2];
      b[10] = n[3];

      b[11] = o[0];
      b[12] = o[1];
      b[13] = o[2];
      b[14] = o[3];

      b[15] = p[0];
      break;

    case 16:
      b[0] |= l[0];
      b[1] = l[1];
      b[2] = l[2];
      b[3] = l[3];

      b[4] = m[0];
      b[5] = m[1];
      b[6] = m[2];
      b[7] = m[3];

      b[8] = n[0];
      b[9] = n[1];
      b[10] = n[2];
      b[11] = n[3];

      b[12] = o[0];
      b[13] = o[1];
      b[14] = o[2];
      b[15] = o[3];
      break;

    case 17:
      b[1] |= l[0];
      b[2] = l[1];
      b[3] = l[2];
      b[4] = l[3];

      b[5] = m[0];
      b[6] = m[1];
      b[7] = m[2];
      b[8] = m[3];

      b[9] = n[0];
      b[10] = n[1];
      b[11] = n[2];
      b[12] = n[3];

      b[13] = o[0];
      b[14] = o[1];
      b[15] = o[2];
      break;

    case 18:
      b[2] |= l[0];
      b[3] = l[1];
      b[4] = l[2];
      b[5] = l[3];

      b[6] = m[0];
      b[7] = m[1];
      b[8] = m[2];
      b[9] = m[3];

      b[10] = n[0];
      b[11] = n[1];
      b[12] = n[2];
      b[13] = n[3];

      b[14] = o[0];
      b[15] = o[1];
      break;

    case 19:
      b[3] |= l[0];
      b[4] = l[1];
      b[5] = l[2];
      b[6] = l[3];

      b[7] = m[0];
      b[8] = m[1];
      b[9] = m[2];
      b[10] = m[3];

      b[11] = n[0];
      b[12] = n[1];
      b[13] = n[2];
      b[14] = n[3];

      b[15] = o[0];
      break;

    case 20:
      b[4] |= l[0];
      b[5] = l[1];
      b[6] = l[2];
      b[7] = l[3];

      b[8] = m[0];
      b[9] = m[1];
      b[10] = m[2];
      b[11] = m[3];

      b[12] = n[0];
      b[13] = n[1];
      b[14] = n[2];
      b[15] = n[3];
      break;

    case 21:
      b[5] |= l[0];
      b[6] = l[1];
      b[7] = l[2];
      b[8] = l[3];

      b[9] = m[0];
      b[10] = m[1];
      b[11] = m[2];
      b[12] = m[3];

      b[13] = n[0];
      b[14] = n[1];
      b[15] = n[2];
      break;

    case 22:
      b[6] |= l[0];
      b[7] = l[1];
      b[8] = l[2];
      b[9] = l[3];

      b[10] = m[0];
      b[11] = m[1];
      b[12] = m[2];
      b[13] = m[3];

      b[14] = n[0];
      b[15] = n[1];
      break;

    case 23:
      b[7] |= l[0];
      b[8] = l[1];
      b[9] = l[2];
      b[10] = l[3];

      b[11] = m[0];
      b[12] = m[1];
      b[13] = m[2];
      b[14] = m[3];

      b[15] = n[0];
      break;

    case 24:
      b[8] |= l[0];
      b[9] = l[1];
      b[10] = l[2];
      b[11] = l[3];

      b[12] = m[0];
      b[13] = m[1];
      b[14] = m[2];
      b[15] = m[3];
      break;

    case 25:
      b[9] |= l[0];
      b[10] = l[1];
      b[11] = l[2];
      b[12] = l[3];

      b[13] = m[0];
      b[14] = m[1];
      b[15] = m[2];
      break;

    case 26:
      b[10] |= l[0];
      b[11] = l[1];
      b[12] = l[2];
      b[13] = l[3];

      b[14] = m[0];
      b[15] = m[1];
      break;

    case 27:
      b[11] |= l[0];
      b[12] = l[1];
      b[13] = l[2];
      b[14] = l[3];

      b[15] = m[0];
      break;

    case 28:
      b[12] |= l[0];
      b[13] = l[1];
      b[14] = l[2];
      b[15] = l[3];
      break;

    case 29:
      b[13] |= l[0];
      b[14] = l[1];
      b[15] = l[2];
      break;

    case 30:
      b[14] |= l[0];
      b[15] = l[1];
      break;
  }

  u32 q = c + h;

  return q;
}

void BY(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am = x[ad].salt_len;

  const u32 an = am + e;

  u32 ao[16];
  u32 ap[16];

  ao[0] = x[ad].salt_buf[0];
  ao[1] = x[ad].salt_buf[1];
  ao[2] = x[ad].salt_buf[2];
  ao[3] = x[ad].salt_buf[3];
  ao[4] = x[ad].salt_buf[4];
  ao[5] = x[ad].salt_buf[5];
  ao[6] = x[ad].salt_buf[6];
  ao[7] = x[ad].salt_buf[7];
  ao[8] = x[ad].salt_buf[8];
  ao[9] = x[ad].salt_buf[9];
  ao[10] = x[ad].salt_buf[10];
  ao[11] = x[ad].salt_buf[11];
  ao[12] = x[ad].salt_buf[12];
  ao[13] = x[ad].salt_buf[13];
  ao[14] = x[ad].salt_buf[14];
  ao[15] = x[ad].salt_buf[15];
  ap[0] = x[ad].salt_buf[16];
  ap[1] = x[ad].salt_buf[17];
  ap[2] = x[ad].salt_buf[18];
  ap[3] = x[ad].salt_buf[19];
  ap[4] = x[ad].salt_buf[20];
  ap[5] = x[ad].salt_buf[21];
  ap[6] = x[ad].salt_buf[22];
  ap[7] = x[ad].salt_buf[23];
  ap[8] = x[ad].salt_buf[24];
  ap[9] = x[ad].salt_buf[25];
  ap[10] = x[ad].salt_buf[26];
  ap[11] = x[ad].salt_buf[27];
  ap[12] = x[ad].salt_buf[28];
  ap[13] = x[ad].salt_buf[29];
  ap[14] = 0;
  ap[15] = 0;

  const u32 aq = x[ad].esalt_len;

  u32 ar[16];
  u32 as[16];

  ar[0] = x[ad].esalt_buf[0];
  ar[1] = x[ad].esalt_buf[1];
  ar[2] = x[ad].esalt_buf[2];
  ar[3] = x[ad].esalt_buf[3];
  ar[4] = x[ad].esalt_buf[4];
  ar[5] = x[ad].esalt_buf[5];
  ar[6] = x[ad].esalt_buf[6];
  ar[7] = x[ad].esalt_buf[7];
  ar[8] = x[ad].esalt_buf[8];
  ar[9] = x[ad].esalt_buf[9];
  ar[10] = x[ad].esalt_buf[10];
  ar[11] = x[ad].esalt_buf[11];
  ar[12] = x[ad].esalt_buf[12];
  ar[13] = x[ad].esalt_buf[13];
  ar[14] = x[ad].esalt_buf[14];
  ar[15] = x[ad].esalt_buf[15];
  as[0] = x[ad].esalt_buf[16];
  as[1] = x[ad].esalt_buf[17];
  as[2] = x[ad].esalt_buf[18];
  as[3] = x[ad].esalt_buf[19];
  as[4] = x[ad].esalt_buf[20];
  as[5] = x[ad].esalt_buf[21];
  as[6] = x[ad].esalt_buf[22];
  as[7] = x[ad].esalt_buf[23];
  as[8] = x[ad].esalt_buf[24];
  as[9] = x[ad].esalt_buf[25];
  as[10] = x[ad].esalt_buf[26];
  as[11] = x[ad].esalt_buf[27];
  as[12] = x[ad].esalt_buf[28];
  as[13] = x[ad].esalt_buf[29];
  as[14] = x[ad].esalt_buf[30];
  as[15] = x[ad].esalt_buf[31];

  const u32 at = 32 + aq;

  u32 au = a[0];

  for (u32 av = 0; av < ag; av += 1) {
    const u32x aw = BU(i, av);

    const u32x ax = au | aw;

    u32x ay[16];
    u32x az[16];

    ay[0] = ao[0];
    ay[1] = ao[1];
    ay[2] = ao[2];
    ay[3] = ao[3];
    ay[4] = ao[4];
    ay[5] = ao[5];
    ay[6] = ao[6];
    ay[7] = ao[7];
    ay[8] = ao[8];
    ay[9] = ao[9];
    ay[10] = ao[10];
    ay[11] = ao[11];
    ay[12] = ao[12];
    ay[13] = ao[13];
    ay[14] = ao[14];
    ay[15] = ao[15];
    az[0] = ap[0];
    az[1] = ap[1];
    az[2] = ap[2];
    az[3] = ap[3];
    az[4] = ap[4];
    az[5] = ap[5];
    az[6] = ap[6];
    az[7] = ap[7];
    az[8] = ap[8];
    az[9] = ap[9];
    az[10] = ap[10];
    az[11] = ap[11];
    az[12] = ap[12];
    az[13] = ap[13];
    az[14] = ap[14];
    az[15] = ap[15];

    u32x ba[4];
    u32x bb[4];
    u32x bc[4];
    u32x bd[4];

    ba[0] = ax;
    ba[1] = a[1];
    ba[2] = a[2];
    ba[3] = a[3];
    bb[0] = b[0];
    bb[1] = b[1];
    bb[2] = b[2];
    bb[3] = b[3];
    bc[0] = c[0];
    bc[1] = c[1];
    bc[2] = c[2];
    bc[3] = c[3];
    bd[0] = d[0];
    bd[1] = d[1];
    bd[2] = d[2];
    bd[3] = d[3];

    BX(ay, az, am, ba, bb, bc, bd, e);

    ba[0] = ay[0];
    ba[1] = ay[1];
    ba[2] = ay[2];
    ba[3] = ay[3];
    bb[0] = ay[4];
    bb[1] = ay[5];
    bb[2] = ay[6];
    bb[3] = ay[7];
    bc[0] = ay[8];
    bc[1] = ay[9];
    bc[2] = ay[10];
    bc[3] = ay[11];
    bd[0] = ay[12];
    bd[1] = ay[13];
    bd[2] = an * 8;
    bd[3] = 0;

    u32x be = 0x67452301u;
    u32x bf = 0xefcdab89u;
    u32x bg = 0x98badcfeu;
    u32x bh = 0x10325476u;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += 0x67452301u;
    bf += 0xefcdab89u;
    bg += 0x98badcfeu;
    bh += 0x10325476u;

    ba[0] = (u32x)(aj[((be >> 0) & 255)]) << 0 | (u32x)(aj[((be >> 8) & 255)]) << 16;
    ba[1] = (u32x)(aj[((be >> 16) & 255)]) << 0 | (u32x)(aj[((be >> 24) & 255)]) << 16;
    ba[2] = (u32x)(aj[((bf >> 0) & 255)]) << 0 | (u32x)(aj[((bf >> 8) & 255)]) << 16;
    ba[3] = (u32x)(aj[((bf >> 16) & 255)]) << 0 | (u32x)(aj[((bf >> 24) & 255)]) << 16;
    bb[0] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
    bb[1] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
    bb[2] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
    bb[3] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
    bc[0] = ar[0];
    bc[1] = ar[1];
    bc[2] = ar[2];
    bc[3] = ar[3];
    bd[0] = ar[4];
    bd[1] = ar[5];
    bd[2] = ar[6];
    bd[3] = ar[7];

    be = 0x67452301u;
    bf = 0xefcdab89u;
    bg = 0x98badcfeu;
    bh = 0x10325476u;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += 0x67452301u;
    bf += 0xefcdab89u;
    bg += 0x98badcfeu;
    bh += 0x10325476u;

    u32x bi = be;
    u32x bj = bf;
    u32x bk = bg;
    u32x bl = bh;

    ba[0] = ar[8];
    ba[1] = ar[9];
    ba[2] = ar[10];
    ba[3] = ar[11];
    bb[0] = ar[12];
    bb[1] = ar[13];
    bb[2] = ar[14];
    bb[3] = ar[15];
    bc[0] = as[0];
    bc[1] = as[1];
    bc[2] = as[2];
    bc[3] = as[3];
    bd[0] = as[4];
    bd[1] = as[5];
    bd[2] = at * 8;
    bd[3] = 0;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += bi;
    bf += bj;
    bg += bk;
    bh += bl;

    {
      const u32 bm[4] = {bee, bhh, bgg, bff};
      if (Z(bm, l, m, n, o, p, q, r, s, aa, ab, ac)) {
        int bn = X(bm, ah, &u[ai]);
        if (bn != -1) {
          const u32 bo = ai + bn;
          if (atomic_add(&v[bo], 1) == 0) {
            AA(t, y, ad, bn, bo, ak, av);
          }
        }
      }
    };
  }
}

void BZ(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am = x[ad].salt_len;

  const u32 an = am + e;

  u32 ao[16];
  u32 ap[16];

  ao[0] = x[ad].salt_buf[0];
  ao[1] = x[ad].salt_buf[1];
  ao[2] = x[ad].salt_buf[2];
  ao[3] = x[ad].salt_buf[3];
  ao[4] = x[ad].salt_buf[4];
  ao[5] = x[ad].salt_buf[5];
  ao[6] = x[ad].salt_buf[6];
  ao[7] = x[ad].salt_buf[7];
  ao[8] = x[ad].salt_buf[8];
  ao[9] = x[ad].salt_buf[9];
  ao[10] = x[ad].salt_buf[10];
  ao[11] = x[ad].salt_buf[11];
  ao[12] = x[ad].salt_buf[12];
  ao[13] = x[ad].salt_buf[13];
  ao[14] = x[ad].salt_buf[14];
  ao[15] = x[ad].salt_buf[15];
  ap[0] = x[ad].salt_buf[16];
  ap[1] = x[ad].salt_buf[17];
  ap[2] = x[ad].salt_buf[18];
  ap[3] = x[ad].salt_buf[19];
  ap[4] = x[ad].salt_buf[20];
  ap[5] = x[ad].salt_buf[21];
  ap[6] = x[ad].salt_buf[22];
  ap[7] = x[ad].salt_buf[23];
  ap[8] = x[ad].salt_buf[24];
  ap[9] = x[ad].salt_buf[25];
  ap[10] = x[ad].salt_buf[26];
  ap[11] = x[ad].salt_buf[27];
  ap[12] = x[ad].salt_buf[28];
  ap[13] = x[ad].salt_buf[29];
  ap[14] = 0;
  ap[15] = 0;

  const u32 aq = x[ad].esalt_len;

  u32 ar[16];
  u32 as[16];
  u32 at[16];

  ar[0] = x[ad].esalt_buf[0];
  ar[1] = x[ad].esalt_buf[1];
  ar[2] = x[ad].esalt_buf[2];
  ar[3] = x[ad].esalt_buf[3];
  ar[4] = x[ad].esalt_buf[4];
  ar[5] = x[ad].esalt_buf[5];
  ar[6] = x[ad].esalt_buf[6];
  ar[7] = x[ad].esalt_buf[7];
  ar[8] = x[ad].esalt_buf[8];
  ar[9] = x[ad].esalt_buf[9];
  ar[10] = x[ad].esalt_buf[10];
  ar[11] = x[ad].esalt_buf[11];
  ar[12] = x[ad].esalt_buf[12];
  ar[13] = x[ad].esalt_buf[13];
  ar[14] = x[ad].esalt_buf[14];
  ar[15] = x[ad].esalt_buf[15];
  as[0] = x[ad].esalt_buf[16];
  as[1] = x[ad].esalt_buf[17];
  as[2] = x[ad].esalt_buf[18];
  as[3] = x[ad].esalt_buf[19];
  as[4] = x[ad].esalt_buf[20];
  as[5] = x[ad].esalt_buf[21];
  as[6] = x[ad].esalt_buf[22];
  as[7] = x[ad].esalt_buf[23];
  as[8] = x[ad].esalt_buf[24];
  as[9] = x[ad].esalt_buf[25];
  as[10] = x[ad].esalt_buf[26];
  as[11] = x[ad].esalt_buf[27];
  as[12] = x[ad].esalt_buf[28];
  as[13] = x[ad].esalt_buf[29];
  as[14] = x[ad].esalt_buf[30];
  as[15] = x[ad].esalt_buf[31];
  at[0] = x[ad].esalt_buf[32];
  at[1] = x[ad].esalt_buf[33];
  at[2] = x[ad].esalt_buf[34];
  at[3] = x[ad].esalt_buf[35];
  at[4] = x[ad].esalt_buf[36];
  at[5] = x[ad].esalt_buf[37];
  at[6] = 0;
  at[7] = 0;
  at[8] = 0;
  at[9] = 0;
  at[10] = 0;
  at[11] = 0;
  at[12] = 0;
  at[13] = 0;
  at[14] = 0;
  at[15] = 0;

  const u32 au = 32 + aq;

  u32 av = a[0];

  for (u32 aw = 0; aw < ag; aw += 1) {
    const u32x ax = BU(i, aw);

    const u32x ay = av | ax;

    u32x az[16];
    u32x ba[16];

    az[0] = ao[0];
    az[1] = ao[1];
    az[2] = ao[2];
    az[3] = ao[3];
    az[4] = ao[4];
    az[5] = ao[5];
    az[6] = ao[6];
    az[7] = ao[7];
    az[8] = ao[8];
    az[9] = ao[9];
    az[10] = ao[10];
    az[11] = ao[11];
    az[12] = ao[12];
    az[13] = ao[13];
    az[14] = ao[14];
    az[15] = ao[15];
    ba[0] = ap[0];
    ba[1] = ap[1];
    ba[2] = ap[2];
    ba[3] = ap[3];
    ba[4] = ap[4];
    ba[5] = ap[5];
    ba[6] = ap[6];
    ba[7] = ap[7];
    ba[8] = ap[8];
    ba[9] = ap[9];
    ba[10] = ap[10];
    ba[11] = ap[11];
    ba[12] = ap[12];
    ba[13] = ap[13];
    ba[14] = ap[14];
    ba[15] = ap[15];

    u32x bb[4];
    u32x bc[4];
    u32x bd[4];
    u32x be[4];

    bb[0] = ay;
    bb[1] = a[1];
    bb[2] = a[2];
    bb[3] = a[3];
    bc[0] = b[0];
    bc[1] = b[1];
    bc[2] = b[2];
    bc[3] = b[3];
    bd[0] = c[0];
    bd[1] = c[1];
    bd[2] = c[2];
    bd[3] = c[3];
    be[0] = d[0];
    be[1] = d[1];
    be[2] = d[2];
    be[3] = d[3];

    BX(az, ba, am, bb, bc, bd, be, e);

    bb[0] = az[0];
    bb[1] = az[1];
    bb[2] = az[2];
    bb[3] = az[3];
    bc[0] = az[4];
    bc[1] = az[5];
    bc[2] = az[6];
    bc[3] = az[7];
    bd[0] = az[8];
    bd[1] = az[9];
    bd[2] = az[10];
    bd[3] = az[11];
    be[0] = az[12];
    be[1] = az[13];
    be[2] = an * 8;
    be[3] = 0;

    u32x bf = 0x67452301u;
    u32x bg = 0xefcdab89u;
    u32x bh = 0x98badcfeu;
    u32x bi = 0x10325476u;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += 0x67452301u;
    bg += 0xefcdab89u;
    bh += 0x98badcfeu;
    bi += 0x10325476u;

    bb[0] = (u32x)(aj[((bf >> 0) & 255)]) << 0 | (u32x)(aj[((bf >> 8) & 255)]) << 16;
    bb[1] = (u32x)(aj[((bf >> 16) & 255)]) << 0 | (u32x)(aj[((bf >> 24) & 255)]) << 16;
    bb[2] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
    bb[3] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
    bc[0] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
    bc[1] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
    bc[2] = (u32x)(aj[((bi >> 0) & 255)]) << 0 | (u32x)(aj[((bi >> 8) & 255)]) << 16;
    bc[3] = (u32x)(aj[((bi >> 16) & 255)]) << 0 | (u32x)(aj[((bi >> 24) & 255)]) << 16;
    bd[0] = ar[0];
    bd[1] = ar[1];
    bd[2] = ar[2];
    bd[3] = ar[3];
    be[0] = ar[4];
    be[1] = ar[5];
    be[2] = ar[6];
    be[3] = ar[7];

    bf = 0x67452301u;
    bg = 0xefcdab89u;
    bh = 0x98badcfeu;
    bi = 0x10325476u;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += 0x67452301u;
    bg += 0xefcdab89u;
    bh += 0x98badcfeu;
    bi += 0x10325476u;

    u32x bj = bf;
    u32x bk = bg;
    u32x bl = bh;
    u32x bm = bi;

    bb[0] = ar[8];
    bb[1] = ar[9];
    bb[2] = ar[10];
    bb[3] = ar[11];
    bc[0] = ar[12];
    bc[1] = ar[13];
    bc[2] = ar[14];
    bc[3] = ar[15];
    bd[0] = as[0];
    bd[1] = as[1];
    bd[2] = as[2];
    bd[3] = as[3];
    be[0] = as[4];
    be[1] = as[5];
    be[2] = as[6];
    be[3] = as[7];

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += bj;
    bg += bk;
    bh += bl;
    bi += bm;

    bj = bf;
    bk = bg;
    bl = bh;
    bm = bi;

    bb[0] = as[8];
    bb[1] = as[9];
    bb[2] = as[10];
    bb[3] = as[11];
    bc[0] = as[12];
    bc[1] = as[13];
    bc[2] = as[14];
    bc[3] = as[15];
    bd[0] = at[0];
    bd[1] = at[1];
    bd[2] = at[2];
    bd[3] = at[3];
    be[0] = at[4];
    be[1] = at[5];
    be[2] = au * 8;
    be[3] = 0;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += bj;
    bg += bk;
    bh += bl;
    bi += bm;

    {
      const u32 bn[4] = {bff, bii, bhh, bgg};
      if (Z(bn, l, m, n, o, p, q, r, s, aa, ab, ac)) {
        int bo = X(bn, ah, &u[ai]);
        if (bo != -1) {
          const u32 bp = ai + bo;
          if (atomic_add(&v[bp], 1) == 0) {
            AA(t, y, ad, bo, bp, ak, aw);
          }
        }
      }
    };
  }
}

void CA(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am = x[ad].salt_len;

  const u32 an = am + e;

  u32 ao[16];
  u32 ap[16];

  ao[0] = x[ad].salt_buf[0];
  ao[1] = x[ad].salt_buf[1];
  ao[2] = x[ad].salt_buf[2];
  ao[3] = x[ad].salt_buf[3];
  ao[4] = x[ad].salt_buf[4];
  ao[5] = x[ad].salt_buf[5];
  ao[6] = x[ad].salt_buf[6];
  ao[7] = x[ad].salt_buf[7];
  ao[8] = x[ad].salt_buf[8];
  ao[9] = x[ad].salt_buf[9];
  ao[10] = x[ad].salt_buf[10];
  ao[11] = x[ad].salt_buf[11];
  ao[12] = x[ad].salt_buf[12];
  ao[13] = x[ad].salt_buf[13];
  ao[14] = x[ad].salt_buf[14];
  ao[15] = x[ad].salt_buf[15];
  ap[0] = x[ad].salt_buf[16];
  ap[1] = x[ad].salt_buf[17];
  ap[2] = x[ad].salt_buf[18];
  ap[3] = x[ad].salt_buf[19];
  ap[4] = x[ad].salt_buf[20];
  ap[5] = x[ad].salt_buf[21];
  ap[6] = x[ad].salt_buf[22];
  ap[7] = x[ad].salt_buf[23];
  ap[8] = x[ad].salt_buf[24];
  ap[9] = x[ad].salt_buf[25];
  ap[10] = x[ad].salt_buf[26];
  ap[11] = x[ad].salt_buf[27];
  ap[12] = x[ad].salt_buf[28];
  ap[13] = x[ad].salt_buf[29];
  ap[14] = 0;
  ap[15] = 0;

  const u32 aq = x[ad].esalt_len;

  u32 ar[16];
  u32 as[16];

  ar[0] = x[ad].esalt_buf[0];
  ar[1] = x[ad].esalt_buf[1];
  ar[2] = x[ad].esalt_buf[2];
  ar[3] = x[ad].esalt_buf[3];
  ar[4] = x[ad].esalt_buf[4];
  ar[5] = x[ad].esalt_buf[5];
  ar[6] = x[ad].esalt_buf[6];
  ar[7] = x[ad].esalt_buf[7];
  ar[8] = x[ad].esalt_buf[8];
  ar[9] = x[ad].esalt_buf[9];
  ar[10] = x[ad].esalt_buf[10];
  ar[11] = x[ad].esalt_buf[11];
  ar[12] = x[ad].esalt_buf[12];
  ar[13] = x[ad].esalt_buf[13];
  ar[14] = x[ad].esalt_buf[14];
  ar[15] = x[ad].esalt_buf[15];
  as[0] = x[ad].esalt_buf[16];
  as[1] = x[ad].esalt_buf[17];
  as[2] = x[ad].esalt_buf[18];
  as[3] = x[ad].esalt_buf[19];
  as[4] = x[ad].esalt_buf[20];
  as[5] = x[ad].esalt_buf[21];
  as[6] = x[ad].esalt_buf[22];
  as[7] = x[ad].esalt_buf[23];
  as[8] = x[ad].esalt_buf[24];
  as[9] = x[ad].esalt_buf[25];
  as[10] = x[ad].esalt_buf[26];
  as[11] = x[ad].esalt_buf[27];
  as[12] = x[ad].esalt_buf[28];
  as[13] = x[ad].esalt_buf[29];
  as[14] = x[ad].esalt_buf[30];
  as[15] = x[ad].esalt_buf[31];

  const u32 at = 32 + aq;

  u32 au = a[0];

  for (u32 av = 0; av < ag; av += 1) {
    const u32x aw = BU(i, av);

    const u32x ax = au | aw;

    u32x ay[16];
    u32x az[16];

    ay[0] = ao[0];
    ay[1] = ao[1];
    ay[2] = ao[2];
    ay[3] = ao[3];
    ay[4] = ao[4];
    ay[5] = ao[5];
    ay[6] = ao[6];
    ay[7] = ao[7];
    ay[8] = ao[8];
    ay[9] = ao[9];
    ay[10] = ao[10];
    ay[11] = ao[11];
    ay[12] = ao[12];
    ay[13] = ao[13];
    ay[14] = ao[14];
    ay[15] = ao[15];
    az[0] = ap[0];
    az[1] = ap[1];
    az[2] = ap[2];
    az[3] = ap[3];
    az[4] = ap[4];
    az[5] = ap[5];
    az[6] = ap[6];
    az[7] = ap[7];
    az[8] = ap[8];
    az[9] = ap[9];
    az[10] = ap[10];
    az[11] = ap[11];
    az[12] = ap[12];
    az[13] = ap[13];
    az[14] = ap[14];
    az[15] = ap[15];

    u32x ba[4];
    u32x bb[4];
    u32x bc[4];
    u32x bd[4];

    ba[0] = ax;
    ba[1] = a[1];
    ba[2] = a[2];
    ba[3] = a[3];
    bb[0] = b[0];
    bb[1] = b[1];
    bb[2] = b[2];
    bb[3] = b[3];
    bc[0] = c[0];
    bc[1] = c[1];
    bc[2] = c[2];
    bc[3] = c[3];
    bd[0] = d[0];
    bd[1] = d[1];
    bd[2] = d[2];
    bd[3] = d[3];

    BX(ay, az, am, ba, bb, bc, bd, e);

    ba[0] = ay[0];
    ba[1] = ay[1];
    ba[2] = ay[2];
    ba[3] = ay[3];
    bb[0] = ay[4];
    bb[1] = ay[5];
    bb[2] = ay[6];
    bb[3] = ay[7];
    bc[0] = ay[8];
    bc[1] = ay[9];
    bc[2] = ay[10];
    bc[3] = ay[11];
    bd[0] = ay[12];
    bd[1] = ay[13];
    bd[2] = ay[14];
    bd[3] = ay[15];

    u32x be = 0x67452301u;
    u32x bf = 0xefcdab89u;
    u32x bg = 0x98badcfeu;
    u32x bh = 0x10325476u;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += 0x67452301u;
    bf += 0xefcdab89u;
    bg += 0x98badcfeu;
    bh += 0x10325476u;

    u32x bi = be;
    u32x bj = bf;
    u32x bk = bg;
    u32x bl = bh;

    ba[0] = az[0];
    ba[1] = az[1];
    ba[2] = az[2];
    ba[3] = az[3];
    bb[0] = az[4];
    bb[1] = az[5];
    bb[2] = az[6];
    bb[3] = az[7];
    bc[0] = az[8];
    bc[1] = az[9];
    bc[2] = az[10];
    bc[3] = az[11];
    bd[0] = az[12];
    bd[1] = az[13];
    bd[2] = an * 8;
    bd[3] = 0;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += bi;
    bf += bj;
    bg += bk;
    bh += bl;

    ba[0] = (u32x)(aj[((be >> 0) & 255)]) << 0 | (u32x)(aj[((be >> 8) & 255)]) << 16;
    ba[1] = (u32x)(aj[((be >> 16) & 255)]) << 0 | (u32x)(aj[((be >> 24) & 255)]) << 16;
    ba[2] = (u32x)(aj[((bf >> 0) & 255)]) << 0 | (u32x)(aj[((bf >> 8) & 255)]) << 16;
    ba[3] = (u32x)(aj[((bf >> 16) & 255)]) << 0 | (u32x)(aj[((bf >> 24) & 255)]) << 16;
    bb[0] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
    bb[1] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
    bb[2] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
    bb[3] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
    bc[0] = ar[0];
    bc[1] = ar[1];
    bc[2] = ar[2];
    bc[3] = ar[3];
    bd[0] = ar[4];
    bd[1] = ar[5];
    bd[2] = ar[6];
    bd[3] = ar[7];

    be = 0x67452301u;
    bf = 0xefcdab89u;
    bg = 0x98badcfeu;
    bh = 0x10325476u;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += 0x67452301u;
    bf += 0xefcdab89u;
    bg += 0x98badcfeu;
    bh += 0x10325476u;

    bi = be;
    bj = bf;
    bk = bg;
    bl = bh;

    ba[0] = ar[8];
    ba[1] = ar[9];
    ba[2] = ar[10];
    ba[3] = ar[11];
    bb[0] = ar[12];
    bb[1] = ar[13];
    bb[2] = ar[14];
    bb[3] = ar[15];
    bc[0] = as[0];
    bc[1] = as[1];
    bc[2] = as[2];
    bc[3] = as[3];
    bd[0] = as[4];
    bd[1] = as[5];
    bd[2] = at * 8;
    bd[3] = 0;

    {
      be += 0xd76aa478u;
      be += ba[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xe8c7b756u;
      bh += ba[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0x242070dbu;
      bg += ba[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xc1bdceeeu;
      bf += ba[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0xf57c0fafu;
      be += bb[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x4787c62au;
      bh += bb[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa8304613u;
      bg += bb[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0xfd469501u;
      bf += bb[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x698098d8u;
      be += bc[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0x8b44f7afu;
      bh += bc[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xffff5bb1u;
      bg += bc[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x895cd7beu;
      bf += bc[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };
    {
      be += 0x6b901122u;
      be += bd[0];
      be += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      be = P(be, 7u);
      be += bf;
    };
    {
      bh += 0xfd987193u;
      bh += bd[1];
      bh += ((((bg)) ^ (((be)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 12u);
      bh += be;
    };
    {
      bg += 0xa679438eu;
      bg += bd[2];
      bg += ((((bf)) ^ (((bh)) & (((be)) ^ ((bf))))));
      bg = P(bg, 17u);
      bg += bh;
    };
    {
      bf += 0x49b40821u;
      bf += bd[3];
      bf += ((((be)) ^ (((bg)) & (((bh)) ^ ((be))))));
      bf = P(bf, 22u);
      bf += bg;
    };

    {
      be += 0xf61e2562u;
      be += ba[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc040b340u;
      bh += bb[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x265e5a51u;
      bg += bc[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe9b6c7aau;
      bf += ba[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xd62f105du;
      be += bb[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0x02441453u;
      bh += bc[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xd8a1e681u;
      bg += bd[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0xe7d3fbc8u;
      bf += bb[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0x21e1cde6u;
      be += bc[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xc33707d6u;
      bh += bd[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0xf4d50d87u;
      bg += ba[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x455a14edu;
      bf += bc[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };
    {
      be += 0xa9e3e905u;
      be += bd[1];
      be += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      be = P(be, 5u);
      be += bf;
    };
    {
      bh += 0xfcefa3f8u;
      bh += ba[2];
      bh += ((((bf)) ^ (((bg)) & (((be)) ^ ((bf))))));
      bh = P(bh, 9u);
      bh += be;
    };
    {
      bg += 0x676f02d9u;
      bg += bb[3];
      bg += ((((be)) ^ (((bf)) & (((bh)) ^ ((be))))));
      bg = P(bg, 14u);
      bg += bh;
    };
    {
      bf += 0x8d2a4c8au;
      bf += bd[0];
      bf += ((((bh)) ^ (((be)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 20u);
      bf += bg;
    };

    {
      be += 0xfffa3942u;
      be += bb[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x8771f681u;
      bh += bc[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x6d9d6122u;
      bg += bc[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xfde5380cu;
      bf += bd[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xa4beea44u;
      be += ba[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0x4bdecfa9u;
      bh += bb[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xf6bb4b60u;
      bg += bb[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xbebfbc70u;
      bf += bc[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0x289b7ec6u;
      be += bd[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xeaa127fau;
      bh += ba[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0xd4ef3085u;
      bg += ba[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0x04881d05u;
      bf += bb[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };
    {
      be += 0xd9d4d039u;
      be += bc[1];
      be += ((bf) ^ (bg) ^ (bh));
      be = P(be, 4u);
      be += bf;
    };
    {
      bh += 0xe6db99e5u;
      bh += bd[0];
      bh += ((be) ^ (bf) ^ (bg));
      bh = P(bh, 11u);
      bh += be;
    };
    {
      bg += 0x1fa27cf8u;
      bg += bd[3];
      bg += ((bh) ^ (be) ^ (bf));
      bg = P(bg, 16u);
      bg += bh;
    };
    {
      bf += 0xc4ac5665u;
      bf += ba[2];
      bf += ((bg) ^ (bh) ^ (be));
      bf = P(bf, 23u);
      bf += bg;
    };

    {
      be += 0xf4292244u;
      be += ba[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x432aff97u;
      bh += bb[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xab9423a7u;
      bg += bd[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xfc93a039u;
      bf += bb[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x655b59c3u;
      be += bd[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0x8f0ccc92u;
      bh += ba[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xffeff47du;
      bg += bc[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x85845dd1u;
      bf += ba[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0x6fa87e4fu;
      be += bc[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xfe2ce6e0u;
      bh += bd[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0xa3014314u;
      bg += bb[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0x4e0811a1u;
      bf += bd[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };
    {
      be += 0xf7537e82u;
      be += bb[0];
      be += ((bg) ^ ((bf) | ~(bh)));
      be = P(be, 6u);
      be += bf;
    };
    {
      bh += 0xbd3af235u;
      bh += bc[3];
      bh += ((bf) ^ ((be) | ~(bg)));
      bh = P(bh, 10u);
      bh += be;
    };
    {
      bg += 0x2ad7d2bbu;
      bg += ba[2];
      bg += ((be) ^ ((bh) | ~(bf)));
      bg = P(bg, 15u);
      bg += bh;
    };
    {
      bf += 0xeb86d391u;
      bf += bc[1];
      bf += ((bh) ^ ((bg) | ~(be)));
      bf = P(bf, 21u);
      bf += bg;
    };

    be += bi;
    bf += bj;
    bg += bk;
    bh += bl;

    {
      const u32 bm[4] = {bee, bhh, bgg, bff};
      if (Z(bm, l, m, n, o, p, q, r, s, aa, ab, ac)) {
        int bn = X(bm, ah, &u[ai]);
        if (bn != -1) {
          const u32 bo = ai + bn;
          if (atomic_add(&v[bo], 1) == 0) {
            AA(t, y, ad, bn, bo, ak, av);
          }
        }
      }
    };
  }
}

void CB(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am = x[ad].salt_len;

  const u32 an = am + e;

  u32 ao[16];
  u32 ap[16];

  ao[0] = x[ad].salt_buf[0];
  ao[1] = x[ad].salt_buf[1];
  ao[2] = x[ad].salt_buf[2];
  ao[3] = x[ad].salt_buf[3];
  ao[4] = x[ad].salt_buf[4];
  ao[5] = x[ad].salt_buf[5];
  ao[6] = x[ad].salt_buf[6];
  ao[7] = x[ad].salt_buf[7];
  ao[8] = x[ad].salt_buf[8];
  ao[9] = x[ad].salt_buf[9];
  ao[10] = x[ad].salt_buf[10];
  ao[11] = x[ad].salt_buf[11];
  ao[12] = x[ad].salt_buf[12];
  ao[13] = x[ad].salt_buf[13];
  ao[14] = x[ad].salt_buf[14];
  ao[15] = x[ad].salt_buf[15];
  ap[0] = x[ad].salt_buf[16];
  ap[1] = x[ad].salt_buf[17];
  ap[2] = x[ad].salt_buf[18];
  ap[3] = x[ad].salt_buf[19];
  ap[4] = x[ad].salt_buf[20];
  ap[5] = x[ad].salt_buf[21];
  ap[6] = x[ad].salt_buf[22];
  ap[7] = x[ad].salt_buf[23];
  ap[8] = x[ad].salt_buf[24];
  ap[9] = x[ad].salt_buf[25];
  ap[10] = x[ad].salt_buf[26];
  ap[11] = x[ad].salt_buf[27];
  ap[12] = x[ad].salt_buf[28];
  ap[13] = x[ad].salt_buf[29];
  ap[14] = 0;
  ap[15] = 0;

  const u32 aq = x[ad].esalt_len;

  u32 ar[16];
  u32 as[16];
  u32 at[16];

  ar[0] = x[ad].esalt_buf[0];
  ar[1] = x[ad].esalt_buf[1];
  ar[2] = x[ad].esalt_buf[2];
  ar[3] = x[ad].esalt_buf[3];
  ar[4] = x[ad].esalt_buf[4];
  ar[5] = x[ad].esalt_buf[5];
  ar[6] = x[ad].esalt_buf[6];
  ar[7] = x[ad].esalt_buf[7];
  ar[8] = x[ad].esalt_buf[8];
  ar[9] = x[ad].esalt_buf[9];
  ar[10] = x[ad].esalt_buf[10];
  ar[11] = x[ad].esalt_buf[11];
  ar[12] = x[ad].esalt_buf[12];
  ar[13] = x[ad].esalt_buf[13];
  ar[14] = x[ad].esalt_buf[14];
  ar[15] = x[ad].esalt_buf[15];
  as[0] = x[ad].esalt_buf[16];
  as[1] = x[ad].esalt_buf[17];
  as[2] = x[ad].esalt_buf[18];
  as[3] = x[ad].esalt_buf[19];
  as[4] = x[ad].esalt_buf[20];
  as[5] = x[ad].esalt_buf[21];
  as[6] = x[ad].esalt_buf[22];
  as[7] = x[ad].esalt_buf[23];
  as[8] = x[ad].esalt_buf[24];
  as[9] = x[ad].esalt_buf[25];
  as[10] = x[ad].esalt_buf[26];
  as[11] = x[ad].esalt_buf[27];
  as[12] = x[ad].esalt_buf[28];
  as[13] = x[ad].esalt_buf[29];
  as[14] = x[ad].esalt_buf[30];
  as[15] = x[ad].esalt_buf[31];
  at[0] = x[ad].esalt_buf[32];
  at[1] = x[ad].esalt_buf[33];
  at[2] = x[ad].esalt_buf[34];
  at[3] = x[ad].esalt_buf[35];
  at[4] = x[ad].esalt_buf[36];
  at[5] = x[ad].esalt_buf[37];
  at[6] = 0;
  at[7] = 0;
  at[8] = 0;
  at[9] = 0;
  at[10] = 0;
  at[11] = 0;
  at[12] = 0;
  at[13] = 0;
  at[14] = 0;
  at[15] = 0;

  const u32 au = 32 + aq;

  u32 av = a[0];

  for (u32 aw = 0; aw < ag; aw += 1) {
    const u32x ax = BU(i, aw);

    const u32x ay = av | ax;

    u32x az[16];
    u32x ba[16];

    az[0] = ao[0];
    az[1] = ao[1];
    az[2] = ao[2];
    az[3] = ao[3];
    az[4] = ao[4];
    az[5] = ao[5];
    az[6] = ao[6];
    az[7] = ao[7];
    az[8] = ao[8];
    az[9] = ao[9];
    az[10] = ao[10];
    az[11] = ao[11];
    az[12] = ao[12];
    az[13] = ao[13];
    az[14] = ao[14];
    az[15] = ao[15];
    ba[0] = ap[0];
    ba[1] = ap[1];
    ba[2] = ap[2];
    ba[3] = ap[3];
    ba[4] = ap[4];
    ba[5] = ap[5];
    ba[6] = ap[6];
    ba[7] = ap[7];
    ba[8] = ap[8];
    ba[9] = ap[9];
    ba[10] = ap[10];
    ba[11] = ap[11];
    ba[12] = ap[12];
    ba[13] = ap[13];
    ba[14] = ap[14];
    ba[15] = ap[15];

    u32x bb[4];
    u32x bc[4];
    u32x bd[4];
    u32x be[4];

    bb[0] = ay;
    bb[1] = a[1];
    bb[2] = a[2];
    bb[3] = a[3];
    bc[0] = b[0];
    bc[1] = b[1];
    bc[2] = b[2];
    bc[3] = b[3];
    bd[0] = c[0];
    bd[1] = c[1];
    bd[2] = c[2];
    bd[3] = c[3];
    be[0] = d[0];
    be[1] = d[1];
    be[2] = d[2];
    be[3] = d[3];

    BX(az, ba, am, bb, bc, bd, be, e);

    bb[0] = az[0];
    bb[1] = az[1];
    bb[2] = az[2];
    bb[3] = az[3];
    bc[0] = az[4];
    bc[1] = az[5];
    bc[2] = az[6];
    bc[3] = az[7];
    bd[0] = az[8];
    bd[1] = az[9];
    bd[2] = az[10];
    bd[3] = az[11];
    be[0] = az[12];
    be[1] = az[13];
    be[2] = az[14];
    be[3] = az[15];

    u32x bf = 0x67452301u;
    u32x bg = 0xefcdab89u;
    u32x bh = 0x98badcfeu;
    u32x bi = 0x10325476u;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += 0x67452301u;
    bg += 0xefcdab89u;
    bh += 0x98badcfeu;
    bi += 0x10325476u;

    u32x bj = bf;
    u32x bk = bg;
    u32x bl = bh;
    u32x bm = bi;

    bb[0] = ba[0];
    bb[1] = ba[1];
    bb[2] = ba[2];
    bb[3] = ba[3];
    bc[0] = ba[4];
    bc[1] = ba[5];
    bc[2] = ba[6];
    bc[3] = ba[7];
    bd[0] = ba[8];
    bd[1] = ba[9];
    bd[2] = ba[10];
    bd[3] = ba[11];
    be[0] = ba[12];
    be[1] = ba[13];
    be[2] = an * 8;
    be[3] = 0;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += bj;
    bg += bk;
    bh += bl;
    bi += bm;

    bb[0] = (u32x)(aj[((bf >> 0) & 255)]) << 0 | (u32x)(aj[((bf >> 8) & 255)]) << 16;
    bb[1] = (u32x)(aj[((bf >> 16) & 255)]) << 0 | (u32x)(aj[((bf >> 24) & 255)]) << 16;
    bb[2] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
    bb[3] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
    bc[0] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
    bc[1] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
    bc[2] = (u32x)(aj[((bi >> 0) & 255)]) << 0 | (u32x)(aj[((bi >> 8) & 255)]) << 16;
    bc[3] = (u32x)(aj[((bi >> 16) & 255)]) << 0 | (u32x)(aj[((bi >> 24) & 255)]) << 16;
    bd[0] = ar[0];
    bd[1] = ar[1];
    bd[2] = ar[2];
    bd[3] = ar[3];
    be[0] = ar[4];
    be[1] = ar[5];
    be[2] = ar[6];
    be[3] = ar[7];

    bf = 0x67452301u;
    bg = 0xefcdab89u;
    bh = 0x98badcfeu;
    bi = 0x10325476u;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += 0x67452301u;
    bg += 0xefcdab89u;
    bh += 0x98badcfeu;
    bi += 0x10325476u;

    bj = bf;
    bk = bg;
    bl = bh;
    bm = bi;

    bb[0] = ar[8];
    bb[1] = ar[9];
    bb[2] = ar[10];
    bb[3] = ar[11];
    bc[0] = ar[12];
    bc[1] = ar[13];
    bc[2] = ar[14];
    bc[3] = ar[15];
    bd[0] = as[0];
    bd[1] = as[1];
    bd[2] = as[2];
    bd[3] = as[3];
    be[0] = as[4];
    be[1] = as[5];
    be[2] = as[6];
    be[3] = as[7];

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += bj;
    bg += bk;
    bh += bl;
    bi += bm;

    bj = bf;
    bk = bg;
    bl = bh;
    bm = bi;

    bb[0] = as[8];
    bb[1] = as[9];
    bb[2] = as[10];
    bb[3] = as[11];
    bc[0] = as[12];
    bc[1] = as[13];
    bc[2] = as[14];
    bc[3] = as[15];
    bd[0] = at[0];
    bd[1] = at[1];
    bd[2] = at[2];
    bd[3] = at[3];
    be[0] = at[4];
    be[1] = at[5];
    be[2] = au * 8;
    be[3] = 0;

    {
      bf += 0xd76aa478u;
      bf += bb[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xe8c7b756u;
      bi += bb[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0x242070dbu;
      bh += bb[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xc1bdceeeu;
      bg += bb[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0xf57c0fafu;
      bf += bc[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x4787c62au;
      bi += bc[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa8304613u;
      bh += bc[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0xfd469501u;
      bg += bc[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x698098d8u;
      bf += bd[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0x8b44f7afu;
      bi += bd[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xffff5bb1u;
      bh += bd[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x895cd7beu;
      bg += bd[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };
    {
      bf += 0x6b901122u;
      bf += be[0];
      bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
      bf = P(bf, 7u);
      bf += bg;
    };
    {
      bi += 0xfd987193u;
      bi += be[1];
      bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
      bi = P(bi, 12u);
      bi += bf;
    };
    {
      bh += 0xa679438eu;
      bh += be[2];
      bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
      bh = P(bh, 17u);
      bh += bi;
    };
    {
      bg += 0x49b40821u;
      bg += be[3];
      bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
      bg = P(bg, 22u);
      bg += bh;
    };

    {
      bf += 0xf61e2562u;
      bf += bb[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc040b340u;
      bi += bc[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x265e5a51u;
      bh += bd[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe9b6c7aau;
      bg += bb[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xd62f105du;
      bf += bc[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0x02441453u;
      bi += bd[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xd8a1e681u;
      bh += be[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0xe7d3fbc8u;
      bg += bc[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0x21e1cde6u;
      bf += bd[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xc33707d6u;
      bi += be[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0xf4d50d87u;
      bh += bb[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x455a14edu;
      bg += bd[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };
    {
      bf += 0xa9e3e905u;
      bf += be[1];
      bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
      bf = P(bf, 5u);
      bf += bg;
    };
    {
      bi += 0xfcefa3f8u;
      bi += bb[2];
      bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
      bi = P(bi, 9u);
      bi += bf;
    };
    {
      bh += 0x676f02d9u;
      bh += bc[3];
      bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
      bh = P(bh, 14u);
      bh += bi;
    };
    {
      bg += 0x8d2a4c8au;
      bg += be[0];
      bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
      bg = P(bg, 20u);
      bg += bh;
    };

    {
      bf += 0xfffa3942u;
      bf += bc[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x8771f681u;
      bi += bd[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x6d9d6122u;
      bh += bd[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xfde5380cu;
      bg += be[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xa4beea44u;
      bf += bb[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0x4bdecfa9u;
      bi += bc[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xf6bb4b60u;
      bh += bc[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xbebfbc70u;
      bg += bd[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0x289b7ec6u;
      bf += be[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xeaa127fau;
      bi += bb[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0xd4ef3085u;
      bh += bb[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0x04881d05u;
      bg += bc[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };
    {
      bf += 0xd9d4d039u;
      bf += bd[1];
      bf += ((bg) ^ (bh) ^ (bi));
      bf = P(bf, 4u);
      bf += bg;
    };
    {
      bi += 0xe6db99e5u;
      bi += be[0];
      bi += ((bf) ^ (bg) ^ (bh));
      bi = P(bi, 11u);
      bi += bf;
    };
    {
      bh += 0x1fa27cf8u;
      bh += be[3];
      bh += ((bi) ^ (bf) ^ (bg));
      bh = P(bh, 16u);
      bh += bi;
    };
    {
      bg += 0xc4ac5665u;
      bg += bb[2];
      bg += ((bh) ^ (bi) ^ (bf));
      bg = P(bg, 23u);
      bg += bh;
    };

    {
      bf += 0xf4292244u;
      bf += bb[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x432aff97u;
      bi += bc[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xab9423a7u;
      bh += be[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xfc93a039u;
      bg += bc[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x655b59c3u;
      bf += be[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0x8f0ccc92u;
      bi += bb[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xffeff47du;
      bh += bd[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x85845dd1u;
      bg += bb[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0x6fa87e4fu;
      bf += bd[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xfe2ce6e0u;
      bi += be[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0xa3014314u;
      bh += bc[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0x4e0811a1u;
      bg += be[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };
    {
      bf += 0xf7537e82u;
      bf += bc[0];
      bf += ((bh) ^ ((bg) | ~(bi)));
      bf = P(bf, 6u);
      bf += bg;
    };
    {
      bi += 0xbd3af235u;
      bi += bd[3];
      bi += ((bg) ^ ((bf) | ~(bh)));
      bi = P(bi, 10u);
      bi += bf;
    };
    {
      bh += 0x2ad7d2bbu;
      bh += bb[2];
      bh += ((bf) ^ ((bi) | ~(bg)));
      bh = P(bh, 15u);
      bh += bi;
    };
    {
      bg += 0xeb86d391u;
      bg += bd[1];
      bg += ((bi) ^ ((bh) | ~(bf)));
      bg = P(bg, 21u);
      bg += bh;
    };

    bf += bj;
    bg += bk;
    bh += bl;
    bi += bm;

    {
      const u32 bn[4] = {bff, bii, bhh, bgg};
      if (Z(bn, l, m, n, o, p, q, r, s, aa, ab, ac)) {
        int bo = X(bn, ah, &u[ai]);
        if (bo != -1) {
          const u32 bp = ai + bo;
          if (atomic_add(&v[bp], 1) == 0) {
            AA(t, y, ad, bo, bp, ak, aw);
          }
        }
      }
    };
  }
}

void CC(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am[4] =
ai[ai[ai[ai[1]
};

const u32 an = x[ad].salt_len;

const u32 ao = an + e;

u32 ap[16];
u32 aq[16];

ap[0] = x[ad].salt_buf[0];
ap[1] = x[ad].salt_buf[1];
ap[2] = x[ad].salt_buf[2];
ap[3] = x[ad].salt_buf[3];
ap[4] = x[ad].salt_buf[4];
ap[5] = x[ad].salt_buf[5];
ap[6] = x[ad].salt_buf[6];
ap[7] = x[ad].salt_buf[7];
ap[8] = x[ad].salt_buf[8];
ap[9] = x[ad].salt_buf[9];
ap[10] = x[ad].salt_buf[10];
ap[11] = x[ad].salt_buf[11];
ap[12] = x[ad].salt_buf[12];
ap[13] = x[ad].salt_buf[13];
ap[14] = x[ad].salt_buf[14];
ap[15] = x[ad].salt_buf[15];
aq[0] = x[ad].salt_buf[16];
aq[1] = x[ad].salt_buf[17];
aq[2] = x[ad].salt_buf[18];
aq[3] = x[ad].salt_buf[19];
aq[4] = x[ad].salt_buf[20];
aq[5] = x[ad].salt_buf[21];
aq[6] = x[ad].salt_buf[22];
aq[7] = x[ad].salt_buf[23];
aq[8] = x[ad].salt_buf[24];
aq[9] = x[ad].salt_buf[25];
aq[10] = x[ad].salt_buf[26];
aq[11] = x[ad].salt_buf[27];
aq[12] = x[ad].salt_buf[28];
aq[13] = x[ad].salt_buf[29];
aq[14] = 0;
aq[15] = 0;

const u32 ar = x[ad].esalt_len;

u32 as[16];
u32 at[16];

as[0] = x[ad].esalt_buf[0];
as[1] = x[ad].esalt_buf[1];
as[2] = x[ad].esalt_buf[2];
as[3] = x[ad].esalt_buf[3];
as[4] = x[ad].esalt_buf[4];
as[5] = x[ad].esalt_buf[5];
as[6] = x[ad].esalt_buf[6];
as[7] = x[ad].esalt_buf[7];
as[8] = x[ad].esalt_buf[8];
as[9] = x[ad].esalt_buf[9];
as[10] = x[ad].esalt_buf[10];
as[11] = x[ad].esalt_buf[11];
as[12] = x[ad].esalt_buf[12];
as[13] = x[ad].esalt_buf[13];
as[14] = x[ad].esalt_buf[14];
as[15] = x[ad].esalt_buf[15];
at[0] = x[ad].esalt_buf[16];
at[1] = x[ad].esalt_buf[17];
at[2] = x[ad].esalt_buf[18];
at[3] = x[ad].esalt_buf[19];
at[4] = x[ad].esalt_buf[20];
at[5] = x[ad].esalt_buf[21];
at[6] = x[ad].esalt_buf[22];
at[7] = x[ad].esalt_buf[23];
at[8] = x[ad].esalt_buf[24];
at[9] = x[ad].esalt_buf[25];
at[10] = x[ad].esalt_buf[26];
at[11] = x[ad].esalt_buf[27];
at[12] = x[ad].esalt_buf[28];
at[13] = x[ad].esalt_buf[29];
at[14] = x[ad].esalt_buf[30];
at[15] = x[ad].esalt_buf[31];

const u32 au = 32 + ar;

u32 av = a[0];

for (u32 aw = 0; aw < ag; aw += 1) {
  const u32x ax = BU(i, aw);

  const u32x ay = av | ax;

  u32x az[16];
  u32x ba[16];

  az[0] = ap[0];
  az[1] = ap[1];
  az[2] = ap[2];
  az[3] = ap[3];
  az[4] = ap[4];
  az[5] = ap[5];
  az[6] = ap[6];
  az[7] = ap[7];
  az[8] = ap[8];
  az[9] = ap[9];
  az[10] = ap[10];
  az[11] = ap[11];
  az[12] = ap[12];
  az[13] = ap[13];
  az[14] = ap[14];
  az[15] = ap[15];
  ba[0] = aq[0];
  ba[1] = aq[1];
  ba[2] = aq[2];
  ba[3] = aq[3];
  ba[4] = aq[4];
  ba[5] = aq[5];
  ba[6] = aq[6];
  ba[7] = aq[7];
  ba[8] = aq[8];
  ba[9] = aq[9];
  ba[10] = aq[10];
  ba[11] = aq[11];
  ba[12] = aq[12];
  ba[13] = aq[13];
  ba[14] = aq[14];
  ba[15] = aq[15];

  u32x bb[4];
  u32x bc[4];
  u32x bd[4];
  u32x be[4];

  bb[0] = ay;
  bb[1] = a[1];
  bb[2] = a[2];
  bb[3] = a[3];
  bc[0] = b[0];
  bc[1] = b[1];
  bc[2] = b[2];
  bc[3] = b[3];
  bd[0] = c[0];
  bd[1] = c[1];
  bd[2] = c[2];
  bd[3] = c[3];
  be[0] = d[0];
  be[1] = d[1];
  be[2] = d[2];
  be[3] = d[3];

  BX(az, ba, an, bb, bc, bd, be, e);

  bb[0] = az[0];
  bb[1] = az[1];
  bb[2] = az[2];
  bb[3] = az[3];
  bc[0] = az[4];
  bc[1] = az[5];
  bc[2] = az[6];
  bc[3] = az[7];
  bd[0] = az[8];
  bd[1] = az[9];
  bd[2] = az[10];
  bd[3] = az[11];
  be[0] = az[12];
  be[1] = az[13];
  be[2] = ao * 8;
  be[3] = 0;

  u32x bf = 0x67452301u;
  u32x bg = 0xefcdab89u;
  u32x bh = 0x98badcfeu;
  u32x bi = 0x10325476u;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += 0x67452301u;
  bg += 0xefcdab89u;
  bh += 0x98badcfeu;
  bi += 0x10325476u;

  bb[0] = (u32x)(aj[((bf >> 0) & 255)]) << 0 | (u32x)(aj[((bf >> 8) & 255)]) << 16;
  bb[1] = (u32x)(aj[((bf >> 16) & 255)]) << 0 | (u32x)(aj[((bf >> 24) & 255)]) << 16;
  bb[2] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
  bb[3] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
  bc[0] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
  bc[1] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
  bc[2] = (u32x)(aj[((bi >> 0) & 255)]) << 0 | (u32x)(aj[((bi >> 8) & 255)]) << 16;
  bc[3] = (u32x)(aj[((bi >> 16) & 255)]) << 0 | (u32x)(aj[((bi >> 24) & 255)]) << 16;
  bd[0] = as[0];
  bd[1] = as[1];
  bd[2] = as[2];
  bd[3] = as[3];
  be[0] = as[4];
  be[1] = as[5];
  be[2] = as[6];
  be[3] = as[7];

  bf = 0x67452301u;
  bg = 0xefcdab89u;
  bh = 0x98badcfeu;
  bi = 0x10325476u;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += 0x67452301u;
  bg += 0xefcdab89u;
  bh += 0x98badcfeu;
  bi += 0x10325476u;

  u32x bj = bf;
  u32x bk = bg;
  u32x bl = bh;
  u32x bm = bi;

  bb[0] = as[8];
  bb[1] = as[9];
  bb[2] = as[10];
  bb[3] = as[11];
  bc[0] = as[12];
  bc[1] = as[13];
  bc[2] = as[14];
  bc[3] = as[15];
  bd[0] = at[0];
  bd[1] = at[1];
  bd[2] = at[2];
  bd[3] = at[3];
  be[0] = at[4];
  be[1] = at[5];
  be[2] = au * 8;
  be[3] = 0;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += bj;
  bg += bk;
  bh += bl;
  bi += bm;

  {
    if (((bf) == am[0]) && ((bi) == am[1]) && ((bh) == am[2]) && ((bg) == am[3])) {
      const u32 bn = ai + 0;
      if (atomic_add(&v[bn], 1) == 0) {
        AA(t, y, ad, 0, bn, ak, aw);
      }
    }
  };
}
}

void CD(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am[4] =
ai[ai[ai[ai[1]
};

const u32 an = x[ad].salt_len;

const u32 ao = an + e;

u32 ap[16];
u32 aq[16];

ap[0] = x[ad].salt_buf[0];
ap[1] = x[ad].salt_buf[1];
ap[2] = x[ad].salt_buf[2];
ap[3] = x[ad].salt_buf[3];
ap[4] = x[ad].salt_buf[4];
ap[5] = x[ad].salt_buf[5];
ap[6] = x[ad].salt_buf[6];
ap[7] = x[ad].salt_buf[7];
ap[8] = x[ad].salt_buf[8];
ap[9] = x[ad].salt_buf[9];
ap[10] = x[ad].salt_buf[10];
ap[11] = x[ad].salt_buf[11];
ap[12] = x[ad].salt_buf[12];
ap[13] = x[ad].salt_buf[13];
ap[14] = x[ad].salt_buf[14];
ap[15] = x[ad].salt_buf[15];
aq[0] = x[ad].salt_buf[16];
aq[1] = x[ad].salt_buf[17];
aq[2] = x[ad].salt_buf[18];
aq[3] = x[ad].salt_buf[19];
aq[4] = x[ad].salt_buf[20];
aq[5] = x[ad].salt_buf[21];
aq[6] = x[ad].salt_buf[22];
aq[7] = x[ad].salt_buf[23];
aq[8] = x[ad].salt_buf[24];
aq[9] = x[ad].salt_buf[25];
aq[10] = x[ad].salt_buf[26];
aq[11] = x[ad].salt_buf[27];
aq[12] = x[ad].salt_buf[28];
aq[13] = x[ad].salt_buf[29];
aq[14] = 0;
aq[15] = 0;

const u32 ar = x[ad].esalt_len;

u32 as[16];
u32 at[16];
u32 au[16];

as[0] = x[ad].esalt_buf[0];
as[1] = x[ad].esalt_buf[1];
as[2] = x[ad].esalt_buf[2];
as[3] = x[ad].esalt_buf[3];
as[4] = x[ad].esalt_buf[4];
as[5] = x[ad].esalt_buf[5];
as[6] = x[ad].esalt_buf[6];
as[7] = x[ad].esalt_buf[7];
as[8] = x[ad].esalt_buf[8];
as[9] = x[ad].esalt_buf[9];
as[10] = x[ad].esalt_buf[10];
as[11] = x[ad].esalt_buf[11];
as[12] = x[ad].esalt_buf[12];
as[13] = x[ad].esalt_buf[13];
as[14] = x[ad].esalt_buf[14];
as[15] = x[ad].esalt_buf[15];
at[0] = x[ad].esalt_buf[16];
at[1] = x[ad].esalt_buf[17];
at[2] = x[ad].esalt_buf[18];
at[3] = x[ad].esalt_buf[19];
at[4] = x[ad].esalt_buf[20];
at[5] = x[ad].esalt_buf[21];
at[6] = x[ad].esalt_buf[22];
at[7] = x[ad].esalt_buf[23];
at[8] = x[ad].esalt_buf[24];
at[9] = x[ad].esalt_buf[25];
at[10] = x[ad].esalt_buf[26];
at[11] = x[ad].esalt_buf[27];
at[12] = x[ad].esalt_buf[28];
at[13] = x[ad].esalt_buf[29];
at[14] = x[ad].esalt_buf[30];
at[15] = x[ad].esalt_buf[31];
au[0] = x[ad].esalt_buf[32];
au[1] = x[ad].esalt_buf[33];
au[2] = x[ad].esalt_buf[34];
au[3] = x[ad].esalt_buf[35];
au[4] = x[ad].esalt_buf[36];
au[5] = x[ad].esalt_buf[37];
au[6] = 0;
au[7] = 0;
au[8] = 0;
au[9] = 0;
au[10] = 0;
au[11] = 0;
au[12] = 0;
au[13] = 0;
au[14] = 0;
au[15] = 0;

const u32 av = 32 + ar;

u32 aw = a[0];

for (u32 ax = 0; ax < ag; ax += 1) {
  const u32x ay = BU(i, ax);

  const u32x az = aw | ay;

  u32x ba[16];
  u32x bb[16];

  ba[0] = ap[0];
  ba[1] = ap[1];
  ba[2] = ap[2];
  ba[3] = ap[3];
  ba[4] = ap[4];
  ba[5] = ap[5];
  ba[6] = ap[6];
  ba[7] = ap[7];
  ba[8] = ap[8];
  ba[9] = ap[9];
  ba[10] = ap[10];
  ba[11] = ap[11];
  ba[12] = ap[12];
  ba[13] = ap[13];
  ba[14] = ap[14];
  ba[15] = ap[15];
  bb[0] = aq[0];
  bb[1] = aq[1];
  bb[2] = aq[2];
  bb[3] = aq[3];
  bb[4] = aq[4];
  bb[5] = aq[5];
  bb[6] = aq[6];
  bb[7] = aq[7];
  bb[8] = aq[8];
  bb[9] = aq[9];
  bb[10] = aq[10];
  bb[11] = aq[11];
  bb[12] = aq[12];
  bb[13] = aq[13];
  bb[14] = aq[14];
  bb[15] = aq[15];

  u32x bc[4];
  u32x bd[4];
  u32x be[4];
  u32x bf[4];

  bc[0] = az;
  bc[1] = a[1];
  bc[2] = a[2];
  bc[3] = a[3];
  bd[0] = b[0];
  bd[1] = b[1];
  bd[2] = b[2];
  bd[3] = b[3];
  be[0] = c[0];
  be[1] = c[1];
  be[2] = c[2];
  be[3] = c[3];
  bf[0] = d[0];
  bf[1] = d[1];
  bf[2] = d[2];
  bf[3] = d[3];

  BX(ba, bb, an, bc, bd, be, bf, e);

  bc[0] = ba[0];
  bc[1] = ba[1];
  bc[2] = ba[2];
  bc[3] = ba[3];
  bd[0] = ba[4];
  bd[1] = ba[5];
  bd[2] = ba[6];
  bd[3] = ba[7];
  be[0] = ba[8];
  be[1] = ba[9];
  be[2] = ba[10];
  be[3] = ba[11];
  bf[0] = ba[12];
  bf[1] = ba[13];
  bf[2] = ao * 8;
  bf[3] = 0;

  u32x bg = 0x67452301u;
  u32x bh = 0xefcdab89u;
  u32x bi = 0x98badcfeu;
  u32x bj = 0x10325476u;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += 0x67452301u;
  bh += 0xefcdab89u;
  bi += 0x98badcfeu;
  bj += 0x10325476u;

  bc[0] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
  bc[1] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
  bc[2] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
  bc[3] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
  bd[0] = (u32x)(aj[((bi >> 0) & 255)]) << 0 | (u32x)(aj[((bi >> 8) & 255)]) << 16;
  bd[1] = (u32x)(aj[((bi >> 16) & 255)]) << 0 | (u32x)(aj[((bi >> 24) & 255)]) << 16;
  bd[2] = (u32x)(aj[((bj >> 0) & 255)]) << 0 | (u32x)(aj[((bj >> 8) & 255)]) << 16;
  bd[3] = (u32x)(aj[((bj >> 16) & 255)]) << 0 | (u32x)(aj[((bj >> 24) & 255)]) << 16;
  be[0] = as[0];
  be[1] = as[1];
  be[2] = as[2];
  be[3] = as[3];
  bf[0] = as[4];
  bf[1] = as[5];
  bf[2] = as[6];
  bf[3] = as[7];

  bg = 0x67452301u;
  bh = 0xefcdab89u;
  bi = 0x98badcfeu;
  bj = 0x10325476u;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += 0x67452301u;
  bh += 0xefcdab89u;
  bi += 0x98badcfeu;
  bj += 0x10325476u;

  u32x bk = bg;
  u32x bl = bh;
  u32x bm = bi;
  u32x bn = bj;

  bc[0] = as[8];
  bc[1] = as[9];
  bc[2] = as[10];
  bc[3] = as[11];
  bd[0] = as[12];
  bd[1] = as[13];
  bd[2] = as[14];
  bd[3] = as[15];
  be[0] = at[0];
  be[1] = at[1];
  be[2] = at[2];
  be[3] = at[3];
  bf[0] = at[4];
  bf[1] = at[5];
  bf[2] = at[6];
  bf[3] = at[7];

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += bk;
  bh += bl;
  bi += bm;
  bj += bn;

  bk = bg;
  bl = bh;
  bm = bi;
  bn = bj;

  bc[0] = at[8];
  bc[1] = at[9];
  bc[2] = at[10];
  bc[3] = at[11];
  bd[0] = at[12];
  bd[1] = at[13];
  bd[2] = at[14];
  bd[3] = at[15];
  be[0] = au[0];
  be[1] = au[1];
  be[2] = au[2];
  be[3] = au[3];
  bf[0] = au[4];
  bf[1] = au[5];
  bf[2] = av * 8;
  bf[3] = 0;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += bk;
  bh += bl;
  bi += bm;
  bj += bn;

  {
    if (((bg) == am[0]) && ((bj) == am[1]) && ((bi) == am[2]) && ((bh) == am[3])) {
      const u32 bo = ai + 0;
      if (atomic_add(&v[bo], 1) == 0) {
        AA(t, y, ad, 0, bo, ak, ax);
      }
    }
  };
}
}

void CE(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am[4] =
ai[ai[ai[ai[1]
};

const u32 an = x[ad].salt_len;

const u32 ao = an + e;

u32 ap[16];
u32 aq[16];

ap[0] = x[ad].salt_buf[0];
ap[1] = x[ad].salt_buf[1];
ap[2] = x[ad].salt_buf[2];
ap[3] = x[ad].salt_buf[3];
ap[4] = x[ad].salt_buf[4];
ap[5] = x[ad].salt_buf[5];
ap[6] = x[ad].salt_buf[6];
ap[7] = x[ad].salt_buf[7];
ap[8] = x[ad].salt_buf[8];
ap[9] = x[ad].salt_buf[9];
ap[10] = x[ad].salt_buf[10];
ap[11] = x[ad].salt_buf[11];
ap[12] = x[ad].salt_buf[12];
ap[13] = x[ad].salt_buf[13];
ap[14] = x[ad].salt_buf[14];
ap[15] = x[ad].salt_buf[15];
aq[0] = x[ad].salt_buf[16];
aq[1] = x[ad].salt_buf[17];
aq[2] = x[ad].salt_buf[18];
aq[3] = x[ad].salt_buf[19];
aq[4] = x[ad].salt_buf[20];
aq[5] = x[ad].salt_buf[21];
aq[6] = x[ad].salt_buf[22];
aq[7] = x[ad].salt_buf[23];
aq[8] = x[ad].salt_buf[24];
aq[9] = x[ad].salt_buf[25];
aq[10] = x[ad].salt_buf[26];
aq[11] = x[ad].salt_buf[27];
aq[12] = x[ad].salt_buf[28];
aq[13] = x[ad].salt_buf[29];
aq[14] = 0;
aq[15] = 0;

const u32 ar = x[ad].esalt_len;

u32 as[16];
u32 at[16];

as[0] = x[ad].esalt_buf[0];
as[1] = x[ad].esalt_buf[1];
as[2] = x[ad].esalt_buf[2];
as[3] = x[ad].esalt_buf[3];
as[4] = x[ad].esalt_buf[4];
as[5] = x[ad].esalt_buf[5];
as[6] = x[ad].esalt_buf[6];
as[7] = x[ad].esalt_buf[7];
as[8] = x[ad].esalt_buf[8];
as[9] = x[ad].esalt_buf[9];
as[10] = x[ad].esalt_buf[10];
as[11] = x[ad].esalt_buf[11];
as[12] = x[ad].esalt_buf[12];
as[13] = x[ad].esalt_buf[13];
as[14] = x[ad].esalt_buf[14];
as[15] = x[ad].esalt_buf[15];
at[0] = x[ad].esalt_buf[16];
at[1] = x[ad].esalt_buf[17];
at[2] = x[ad].esalt_buf[18];
at[3] = x[ad].esalt_buf[19];
at[4] = x[ad].esalt_buf[20];
at[5] = x[ad].esalt_buf[21];
at[6] = x[ad].esalt_buf[22];
at[7] = x[ad].esalt_buf[23];
at[8] = x[ad].esalt_buf[24];
at[9] = x[ad].esalt_buf[25];
at[10] = x[ad].esalt_buf[26];
at[11] = x[ad].esalt_buf[27];
at[12] = x[ad].esalt_buf[28];
at[13] = x[ad].esalt_buf[29];
at[14] = x[ad].esalt_buf[30];
at[15] = x[ad].esalt_buf[31];

const u32 au = 32 + ar;

u32 av = a[0];

for (u32 aw = 0; aw < ag; aw += 1) {
  const u32x ax = BU(i, aw);

  const u32x ay = av | ax;

  u32x az[16];
  u32x ba[16];

  az[0] = ap[0];
  az[1] = ap[1];
  az[2] = ap[2];
  az[3] = ap[3];
  az[4] = ap[4];
  az[5] = ap[5];
  az[6] = ap[6];
  az[7] = ap[7];
  az[8] = ap[8];
  az[9] = ap[9];
  az[10] = ap[10];
  az[11] = ap[11];
  az[12] = ap[12];
  az[13] = ap[13];
  az[14] = ap[14];
  az[15] = ap[15];
  ba[0] = aq[0];
  ba[1] = aq[1];
  ba[2] = aq[2];
  ba[3] = aq[3];
  ba[4] = aq[4];
  ba[5] = aq[5];
  ba[6] = aq[6];
  ba[7] = aq[7];
  ba[8] = aq[8];
  ba[9] = aq[9];
  ba[10] = aq[10];
  ba[11] = aq[11];
  ba[12] = aq[12];
  ba[13] = aq[13];
  ba[14] = aq[14];
  ba[15] = aq[15];

  u32x bb[4];
  u32x bc[4];
  u32x bd[4];
  u32x be[4];

  bb[0] = ay;
  bb[1] = a[1];
  bb[2] = a[2];
  bb[3] = a[3];
  bc[0] = b[0];
  bc[1] = b[1];
  bc[2] = b[2];
  bc[3] = b[3];
  bd[0] = c[0];
  bd[1] = c[1];
  bd[2] = c[2];
  bd[3] = c[3];
  be[0] = d[0];
  be[1] = d[1];
  be[2] = d[2];
  be[3] = d[3];

  BX(az, ba, an, bb, bc, bd, be, e);

  bb[0] = az[0];
  bb[1] = az[1];
  bb[2] = az[2];
  bb[3] = az[3];
  bc[0] = az[4];
  bc[1] = az[5];
  bc[2] = az[6];
  bc[3] = az[7];
  bd[0] = az[8];
  bd[1] = az[9];
  bd[2] = az[10];
  bd[3] = az[11];
  be[0] = az[12];
  be[1] = az[13];
  be[2] = az[14];
  be[3] = az[15];

  u32x bf = 0x67452301u;
  u32x bg = 0xefcdab89u;
  u32x bh = 0x98badcfeu;
  u32x bi = 0x10325476u;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += 0x67452301u;
  bg += 0xefcdab89u;
  bh += 0x98badcfeu;
  bi += 0x10325476u;

  u32x bj = bf;
  u32x bk = bg;
  u32x bl = bh;
  u32x bm = bi;

  bb[0] = ba[0];
  bb[1] = ba[1];
  bb[2] = ba[2];
  bb[3] = ba[3];
  bc[0] = ba[4];
  bc[1] = ba[5];
  bc[2] = ba[6];
  bc[3] = ba[7];
  bd[0] = ba[8];
  bd[1] = ba[9];
  bd[2] = ba[10];
  bd[3] = ba[11];
  be[0] = ba[12];
  be[1] = ba[13];
  be[2] = ao * 8;
  be[3] = 0;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += bj;
  bg += bk;
  bh += bl;
  bi += bm;

  bb[0] = (u32x)(aj[((bf >> 0) & 255)]) << 0 | (u32x)(aj[((bf >> 8) & 255)]) << 16;
  bb[1] = (u32x)(aj[((bf >> 16) & 255)]) << 0 | (u32x)(aj[((bf >> 24) & 255)]) << 16;
  bb[2] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
  bb[3] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
  bc[0] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
  bc[1] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
  bc[2] = (u32x)(aj[((bi >> 0) & 255)]) << 0 | (u32x)(aj[((bi >> 8) & 255)]) << 16;
  bc[3] = (u32x)(aj[((bi >> 16) & 255)]) << 0 | (u32x)(aj[((bi >> 24) & 255)]) << 16;
  bd[0] = as[0];
  bd[1] = as[1];
  bd[2] = as[2];
  bd[3] = as[3];
  be[0] = as[4];
  be[1] = as[5];
  be[2] = as[6];
  be[3] = as[7];

  bf = 0x67452301u;
  bg = 0xefcdab89u;
  bh = 0x98badcfeu;
  bi = 0x10325476u;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += 0x67452301u;
  bg += 0xefcdab89u;
  bh += 0x98badcfeu;
  bi += 0x10325476u;

  bj = bf;
  bk = bg;
  bl = bh;
  bm = bi;

  bb[0] = as[8];
  bb[1] = as[9];
  bb[2] = as[10];
  bb[3] = as[11];
  bc[0] = as[12];
  bc[1] = as[13];
  bc[2] = as[14];
  bc[3] = as[15];
  bd[0] = at[0];
  bd[1] = at[1];
  bd[2] = at[2];
  bd[3] = at[3];
  be[0] = at[4];
  be[1] = at[5];
  be[2] = au * 8;
  be[3] = 0;

  {
    bf += 0xd76aa478u;
    bf += bb[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xe8c7b756u;
    bi += bb[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0x242070dbu;
    bh += bb[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xc1bdceeeu;
    bg += bb[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0xf57c0fafu;
    bf += bc[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x4787c62au;
    bi += bc[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa8304613u;
    bh += bc[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0xfd469501u;
    bg += bc[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x698098d8u;
    bf += bd[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0x8b44f7afu;
    bi += bd[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xffff5bb1u;
    bh += bd[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x895cd7beu;
    bg += bd[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };
  {
    bf += 0x6b901122u;
    bf += be[0];
    bf += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bf = P(bf, 7u);
    bf += bg;
  };
  {
    bi += 0xfd987193u;
    bi += be[1];
    bi += ((((bh)) ^ (((bf)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 12u);
    bi += bf;
  };
  {
    bh += 0xa679438eu;
    bh += be[2];
    bh += ((((bg)) ^ (((bi)) & (((bf)) ^ ((bg))))));
    bh = P(bh, 17u);
    bh += bi;
  };
  {
    bg += 0x49b40821u;
    bg += be[3];
    bg += ((((bf)) ^ (((bh)) & (((bi)) ^ ((bf))))));
    bg = P(bg, 22u);
    bg += bh;
  };

  {
    bf += 0xf61e2562u;
    bf += bb[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc040b340u;
    bi += bc[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x265e5a51u;
    bh += bd[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe9b6c7aau;
    bg += bb[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xd62f105du;
    bf += bc[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0x02441453u;
    bi += bd[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xd8a1e681u;
    bh += be[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0xe7d3fbc8u;
    bg += bc[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0x21e1cde6u;
    bf += bd[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xc33707d6u;
    bi += be[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0xf4d50d87u;
    bh += bb[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x455a14edu;
    bg += bd[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };
  {
    bf += 0xa9e3e905u;
    bf += be[1];
    bf += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bf = P(bf, 5u);
    bf += bg;
  };
  {
    bi += 0xfcefa3f8u;
    bi += bb[2];
    bi += ((((bg)) ^ (((bh)) & (((bf)) ^ ((bg))))));
    bi = P(bi, 9u);
    bi += bf;
  };
  {
    bh += 0x676f02d9u;
    bh += bc[3];
    bh += ((((bf)) ^ (((bg)) & (((bi)) ^ ((bf))))));
    bh = P(bh, 14u);
    bh += bi;
  };
  {
    bg += 0x8d2a4c8au;
    bg += be[0];
    bg += ((((bi)) ^ (((bf)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 20u);
    bg += bh;
  };

  {
    bf += 0xfffa3942u;
    bf += bc[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x8771f681u;
    bi += bd[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x6d9d6122u;
    bh += bd[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xfde5380cu;
    bg += be[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xa4beea44u;
    bf += bb[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0x4bdecfa9u;
    bi += bc[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xf6bb4b60u;
    bh += bc[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xbebfbc70u;
    bg += bd[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0x289b7ec6u;
    bf += be[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xeaa127fau;
    bi += bb[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0xd4ef3085u;
    bh += bb[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0x04881d05u;
    bg += bc[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };
  {
    bf += 0xd9d4d039u;
    bf += bd[1];
    bf += ((bg) ^ (bh) ^ (bi));
    bf = P(bf, 4u);
    bf += bg;
  };
  {
    bi += 0xe6db99e5u;
    bi += be[0];
    bi += ((bf) ^ (bg) ^ (bh));
    bi = P(bi, 11u);
    bi += bf;
  };
  {
    bh += 0x1fa27cf8u;
    bh += be[3];
    bh += ((bi) ^ (bf) ^ (bg));
    bh = P(bh, 16u);
    bh += bi;
  };
  {
    bg += 0xc4ac5665u;
    bg += bb[2];
    bg += ((bh) ^ (bi) ^ (bf));
    bg = P(bg, 23u);
    bg += bh;
  };

  {
    bf += 0xf4292244u;
    bf += bb[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x432aff97u;
    bi += bc[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xab9423a7u;
    bh += be[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xfc93a039u;
    bg += bc[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x655b59c3u;
    bf += be[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0x8f0ccc92u;
    bi += bb[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xffeff47du;
    bh += bd[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x85845dd1u;
    bg += bb[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0x6fa87e4fu;
    bf += bd[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xfe2ce6e0u;
    bi += be[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0xa3014314u;
    bh += bc[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0x4e0811a1u;
    bg += be[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };
  {
    bf += 0xf7537e82u;
    bf += bc[0];
    bf += ((bh) ^ ((bg) | ~(bi)));
    bf = P(bf, 6u);
    bf += bg;
  };
  {
    bi += 0xbd3af235u;
    bi += bd[3];
    bi += ((bg) ^ ((bf) | ~(bh)));
    bi = P(bi, 10u);
    bi += bf;
  };
  {
    bh += 0x2ad7d2bbu;
    bh += bb[2];
    bh += ((bf) ^ ((bi) | ~(bg)));
    bh = P(bh, 15u);
    bh += bi;
  };
  {
    bg += 0xeb86d391u;
    bg += bd[1];
    bg += ((bi) ^ ((bh) | ~(bf)));
    bg = P(bg, 21u);
    bg += bh;
  };

  bf += bj;
  bg += bk;
  bh += bl;
  bi += bm;

  {
    if (((bf) == am[0]) && ((bi) == am[1]) && ((bh) == am[2]) && ((bg) == am[3])) {
      const u32 bn = ai + 0;
      if (atomic_add(&v[bn], 1) == 0) {
        AA(t, y, ad, 0, bn, ak, aw);
      }
    }
  };
}
}

void CF(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e, __global pw_t* f, __global kernel_rule_t* g, __global comb_t* h, __global bf_t* i, __global void* j, __global void* k, __global u32* l, __global u32* m, __global u32* n, __global u32* o, __global u32* p, __global u32* q, __global u32* r, __global u32* s, __global plain_t* t, __global digest_t* u, __global u32* v, __global salt_t* w, __global sip_t* x, __global u32* y, __global u32* z, const u32 aa, const u32 ab, const u32 ac,
        const u32 ad, const u32 ae, const u32 af, const u32 ag, const u32 ah, const u32 ai, __local u32* aj) {
  const u32 ak = get_global_id(0);
  const u32 al = get_local_id(0);

  const u32 am[4] =
ai[ai[ai[ai[1]
};

const u32 an = x[ad].salt_len;

const u32 ao = an + e;

u32 ap[16];
u32 aq[16];

ap[0] = x[ad].salt_buf[0];
ap[1] = x[ad].salt_buf[1];
ap[2] = x[ad].salt_buf[2];
ap[3] = x[ad].salt_buf[3];
ap[4] = x[ad].salt_buf[4];
ap[5] = x[ad].salt_buf[5];
ap[6] = x[ad].salt_buf[6];
ap[7] = x[ad].salt_buf[7];
ap[8] = x[ad].salt_buf[8];
ap[9] = x[ad].salt_buf[9];
ap[10] = x[ad].salt_buf[10];
ap[11] = x[ad].salt_buf[11];
ap[12] = x[ad].salt_buf[12];
ap[13] = x[ad].salt_buf[13];
ap[14] = x[ad].salt_buf[14];
ap[15] = x[ad].salt_buf[15];
aq[0] = x[ad].salt_buf[16];
aq[1] = x[ad].salt_buf[17];
aq[2] = x[ad].salt_buf[18];
aq[3] = x[ad].salt_buf[19];
aq[4] = x[ad].salt_buf[20];
aq[5] = x[ad].salt_buf[21];
aq[6] = x[ad].salt_buf[22];
aq[7] = x[ad].salt_buf[23];
aq[8] = x[ad].salt_buf[24];
aq[9] = x[ad].salt_buf[25];
aq[10] = x[ad].salt_buf[26];
aq[11] = x[ad].salt_buf[27];
aq[12] = x[ad].salt_buf[28];
aq[13] = x[ad].salt_buf[29];
aq[14] = 0;
aq[15] = 0;

const u32 ar = x[ad].esalt_len;

u32 as[16];
u32 at[16];
u32 au[16];

as[0] = x[ad].esalt_buf[0];
as[1] = x[ad].esalt_buf[1];
as[2] = x[ad].esalt_buf[2];
as[3] = x[ad].esalt_buf[3];
as[4] = x[ad].esalt_buf[4];
as[5] = x[ad].esalt_buf[5];
as[6] = x[ad].esalt_buf[6];
as[7] = x[ad].esalt_buf[7];
as[8] = x[ad].esalt_buf[8];
as[9] = x[ad].esalt_buf[9];
as[10] = x[ad].esalt_buf[10];
as[11] = x[ad].esalt_buf[11];
as[12] = x[ad].esalt_buf[12];
as[13] = x[ad].esalt_buf[13];
as[14] = x[ad].esalt_buf[14];
as[15] = x[ad].esalt_buf[15];
at[0] = x[ad].esalt_buf[16];
at[1] = x[ad].esalt_buf[17];
at[2] = x[ad].esalt_buf[18];
at[3] = x[ad].esalt_buf[19];
at[4] = x[ad].esalt_buf[20];
at[5] = x[ad].esalt_buf[21];
at[6] = x[ad].esalt_buf[22];
at[7] = x[ad].esalt_buf[23];
at[8] = x[ad].esalt_buf[24];
at[9] = x[ad].esalt_buf[25];
at[10] = x[ad].esalt_buf[26];
at[11] = x[ad].esalt_buf[27];
at[12] = x[ad].esalt_buf[28];
at[13] = x[ad].esalt_buf[29];
at[14] = x[ad].esalt_buf[30];
at[15] = x[ad].esalt_buf[31];
au[0] = x[ad].esalt_buf[32];
au[1] = x[ad].esalt_buf[33];
au[2] = x[ad].esalt_buf[34];
au[3] = x[ad].esalt_buf[35];
au[4] = x[ad].esalt_buf[36];
au[5] = x[ad].esalt_buf[37];
au[6] = 0;
au[7] = 0;
au[8] = 0;
au[9] = 0;
au[10] = 0;
au[11] = 0;
au[12] = 0;
au[13] = 0;
au[14] = 0;
au[15] = 0;

const u32 av = 32 + ar;

u32 aw = a[0];

for (u32 ax = 0; ax < ag; ax += 1) {
  const u32x ay = BU(i, ax);

  const u32x az = aw | ay;

  u32x ba[16];
  u32x bb[16];

  ba[0] = ap[0];
  ba[1] = ap[1];
  ba[2] = ap[2];
  ba[3] = ap[3];
  ba[4] = ap[4];
  ba[5] = ap[5];
  ba[6] = ap[6];
  ba[7] = ap[7];
  ba[8] = ap[8];
  ba[9] = ap[9];
  ba[10] = ap[10];
  ba[11] = ap[11];
  ba[12] = ap[12];
  ba[13] = ap[13];
  ba[14] = ap[14];
  ba[15] = ap[15];
  bb[0] = aq[0];
  bb[1] = aq[1];
  bb[2] = aq[2];
  bb[3] = aq[3];
  bb[4] = aq[4];
  bb[5] = aq[5];
  bb[6] = aq[6];
  bb[7] = aq[7];
  bb[8] = aq[8];
  bb[9] = aq[9];
  bb[10] = aq[10];
  bb[11] = aq[11];
  bb[12] = aq[12];
  bb[13] = aq[13];
  bb[14] = aq[14];
  bb[15] = aq[15];

  u32x bc[4];
  u32x bd[4];
  u32x be[4];
  u32x bf[4];

  bc[0] = az;
  bc[1] = a[1];
  bc[2] = a[2];
  bc[3] = a[3];
  bd[0] = b[0];
  bd[1] = b[1];
  bd[2] = b[2];
  bd[3] = b[3];
  be[0] = c[0];
  be[1] = c[1];
  be[2] = c[2];
  be[3] = c[3];
  bf[0] = d[0];
  bf[1] = d[1];
  bf[2] = d[2];
  bf[3] = d[3];

  BX(ba, bb, an, bc, bd, be, bf, e);

  bc[0] = ba[0];
  bc[1] = ba[1];
  bc[2] = ba[2];
  bc[3] = ba[3];
  bd[0] = ba[4];
  bd[1] = ba[5];
  bd[2] = ba[6];
  bd[3] = ba[7];
  be[0] = ba[8];
  be[1] = ba[9];
  be[2] = ba[10];
  be[3] = ba[11];
  bf[0] = ba[12];
  bf[1] = ba[13];
  bf[2] = ba[14];
  bf[3] = ba[15];

  u32x bg = 0x67452301u;
  u32x bh = 0xefcdab89u;
  u32x bi = 0x98badcfeu;
  u32x bj = 0x10325476u;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += 0x67452301u;
  bh += 0xefcdab89u;
  bi += 0x98badcfeu;
  bj += 0x10325476u;

  u32x bk = bg;
  u32x bl = bh;
  u32x bm = bi;
  u32x bn = bj;

  bc[0] = bb[0];
  bc[1] = bb[1];
  bc[2] = bb[2];
  bc[3] = bb[3];
  bd[0] = bb[4];
  bd[1] = bb[5];
  bd[2] = bb[6];
  bd[3] = bb[7];
  be[0] = bb[8];
  be[1] = bb[9];
  be[2] = bb[10];
  be[3] = bb[11];
  bf[0] = bb[12];
  bf[1] = bb[13];
  bf[2] = ao * 8;
  bf[3] = 0;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += bk;
  bh += bl;
  bi += bm;
  bj += bn;

  bc[0] = (u32x)(aj[((bg >> 0) & 255)]) << 0 | (u32x)(aj[((bg >> 8) & 255)]) << 16;
  bc[1] = (u32x)(aj[((bg >> 16) & 255)]) << 0 | (u32x)(aj[((bg >> 24) & 255)]) << 16;
  bc[2] = (u32x)(aj[((bh >> 0) & 255)]) << 0 | (u32x)(aj[((bh >> 8) & 255)]) << 16;
  bc[3] = (u32x)(aj[((bh >> 16) & 255)]) << 0 | (u32x)(aj[((bh >> 24) & 255)]) << 16;
  bd[0] = (u32x)(aj[((bi >> 0) & 255)]) << 0 | (u32x)(aj[((bi >> 8) & 255)]) << 16;
  bd[1] = (u32x)(aj[((bi >> 16) & 255)]) << 0 | (u32x)(aj[((bi >> 24) & 255)]) << 16;
  bd[2] = (u32x)(aj[((bj >> 0) & 255)]) << 0 | (u32x)(aj[((bj >> 8) & 255)]) << 16;
  bd[3] = (u32x)(aj[((bj >> 16) & 255)]) << 0 | (u32x)(aj[((bj >> 24) & 255)]) << 16;
  be[0] = as[0];
  be[1] = as[1];
  be[2] = as[2];
  be[3] = as[3];
  bf[0] = as[4];
  bf[1] = as[5];
  bf[2] = as[6];
  bf[3] = as[7];

  bg = 0x67452301u;
  bh = 0xefcdab89u;
  bi = 0x98badcfeu;
  bj = 0x10325476u;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += 0x67452301u;
  bh += 0xefcdab89u;
  bi += 0x98badcfeu;
  bj += 0x10325476u;

  bk = bg;
  bl = bh;
  bm = bi;
  bn = bj;

  bc[0] = as[8];
  bc[1] = as[9];
  bc[2] = as[10];
  bc[3] = as[11];
  bd[0] = as[12];
  bd[1] = as[13];
  bd[2] = as[14];
  bd[3] = as[15];
  be[0] = at[0];
  be[1] = at[1];
  be[2] = at[2];
  be[3] = at[3];
  bf[0] = at[4];
  bf[1] = at[5];
  bf[2] = at[6];
  bf[3] = at[7];

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += bk;
  bh += bl;
  bi += bm;
  bj += bn;

  bk = bg;
  bl = bh;
  bm = bi;
  bn = bj;

  bc[0] = at[8];
  bc[1] = at[9];
  bc[2] = at[10];
  bc[3] = at[11];
  bd[0] = at[12];
  bd[1] = at[13];
  bd[2] = at[14];
  bd[3] = at[15];
  be[0] = au[0];
  be[1] = au[1];
  be[2] = au[2];
  be[3] = au[3];
  bf[0] = au[4];
  bf[1] = au[5];
  bf[2] = av * 8;
  bf[3] = 0;

  {
    bg += 0xd76aa478u;
    bg += bc[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xe8c7b756u;
    bj += bc[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0x242070dbu;
    bi += bc[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xc1bdceeeu;
    bh += bc[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0xf57c0fafu;
    bg += bd[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x4787c62au;
    bj += bd[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa8304613u;
    bi += bd[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0xfd469501u;
    bh += bd[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x698098d8u;
    bg += be[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0x8b44f7afu;
    bj += be[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xffff5bb1u;
    bi += be[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x895cd7beu;
    bh += be[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };
  {
    bg += 0x6b901122u;
    bg += bf[0];
    bg += ((((bj)) ^ (((bh)) & (((bi)) ^ ((bj))))));
    bg = P(bg, 7u);
    bg += bh;
  };
  {
    bj += 0xfd987193u;
    bj += bf[1];
    bj += ((((bi)) ^ (((bg)) & (((bh)) ^ ((bi))))));
    bj = P(bj, 12u);
    bj += bg;
  };
  {
    bi += 0xa679438eu;
    bi += bf[2];
    bi += ((((bh)) ^ (((bj)) & (((bg)) ^ ((bh))))));
    bi = P(bi, 17u);
    bi += bj;
  };
  {
    bh += 0x49b40821u;
    bh += bf[3];
    bh += ((((bg)) ^ (((bi)) & (((bj)) ^ ((bg))))));
    bh = P(bh, 22u);
    bh += bi;
  };

  {
    bg += 0xf61e2562u;
    bg += bc[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc040b340u;
    bj += bd[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x265e5a51u;
    bi += be[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe9b6c7aau;
    bh += bc[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xd62f105du;
    bg += bd[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0x02441453u;
    bj += be[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xd8a1e681u;
    bi += bf[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0xe7d3fbc8u;
    bh += bd[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0x21e1cde6u;
    bg += be[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xc33707d6u;
    bj += bf[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0xf4d50d87u;
    bi += bc[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x455a14edu;
    bh += be[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };
  {
    bg += 0xa9e3e905u;
    bg += bf[1];
    bg += ((((bi)) ^ (((bj)) & (((bh)) ^ ((bi))))));
    bg = P(bg, 5u);
    bg += bh;
  };
  {
    bj += 0xfcefa3f8u;
    bj += bc[2];
    bj += ((((bh)) ^ (((bi)) & (((bg)) ^ ((bh))))));
    bj = P(bj, 9u);
    bj += bg;
  };
  {
    bi += 0x676f02d9u;
    bi += bd[3];
    bi += ((((bg)) ^ (((bh)) & (((bj)) ^ ((bg))))));
    bi = P(bi, 14u);
    bi += bj;
  };
  {
    bh += 0x8d2a4c8au;
    bh += bf[0];
    bh += ((((bj)) ^ (((bg)) & (((bi)) ^ ((bj))))));
    bh = P(bh, 20u);
    bh += bi;
  };

  {
    bg += 0xfffa3942u;
    bg += bd[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x8771f681u;
    bj += be[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x6d9d6122u;
    bi += be[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xfde5380cu;
    bh += bf[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xa4beea44u;
    bg += bc[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0x4bdecfa9u;
    bj += bd[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xf6bb4b60u;
    bi += bd[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xbebfbc70u;
    bh += be[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0x289b7ec6u;
    bg += bf[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xeaa127fau;
    bj += bc[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0xd4ef3085u;
    bi += bc[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0x04881d05u;
    bh += bd[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };
  {
    bg += 0xd9d4d039u;
    bg += be[1];
    bg += ((bh) ^ (bi) ^ (bj));
    bg = P(bg, 4u);
    bg += bh;
  };
  {
    bj += 0xe6db99e5u;
    bj += bf[0];
    bj += ((bg) ^ (bh) ^ (bi));
    bj = P(bj, 11u);
    bj += bg;
  };
  {
    bi += 0x1fa27cf8u;
    bi += bf[3];
    bi += ((bj) ^ (bg) ^ (bh));
    bi = P(bi, 16u);
    bi += bj;
  };
  {
    bh += 0xc4ac5665u;
    bh += bc[2];
    bh += ((bi) ^ (bj) ^ (bg));
    bh = P(bh, 23u);
    bh += bi;
  };

  {
    bg += 0xf4292244u;
    bg += bc[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x432aff97u;
    bj += bd[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xab9423a7u;
    bi += bf[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xfc93a039u;
    bh += bd[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x655b59c3u;
    bg += bf[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0x8f0ccc92u;
    bj += bc[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xffeff47du;
    bi += be[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x85845dd1u;
    bh += bc[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0x6fa87e4fu;
    bg += be[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xfe2ce6e0u;
    bj += bf[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0xa3014314u;
    bi += bd[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0x4e0811a1u;
    bh += bf[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };
  {
    bg += 0xf7537e82u;
    bg += bd[0];
    bg += ((bi) ^ ((bh) | ~(bj)));
    bg = P(bg, 6u);
    bg += bh;
  };
  {
    bj += 0xbd3af235u;
    bj += be[3];
    bj += ((bh) ^ ((bg) | ~(bi)));
    bj = P(bj, 10u);
    bj += bg;
  };
  {
    bi += 0x2ad7d2bbu;
    bi += bc[2];
    bi += ((bg) ^ ((bj) | ~(bh)));
    bi = P(bi, 15u);
    bi += bj;
  };
  {
    bh += 0xeb86d391u;
    bh += be[1];
    bh += ((bj) ^ ((bi) | ~(bg)));
    bh = P(bh, 21u);
    bh += bi;
  };

  bg += bk;
  bh += bl;
  bi += bm;
  bj += bn;

  {
    if (((bg) == am[0]) && ((bj) == am[1]) && ((bi) == am[2]) && ((bh) == am[3])) {
      const u32 bo = ai + 0;
      if (atomic_add(&v[bo], 1) == 0) {
        AA(t, y, ad, 0, bo, ak, ax);
      }
    }
  };
}
}

__kernel void CG(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[256];

  for (u32 ak = ah; ak < 256; ak += ai) {
    const u32 al = (ak >> 0) & 15;
    const u32 am = (ak >> 4) & 15;

    aj[ak] = ((al < 10) ? '0' + al : 'a' - 10 + al) << 8 | ((am < 10) ? '0' + am : 'a' - 10 + am) << 0;
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 an[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];

  u32 ao[4];

  ao[0] = 0;
  ao[1] = 0;
  ao[2] = 0;
  ao[3] = 0;

  u32 ap[4];

  ap[0] = 0;
  ap[1] = 0;
  ap[2] = 0;
  ap[3] = 0;

  u32 aq[4];

  aq[0] = 0;
  aq[1] = 0;
  aq[2] = a[ag].i[14];
  aq[3] = 0;

  const u32 ar = a[ag].pw_len;

  const u32 as = s[y].esalt_len;
  const u32 at = s[y].salt_len;

  const u32 au = ((32 + as + 1) > 119);
  const u32 av = ((ar + at) > 55) << 1;

  switch (au | av) {
    case 0:
      BY(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 1:
      BZ(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 2:
      CA(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 3:
      CB(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
  }
}

__kernel void CH(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[256];

  for (u32 ak = ah; ak < 256; ak += ai) {
    const u32 al = (ak >> 0) & 15;
    const u32 am = (ak >> 4) & 15;

    aj[ak] = ((al < 10) ? '0' + al : 'a' - 10 + al) << 8 | ((am < 10) ? '0' + am : 'a' - 10 + am) << 0;
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 an[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];

  u32 ao[4];

  ao[0] = a[ag].i[4];
  ao[1] = a[ag].i[5];
  ao[2] = a[ag].i[6];
  ao[3] = a[ag].i[7];

  u32 ap[4];

  ap[0] = 0;
  ap[1] = 0;
  ap[2] = 0;
  ap[3] = 0;

  u32 aq[4];

  aq[0] = 0;
  aq[1] = 0;
  aq[2] = a[ag].i[14];
  aq[3] = 0;

  const u32 ar = a[ag].pw_len;

  const u32 as = s[y].esalt_len;
  const u32 at = s[y].salt_len;

  const u32 au = ((32 + as + 1) > 119);
  const u32 av = ((ar + at) > 55) << 1;

  switch (au | av) {
    case 0:
      BY(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 1:
      BZ(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 2:
      CA(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 3:
      CB(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
  }
}

__kernel void CI(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[256];

  for (u32 ak = ah; ak < 256; ak += ai) {
    const u32 al = (ak >> 0) & 15;
    const u32 am = (ak >> 4) & 15;

    aj[ak] = ((al < 10) ? '0' + al : 'a' - 10 + al) << 8 | ((am < 10) ? '0' + am : 'a' - 10 + am) << 0;
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 an[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];

  u32 ao[4];

  ao[0] = a[ag].i[4];
  ao[1] = a[ag].i[5];
  ao[2] = a[ag].i[6];
  ao[3] = a[ag].i[7];

  u32 ap[4];

  ap[0] = a[ag].i[8];
  ap[1] = a[ag].i[9];
  ap[2] = a[ag].i[10];
  ap[3] = a[ag].i[11];

  u32 aq[4];

  aq[0] = a[ag].i[12];
  aq[1] = a[ag].i[13];
  aq[2] = a[ag].i[14];
  aq[3] = a[ag].i[15];

  const u32 ar = a[ag].pw_len;

  const u32 as = s[y].esalt_len;
  const u32 at = s[y].salt_len;

  const u32 au = ((32 + as + 1) > 119);
  const u32 av = ((ar + at) > 55) << 1;

  switch (au | av) {
    case 0:
      BY(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 1:
      BZ(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 2:
      CA(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 3:
      CB(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
  }
}

__kernel void CJ(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[256];

  for (u32 ak = ah; ak < 256; ak += ai) {
    const u32 al = (ak >> 0) & 15;
    const u32 am = (ak >> 4) & 15;

    aj[ak] = ((al < 10) ? '0' + al : 'a' - 10 + al) << 8 | ((am < 10) ? '0' + am : 'a' - 10 + am) << 0;
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 an[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];

  u32 ao[4];

  ao[0] = 0;
  ao[1] = 0;
  ao[2] = 0;
  ao[3] = 0;

  u32 ap[4];

  ap[0] = 0;
  ap[1] = 0;
  ap[2] = 0;
  ap[3] = 0;

  u32 aq[4];

  aq[0] = 0;
  aq[1] = 0;
  aq[2] = a[ag].i[14];
  aq[3] = 0;

  const u32 ar = a[ag].pw_len;

  const u32 as = s[y].esalt_len;
  const u32 at = s[y].salt_len;

  const u32 au = ((32 + as + 1) > 119);
  const u32 av = ((ar + at) > 55) << 1;

  switch (au | av) {
    case 0:
      CC(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 1:
      CD(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 2:
      CE(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 3:
      CF(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
  }
}

__kernel void CK(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[256];

  for (u32 ak = ah; ak < 256; ak += ai) {
    const u32 al = (ak >> 0) & 15;
    const u32 am = (ak >> 4) & 15;

    aj[ak] = ((al < 10) ? '0' + al : 'a' - 10 + al) << 8 | ((am < 10) ? '0' + am : 'a' - 10 + am) << 0;
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 an[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];

  u32 ao[4];

  ao[0] = a[ag].i[4];
  ao[1] = a[ag].i[5];
  ao[2] = a[ag].i[6];
  ao[3] = a[ag].i[7];

  u32 ap[4];

  ap[0] = 0;
  ap[1] = 0;
  ap[2] = 0;
  ap[3] = 0;

  u32 aq[4];

  aq[0] = 0;
  aq[1] = 0;
  aq[2] = a[ag].i[14];
  aq[3] = 0;

  const u32 ar = a[ag].pw_len;

  const u32 as = s[y].esalt_len;
  const u32 at = s[y].salt_len;

  const u32 au = ((32 + as + 1) > 119);
  const u32 av = ((ar + at) > 55) << 1;

  switch (au | av) {
    case 0:
      CC(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 1:
      CD(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 2:
      CE(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 3:
      CF(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
  }
}

__kernel void CL(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_global_id(0);
  const u32 ah = get_local_id(0);
  const u32 ai = get_local_size(0);

  __local u32 aj[256];

  for (u32 ak = ah; ak < 256; ak += ai) {
    const u32 al = (ak >> 0) & 15;
    const u32 am = (ak >> 4) & 15;

    aj[ak] = ((al < 10) ? '0' + al : 'a' - 10 + al) << 8 | ((am < 10) ? '0' + am : 'a' - 10 + am) << 0;
  }

  barrier(1);

  if (ag >= af)
    return;

  u32 an[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];

  u32 ao[4];

  ao[0] = a[ag].i[4];
  ao[1] = a[ag].i[5];
  ao[2] = a[ag].i[6];
  ao[3] = a[ag].i[7];

  u32 ap[4];

  ap[0] = a[ag].i[8];
  ap[1] = a[ag].i[9];
  ap[2] = a[ag].i[10];
  ap[3] = a[ag].i[11];

  u32 aq[4];

  aq[0] = a[ag].i[12];
  aq[1] = a[ag].i[13];
  aq[2] = a[ag].i[14];
  aq[3] = a[ag].i[15];

  const u32 ar = a[ag].pw_len;

  const u32 as = s[y].esalt_len;
  const u32 at = s[y].salt_len;

  const u32 au = ((32 + as + 1) > 119);
  const u32 av = ((ar + at) > 55) << 1;

  switch (au | av) {
    case 0:
      CC(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 1:
      CD(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 2:
      CE(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
    case 3:
      CF(an, ao, ap, aq, ar, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, aj);
      break;
  }
}