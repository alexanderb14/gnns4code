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

__kernel void BY(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
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
  u32 ao[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];
  ao[0] = a[ag].i[4];
  ao[1] = a[ag].i[5];
  ao[2] = a[ag].i[6];
  ao[3] = a[ag].i[7];

  const u32 ap = a[ag].pw_len;

  const u32 aq = s[y].salt_len;

  u32 ar[16];
  u32 as[16];

  ar[0] = s[y].salt_buf[0];
  ar[1] = s[y].salt_buf[1];
  ar[2] = s[y].salt_buf[2];
  ar[3] = s[y].salt_buf[3];
  ar[4] = s[y].salt_buf[4];
  ar[5] = s[y].salt_buf[5];
  ar[6] = s[y].salt_buf[6];
  ar[7] = s[y].salt_buf[7];
  ar[8] = s[y].salt_buf[8];
  ar[9] = s[y].salt_buf[9];
  ar[10] = s[y].salt_buf[10];
  ar[11] = s[y].salt_buf[11];
  ar[12] = s[y].salt_buf[12];
  ar[13] = s[y].salt_buf[13];
  ar[14] = s[y].salt_buf[14];
  ar[15] = s[y].salt_buf[15];
  as[0] = s[y].salt_buf[16];
  as[1] = s[y].salt_buf[17];
  as[2] = s[y].salt_buf[18];
  as[3] = s[y].salt_buf[19];
  as[4] = s[y].salt_buf[20];
  as[5] = s[y].salt_buf[21];
  as[6] = s[y].salt_buf[22];
  as[7] = s[y].salt_buf[23];
  as[8] = s[y].salt_buf[24];
  as[9] = s[y].salt_buf[25];
  as[10] = s[y].salt_buf[26];
  as[11] = s[y].salt_buf[27];
  as[12] = s[y].salt_buf[28];
  as[13] = s[y].salt_buf[29];
  as[14] = 0;
  as[15] = 0;

  const u32 at = s[y].esalt_len;

  u32 au[16];
  u32 av[16];
  u32 aw[16];

  au[0] = s[y].esalt_buf[0];
  au[1] = s[y].esalt_buf[1];
  au[2] = s[y].esalt_buf[2];
  au[3] = s[y].esalt_buf[3];
  au[4] = s[y].esalt_buf[4];
  au[5] = s[y].esalt_buf[5];
  au[6] = s[y].esalt_buf[6];
  au[7] = s[y].esalt_buf[7];
  au[8] = s[y].esalt_buf[8];
  au[9] = s[y].esalt_buf[9];
  au[10] = s[y].esalt_buf[10];
  au[11] = s[y].esalt_buf[11];
  au[12] = s[y].esalt_buf[12];
  au[13] = s[y].esalt_buf[13];
  au[14] = s[y].esalt_buf[14];
  au[15] = s[y].esalt_buf[15];
  av[0] = s[y].esalt_buf[16];
  av[1] = s[y].esalt_buf[17];
  av[2] = s[y].esalt_buf[18];
  av[3] = s[y].esalt_buf[19];
  av[4] = s[y].esalt_buf[20];
  av[5] = s[y].esalt_buf[21];
  av[6] = s[y].esalt_buf[22];
  av[7] = s[y].esalt_buf[23];
  av[8] = s[y].esalt_buf[24];
  av[9] = s[y].esalt_buf[25];
  av[10] = s[y].esalt_buf[26];
  av[11] = s[y].esalt_buf[27];
  av[12] = s[y].esalt_buf[28];
  av[13] = s[y].esalt_buf[29];
  av[14] = s[y].esalt_buf[30];
  av[15] = s[y].esalt_buf[31];
  aw[0] = s[y].esalt_buf[32];
  aw[1] = s[y].esalt_buf[33];
  aw[2] = s[y].esalt_buf[34];
  aw[3] = s[y].esalt_buf[35];
  aw[4] = s[y].esalt_buf[36];
  aw[5] = s[y].esalt_buf[37];
  aw[6] = 0;
  aw[7] = 0;
  aw[8] = 0;
  aw[9] = 0;
  aw[10] = 0;
  aw[11] = 0;
  aw[12] = 0;
  aw[13] = 0;
  aw[14] = 0;
  aw[15] = 0;

  const u32 ax = 32 + at;
  const u32 ay = ax + 1 - 64;

  for (u32 az = 0; az < ab; az += 1) {
    const u32x ba = BV(c, az);

    const u32x bb = ap + ba;

    u32x bc[4] = {0};
    u32x bd[4] = {0};
    u32x be[4] = {0};
    u32x bf[4] = {0};

    bc[0] = an[0];
    bc[1] = an[1];
    bc[2] = an[2];
    bc[3] = an[3];
    bd[0] = ao[0];
    bd[1] = ao[1];
    bd[2] = ao[2];
    bd[3] = ao[3];

    u32x bg[4] = {0};
    u32x bh[4] = {0};
    u32x bi[4] = {0};
    u32x bj[4] = {0};

    bg[0] = BW(c, az, 0);
    bg[1] = BW(c, az, 1);
    bg[2] = BW(c, az, 2);
    bg[3] = BW(c, az, 3);
    bh[0] = BW(c, az, 4);
    bh[1] = BW(c, az, 5);
    bh[2] = BW(c, az, 6);
    bh[3] = BW(c, az, 7);

    if (ae == 10001) {
      BP(bg, bh, bi, bj, ap);
    } else {
      BP(bc, bd, be, bf, ba);
    }

    u32x bk[4];
    u32x bl[4];
    u32x bm[4];
    u32x bn[4];

    bk[0] = bc[0] | bg[0];
    bk[1] = bc[1] | bg[1];
    bk[2] = bc[2] | bg[2];
    bk[3] = bc[3] | bg[3];
    bl[0] = bd[0] | bh[0];
    bl[1] = bd[1] | bh[1];
    bl[2] = bd[2] | bh[2];
    bl[3] = bd[3] | bh[3];
    bm[0] = be[0] | bi[0];
    bm[1] = be[1] | bi[1];
    bm[2] = be[2] | bi[2];
    bm[3] = be[3] | bi[3];
    bn[0] = bf[0] | bj[0];
    bn[1] = bf[1] | bj[1];
    bn[2] = bf[2] | bj[2];
    bn[3] = bf[3] | bj[3];

    const u32x bo = aq + bb;

    u32x bp[16];
    u32x bq[16];

    bp[0] = ar[0];
    bp[1] = ar[1];
    bp[2] = ar[2];
    bp[3] = ar[3];
    bp[4] = ar[4];
    bp[5] = ar[5];
    bp[6] = ar[6];
    bp[7] = ar[7];
    bp[8] = ar[8];
    bp[9] = ar[9];
    bp[10] = ar[10];
    bp[11] = ar[11];
    bp[12] = ar[12];
    bp[13] = ar[13];
    bp[14] = ar[14];
    bp[15] = ar[15];
    bq[0] = as[0];
    bq[1] = as[1];
    bq[2] = as[2];
    bq[3] = as[3];
    bq[4] = as[4];
    bq[5] = as[5];
    bq[6] = as[6];
    bq[7] = as[7];
    bq[8] = as[8];
    bq[9] = as[9];
    bq[10] = as[10];
    bq[11] = as[11];
    bq[12] = as[12];
    bq[13] = as[13];
    bq[14] = as[14];
    bq[15] = as[15];

    u32 br = 0;

    br = BX(bp, bq, aq, bk, bl, bm, bn, bb);

    u32x bs[4];
    u32x bt[4];
    u32x bu[4];
    u32x bv[4];

    bs[0] = bp[0];
    bs[1] = bp[1];
    bs[2] = bp[2];
    bs[3] = bp[3];
    bt[0] = bp[4];
    bt[1] = bp[5];
    bt[2] = bp[6];
    bt[3] = bp[7];
    bu[0] = bp[8];
    bu[1] = bp[9];
    bu[2] = bp[10];
    bu[3] = bp[11];
    bv[0] = bp[12];
    bv[1] = bp[13];
    bv[2] = bp[14];
    bv[3] = bp[15];

    if (br < 56) {
      bv[2] = bo * 8;
    }

    u32x bw = 0x67452301u;
    u32x bx = 0xefcdab89u;
    u32x by = 0x98badcfeu;
    u32x bz = 0x10325476u;

    {
      bw += 0xd76aa478u;
      bw += bs[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0xe8c7b756u;
      bz += bs[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0x242070dbu;
      by += bs[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0xc1bdceeeu;
      bx += bs[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0xf57c0fafu;
      bw += bt[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0x4787c62au;
      bz += bt[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xa8304613u;
      by += bt[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0xfd469501u;
      bx += bt[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0x698098d8u;
      bw += bu[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0x8b44f7afu;
      bz += bu[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xffff5bb1u;
      by += bu[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0x895cd7beu;
      bx += bu[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0x6b901122u;
      bw += bv[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0xfd987193u;
      bz += bv[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xa679438eu;
      by += bv[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0x49b40821u;
      bx += bv[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };

    {
      bw += 0xf61e2562u;
      bw += bs[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xc040b340u;
      bz += bt[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0x265e5a51u;
      by += bu[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0xe9b6c7aau;
      bx += bs[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0xd62f105du;
      bw += bt[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0x02441453u;
      bz += bu[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0xd8a1e681u;
      by += bv[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0xe7d3fbc8u;
      bx += bt[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0x21e1cde6u;
      bw += bu[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xc33707d6u;
      bz += bv[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0xf4d50d87u;
      by += bs[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0x455a14edu;
      bx += bu[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0xa9e3e905u;
      bw += bv[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xfcefa3f8u;
      bz += bs[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0x676f02d9u;
      by += bt[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0x8d2a4c8au;
      bx += bv[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };

    {
      bw += 0xfffa3942u;
      bw += bt[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0x8771f681u;
      bz += bu[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0x6d9d6122u;
      by += bu[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xfde5380cu;
      bx += bv[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0xa4beea44u;
      bw += bs[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0x4bdecfa9u;
      bz += bt[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0xf6bb4b60u;
      by += bt[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xbebfbc70u;
      bx += bu[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0x289b7ec6u;
      bw += bv[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0xeaa127fau;
      bz += bs[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0xd4ef3085u;
      by += bs[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0x04881d05u;
      bx += bt[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0xd9d4d039u;
      bw += bu[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0xe6db99e5u;
      bz += bv[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0x1fa27cf8u;
      by += bv[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xc4ac5665u;
      bx += bs[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };

    {
      bw += 0xf4292244u;
      bw += bs[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0x432aff97u;
      bz += bt[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xab9423a7u;
      by += bv[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0xfc93a039u;
      bx += bt[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0x655b59c3u;
      bw += bv[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0x8f0ccc92u;
      bz += bs[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xffeff47du;
      by += bu[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0x85845dd1u;
      bx += bs[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0x6fa87e4fu;
      bw += bu[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0xfe2ce6e0u;
      bz += bv[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xa3014314u;
      by += bt[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0x4e0811a1u;
      bx += bv[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0xf7537e82u;
      bw += bt[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0xbd3af235u;
      bz += bu[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0x2ad7d2bbu;
      by += bs[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0xeb86d391u;
      bx += bu[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };

    bw += 0x67452301u;
    bx += 0xefcdab89u;
    by += 0x98badcfeu;
    bz += 0x10325476u;

    if (br > 55) {
      u32x ca = bw;
      u32x cb = bx;
      u32x cc = by;
      u32x cd = bz;

      bs[0] = bq[0];
      bs[1] = bq[1];
      bs[2] = bq[2];
      bs[3] = bq[3];
      bt[0] = bq[4];
      bt[1] = bq[5];
      bt[2] = bq[6];
      bt[3] = bq[7];
      bu[0] = bq[8];
      bu[1] = bq[9];
      bu[2] = bq[10];
      bu[3] = bq[11];
      bv[0] = bq[12];
      bv[1] = bq[13];
      bv[2] = bo * 8;
      bv[3] = 0;

      {
        bw += 0xd76aa478u;
        bw += bs[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0xe8c7b756u;
        bz += bs[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0x242070dbu;
        by += bs[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0xc1bdceeeu;
        bx += bs[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };
      {
        bw += 0xf57c0fafu;
        bw += bt[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0x4787c62au;
        bz += bt[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0xa8304613u;
        by += bt[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0xfd469501u;
        bx += bt[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };
      {
        bw += 0x698098d8u;
        bw += bu[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0x8b44f7afu;
        bz += bu[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0xffff5bb1u;
        by += bu[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0x895cd7beu;
        bx += bu[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };
      {
        bw += 0x6b901122u;
        bw += bv[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0xfd987193u;
        bz += bv[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0xa679438eu;
        by += bv[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0x49b40821u;
        bx += bv[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };

      {
        bw += 0xf61e2562u;
        bw += bs[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0xc040b340u;
        bz += bt[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0x265e5a51u;
        by += bu[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0xe9b6c7aau;
        bx += bs[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };
      {
        bw += 0xd62f105du;
        bw += bt[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0x02441453u;
        bz += bu[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0xd8a1e681u;
        by += bv[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0xe7d3fbc8u;
        bx += bt[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };
      {
        bw += 0x21e1cde6u;
        bw += bu[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0xc33707d6u;
        bz += bv[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0xf4d50d87u;
        by += bs[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0x455a14edu;
        bx += bu[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };
      {
        bw += 0xa9e3e905u;
        bw += bv[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0xfcefa3f8u;
        bz += bs[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0x676f02d9u;
        by += bt[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0x8d2a4c8au;
        bx += bv[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };

      {
        bw += 0xfffa3942u;
        bw += bt[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0x8771f681u;
        bz += bu[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0x6d9d6122u;
        by += bu[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0xfde5380cu;
        bx += bv[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };
      {
        bw += 0xa4beea44u;
        bw += bs[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0x4bdecfa9u;
        bz += bt[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0xf6bb4b60u;
        by += bt[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0xbebfbc70u;
        bx += bu[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };
      {
        bw += 0x289b7ec6u;
        bw += bv[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0xeaa127fau;
        bz += bs[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0xd4ef3085u;
        by += bs[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0x04881d05u;
        bx += bt[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };
      {
        bw += 0xd9d4d039u;
        bw += bu[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0xe6db99e5u;
        bz += bv[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0x1fa27cf8u;
        by += bv[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0xc4ac5665u;
        bx += bs[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };

      {
        bw += 0xf4292244u;
        bw += bs[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0x432aff97u;
        bz += bt[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0xab9423a7u;
        by += bv[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0xfc93a039u;
        bx += bt[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
      {
        bw += 0x655b59c3u;
        bw += bv[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0x8f0ccc92u;
        bz += bs[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0xffeff47du;
        by += bu[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0x85845dd1u;
        bx += bs[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
      {
        bw += 0x6fa87e4fu;
        bw += bu[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0xfe2ce6e0u;
        bz += bv[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0xa3014314u;
        by += bt[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0x4e0811a1u;
        bx += bv[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
      {
        bw += 0xf7537e82u;
        bw += bt[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0xbd3af235u;
        bz += bu[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0x2ad7d2bbu;
        by += bs[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0xeb86d391u;
        bx += bu[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };

      bw += ca;
      bx += cb;
      by += cc;
      bz += cd;
    }

    bs[0] = (u32x)(aj[((bw >> 0) & 255)]) << 0 | (u32x)(aj[((bw >> 8) & 255)]) << 16;
    bs[1] = (u32x)(aj[((bw >> 16) & 255)]) << 0 | (u32x)(aj[((bw >> 24) & 255)]) << 16;
    bs[2] = (u32x)(aj[((bx >> 0) & 255)]) << 0 | (u32x)(aj[((bx >> 8) & 255)]) << 16;
    bs[3] = (u32x)(aj[((bx >> 16) & 255)]) << 0 | (u32x)(aj[((bx >> 24) & 255)]) << 16;
    bt[0] = (u32x)(aj[((by >> 0) & 255)]) << 0 | (u32x)(aj[((by >> 8) & 255)]) << 16;
    bt[1] = (u32x)(aj[((by >> 16) & 255)]) << 0 | (u32x)(aj[((by >> 24) & 255)]) << 16;
    bt[2] = (u32x)(aj[((bz >> 0) & 255)]) << 0 | (u32x)(aj[((bz >> 8) & 255)]) << 16;
    bt[3] = (u32x)(aj[((bz >> 16) & 255)]) << 0 | (u32x)(aj[((bz >> 24) & 255)]) << 16;
    bu[0] = au[0];
    bu[1] = au[1];
    bu[2] = au[2];
    bu[3] = au[3];
    bv[0] = au[4];
    bv[1] = au[5];
    bv[2] = au[6];
    bv[3] = au[7];

    bw = 0x67452301u;
    bx = 0xefcdab89u;
    by = 0x98badcfeu;
    bz = 0x10325476u;

    {
      bw += 0xd76aa478u;
      bw += bs[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0xe8c7b756u;
      bz += bs[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0x242070dbu;
      by += bs[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0xc1bdceeeu;
      bx += bs[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0xf57c0fafu;
      bw += bt[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0x4787c62au;
      bz += bt[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xa8304613u;
      by += bt[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0xfd469501u;
      bx += bt[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0x698098d8u;
      bw += bu[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0x8b44f7afu;
      bz += bu[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xffff5bb1u;
      by += bu[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0x895cd7beu;
      bx += bu[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0x6b901122u;
      bw += bv[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0xfd987193u;
      bz += bv[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xa679438eu;
      by += bv[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0x49b40821u;
      bx += bv[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };

    {
      bw += 0xf61e2562u;
      bw += bs[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xc040b340u;
      bz += bt[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0x265e5a51u;
      by += bu[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0xe9b6c7aau;
      bx += bs[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0xd62f105du;
      bw += bt[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0x02441453u;
      bz += bu[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0xd8a1e681u;
      by += bv[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0xe7d3fbc8u;
      bx += bt[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0x21e1cde6u;
      bw += bu[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xc33707d6u;
      bz += bv[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0xf4d50d87u;
      by += bs[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0x455a14edu;
      bx += bu[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0xa9e3e905u;
      bw += bv[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xfcefa3f8u;
      bz += bs[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0x676f02d9u;
      by += bt[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0x8d2a4c8au;
      bx += bv[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };

    {
      bw += 0xfffa3942u;
      bw += bt[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0x8771f681u;
      bz += bu[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0x6d9d6122u;
      by += bu[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xfde5380cu;
      bx += bv[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0xa4beea44u;
      bw += bs[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0x4bdecfa9u;
      bz += bt[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0xf6bb4b60u;
      by += bt[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xbebfbc70u;
      bx += bu[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0x289b7ec6u;
      bw += bv[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0xeaa127fau;
      bz += bs[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0xd4ef3085u;
      by += bs[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0x04881d05u;
      bx += bt[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0xd9d4d039u;
      bw += bu[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0xe6db99e5u;
      bz += bv[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0x1fa27cf8u;
      by += bv[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xc4ac5665u;
      bx += bs[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };

    {
      bw += 0xf4292244u;
      bw += bs[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0x432aff97u;
      bz += bt[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xab9423a7u;
      by += bv[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0xfc93a039u;
      bx += bt[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0x655b59c3u;
      bw += bv[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0x8f0ccc92u;
      bz += bs[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xffeff47du;
      by += bu[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0x85845dd1u;
      bx += bs[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0x6fa87e4fu;
      bw += bu[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0xfe2ce6e0u;
      bz += bv[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xa3014314u;
      by += bt[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0x4e0811a1u;
      bx += bv[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0xf7537e82u;
      bw += bt[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0xbd3af235u;
      bz += bu[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0x2ad7d2bbu;
      by += bs[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0xeb86d391u;
      bx += bu[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };

    bw += 0x67452301u;
    bx += 0xefcdab89u;
    by += 0x98badcfeu;
    bz += 0x10325476u;

    u32x ca = bw;
    u32x cb = bx;
    u32x cc = by;
    u32x cd = bz;

    bs[0] = au[8];
    bs[1] = au[9];
    bs[2] = au[10];
    bs[3] = au[11];
    bt[0] = au[12];
    bt[1] = au[13];
    bt[2] = au[14];
    bt[3] = au[15];
    bu[0] = av[0];
    bu[1] = av[1];
    bu[2] = av[2];
    bu[3] = av[3];
    bv[0] = av[4];
    bv[1] = av[5];
    bv[2] = av[6];
    bv[3] = av[7];

    if (ay < 56) {
      bv[2] = ax * 8;
    }

    {
      bw += 0xd76aa478u;
      bw += bs[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0xe8c7b756u;
      bz += bs[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0x242070dbu;
      by += bs[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0xc1bdceeeu;
      bx += bs[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0xf57c0fafu;
      bw += bt[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0x4787c62au;
      bz += bt[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xa8304613u;
      by += bt[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0xfd469501u;
      bx += bt[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0x698098d8u;
      bw += bu[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0x8b44f7afu;
      bz += bu[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xffff5bb1u;
      by += bu[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0x895cd7beu;
      bx += bu[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };
    {
      bw += 0x6b901122u;
      bw += bv[0];
      bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      bw = P(bw, 7u);
      bw += bx;
    };
    {
      bz += 0xfd987193u;
      bz += bv[1];
      bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
      bz = P(bz, 12u);
      bz += bw;
    };
    {
      by += 0xa679438eu;
      by += bv[2];
      by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
      by = P(by, 17u);
      by += bz;
    };
    {
      bx += 0x49b40821u;
      bx += bv[3];
      bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
      bx = P(bx, 22u);
      bx += by;
    };

    {
      bw += 0xf61e2562u;
      bw += bs[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xc040b340u;
      bz += bt[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0x265e5a51u;
      by += bu[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0xe9b6c7aau;
      bx += bs[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0xd62f105du;
      bw += bt[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0x02441453u;
      bz += bu[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0xd8a1e681u;
      by += bv[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0xe7d3fbc8u;
      bx += bt[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0x21e1cde6u;
      bw += bu[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xc33707d6u;
      bz += bv[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0xf4d50d87u;
      by += bs[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0x455a14edu;
      bx += bu[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };
    {
      bw += 0xa9e3e905u;
      bw += bv[1];
      bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      bw = P(bw, 5u);
      bw += bx;
    };
    {
      bz += 0xfcefa3f8u;
      bz += bs[2];
      bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
      bz = P(bz, 9u);
      bz += bw;
    };
    {
      by += 0x676f02d9u;
      by += bt[3];
      by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
      by = P(by, 14u);
      by += bz;
    };
    {
      bx += 0x8d2a4c8au;
      bx += bv[0];
      bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
      bx = P(bx, 20u);
      bx += by;
    };

    {
      bw += 0xfffa3942u;
      bw += bt[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0x8771f681u;
      bz += bu[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0x6d9d6122u;
      by += bu[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xfde5380cu;
      bx += bv[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0xa4beea44u;
      bw += bs[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0x4bdecfa9u;
      bz += bt[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0xf6bb4b60u;
      by += bt[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xbebfbc70u;
      bx += bu[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0x289b7ec6u;
      bw += bv[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0xeaa127fau;
      bz += bs[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0xd4ef3085u;
      by += bs[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0x04881d05u;
      bx += bt[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };
    {
      bw += 0xd9d4d039u;
      bw += bu[1];
      bw += ((bx) ^ (by) ^ (bz));
      bw = P(bw, 4u);
      bw += bx;
    };
    {
      bz += 0xe6db99e5u;
      bz += bv[0];
      bz += ((bw) ^ (bx) ^ (by));
      bz = P(bz, 11u);
      bz += bw;
    };
    {
      by += 0x1fa27cf8u;
      by += bv[3];
      by += ((bz) ^ (bw) ^ (bx));
      by = P(by, 16u);
      by += bz;
    };
    {
      bx += 0xc4ac5665u;
      bx += bs[2];
      bx += ((by) ^ (bz) ^ (bw));
      bx = P(bx, 23u);
      bx += by;
    };

    {
      bw += 0xf4292244u;
      bw += bs[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0x432aff97u;
      bz += bt[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xab9423a7u;
      by += bv[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0xfc93a039u;
      bx += bt[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0x655b59c3u;
      bw += bv[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0x8f0ccc92u;
      bz += bs[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xffeff47du;
      by += bu[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0x85845dd1u;
      bx += bs[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0x6fa87e4fu;
      bw += bu[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0xfe2ce6e0u;
      bz += bv[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0xa3014314u;
      by += bt[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0x4e0811a1u;
      bx += bv[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };
    {
      bw += 0xf7537e82u;
      bw += bt[0];
      bw += ((by) ^ ((bx) | ~(bz)));
      bw = P(bw, 6u);
      bw += bx;
    };
    {
      bz += 0xbd3af235u;
      bz += bu[3];
      bz += ((bx) ^ ((bw) | ~(by)));
      bz = P(bz, 10u);
      bz += bw;
    };
    {
      by += 0x2ad7d2bbu;
      by += bs[2];
      by += ((bw) ^ ((bz) | ~(bx)));
      by = P(by, 15u);
      by += bz;
    };
    {
      bx += 0xeb86d391u;
      bx += bu[1];
      bx += ((bz) ^ ((by) | ~(bw)));
      bx = P(bx, 21u);
      bx += by;
    };

    if (ay > 55) {
      bw += ca;
      bx += cb;
      by += cc;
      bz += cd;

      ca = bw;
      cb = bx;
      cc = by;
      cd = bz;

      bs[0] = av[8];
      bs[1] = av[9];
      bs[2] = av[10];
      bs[3] = av[11];
      bt[0] = av[12];
      bt[1] = av[13];
      bt[2] = av[14];
      bt[3] = av[15];
      bu[0] = aw[0];
      bu[1] = aw[1];
      bu[2] = aw[2];
      bu[3] = aw[3];
      bv[0] = aw[4];
      bv[1] = aw[5];
      bv[2] = ax * 8;
      bv[3] = 0;

      {
        bw += 0xd76aa478u;
        bw += bs[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0xe8c7b756u;
        bz += bs[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0x242070dbu;
        by += bs[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0xc1bdceeeu;
        bx += bs[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };
      {
        bw += 0xf57c0fafu;
        bw += bt[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0x4787c62au;
        bz += bt[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0xa8304613u;
        by += bt[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0xfd469501u;
        bx += bt[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };
      {
        bw += 0x698098d8u;
        bw += bu[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0x8b44f7afu;
        bz += bu[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0xffff5bb1u;
        by += bu[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0x895cd7beu;
        bx += bu[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };
      {
        bw += 0x6b901122u;
        bw += bv[0];
        bw += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
        bw = P(bw, 7u);
        bw += bx;
      };
      {
        bz += 0xfd987193u;
        bz += bv[1];
        bz += ((((by)) ^ (((bw)) & (((bx)) ^ ((by))))));
        bz = P(bz, 12u);
        bz += bw;
      };
      {
        by += 0xa679438eu;
        by += bv[2];
        by += ((((bx)) ^ (((bz)) & (((bw)) ^ ((bx))))));
        by = P(by, 17u);
        by += bz;
      };
      {
        bx += 0x49b40821u;
        bx += bv[3];
        bx += ((((bw)) ^ (((by)) & (((bz)) ^ ((bw))))));
        bx = P(bx, 22u);
        bx += by;
      };

      {
        bw += 0xf61e2562u;
        bw += bs[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0xc040b340u;
        bz += bt[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0x265e5a51u;
        by += bu[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0xe9b6c7aau;
        bx += bs[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };
      {
        bw += 0xd62f105du;
        bw += bt[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0x02441453u;
        bz += bu[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0xd8a1e681u;
        by += bv[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0xe7d3fbc8u;
        bx += bt[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };
      {
        bw += 0x21e1cde6u;
        bw += bu[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0xc33707d6u;
        bz += bv[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0xf4d50d87u;
        by += bs[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0x455a14edu;
        bx += bu[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };
      {
        bw += 0xa9e3e905u;
        bw += bv[1];
        bw += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
        bw = P(bw, 5u);
        bw += bx;
      };
      {
        bz += 0xfcefa3f8u;
        bz += bs[2];
        bz += ((((bx)) ^ (((by)) & (((bw)) ^ ((bx))))));
        bz = P(bz, 9u);
        bz += bw;
      };
      {
        by += 0x676f02d9u;
        by += bt[3];
        by += ((((bw)) ^ (((bx)) & (((bz)) ^ ((bw))))));
        by = P(by, 14u);
        by += bz;
      };
      {
        bx += 0x8d2a4c8au;
        bx += bv[0];
        bx += ((((bz)) ^ (((bw)) & (((by)) ^ ((bz))))));
        bx = P(bx, 20u);
        bx += by;
      };

      {
        bw += 0xfffa3942u;
        bw += bt[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0x8771f681u;
        bz += bu[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0x6d9d6122u;
        by += bu[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0xfde5380cu;
        bx += bv[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };
      {
        bw += 0xa4beea44u;
        bw += bs[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0x4bdecfa9u;
        bz += bt[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0xf6bb4b60u;
        by += bt[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0xbebfbc70u;
        bx += bu[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };
      {
        bw += 0x289b7ec6u;
        bw += bv[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0xeaa127fau;
        bz += bs[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0xd4ef3085u;
        by += bs[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0x04881d05u;
        bx += bt[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };
      {
        bw += 0xd9d4d039u;
        bw += bu[1];
        bw += ((bx) ^ (by) ^ (bz));
        bw = P(bw, 4u);
        bw += bx;
      };
      {
        bz += 0xe6db99e5u;
        bz += bv[0];
        bz += ((bw) ^ (bx) ^ (by));
        bz = P(bz, 11u);
        bz += bw;
      };
      {
        by += 0x1fa27cf8u;
        by += bv[3];
        by += ((bz) ^ (bw) ^ (bx));
        by = P(by, 16u);
        by += bz;
      };
      {
        bx += 0xc4ac5665u;
        bx += bs[2];
        bx += ((by) ^ (bz) ^ (bw));
        bx = P(bx, 23u);
        bx += by;
      };

      {
        bw += 0xf4292244u;
        bw += bs[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0x432aff97u;
        bz += bt[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0xab9423a7u;
        by += bv[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0xfc93a039u;
        bx += bt[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
      {
        bw += 0x655b59c3u;
        bw += bv[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0x8f0ccc92u;
        bz += bs[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0xffeff47du;
        by += bu[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0x85845dd1u;
        bx += bs[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
      {
        bw += 0x6fa87e4fu;
        bw += bu[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0xfe2ce6e0u;
        bz += bv[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0xa3014314u;
        by += bt[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0x4e0811a1u;
        bx += bv[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
      {
        bw += 0xf7537e82u;
        bw += bt[0];
        bw += ((by) ^ ((bx) | ~(bz)));
        bw = P(bw, 6u);
        bw += bx;
      };
      {
        bz += 0xbd3af235u;
        bz += bu[3];
        bz += ((bx) ^ ((bw) | ~(by)));
        bz = P(bz, 10u);
        bz += bw;
      };
      {
        by += 0x2ad7d2bbu;
        by += bs[2];
        by += ((bw) ^ ((bz) | ~(bx)));
        by = P(by, 15u);
        by += bz;
      };
      {
        bx += 0xeb86d391u;
        bx += bu[1];
        bx += ((bz) ^ ((by) | ~(bw)));
        bx = P(bx, 21u);
        bx += by;
      };
    }

    bw += ca;
    bx += cb;
    by += cc;
    bz += cd;

    {
      const u32 ce[4] = {bww, bzz, byy, bxx};
      if (Z(ce, g, h, i, j, k, l, m, n, v, w, x)) {
        int cf = X(ce, ac, &p[ad]);
        if (cf != -1) {
          const u32 cg = ad + cf;
          if (atomic_add(&q[cg], 1) == 0) {
            AA(o, t, y, cf, cg, ag, az);
          }
        }
      }
    };
  }
}

__kernel void BZ(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CA(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
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
  u32 ao[4];

  an[0] = a[ag].i[0];
  an[1] = a[ag].i[1];
  an[2] = a[ag].i[2];
  an[3] = a[ag].i[3];
  ao[0] = a[ag].i[4];
  ao[1] = a[ag].i[5];
  ao[2] = a[ag].i[6];
  ao[3] = a[ag].i[7];

  const u32 ap = a[ag].pw_len;

  const u32 aq = s[y].salt_len;

  u32 ar[16];
  u32 as[16];

  ar[0] = s[y].salt_buf[0];
  ar[1] = s[y].salt_buf[1];
  ar[2] = s[y].salt_buf[2];
  ar[3] = s[y].salt_buf[3];
  ar[4] = s[y].salt_buf[4];
  ar[5] = s[y].salt_buf[5];
  ar[6] = s[y].salt_buf[6];
  ar[7] = s[y].salt_buf[7];
  ar[8] = s[y].salt_buf[8];
  ar[9] = s[y].salt_buf[9];
  ar[10] = s[y].salt_buf[10];
  ar[11] = s[y].salt_buf[11];
  ar[12] = s[y].salt_buf[12];
  ar[13] = s[y].salt_buf[13];
  ar[14] = s[y].salt_buf[14];
  ar[15] = s[y].salt_buf[15];
  as[0] = s[y].salt_buf[16];
  as[1] = s[y].salt_buf[17];
  as[2] = s[y].salt_buf[18];
  as[3] = s[y].salt_buf[19];
  as[4] = s[y].salt_buf[20];
  as[5] = s[y].salt_buf[21];
  as[6] = s[y].salt_buf[22];
  as[7] = s[y].salt_buf[23];
  as[8] = s[y].salt_buf[24];
  as[9] = s[y].salt_buf[25];
  as[10] = s[y].salt_buf[26];
  as[11] = s[y].salt_buf[27];
  as[12] = s[y].salt_buf[28];
  as[13] = s[y].salt_buf[29];
  as[14] = 0;
  as[15] = 0;

  const u32 at = s[y].esalt_len;

  u32 au[16];
  u32 av[16];
  u32 aw[16];

  au[0] = s[y].esalt_buf[0];
  au[1] = s[y].esalt_buf[1];
  au[2] = s[y].esalt_buf[2];
  au[3] = s[y].esalt_buf[3];
  au[4] = s[y].esalt_buf[4];
  au[5] = s[y].esalt_buf[5];
  au[6] = s[y].esalt_buf[6];
  au[7] = s[y].esalt_buf[7];
  au[8] = s[y].esalt_buf[8];
  au[9] = s[y].esalt_buf[9];
  au[10] = s[y].esalt_buf[10];
  au[11] = s[y].esalt_buf[11];
  au[12] = s[y].esalt_buf[12];
  au[13] = s[y].esalt_buf[13];
  au[14] = s[y].esalt_buf[14];
  au[15] = s[y].esalt_buf[15];
  av[0] = s[y].esalt_buf[16];
  av[1] = s[y].esalt_buf[17];
  av[2] = s[y].esalt_buf[18];
  av[3] = s[y].esalt_buf[19];
  av[4] = s[y].esalt_buf[20];
  av[5] = s[y].esalt_buf[21];
  av[6] = s[y].esalt_buf[22];
  av[7] = s[y].esalt_buf[23];
  av[8] = s[y].esalt_buf[24];
  av[9] = s[y].esalt_buf[25];
  av[10] = s[y].esalt_buf[26];
  av[11] = s[y].esalt_buf[27];
  av[12] = s[y].esalt_buf[28];
  av[13] = s[y].esalt_buf[29];
  av[14] = s[y].esalt_buf[30];
  av[15] = s[y].esalt_buf[31];
  aw[0] = s[y].esalt_buf[32];
  aw[1] = s[y].esalt_buf[33];
  aw[2] = s[y].esalt_buf[34];
  aw[3] = s[y].esalt_buf[35];
  aw[4] = s[y].esalt_buf[36];
  aw[5] = s[y].esalt_buf[37];
  aw[6] = 0;
  aw[7] = 0;
  aw[8] = 0;
  aw[9] = 0;
  aw[10] = 0;
  aw[11] = 0;
  aw[12] = 0;
  aw[13] = 0;
  aw[14] = 0;
  aw[15] = 0;

  const u32 ax = 32 + at;
  const u32 ay = ax + 1 - 64;

  const u32 az[4] =
ad[ad[ad[ad[1]
};

for (u32 ba = 0; ba < ab; ba += 1) {
  const u32x bb = BV(c, ba);

  const u32x bc = ap + bb;

  u32x bd[4] = {0};
  u32x be[4] = {0};
  u32x bf[4] = {0};
  u32x bg[4] = {0};

  bd[0] = an[0];
  bd[1] = an[1];
  bd[2] = an[2];
  bd[3] = an[3];
  be[0] = ao[0];
  be[1] = ao[1];
  be[2] = ao[2];
  be[3] = ao[3];

  u32x bh[4] = {0};
  u32x bi[4] = {0};
  u32x bj[4] = {0};
  u32x bk[4] = {0};

  bh[0] = BW(c, ba, 0);
  bh[1] = BW(c, ba, 1);
  bh[2] = BW(c, ba, 2);
  bh[3] = BW(c, ba, 3);
  bi[0] = BW(c, ba, 4);
  bi[1] = BW(c, ba, 5);
  bi[2] = BW(c, ba, 6);
  bi[3] = BW(c, ba, 7);

  if (ae == 10001) {
    BP(bh, bi, bj, bk, ap);
  } else {
    BP(bd, be, bf, bg, bb);
  }

  u32x bl[4];
  u32x bm[4];
  u32x bn[4];
  u32x bo[4];

  bl[0] = bd[0] | bh[0];
  bl[1] = bd[1] | bh[1];
  bl[2] = bd[2] | bh[2];
  bl[3] = bd[3] | bh[3];
  bm[0] = be[0] | bi[0];
  bm[1] = be[1] | bi[1];
  bm[2] = be[2] | bi[2];
  bm[3] = be[3] | bi[3];
  bn[0] = bf[0] | bj[0];
  bn[1] = bf[1] | bj[1];
  bn[2] = bf[2] | bj[2];
  bn[3] = bf[3] | bj[3];
  bo[0] = bg[0] | bk[0];
  bo[1] = bg[1] | bk[1];
  bo[2] = bg[2] | bk[2];
  bo[3] = bg[3] | bk[3];

  const u32x bp = aq + bc;

  u32x bq[16];
  u32x br[16];

  bq[0] = ar[0];
  bq[1] = ar[1];
  bq[2] = ar[2];
  bq[3] = ar[3];
  bq[4] = ar[4];
  bq[5] = ar[5];
  bq[6] = ar[6];
  bq[7] = ar[7];
  bq[8] = ar[8];
  bq[9] = ar[9];
  bq[10] = ar[10];
  bq[11] = ar[11];
  bq[12] = ar[12];
  bq[13] = ar[13];
  bq[14] = ar[14];
  bq[15] = ar[15];
  br[0] = as[0];
  br[1] = as[1];
  br[2] = as[2];
  br[3] = as[3];
  br[4] = as[4];
  br[5] = as[5];
  br[6] = as[6];
  br[7] = as[7];
  br[8] = as[8];
  br[9] = as[9];
  br[10] = as[10];
  br[11] = as[11];
  br[12] = as[12];
  br[13] = as[13];
  br[14] = as[14];
  br[15] = as[15];

  u32 bs = 0;

  bs = BX(bq, br, aq, bl, bm, bn, bo, bc);

  u32x bt[4];
  u32x bu[4];
  u32x bv[4];
  u32x bw[4];

  bt[0] = bq[0];
  bt[1] = bq[1];
  bt[2] = bq[2];
  bt[3] = bq[3];
  bu[0] = bq[4];
  bu[1] = bq[5];
  bu[2] = bq[6];
  bu[3] = bq[7];
  bv[0] = bq[8];
  bv[1] = bq[9];
  bv[2] = bq[10];
  bv[3] = bq[11];
  bw[0] = bq[12];
  bw[1] = bq[13];
  bw[2] = bq[14];
  bw[3] = bq[15];

  if (bs < 56) {
    bw[2] = bp * 8;
  }

  u32x bx = 0x67452301u;
  u32x by = 0xefcdab89u;
  u32x bz = 0x98badcfeu;
  u32x ca = 0x10325476u;

  {
    bx += 0xd76aa478u;
    bx += bt[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0xe8c7b756u;
    ca += bt[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0x242070dbu;
    bz += bt[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0xc1bdceeeu;
    by += bt[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0xf57c0fafu;
    bx += bu[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0x4787c62au;
    ca += bu[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xa8304613u;
    bz += bu[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0xfd469501u;
    by += bu[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0x698098d8u;
    bx += bv[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0x8b44f7afu;
    ca += bv[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xffff5bb1u;
    bz += bv[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0x895cd7beu;
    by += bv[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0x6b901122u;
    bx += bw[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0xfd987193u;
    ca += bw[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xa679438eu;
    bz += bw[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0x49b40821u;
    by += bw[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };

  {
    bx += 0xf61e2562u;
    bx += bt[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xc040b340u;
    ca += bu[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0x265e5a51u;
    bz += bv[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0xe9b6c7aau;
    by += bt[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0xd62f105du;
    bx += bu[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0x02441453u;
    ca += bv[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0xd8a1e681u;
    bz += bw[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0xe7d3fbc8u;
    by += bu[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0x21e1cde6u;
    bx += bv[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xc33707d6u;
    ca += bw[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0xf4d50d87u;
    bz += bt[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0x455a14edu;
    by += bv[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0xa9e3e905u;
    bx += bw[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xfcefa3f8u;
    ca += bt[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0x676f02d9u;
    bz += bu[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0x8d2a4c8au;
    by += bw[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };

  {
    bx += 0xfffa3942u;
    bx += bu[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0x8771f681u;
    ca += bv[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0x6d9d6122u;
    bz += bv[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xfde5380cu;
    by += bw[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0xa4beea44u;
    bx += bt[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0x4bdecfa9u;
    ca += bu[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0xf6bb4b60u;
    bz += bu[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xbebfbc70u;
    by += bv[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0x289b7ec6u;
    bx += bw[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0xeaa127fau;
    ca += bt[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0xd4ef3085u;
    bz += bt[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0x04881d05u;
    by += bu[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0xd9d4d039u;
    bx += bv[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0xe6db99e5u;
    ca += bw[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0x1fa27cf8u;
    bz += bw[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xc4ac5665u;
    by += bt[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };

  {
    bx += 0xf4292244u;
    bx += bt[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0x432aff97u;
    ca += bu[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xab9423a7u;
    bz += bw[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0xfc93a039u;
    by += bu[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0x655b59c3u;
    bx += bw[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0x8f0ccc92u;
    ca += bt[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xffeff47du;
    bz += bv[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0x85845dd1u;
    by += bt[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0x6fa87e4fu;
    bx += bv[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0xfe2ce6e0u;
    ca += bw[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xa3014314u;
    bz += bu[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0x4e0811a1u;
    by += bw[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0xf7537e82u;
    bx += bu[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0xbd3af235u;
    ca += bv[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0x2ad7d2bbu;
    bz += bt[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0xeb86d391u;
    by += bv[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };

  bx += 0x67452301u;
  by += 0xefcdab89u;
  bz += 0x98badcfeu;
  ca += 0x10325476u;

  if (bs > 55) {
    u32x cb = bx;
    u32x cc = by;
    u32x cd = bz;
    u32x ce = ca;

    bt[0] = br[0];
    bt[1] = br[1];
    bt[2] = br[2];
    bt[3] = br[3];
    bu[0] = br[4];
    bu[1] = br[5];
    bu[2] = br[6];
    bu[3] = br[7];
    bv[0] = br[8];
    bv[1] = br[9];
    bv[2] = br[10];
    bv[3] = br[11];
    bw[0] = br[12];
    bw[1] = br[13];
    bw[2] = bp * 8;
    bw[3] = 0;

    {
      bx += 0xd76aa478u;
      bx += bt[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0xe8c7b756u;
      ca += bt[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0x242070dbu;
      bz += bt[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0xc1bdceeeu;
      by += bt[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };
    {
      bx += 0xf57c0fafu;
      bx += bu[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0x4787c62au;
      ca += bu[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0xa8304613u;
      bz += bu[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0xfd469501u;
      by += bu[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };
    {
      bx += 0x698098d8u;
      bx += bv[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0x8b44f7afu;
      ca += bv[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0xffff5bb1u;
      bz += bv[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0x895cd7beu;
      by += bv[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };
    {
      bx += 0x6b901122u;
      bx += bw[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0xfd987193u;
      ca += bw[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0xa679438eu;
      bz += bw[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0x49b40821u;
      by += bw[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };

    {
      bx += 0xf61e2562u;
      bx += bt[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0xc040b340u;
      ca += bu[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0x265e5a51u;
      bz += bv[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0xe9b6c7aau;
      by += bt[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };
    {
      bx += 0xd62f105du;
      bx += bu[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0x02441453u;
      ca += bv[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0xd8a1e681u;
      bz += bw[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0xe7d3fbc8u;
      by += bu[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };
    {
      bx += 0x21e1cde6u;
      bx += bv[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0xc33707d6u;
      ca += bw[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0xf4d50d87u;
      bz += bt[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0x455a14edu;
      by += bv[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };
    {
      bx += 0xa9e3e905u;
      bx += bw[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0xfcefa3f8u;
      ca += bt[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0x676f02d9u;
      bz += bu[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0x8d2a4c8au;
      by += bw[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };

    {
      bx += 0xfffa3942u;
      bx += bu[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0x8771f681u;
      ca += bv[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0x6d9d6122u;
      bz += bv[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0xfde5380cu;
      by += bw[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };
    {
      bx += 0xa4beea44u;
      bx += bt[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0x4bdecfa9u;
      ca += bu[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0xf6bb4b60u;
      bz += bu[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0xbebfbc70u;
      by += bv[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };
    {
      bx += 0x289b7ec6u;
      bx += bw[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0xeaa127fau;
      ca += bt[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0xd4ef3085u;
      bz += bt[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0x04881d05u;
      by += bu[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };
    {
      bx += 0xd9d4d039u;
      bx += bv[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0xe6db99e5u;
      ca += bw[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0x1fa27cf8u;
      bz += bw[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0xc4ac5665u;
      by += bt[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };

    {
      bx += 0xf4292244u;
      bx += bt[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0x432aff97u;
      ca += bu[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0xab9423a7u;
      bz += bw[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0xfc93a039u;
      by += bu[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
    {
      bx += 0x655b59c3u;
      bx += bw[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0x8f0ccc92u;
      ca += bt[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0xffeff47du;
      bz += bv[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0x85845dd1u;
      by += bt[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
    {
      bx += 0x6fa87e4fu;
      bx += bv[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0xfe2ce6e0u;
      ca += bw[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0xa3014314u;
      bz += bu[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0x4e0811a1u;
      by += bw[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
    {
      bx += 0xf7537e82u;
      bx += bu[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0xbd3af235u;
      ca += bv[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0x2ad7d2bbu;
      bz += bt[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0xeb86d391u;
      by += bv[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };

    bx += cb;
    by += cc;
    bz += cd;
    ca += ce;
  }

  bt[0] = (u32x)(aj[((bx >> 0) & 255)]) << 0 | (u32x)(aj[((bx >> 8) & 255)]) << 16;
  bt[1] = (u32x)(aj[((bx >> 16) & 255)]) << 0 | (u32x)(aj[((bx >> 24) & 255)]) << 16;
  bt[2] = (u32x)(aj[((by >> 0) & 255)]) << 0 | (u32x)(aj[((by >> 8) & 255)]) << 16;
  bt[3] = (u32x)(aj[((by >> 16) & 255)]) << 0 | (u32x)(aj[((by >> 24) & 255)]) << 16;
  bu[0] = (u32x)(aj[((bz >> 0) & 255)]) << 0 | (u32x)(aj[((bz >> 8) & 255)]) << 16;
  bu[1] = (u32x)(aj[((bz >> 16) & 255)]) << 0 | (u32x)(aj[((bz >> 24) & 255)]) << 16;
  bu[2] = (u32x)(aj[((ca >> 0) & 255)]) << 0 | (u32x)(aj[((ca >> 8) & 255)]) << 16;
  bu[3] = (u32x)(aj[((ca >> 16) & 255)]) << 0 | (u32x)(aj[((ca >> 24) & 255)]) << 16;
  bv[0] = au[0];
  bv[1] = au[1];
  bv[2] = au[2];
  bv[3] = au[3];
  bw[0] = au[4];
  bw[1] = au[5];
  bw[2] = au[6];
  bw[3] = au[7];

  bx = 0x67452301u;
  by = 0xefcdab89u;
  bz = 0x98badcfeu;
  ca = 0x10325476u;

  {
    bx += 0xd76aa478u;
    bx += bt[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0xe8c7b756u;
    ca += bt[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0x242070dbu;
    bz += bt[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0xc1bdceeeu;
    by += bt[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0xf57c0fafu;
    bx += bu[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0x4787c62au;
    ca += bu[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xa8304613u;
    bz += bu[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0xfd469501u;
    by += bu[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0x698098d8u;
    bx += bv[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0x8b44f7afu;
    ca += bv[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xffff5bb1u;
    bz += bv[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0x895cd7beu;
    by += bv[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0x6b901122u;
    bx += bw[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0xfd987193u;
    ca += bw[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xa679438eu;
    bz += bw[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0x49b40821u;
    by += bw[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };

  {
    bx += 0xf61e2562u;
    bx += bt[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xc040b340u;
    ca += bu[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0x265e5a51u;
    bz += bv[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0xe9b6c7aau;
    by += bt[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0xd62f105du;
    bx += bu[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0x02441453u;
    ca += bv[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0xd8a1e681u;
    bz += bw[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0xe7d3fbc8u;
    by += bu[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0x21e1cde6u;
    bx += bv[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xc33707d6u;
    ca += bw[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0xf4d50d87u;
    bz += bt[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0x455a14edu;
    by += bv[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0xa9e3e905u;
    bx += bw[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xfcefa3f8u;
    ca += bt[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0x676f02d9u;
    bz += bu[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0x8d2a4c8au;
    by += bw[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };

  {
    bx += 0xfffa3942u;
    bx += bu[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0x8771f681u;
    ca += bv[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0x6d9d6122u;
    bz += bv[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xfde5380cu;
    by += bw[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0xa4beea44u;
    bx += bt[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0x4bdecfa9u;
    ca += bu[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0xf6bb4b60u;
    bz += bu[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xbebfbc70u;
    by += bv[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0x289b7ec6u;
    bx += bw[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0xeaa127fau;
    ca += bt[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0xd4ef3085u;
    bz += bt[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0x04881d05u;
    by += bu[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0xd9d4d039u;
    bx += bv[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0xe6db99e5u;
    ca += bw[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0x1fa27cf8u;
    bz += bw[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xc4ac5665u;
    by += bt[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };

  {
    bx += 0xf4292244u;
    bx += bt[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0x432aff97u;
    ca += bu[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xab9423a7u;
    bz += bw[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0xfc93a039u;
    by += bu[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0x655b59c3u;
    bx += bw[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0x8f0ccc92u;
    ca += bt[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xffeff47du;
    bz += bv[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0x85845dd1u;
    by += bt[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0x6fa87e4fu;
    bx += bv[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0xfe2ce6e0u;
    ca += bw[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xa3014314u;
    bz += bu[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0x4e0811a1u;
    by += bw[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0xf7537e82u;
    bx += bu[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0xbd3af235u;
    ca += bv[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0x2ad7d2bbu;
    bz += bt[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0xeb86d391u;
    by += bv[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };

  bx += 0x67452301u;
  by += 0xefcdab89u;
  bz += 0x98badcfeu;
  ca += 0x10325476u;

  u32x cb = bx;
  u32x cc = by;
  u32x cd = bz;
  u32x ce = ca;

  bt[0] = au[8];
  bt[1] = au[9];
  bt[2] = au[10];
  bt[3] = au[11];
  bu[0] = au[12];
  bu[1] = au[13];
  bu[2] = au[14];
  bu[3] = au[15];
  bv[0] = av[0];
  bv[1] = av[1];
  bv[2] = av[2];
  bv[3] = av[3];
  bw[0] = av[4];
  bw[1] = av[5];
  bw[2] = av[6];
  bw[3] = av[7];

  if (ay < 56) {
    bw[2] = ax * 8;
  }

  {
    bx += 0xd76aa478u;
    bx += bt[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0xe8c7b756u;
    ca += bt[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0x242070dbu;
    bz += bt[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0xc1bdceeeu;
    by += bt[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0xf57c0fafu;
    bx += bu[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0x4787c62au;
    ca += bu[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xa8304613u;
    bz += bu[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0xfd469501u;
    by += bu[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0x698098d8u;
    bx += bv[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0x8b44f7afu;
    ca += bv[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xffff5bb1u;
    bz += bv[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0x895cd7beu;
    by += bv[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };
  {
    bx += 0x6b901122u;
    bx += bw[0];
    bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
    bx = P(bx, 7u);
    bx += by;
  };
  {
    ca += 0xfd987193u;
    ca += bw[1];
    ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
    ca = P(ca, 12u);
    ca += bx;
  };
  {
    bz += 0xa679438eu;
    bz += bw[2];
    bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
    bz = P(bz, 17u);
    bz += ca;
  };
  {
    by += 0x49b40821u;
    by += bw[3];
    by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
    by = P(by, 22u);
    by += bz;
  };

  {
    bx += 0xf61e2562u;
    bx += bt[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xc040b340u;
    ca += bu[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0x265e5a51u;
    bz += bv[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0xe9b6c7aau;
    by += bt[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0xd62f105du;
    bx += bu[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0x02441453u;
    ca += bv[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0xd8a1e681u;
    bz += bw[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0xe7d3fbc8u;
    by += bu[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0x21e1cde6u;
    bx += bv[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xc33707d6u;
    ca += bw[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0xf4d50d87u;
    bz += bt[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0x455a14edu;
    by += bv[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };
  {
    bx += 0xa9e3e905u;
    bx += bw[1];
    bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
    bx = P(bx, 5u);
    bx += by;
  };
  {
    ca += 0xfcefa3f8u;
    ca += bt[2];
    ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
    ca = P(ca, 9u);
    ca += bx;
  };
  {
    bz += 0x676f02d9u;
    bz += bu[3];
    bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
    bz = P(bz, 14u);
    bz += ca;
  };
  {
    by += 0x8d2a4c8au;
    by += bw[0];
    by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
    by = P(by, 20u);
    by += bz;
  };

  {
    bx += 0xfffa3942u;
    bx += bu[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0x8771f681u;
    ca += bv[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0x6d9d6122u;
    bz += bv[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xfde5380cu;
    by += bw[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0xa4beea44u;
    bx += bt[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0x4bdecfa9u;
    ca += bu[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0xf6bb4b60u;
    bz += bu[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xbebfbc70u;
    by += bv[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0x289b7ec6u;
    bx += bw[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0xeaa127fau;
    ca += bt[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0xd4ef3085u;
    bz += bt[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0x04881d05u;
    by += bu[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };
  {
    bx += 0xd9d4d039u;
    bx += bv[1];
    bx += ((by) ^ (bz) ^ (ca));
    bx = P(bx, 4u);
    bx += by;
  };
  {
    ca += 0xe6db99e5u;
    ca += bw[0];
    ca += ((bx) ^ (by) ^ (bz));
    ca = P(ca, 11u);
    ca += bx;
  };
  {
    bz += 0x1fa27cf8u;
    bz += bw[3];
    bz += ((ca) ^ (bx) ^ (by));
    bz = P(bz, 16u);
    bz += ca;
  };
  {
    by += 0xc4ac5665u;
    by += bt[2];
    by += ((bz) ^ (ca) ^ (bx));
    by = P(by, 23u);
    by += bz;
  };

  {
    bx += 0xf4292244u;
    bx += bt[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0x432aff97u;
    ca += bu[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xab9423a7u;
    bz += bw[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0xfc93a039u;
    by += bu[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0x655b59c3u;
    bx += bw[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0x8f0ccc92u;
    ca += bt[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xffeff47du;
    bz += bv[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0x85845dd1u;
    by += bt[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0x6fa87e4fu;
    bx += bv[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0xfe2ce6e0u;
    ca += bw[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0xa3014314u;
    bz += bu[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0x4e0811a1u;
    by += bw[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };
  {
    bx += 0xf7537e82u;
    bx += bu[0];
    bx += ((bz) ^ ((by) | ~(ca)));
    bx = P(bx, 6u);
    bx += by;
  };
  {
    ca += 0xbd3af235u;
    ca += bv[3];
    ca += ((by) ^ ((bx) | ~(bz)));
    ca = P(ca, 10u);
    ca += bx;
  };
  {
    bz += 0x2ad7d2bbu;
    bz += bt[2];
    bz += ((bx) ^ ((ca) | ~(by)));
    bz = P(bz, 15u);
    bz += ca;
  };
  {
    by += 0xeb86d391u;
    by += bv[1];
    by += ((ca) ^ ((bz) | ~(bx)));
    by = P(by, 21u);
    by += bz;
  };

  if (ay > 55) {
    bx += cb;
    by += cc;
    bz += cd;
    ca += ce;

    cb = bx;
    cc = by;
    cd = bz;
    ce = ca;

    bt[0] = av[8];
    bt[1] = av[9];
    bt[2] = av[10];
    bt[3] = av[11];
    bu[0] = av[12];
    bu[1] = av[13];
    bu[2] = av[14];
    bu[3] = av[15];
    bv[0] = aw[0];
    bv[1] = aw[1];
    bv[2] = aw[2];
    bv[3] = aw[3];
    bw[0] = aw[4];
    bw[1] = aw[5];
    bw[2] = ax * 8;
    bw[3] = 0;

    {
      bx += 0xd76aa478u;
      bx += bt[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0xe8c7b756u;
      ca += bt[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0x242070dbu;
      bz += bt[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0xc1bdceeeu;
      by += bt[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };
    {
      bx += 0xf57c0fafu;
      bx += bu[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0x4787c62au;
      ca += bu[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0xa8304613u;
      bz += bu[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0xfd469501u;
      by += bu[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };
    {
      bx += 0x698098d8u;
      bx += bv[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0x8b44f7afu;
      ca += bv[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0xffff5bb1u;
      bz += bv[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0x895cd7beu;
      by += bv[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };
    {
      bx += 0x6b901122u;
      bx += bw[0];
      bx += ((((ca)) ^ (((by)) & (((bz)) ^ ((ca))))));
      bx = P(bx, 7u);
      bx += by;
    };
    {
      ca += 0xfd987193u;
      ca += bw[1];
      ca += ((((bz)) ^ (((bx)) & (((by)) ^ ((bz))))));
      ca = P(ca, 12u);
      ca += bx;
    };
    {
      bz += 0xa679438eu;
      bz += bw[2];
      bz += ((((by)) ^ (((ca)) & (((bx)) ^ ((by))))));
      bz = P(bz, 17u);
      bz += ca;
    };
    {
      by += 0x49b40821u;
      by += bw[3];
      by += ((((bx)) ^ (((bz)) & (((ca)) ^ ((bx))))));
      by = P(by, 22u);
      by += bz;
    };

    {
      bx += 0xf61e2562u;
      bx += bt[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0xc040b340u;
      ca += bu[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0x265e5a51u;
      bz += bv[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0xe9b6c7aau;
      by += bt[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };
    {
      bx += 0xd62f105du;
      bx += bu[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0x02441453u;
      ca += bv[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0xd8a1e681u;
      bz += bw[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0xe7d3fbc8u;
      by += bu[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };
    {
      bx += 0x21e1cde6u;
      bx += bv[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0xc33707d6u;
      ca += bw[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0xf4d50d87u;
      bz += bt[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0x455a14edu;
      by += bv[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };
    {
      bx += 0xa9e3e905u;
      bx += bw[1];
      bx += ((((bz)) ^ (((ca)) & (((by)) ^ ((bz))))));
      bx = P(bx, 5u);
      bx += by;
    };
    {
      ca += 0xfcefa3f8u;
      ca += bt[2];
      ca += ((((by)) ^ (((bz)) & (((bx)) ^ ((by))))));
      ca = P(ca, 9u);
      ca += bx;
    };
    {
      bz += 0x676f02d9u;
      bz += bu[3];
      bz += ((((bx)) ^ (((by)) & (((ca)) ^ ((bx))))));
      bz = P(bz, 14u);
      bz += ca;
    };
    {
      by += 0x8d2a4c8au;
      by += bw[0];
      by += ((((ca)) ^ (((bx)) & (((bz)) ^ ((ca))))));
      by = P(by, 20u);
      by += bz;
    };

    {
      bx += 0xfffa3942u;
      bx += bu[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0x8771f681u;
      ca += bv[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0x6d9d6122u;
      bz += bv[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0xfde5380cu;
      by += bw[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };
    {
      bx += 0xa4beea44u;
      bx += bt[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0x4bdecfa9u;
      ca += bu[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0xf6bb4b60u;
      bz += bu[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0xbebfbc70u;
      by += bv[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };
    {
      bx += 0x289b7ec6u;
      bx += bw[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0xeaa127fau;
      ca += bt[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0xd4ef3085u;
      bz += bt[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0x04881d05u;
      by += bu[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };
    {
      bx += 0xd9d4d039u;
      bx += bv[1];
      bx += ((by) ^ (bz) ^ (ca));
      bx = P(bx, 4u);
      bx += by;
    };
    {
      ca += 0xe6db99e5u;
      ca += bw[0];
      ca += ((bx) ^ (by) ^ (bz));
      ca = P(ca, 11u);
      ca += bx;
    };
    {
      bz += 0x1fa27cf8u;
      bz += bw[3];
      bz += ((ca) ^ (bx) ^ (by));
      bz = P(bz, 16u);
      bz += ca;
    };
    {
      by += 0xc4ac5665u;
      by += bt[2];
      by += ((bz) ^ (ca) ^ (bx));
      by = P(by, 23u);
      by += bz;
    };

    {
      bx += 0xf4292244u;
      bx += bt[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0x432aff97u;
      ca += bu[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0xab9423a7u;
      bz += bw[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0xfc93a039u;
      by += bu[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
    {
      bx += 0x655b59c3u;
      bx += bw[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0x8f0ccc92u;
      ca += bt[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0xffeff47du;
      bz += bv[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0x85845dd1u;
      by += bt[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
    {
      bx += 0x6fa87e4fu;
      bx += bv[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0xfe2ce6e0u;
      ca += bw[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0xa3014314u;
      bz += bu[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0x4e0811a1u;
      by += bw[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
    {
      bx += 0xf7537e82u;
      bx += bu[0];
      bx += ((bz) ^ ((by) | ~(ca)));
      bx = P(bx, 6u);
      bx += by;
    };
    {
      ca += 0xbd3af235u;
      ca += bv[3];
      ca += ((by) ^ ((bx) | ~(bz)));
      ca = P(ca, 10u);
      ca += bx;
    };
    {
      bz += 0x2ad7d2bbu;
      bz += bt[2];
      bz += ((bx) ^ ((ca) | ~(by)));
      bz = P(bz, 15u);
      bz += ca;
    };
    {
      by += 0xeb86d391u;
      by += bv[1];
      by += ((ca) ^ ((bz) | ~(bx)));
      by = P(by, 21u);
      by += bz;
    };
  }

  bx += cb;
  by += cc;
  bz += cd;
  ca += ce;

  {
    if (((bx) == az[0]) && ((ca) == az[1]) && ((bz) == az[2]) && ((by) == az[3])) {
      const u32 cf = ad + 0;
      if (atomic_add(&q[cf], 1) == 0) {
        AA(o, t, y, 0, cf, ag, ba);
      }
    }
  };
}
}

__kernel void CC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CD(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global sip_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}