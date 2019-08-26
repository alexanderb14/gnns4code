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
inline u32 BU(const u32 a, const u32 b, const u32 c, u32 d[4], u32 e[4], const u32 f);
inline u32 BV(const __global u32* a, u32 b[4], u32 c[4], const u32 d);
inline u32x BW(const u32 a[4], const u32 b[4], const u32 c, const __global kernel_rule_t* d, const u32 e, u32x f[4], u32x g[4]);

inline u32 BX(u32 a) {
  const u32 b = ((a & 0x40404040) >> 1) & ~((a & 0x80808080) >> 2);

  const u32 c = (a & 0x1f1f1f1f) + 0x05050505;
  const u32 d = (a & 0x1f1f1f1f) + 0x1f1f1f1f;

  return b & ~c & d;
}

inline void BY(u32 a[4], u32 b[4], const u32 c) {
  const u32 d = (1 << ((c % 4) * 8)) - 1;

  switch (c / 4) {
    case 0:
      a[0] &= d;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 1:
      a[1] &= d;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 2:
      a[2] &= d;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 3:
      a[3] &= d;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 4:
      b[0] &= d;
      b[1] = 0;
      b[2] = 0;
      b[3] = 0;
      break;
    case 5:
      b[1] &= d;
      b[2] = 0;
      b[3] = 0;
      break;
    case 6:
      b[2] &= d;
      b[3] = 0;
      break;
    case 7:
      b[3] &= d;
      break;
  }
}

inline void BZ(u32 a[4], u32 b[4], const u32 c) {
  const u32 d = ~((1 << ((c % 4) * 8)) - 1);

  switch (c / 4) {
    case 0:
      a[0] &= d;
      break;
    case 1:
      a[0] = 0;
      a[1] &= d;
      break;
    case 2:
      a[0] = 0;
      a[1] = 0;
      a[2] &= d;
      break;
    case 3:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] &= d;
      break;
    case 4:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] &= d;
      break;
    case 5:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] &= d;
      break;
    case 6:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] &= d;
      break;
    case 7:
      a[0] = 0;
      a[1] = 0;
      a[2] = 0;
      a[3] = 0;
      b[0] = 0;
      b[1] = 0;
      b[2] = 0;
      b[3] &= d;
      break;
  }
}

inline void CA(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4]) {
  c[0] = V(a[1], a[0], 1);
  c[1] = V(a[2], a[1], 1);
  c[2] = V(a[3], a[2], 1);
  c[3] = V(b[0], a[3], 1);
  d[0] = V(b[1], b[0], 1);
  d[1] = V(b[2], b[1], 1);
  d[2] = V(b[3], b[2], 1);
  d[3] = V(0, b[3], 1);
}

inline void CB(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4]) {
  d[3] = V(b[3], b[2], 3);
  d[2] = V(b[2], b[1], 3);
  d[1] = V(b[1], b[0], 3);
  d[0] = V(b[0], a[3], 3);
  c[3] = V(a[3], a[2], 3);
  c[2] = V(a[2], a[1], 3);
  c[1] = V(a[1], a[0], 3);
  c[0] = V(a[0], 0, 3);
}

inline void CC(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      c[0] = a[0];
      c[1] = a[1];
      c[2] = a[2];
      c[3] = a[3];
      d[0] = b[0];
      d[1] = b[1];
      d[2] = b[2];
      d[3] = b[3];
      break;
    case 1:
      c[0] = V(a[1], a[0], 1);
      c[1] = V(a[2], a[1], 1);
      c[2] = V(a[3], a[2], 1);
      c[3] = V(b[0], a[3], 1);
      d[0] = V(b[1], b[0], 1);
      d[1] = V(b[2], b[1], 1);
      d[2] = V(b[3], b[2], 1);
      d[3] = V(0, b[3], 1);
      break;
    case 2:
      c[0] = V(a[1], a[0], 2);
      c[1] = V(a[2], a[1], 2);
      c[2] = V(a[3], a[2], 2);
      c[3] = V(b[0], a[3], 2);
      d[0] = V(b[1], b[0], 2);
      d[1] = V(b[2], b[1], 2);
      d[2] = V(b[3], b[2], 2);
      d[3] = V(0, b[3], 2);
      break;
    case 3:
      c[0] = V(a[1], a[0], 3);
      c[1] = V(a[2], a[1], 3);
      c[2] = V(a[3], a[2], 3);
      c[3] = V(b[0], a[3], 3);
      d[0] = V(b[1], b[0], 3);
      d[1] = V(b[2], b[1], 3);
      d[2] = V(b[3], b[2], 3);
      d[3] = V(0, b[3], 3);
      break;
    case 4:
      c[0] = a[1];
      c[1] = a[2];
      c[2] = a[3];
      c[3] = b[0];
      d[0] = b[1];
      d[1] = b[2];
      d[2] = b[3];
      d[3] = 0;
      break;
    case 5:
      c[0] = V(a[2], a[1], 1);
      c[1] = V(a[3], a[2], 1);
      c[2] = V(b[0], a[3], 1);
      c[3] = V(b[1], b[0], 1);
      d[0] = V(b[2], b[1], 1);
      d[1] = V(b[3], b[2], 1);
      d[2] = V(0, b[3], 1);
      d[3] = 0;
      break;
    case 6:
      c[0] = V(a[2], a[1], 2);
      c[1] = V(a[3], a[2], 2);
      c[2] = V(b[0], a[3], 2);
      c[3] = V(b[1], b[0], 2);
      d[0] = V(b[2], b[1], 2);
      d[1] = V(b[3], b[2], 2);
      d[2] = V(0, b[3], 2);
      d[3] = 0;
      break;
    case 7:
      c[0] = V(a[2], a[1], 3);
      c[1] = V(a[3], a[2], 3);
      c[2] = V(b[0], a[3], 3);
      c[3] = V(b[1], b[0], 3);
      d[0] = V(b[2], b[1], 3);
      d[1] = V(b[3], b[2], 3);
      d[2] = V(0, b[3], 3);
      d[3] = 0;
      break;
    case 8:
      c[0] = a[2];
      c[1] = a[3];
      c[2] = b[0];
      c[3] = b[1];
      d[0] = b[2];
      d[1] = b[3];
      d[2] = 0;
      d[3] = 0;
      break;
    case 9:
      c[0] = V(a[3], a[2], 1);
      c[1] = V(b[0], a[3], 1);
      c[2] = V(b[1], b[0], 1);
      c[3] = V(b[2], b[1], 1);
      d[0] = V(b[3], b[2], 1);
      d[1] = V(0, b[3], 1);
      d[2] = 0;
      d[3] = 0;
      break;
    case 10:
      c[0] = V(a[3], a[2], 2);
      c[1] = V(b[0], a[3], 2);
      c[2] = V(b[1], b[0], 2);
      c[3] = V(b[2], b[1], 2);
      d[0] = V(b[3], b[2], 2);
      d[1] = V(0, b[3], 2);
      d[2] = 0;
      d[3] = 0;
      break;
    case 11:
      c[0] = V(a[3], a[2], 3);
      c[1] = V(b[0], a[3], 3);
      c[2] = V(b[1], b[0], 3);
      c[3] = V(b[2], b[1], 3);
      d[0] = V(b[3], b[2], 3);
      d[1] = V(0, b[3], 3);
      d[2] = 0;
      d[3] = 0;
      break;
    case 12:
      c[0] = a[3];
      c[1] = b[0];
      c[2] = b[1];
      c[3] = b[2];
      d[0] = b[3];
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 13:
      c[0] = V(b[0], a[3], 1);
      c[1] = V(b[1], b[0], 1);
      c[2] = V(b[2], b[1], 1);
      c[3] = V(b[3], b[2], 1);
      d[0] = V(0, b[3], 1);
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 14:
      c[0] = V(b[0], a[3], 2);
      c[1] = V(b[1], b[0], 2);
      c[2] = V(b[2], b[1], 2);
      c[3] = V(b[3], b[2], 2);
      d[0] = V(0, b[3], 2);
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 15:
      c[0] = V(b[0], a[3], 3);
      c[1] = V(b[1], b[0], 3);
      c[2] = V(b[2], b[1], 3);
      c[3] = V(b[3], b[2], 3);
      d[0] = V(0, b[3], 3);
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 16:
      c[0] = b[0];
      c[1] = b[1];
      c[2] = b[2];
      c[3] = b[3];
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 17:
      c[0] = V(b[1], b[0], 1);
      c[1] = V(b[2], b[1], 1);
      c[2] = V(b[3], b[2], 1);
      c[3] = V(0, b[3], 1);
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 18:
      c[0] = V(b[1], b[0], 2);
      c[1] = V(b[2], b[1], 2);
      c[2] = V(b[3], b[2], 2);
      c[3] = V(0, b[3], 2);
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 19:
      c[0] = V(b[1], b[0], 3);
      c[1] = V(b[2], b[1], 3);
      c[2] = V(b[3], b[2], 3);
      c[3] = V(0, b[3], 3);
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 20:
      c[0] = b[1];
      c[1] = b[2];
      c[2] = b[3];
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 21:
      c[0] = V(b[2], b[1], 1);
      c[1] = V(b[3], b[2], 1);
      c[2] = V(0, b[3], 1);
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 22:
      c[0] = V(b[2], b[1], 2);
      c[1] = V(b[3], b[2], 2);
      c[2] = V(0, b[3], 2);
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 23:
      c[0] = V(b[2], b[1], 3);
      c[1] = V(b[3], b[2], 3);
      c[2] = V(0, b[3], 3);
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 24:
      c[0] = b[2];
      c[1] = b[3];
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 25:
      c[0] = V(b[3], b[2], 1);
      c[1] = V(0, b[3], 1);
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 26:
      c[0] = V(b[3], b[2], 2);
      c[1] = V(0, b[3], 2);
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 27:
      c[0] = V(b[3], b[2], 3);
      c[1] = V(0, b[3], 3);
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 28:
      c[0] = b[3];
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 29:
      c[0] = V(0, b[3], 1);
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 30:
      c[0] = V(0, b[3], 2);
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
    case 31:
      c[0] = V(0, b[3], 3);
      c[1] = 0;
      c[2] = 0;
      c[3] = 0;
      d[0] = 0;
      d[1] = 0;
      d[2] = 0;
      d[3] = 0;
      break;
  }
}

inline void CD(const u32 a[4], const u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  switch (e) {
    case 0:
      d[3] = b[3];
      d[2] = b[2];
      d[1] = b[1];
      d[0] = b[0];
      c[3] = a[3];
      c[2] = a[2];
      c[1] = a[1];
      c[0] = a[0];
      break;
    case 1:
      d[3] = V(b[3], b[2], 3);
      d[2] = V(b[2], b[1], 3);
      d[1] = V(b[1], b[0], 3);
      d[0] = V(b[0], a[3], 3);
      c[3] = V(a[3], a[2], 3);
      c[2] = V(a[2], a[1], 3);
      c[1] = V(a[1], a[0], 3);
      c[0] = V(a[0], 0, 3);
      break;
    case 2:
      d[3] = V(b[3], b[2], 2);
      d[2] = V(b[2], b[1], 2);
      d[1] = V(b[1], b[0], 2);
      d[0] = V(b[0], a[3], 2);
      c[3] = V(a[3], a[2], 2);
      c[2] = V(a[2], a[1], 2);
      c[1] = V(a[1], a[0], 2);
      c[0] = V(a[0], 0, 2);
      break;
    case 3:
      d[3] = V(b[3], b[2], 1);
      d[2] = V(b[2], b[1], 1);
      d[1] = V(b[1], b[0], 1);
      d[0] = V(b[0], a[3], 1);
      c[3] = V(a[3], a[2], 1);
      c[2] = V(a[2], a[1], 1);
      c[1] = V(a[1], a[0], 1);
      c[0] = V(a[0], 0, 1);
      break;
    case 4:
      d[3] = b[2];
      d[2] = b[1];
      d[1] = b[0];
      d[0] = a[3];
      c[3] = a[2];
      c[2] = a[1];
      c[1] = a[0];
      c[0] = 0;
      break;
    case 5:
      d[3] = V(b[2], b[1], 3);
      d[2] = V(b[1], b[0], 3);
      d[1] = V(b[0], a[3], 3);
      d[0] = V(a[3], a[2], 3);
      c[3] = V(a[2], a[1], 3);
      c[2] = V(a[1], a[0], 3);
      c[1] = V(a[0], 0, 3);
      c[0] = 0;
      break;
    case 6:
      d[3] = V(b[2], b[1], 2);
      d[2] = V(b[1], b[0], 2);
      d[1] = V(b[0], a[3], 2);
      d[0] = V(a[3], a[2], 2);
      c[3] = V(a[2], a[1], 2);
      c[2] = V(a[1], a[0], 2);
      c[1] = V(a[0], 0, 2);
      c[0] = 0;
      break;
    case 7:
      d[3] = V(b[2], b[1], 1);
      d[2] = V(b[1], b[0], 1);
      d[1] = V(b[0], a[3], 1);
      d[0] = V(a[3], a[2], 1);
      c[3] = V(a[2], a[1], 1);
      c[2] = V(a[1], a[0], 1);
      c[1] = V(a[0], 0, 1);
      c[0] = 0;
      break;
    case 8:
      d[3] = b[1];
      d[2] = b[0];
      d[1] = a[3];
      d[0] = a[2];
      c[3] = a[1];
      c[2] = a[0];
      c[1] = 0;
      c[0] = 0;
      break;
    case 9:
      d[3] = V(b[1], b[0], 3);
      d[2] = V(b[0], a[3], 3);
      d[1] = V(a[3], a[2], 3);
      d[0] = V(a[2], a[1], 3);
      c[3] = V(a[1], a[0], 3);
      c[2] = V(a[0], 0, 3);
      c[1] = 0;
      c[0] = 0;
      break;
    case 10:
      d[3] = V(b[1], b[0], 2);
      d[2] = V(b[0], a[3], 2);
      d[1] = V(a[3], a[2], 2);
      d[0] = V(a[2], a[1], 2);
      c[3] = V(a[1], a[0], 2);
      c[2] = V(a[0], 0, 2);
      c[1] = 0;
      c[0] = 0;
      break;
    case 11:
      d[3] = V(b[1], b[0], 1);
      d[2] = V(b[0], a[3], 1);
      d[1] = V(a[3], a[2], 1);
      d[0] = V(a[2], a[1], 1);
      c[3] = V(a[1], a[0], 1);
      c[2] = V(a[0], 0, 1);
      c[1] = 0;
      c[0] = 0;
      break;
    case 12:
      d[3] = b[0];
      d[2] = a[3];
      d[1] = a[2];
      d[0] = a[1];
      c[3] = a[0];
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 13:
      d[3] = V(b[0], a[3], 3);
      d[2] = V(a[3], a[2], 3);
      d[1] = V(a[2], a[1], 3);
      d[0] = V(a[1], a[0], 3);
      c[3] = V(a[0], 0, 3);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 14:
      d[3] = V(b[0], a[3], 2);
      d[2] = V(a[3], a[2], 2);
      d[1] = V(a[2], a[1], 2);
      d[0] = V(a[1], a[0], 2);
      c[3] = V(a[0], 0, 2);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 15:
      d[3] = V(b[0], a[3], 1);
      d[2] = V(a[3], a[2], 1);
      d[1] = V(a[2], a[1], 1);
      d[0] = V(a[1], a[0], 1);
      c[3] = V(a[0], 0, 1);
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 16:
      d[3] = a[3];
      d[2] = a[2];
      d[1] = a[1];
      d[0] = a[0];
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 17:
      d[3] = V(a[3], a[2], 3);
      d[2] = V(a[2], a[1], 3);
      d[1] = V(a[1], a[0], 3);
      d[0] = V(a[0], 0, 3);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 18:
      d[3] = V(a[3], a[2], 2);
      d[2] = V(a[2], a[1], 2);
      d[1] = V(a[1], a[0], 2);
      d[0] = V(a[0], 0, 2);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 19:
      d[3] = V(a[3], a[2], 1);
      d[2] = V(a[2], a[1], 1);
      d[1] = V(a[1], a[0], 1);
      d[0] = V(a[0], 0, 1);
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 20:
      d[3] = a[2];
      d[2] = a[1];
      d[1] = a[0];
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 21:
      d[3] = V(a[2], a[1], 3);
      d[2] = V(a[1], a[0], 3);
      d[1] = V(a[0], 0, 3);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 22:
      d[3] = V(a[2], a[1], 2);
      d[2] = V(a[1], a[0], 2);
      d[1] = V(a[0], 0, 2);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 23:
      d[3] = V(a[2], a[1], 1);
      d[2] = V(a[1], a[0], 1);
      d[1] = V(a[0], 0, 1);
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 24:
      d[3] = a[1];
      d[2] = a[0];
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 25:
      d[3] = V(a[1], a[0], 3);
      d[2] = V(a[0], 0, 3);
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 26:
      d[3] = V(a[1], a[0], 2);
      d[2] = V(a[0], 0, 2);
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 27:
      d[3] = V(a[1], a[0], 1);
      d[2] = V(a[0], 0, 1);
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 28:
      d[3] = a[0];
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 29:
      d[3] = V(a[0], 0, 3);
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 30:
      d[3] = V(a[0], 0, 2);
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
    case 31:
      d[3] = V(a[0], 0, 1);
      d[2] = 0;
      d[1] = 0;
      d[0] = 0;
      c[3] = 0;
      c[2] = 0;
      c[1] = 0;
      c[0] = 0;
      break;
  }
}

inline void CE(const u32 a, u32 b[4], u32 c[4], const u32 d) {
  u32 e[2];

  switch (a & 3) {
    case 0:
      e[0] = d;
      e[1] = 0;
      break;
    case 1:
      e[0] = d << 8;
      e[1] = d >> 24;
      break;
    case 2:
      e[0] = d << 16;
      e[1] = d >> 16;
      break;
    case 3:
      e[0] = d << 24;
      e[1] = d >> 8;
      break;
  }

  switch (a / 4) {
    case 0:
      b[0] |= e[0];
      b[1] = e[1];
      break;
    case 1:
      b[1] |= e[0];
      b[2] = e[1];
      break;
    case 2:
      b[2] |= e[0];
      b[3] = e[1];
      break;
    case 3:
      b[3] |= e[0];
      c[0] = e[1];
      break;
    case 4:
      c[0] |= e[0];
      c[1] = e[1];
      break;
    case 5:
      c[1] |= e[0];
      c[2] = e[1];
      break;
    case 6:
      c[2] |= e[0];
      c[3] = e[1];
      break;
    case 7:
      c[3] |= e[0];
      break;
  }
}

inline void CF(const u32 a, u32 b[4], u32 c[4], const u32 d[4], const u32 e[4], const u32 f[4], const u32 g[4]) {
  switch (a) {
    case 31:
      c[3] = e[3] | f[0] << 24;
      break;
    case 30:
      c[3] = e[3] | f[0] << 16;
      break;
    case 29:
      c[3] = e[3] | f[0] << 8;
      break;
    case 28:
      c[3] = f[0];
      break;
    case 27:
      c[3] = V(f[1], f[0], 1);
      c[2] = e[2] | f[0] << 24;
      break;
    case 26:
      c[3] = V(f[1], f[0], 2);
      c[2] = e[2] | f[0] << 16;
      break;
    case 25:
      c[3] = V(f[1], f[0], 3);
      c[2] = e[2] | f[0] << 8;
      break;
    case 24:
      c[3] = f[1];
      c[2] = f[0];
      break;
    case 23:
      c[3] = V(f[2], f[1], 1);
      c[2] = V(f[1], f[0], 1);
      c[1] = e[1] | f[0] << 24;
      break;
    case 22:
      c[3] = V(f[2], f[1], 2);
      c[2] = V(f[1], f[0], 2);
      c[1] = e[1] | f[0] << 16;
      break;
    case 21:
      c[3] = V(f[2], f[1], 3);
      c[2] = V(f[1], f[0], 3);
      c[1] = e[1] | f[0] << 8;
      break;
    case 20:
      c[3] = f[2];
      c[2] = f[1];
      c[1] = f[0];
      break;
    case 19:
      c[3] = V(f[3], f[2], 1);
      c[2] = V(f[2], f[1], 1);
      c[1] = V(f[1], f[0], 1);
      c[0] = e[0] | f[0] << 24;
      break;
    case 18:
      c[3] = V(f[3], f[2], 2);
      c[2] = V(f[2], f[1], 2);
      c[1] = V(f[1], f[0], 2);
      c[0] = e[0] | f[0] << 16;
      break;
    case 17:
      c[3] = V(f[3], f[2], 3);
      c[2] = V(f[2], f[1], 3);
      c[1] = V(f[1], f[0], 3);
      c[0] = e[0] | f[0] << 8;
      break;
    case 16:
      c[3] = f[3];
      c[2] = f[2];
      c[1] = f[1];
      c[0] = f[0];
      break;
    case 15:
      c[3] = V(g[0], f[3], 1);
      c[2] = V(f[3], f[2], 1);
      c[1] = V(f[2], f[1], 1);
      c[0] = V(f[1], f[0], 1);
      b[3] = d[3] | f[0] << 24;
      break;
    case 14:
      c[3] = V(g[0], f[3], 2);
      c[2] = V(f[3], f[2], 2);
      c[1] = V(f[2], f[1], 2);
      c[0] = V(f[1], f[0], 2);
      b[3] = d[3] | f[0] << 16;
      break;
    case 13:
      c[3] = V(g[0], f[3], 3);
      c[2] = V(f[3], f[2], 3);
      c[1] = V(f[2], f[1], 3);
      c[0] = V(f[1], f[0], 3);
      b[3] = d[3] | f[0] << 8;
      break;
    case 12:
      c[3] = g[0];
      c[2] = f[3];
      c[1] = f[2];
      c[0] = f[1];
      b[3] = f[0];
      break;
    case 11:
      c[3] = V(g[1], g[0], 1);
      c[2] = V(g[0], f[3], 1);
      c[1] = V(f[3], f[2], 1);
      c[0] = V(f[2], f[1], 1);
      b[3] = V(f[1], f[0], 1);
      b[2] = d[2] | f[0] << 24;
      break;
    case 10:
      c[3] = V(g[1], g[0], 2);
      c[2] = V(g[0], f[3], 2);
      c[1] = V(f[3], f[2], 2);
      c[0] = V(f[2], f[1], 2);
      b[3] = V(f[1], f[0], 2);
      b[2] = d[2] | f[0] << 16;
      break;
    case 9:
      c[3] = V(g[1], g[0], 3);
      c[2] = V(g[0], f[3], 3);
      c[1] = V(f[3], f[2], 3);
      c[0] = V(f[2], f[1], 3);
      b[3] = V(f[1], f[0], 3);
      b[2] = d[2] | f[0] << 8;
      break;
    case 8:
      c[3] = g[1];
      c[2] = g[0];
      c[1] = f[3];
      c[0] = f[2];
      b[3] = f[1];
      b[2] = f[0];
      break;
    case 7:
      c[3] = V(g[2], g[1], 1);
      c[2] = V(g[1], g[0], 1);
      c[1] = V(g[0], f[3], 1);
      c[0] = V(f[3], f[2], 1);
      b[3] = V(f[2], f[1], 1);
      b[2] = V(f[1], f[0], 1);
      b[1] = d[1] | f[0] << 24;
      break;
    case 6:
      c[3] = V(g[2], g[1], 2);
      c[2] = V(g[1], g[0], 2);
      c[1] = V(g[0], f[3], 2);
      c[0] = V(f[3], f[2], 2);
      b[3] = V(f[2], f[1], 2);
      b[2] = V(f[1], f[0], 2);
      b[1] = d[1] | f[0] << 16;
      break;
    case 5:
      c[3] = V(g[2], g[1], 3);
      c[2] = V(g[1], g[0], 3);
      c[1] = V(g[0], f[3], 3);
      c[0] = V(f[3], f[2], 3);
      b[3] = V(f[2], f[1], 3);
      b[2] = V(f[1], f[0], 3);
      b[1] = d[1] | f[0] << 8;
      break;
    case 4:
      c[3] = g[2];
      c[2] = g[1];
      c[1] = g[0];
      c[0] = f[3];
      b[3] = f[2];
      b[2] = f[1];
      b[1] = f[0];
      break;
    case 3:
      c[3] = V(g[3], g[2], 1);
      c[2] = V(g[2], g[1], 1);
      c[1] = V(g[1], g[0], 1);
      c[0] = V(g[0], f[3], 1);
      b[3] = V(f[3], f[2], 1);
      b[2] = V(f[2], f[1], 1);
      b[1] = V(f[1], f[0], 1);
      b[0] = d[0] | f[0] << 24;
      break;
    case 2:
      c[3] = V(g[3], g[2], 2);
      c[2] = V(g[2], g[1], 2);
      c[1] = V(g[1], g[0], 2);
      c[0] = V(g[0], f[3], 2);
      b[3] = V(f[3], f[2], 2);
      b[2] = V(f[2], f[1], 2);
      b[1] = V(f[1], f[0], 2);
      b[0] = d[0] | f[0] << 16;
      break;
    case 1:
      c[3] = V(g[3], g[2], 3);
      c[2] = V(g[2], g[1], 3);
      c[1] = V(g[1], g[0], 3);
      c[0] = V(g[0], f[3], 3);
      b[3] = V(f[3], f[2], 3);
      b[2] = V(f[2], f[1], 3);
      b[1] = V(f[1], f[0], 3);
      b[0] = d[0] | f[0] << 8;
      break;
    case 0:
      c[3] = g[3];
      c[2] = g[2];
      c[1] = g[1];
      c[0] = g[0];
      b[3] = f[3];
      b[2] = f[2];
      b[1] = f[1];
      b[0] = f[0];
      break;
  }
}

inline void CG(u32 a[4], u32 b[4], u32 c[4], u32 d[4], const u32 e) {
  CD(a, b, c, d, 32 - e);

  u32 f[4];
  u32 g[4];

  f[0] = d[3];
  f[1] = d[2];
  f[2] = d[1];
  f[3] = d[0];
  g[0] = c[3];
  g[1] = c[2];
  g[2] = c[1];
  g[3] = c[0];

  c[0] = G(f[0]);
  c[1] = G(f[1]);
  c[2] = G(f[2]);
  c[3] = G(f[3]);
  d[0] = G(g[0]);
  d[1] = G(g[1]);
  d[2] = G(g[2]);
  d[3] = G(g[3]);
}

inline u32 CH(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] |= (BX(c[0]));
  c[1] |= (BX(c[1]));
  c[2] |= (BX(c[2]));
  c[3] |= (BX(c[3]));
  d[0] |= (BX(d[0]));
  d[1] |= (BX(d[1]));
  d[2] |= (BX(d[2]));
  d[3] |= (BX(d[3]));

  return e;
}

inline u32 CI(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] &= ~(BX(c[0]));
  c[1] &= ~(BX(c[1]));
  c[2] &= ~(BX(c[2]));
  c[3] &= ~(BX(c[3]));
  d[0] &= ~(BX(d[0]));
  d[1] &= ~(BX(d[1]));
  d[2] &= ~(BX(d[2]));
  d[3] &= ~(BX(d[3]));

  return e;
}

inline u32 CJ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  CH(a, b, c, d, e);

  c[0] &= ~(0x00000020 & BX(c[0]));

  return e;
}

inline u32 CK(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  CI(a, b, c, d, e);

  c[0] |= (0x00000020 & BX(c[0]));

  return e;
}

inline u32 CL(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] ^= (BX(c[0]));
  c[1] ^= (BX(c[1]));
  c[2] ^= (BX(c[2]));
  c[3] ^= (BX(c[3]));
  d[0] ^= (BX(d[0]));
  d[1] ^= (BX(d[1]));
  d[2] ^= (BX(d[2]));
  d[3] ^= (BX(d[3]));

  return e;
}

inline u32 CM(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0x20u << ((a & 3) * 8);

  switch (a / 4) {
    case 0:
      c[0] ^= (f & BX(c[0]));
      break;
    case 1:
      c[1] ^= (f & BX(c[1]));
      break;
    case 2:
      c[2] ^= (f & BX(c[2]));
      break;
    case 3:
      c[3] ^= (f & BX(c[3]));
      break;
    case 4:
      d[0] ^= (f & BX(d[0]));
      break;
    case 5:
      d[1] ^= (f & BX(d[1]));
      break;
    case 6:
      d[2] ^= (f & BX(d[2]));
      break;
    case 7:
      d[3] ^= (f & BX(d[3]));
      break;
  }

  return e;
}

inline u32 CN(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  CG(c, d, c, d, e);

  return e;
}

inline u32 CO(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + e) >= 32)
    return (e);

  u32 f = e;

  CF(f, c, d, c, d, c, d);

  f += e;

  return f;
}

inline u32 CP(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (((e * a) + e) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  g[0] = c[0];
  g[1] = c[1];
  g[2] = c[2];
  g[3] = c[3];
  h[0] = d[0];
  h[1] = d[1];
  h[2] = d[2];
  h[3] = d[3];

  for (u32 i = 0; i < a; i++) {
    CF(f, c, d, c, d, g, h);

    f += e;
  }

  return f;
}

inline u32 CQ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + e) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CG(c, d, g, h, f);

  CF(f, c, d, c, d, g, h);

  f += e;

  return f;
}

inline u32 CR(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + 1) >= 32)
    return (e);

  u32 f = e;

  CE(f, c, d, a);

  f++;

  return f;
}

inline u32 CS(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((e + 1) >= 32)
    return (e);

  u32 f = e;

  CB(c, d, c, d);

  c[0] = c[0] | a;

  f++;

  return f;
}

inline u32 CT(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  const u32 g = (f & 3) * 8;

  const u32 h = (c[0] & 0xff) << g;

  CA(c, d, c, d);

  switch (f / 4) {
    case 0:
      c[0] |= h;
      break;
    case 1:
      c[1] |= h;
      break;
    case 2:
      c[2] |= h;
      break;
    case 3:
      c[3] |= h;
      break;
    case 4:
      d[0] |= h;
      break;
    case 5:
      d[1] |= h;
      break;
    case 6:
      d[2] |= h;
      break;
    case 7:
      d[3] |= h;
      break;
  }

  return e;
}

inline u32 CU(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  const u32 g = (f & 3) * 8;

  u32 h = 0;

  switch (f / 4) {
    case 0:
      h = (c[0] >> g) & 0xff;
      break;
    case 1:
      h = (c[1] >> g) & 0xff;
      break;
    case 2:
      h = (c[2] >> g) & 0xff;
      break;
    case 3:
      h = (c[3] >> g) & 0xff;
      break;
    case 4:
      h = (d[0] >> g) & 0xff;
      break;
    case 5:
      h = (d[1] >> g) & 0xff;
      break;
    case 6:
      h = (d[2] >> g) & 0xff;
      break;
    case 7:
      h = (d[3] >> g) & 0xff;
      break;
  }

  CB(c, d, c, d);

  c[0] |= h;

  BY(c, d, e);

  return e;
}

inline u32 CV(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  CA(c, d, c, d);

  return f;
}

inline u32 CW(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);

  const u32 f = e - 1;

  const u32 g = (1 << ((f & 3) * 8)) - 1;

  switch (f / 4) {
    case 0:
      c[0] &= g;
      break;
    case 1:
      c[1] &= g;
      break;
    case 2:
      c[2] &= g;
      break;
    case 3:
      c[3] &= g;
      break;
    case 4:
      d[0] &= g;
      break;
    case 5:
      d[1] &= g;
      break;
    case 6:
      d[2] &= g;
      break;
    case 7:
      d[3] &= g;
      break;
  }

  return f;
}

inline u32 CX(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CA(c, d, g, h);

  const u32 i = (1 << ((a & 3) * 8)) - 1;
  const u32 j = ~i;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (g[0] & j);
      c[1] = g[1];
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 1:
      c[1] = (c[1] & i) | (g[1] & j);
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 2:
      c[2] = (c[2] & i) | (g[2] & j);
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 3:
      c[3] = (c[3] & i) | (g[3] & j);
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 4:
      d[0] = (d[0] & i) | (h[0] & j);
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 5:
      d[1] = (d[1] & i) | (h[1] & j);
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 6:
      d[2] = (d[2] & i) | (h[2] & j);
      d[3] = h[3];
      break;
    case 7:
      d[3] = (d[3] & i) | (h[3] & j);
      break;
  }

  f--;

  return f;
}

inline u32 CY(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  if ((a + b) > e)
    return (e);

  u32 f = b;

  CC(c, d, c, d, a);

  BY(c, d, f);

  return f;
}

inline u32 CZ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  if ((a + b) > e)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  g[0] = 0;
  g[1] = 0;
  g[2] = 0;
  g[3] = 0;
  h[0] = 0;
  h[1] = 0;
  h[2] = 0;
  h[3] = 0;

  CC(c, d, g, h, b);

  const u32 i = (1 << ((a & 3) * 8)) - 1;
  const u32 j = ~i;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (g[0] & j);
      c[1] = g[1];
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 1:
      c[1] = (c[1] & i) | (g[1] & j);
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 2:
      c[2] = (c[2] & i) | (g[2] & j);
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 3:
      c[3] = (c[3] & i) | (g[3] & j);
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 4:
      d[0] = (d[0] & i) | (h[0] & j);
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 5:
      d[1] = (d[1] & i) | (h[1] & j);
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 6:
      d[2] = (d[2] & i) | (h[2] & j);
      d[3] = h[3];
      break;
    case 7:
      d[3] = (d[3] & i) | (h[3] & j);
      break;
  }

  f -= b;

  return f;
}

inline u32 DA(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a > e)
    return (e);

  if ((e + 1) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CB(c, d, g, h);

  const u32 i = b << ((a & 3) * 8);

  const u32 j = (1 << ((a & 3) * 8)) - 1;

  const u32 k = 0xffffff00 << ((a & 3) * 8);

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & j) | i | (g[0] & k);
      c[1] = g[1];
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 1:
      c[1] = (c[1] & j) | i | (g[1] & k);
      c[2] = g[2];
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 2:
      c[2] = (c[2] & j) | i | (g[2] & k);
      c[3] = g[3];
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 3:
      c[3] = (c[3] & j) | i | (g[3] & k);
      d[0] = h[0];
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 4:
      d[0] = (d[0] & j) | i | (h[0] & k);
      d[1] = h[1];
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 5:
      d[1] = (d[1] & j) | i | (h[1] & k);
      d[2] = h[2];
      d[3] = h[3];
      break;
    case 6:
      d[2] = (d[2] & j) | i | (h[2] & k);
      d[3] = h[3];
      break;
    case 7:
      d[3] = (d[3] & j) | i | (h[3] & k);
      break;
  }

  f++;

  return f;
}

inline u32 DB(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = b << ((a & 3) * 8);

  const u32 g = ~(0xffu << ((a & 3) * 8));

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | f;
      break;
    case 1:
      c[1] = (c[1] & g) | f;
      break;
    case 2:
      c[2] = (c[2] & g) | f;
      break;
    case 3:
      c[3] = (c[3] & g) | f;
      break;
    case 4:
      d[0] = (d[0] & g) | f;
      break;
    case 5:
      d[1] = (d[1] & g) | f;
      break;
    case 6:
      d[2] = (d[2] & g) | f;
      break;
    case 7:
      d[3] = (d[3] & g) | f;
      break;
  }

  return e;
}

inline u32 DC(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  BY(c, d, a);

  return a;
}

inline u32 DD(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  const uchar4 f = (uchar4)(a);
  const uchar4 g = (uchar4)(b);

  uchar4 h;

  h = __builtin_astype(c[0], uchar4);
  h = ((h == f) ? (g) : (h));
  c[0] = __builtin_astype(h, uint);
  h = __builtin_astype(c[1], uchar4);
  h = ((h == f) ? (g) : (h));
  c[1] = __builtin_astype(h, uint);
  h = __builtin_astype(c[2], uchar4);
  h = ((h == f) ? (g) : (h));
  c[2] = __builtin_astype(h, uint);
  h = __builtin_astype(c[3], uchar4);
  h = ((h == f) ? (g) : (h));
  c[3] = __builtin_astype(h, uint);
  h = __builtin_astype(d[0], uchar4);
  h = ((h == f) ? (g) : (h));
  d[0] = __builtin_astype(h, uint);
  h = __builtin_astype(d[1], uchar4);
  h = ((h == f) ? (g) : (h));
  d[1] = __builtin_astype(h, uint);
  h = __builtin_astype(d[2], uchar4);
  h = ((h == f) ? (g) : (h));
  d[2] = __builtin_astype(h, uint);
  h = __builtin_astype(d[3], uchar4);
  h = ((h == f) ? (g) : (h));
  d[3] = __builtin_astype(h, uint);

  return e;
}

inline u32 DE(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  return e;
}

inline u32 DF(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  return e;
}

inline u32 DG(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);
  if ((e + a) >= 32)
    return (e);

  u32 f = e;

  const u32 g = c[0] & 0xFF;

  CD(c, d, c, d, a);
  switch (a) {
    case 1:
      c[0] |= g << 0;
      break;
    case 2:
      c[0] |= g << 0 | g << 8;
      break;
    case 3:
      c[0] |= g << 0 | g << 8 | g << 16;
      break;
    case 4:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 5:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0;
      break;
    case 6:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8;
      break;
    case 7:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16;
      break;
    case 8:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 9:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0;
      break;
    case 10:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8;
      break;
    case 11:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16;
      break;
    case 12:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 13:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0;
      break;
    case 14:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8;
      break;
    case 15:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16;
      break;
    case 16:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 17:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0;
      break;
    case 18:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8;
      break;
    case 19:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16;
      break;
    case 20:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 21:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0;
      break;
    case 22:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8;
      break;
    case 23:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16;
      break;
    case 24:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 25:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0;
      break;
    case 26:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8;
      break;
    case 27:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16;
      break;
    case 28:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      break;
    case 29:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[3] |= g << 0;
      break;
    case 30:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[3] |= g << 0 | g << 8;
      break;
    case 31:
      c[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      c[3] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[0] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[1] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[2] |= g << 0 | g << 8 | g << 16 | g << 24;
      d[3] |= g << 0 | g << 8 | g << 16;
      break;
  }

  f += a;

  return f;
}

inline u32 DH(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);
  if ((e + a) >= 32)
    return (e);

  const u32 f = e - 1;

  const u32 g = (f & 3) * 8;

  u32 h = 0;

  switch (f / 4) {
    case 0:
      h = (c[0] >> g) & 0xff;
      break;
    case 1:
      h = (c[1] >> g) & 0xff;
      break;
    case 2:
      h = (c[2] >> g) & 0xff;
      break;
    case 3:
      h = (c[3] >> g) & 0xff;
      break;
    case 4:
      h = (d[0] >> g) & 0xff;
      break;
    case 5:
      h = (d[1] >> g) & 0xff;
      break;
    case 6:
      h = (d[2] >> g) & 0xff;
      break;
    case 7:
      h = (d[3] >> g) & 0xff;
      break;
  }

  u32 i = e;

  for (u32 j = 0; j < a; j++) {
    CE(i, c, d, h);

    i++;
  }

  return i;
}

inline u32 DI(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e == 0)
    return (e);
  if ((e + e) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];
  g[0] = ((c[0] & 0x000000FF) << 0) | ((c[0] & 0x0000FF00) << 8);
  g[1] = ((c[0] & 0x00FF0000) >> 16) | ((c[0] & 0xFF000000) >> 8);
  g[2] = ((c[1] & 0x000000FF) << 0) | ((c[1] & 0x0000FF00) << 8);
  g[3] = ((c[1] & 0x00FF0000) >> 16) | ((c[1] & 0xFF000000) >> 8);
  h[0] = ((c[2] & 0x000000FF) << 0) | ((c[2] & 0x0000FF00) << 8);
  h[1] = ((c[2] & 0x00FF0000) >> 16) | ((c[2] & 0xFF000000) >> 8);
  h[2] = ((c[3] & 0x000000FF) << 0) | ((c[3] & 0x0000FF00) << 8);
  h[3] = ((c[3] & 0x00FF0000) >> 16) | ((c[3] & 0xFF000000) >> 8);

  c[0] = g[0] | (g[0] << 8);
  c[1] = g[1] | (g[1] << 8);
  c[2] = g[2] | (g[2] << 8);
  c[3] = g[3] | (g[3] << 8);
  d[0] = h[0] | (h[0] << 8);
  d[1] = h[1] | (h[1] << 8);
  d[2] = h[2] | (h[2] << 8);
  d[3] = h[3] | (h[3] << 8);

  f = f + f;

  return f;
}

inline u32 DJ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e < 2)
    return (e);

  c[0] = (c[0] & 0xFFFF0000) | ((c[0] << 8) & 0x0000FF00) | ((c[0] >> 8) & 0x000000FF);

  return e;
}

inline u32 DK(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (e < 2)
    return (e);
  switch (e) {
    case 2:
      c[0] = ((c[0] << 8) & 0x0000FF00) | ((c[0] >> 8) & 0x000000FF);
      break;
    case 3:
      c[0] = (c[0] & 0x000000FF) | ((c[0] << 8) & 0x00FF0000) | ((c[0] >> 8) & 0x0000FF00);
      break;
    case 4:
      c[0] = (c[0] & 0x0000FFFF) | ((c[0] << 8) & 0xFF000000) | ((c[0] >> 8) & 0x00FF0000);
      break;
    case 5:
      c[1] = (c[0] & 0xFF000000) | c[1];
      c[0] = (c[0] & 0x00FFFFFF) | (c[1] << 24);
      c[1] = (c[1] >> 24);
      break;
    case 6:
      c[1] = ((c[1] << 8) & 0x0000FF00) | ((c[1] >> 8) & 0x000000FF);
      break;
    case 7:
      c[1] = (c[1] & 0x000000FF) | ((c[1] << 8) & 0x00FF0000) | ((c[1] >> 8) & 0x0000FF00);
      break;
    case 8:
      c[1] = (c[1] & 0x0000FFFF) | ((c[1] << 8) & 0xFF000000) | ((c[1] >> 8) & 0x00FF0000);
      break;
    case 9:
      c[2] = (c[1] & 0xFF000000) | c[2];
      c[1] = (c[1] & 0x00FFFFFF) | (c[2] << 24);
      c[2] = (c[2] >> 24);
      break;
    case 10:
      c[2] = ((c[2] << 8) & 0x0000FF00) | ((c[2] >> 8) & 0x000000FF);
      break;
    case 11:
      c[2] = (c[2] & 0x000000FF) | ((c[2] << 8) & 0x00FF0000) | ((c[2] >> 8) & 0x0000FF00);
      break;
    case 12:
      c[2] = (c[2] & 0x0000FFFF) | ((c[2] << 8) & 0xFF000000) | ((c[2] >> 8) & 0x00FF0000);
      break;
    case 13:
      c[3] = (c[2] & 0xFF000000) | c[3];
      c[2] = (c[2] & 0x00FFFFFF) | (c[3] << 24);
      c[3] = (c[3] >> 24);
      break;
    case 14:
      c[3] = ((c[3] << 8) & 0x0000FF00) | ((c[3] >> 8) & 0x000000FF);
      break;
    case 15:
      c[3] = (c[3] & 0x000000FF) | ((c[3] << 8) & 0x00FF0000) | ((c[3] >> 8) & 0x0000FF00);
      break;
    case 16:
      c[3] = (c[3] & 0x0000FFFF) | ((c[3] << 8) & 0xFF000000) | ((c[3] >> 8) & 0x00FF0000);
      break;
    case 17:
      d[0] = (c[3] & 0xFF000000) | d[0];
      c[3] = (c[3] & 0x00FFFFFF) | (d[0] << 24);
      d[0] = (d[0] >> 24);
      break;
    case 18:
      d[0] = ((d[0] << 8) & 0x0000FF00) | ((d[0] >> 8) & 0x000000FF);
      break;
    case 19:
      d[0] = (d[0] & 0x000000FF) | ((d[0] << 8) & 0x00FF0000) | ((d[0] >> 8) & 0x0000FF00);
      break;
    case 20:
      d[0] = (d[0] & 0x0000FFFF) | ((d[0] << 8) & 0xFF000000) | ((d[0] >> 8) & 0x00FF0000);
      break;
    case 21:
      d[1] = (d[0] & 0xFF000000) | d[1];
      d[0] = (d[0] & 0x00FFFFFF) | (d[1] << 24);
      d[1] = (d[1] >> 24);
      break;
    case 22:
      d[1] = ((d[1] << 8) & 0x0000FF00) | ((d[1] >> 8) & 0x000000FF);
      break;
    case 23:
      d[1] = (d[1] & 0x000000FF) | ((d[1] << 8) & 0x00FF0000) | ((d[1] >> 8) & 0x0000FF00);
      break;
    case 24:
      d[1] = (d[1] & 0x0000FFFF) | ((d[1] << 8) & 0xFF000000) | ((d[1] >> 8) & 0x00FF0000);
      break;
    case 25:
      d[2] = (d[1] & 0xFF000000) | d[2];
      d[1] = (d[1] & 0x00FFFFFF) | (d[2] << 24);
      d[2] = (d[2] >> 24);
      break;
    case 26:
      d[2] = ((d[2] << 8) & 0x0000FF00) | ((d[2] >> 8) & 0x000000FF);
      break;
    case 27:
      d[2] = (d[2] & 0x000000FF) | ((d[2] << 8) & 0x00FF0000) | ((d[2] >> 8) & 0x0000FF00);
      break;
    case 28:
      d[2] = (d[2] & 0x0000FFFF) | ((d[2] << 8) & 0xFF000000) | ((d[2] >> 8) & 0x00FF0000);
      break;
    case 29:
      d[3] = (d[2] & 0xFF000000) | d[3];
      d[2] = (d[2] & 0x00FFFFFF) | (d[3] << 24);
      d[3] = (d[3] >> 24);
      break;
    case 30:
      d[3] = ((d[3] << 8) & 0x0000FF00) | ((d[3] >> 8) & 0x000000FF);
      break;
    case 31:
      d[3] = (d[3] & 0x000000FF) | ((d[3] << 8) & 0x00FF0000) | ((d[3] >> 8) & 0x0000FF00);
      break;
  }

  return e;
}

inline u32 DL(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);
  if (b >= e)
    return (e);

  u32 f = 0;
  u32 g = 0;
  switch (a) {
    case 0:
      f = (c[0] >> 0) & 0xFF;
      break;
    case 1:
      f = (c[0] >> 8) & 0xFF;
      break;
    case 2:
      f = (c[0] >> 16) & 0xFF;
      break;
    case 3:
      f = (c[0] >> 24) & 0xFF;
      break;
    case 4:
      f = (c[1] >> 0) & 0xFF;
      break;
    case 5:
      f = (c[1] >> 8) & 0xFF;
      break;
    case 6:
      f = (c[1] >> 16) & 0xFF;
      break;
    case 7:
      f = (c[1] >> 24) & 0xFF;
      break;
    case 8:
      f = (c[2] >> 0) & 0xFF;
      break;
    case 9:
      f = (c[2] >> 8) & 0xFF;
      break;
    case 10:
      f = (c[2] >> 16) & 0xFF;
      break;
    case 11:
      f = (c[2] >> 24) & 0xFF;
      break;
    case 12:
      f = (c[3] >> 0) & 0xFF;
      break;
    case 13:
      f = (c[3] >> 8) & 0xFF;
      break;
    case 14:
      f = (c[3] >> 16) & 0xFF;
      break;
    case 15:
      f = (c[3] >> 24) & 0xFF;
      break;
    case 16:
      f = (d[0] >> 0) & 0xFF;
      break;
    case 17:
      f = (d[0] >> 8) & 0xFF;
      break;
    case 18:
      f = (d[0] >> 16) & 0xFF;
      break;
    case 19:
      f = (d[0] >> 24) & 0xFF;
      break;
    case 20:
      f = (d[1] >> 0) & 0xFF;
      break;
    case 21:
      f = (d[1] >> 8) & 0xFF;
      break;
    case 22:
      f = (d[1] >> 16) & 0xFF;
      break;
    case 23:
      f = (d[1] >> 24) & 0xFF;
      break;
    case 24:
      f = (d[2] >> 0) & 0xFF;
      break;
    case 25:
      f = (d[2] >> 8) & 0xFF;
      break;
    case 26:
      f = (d[2] >> 16) & 0xFF;
      break;
    case 27:
      f = (d[2] >> 24) & 0xFF;
      break;
    case 28:
      f = (d[3] >> 0) & 0xFF;
      break;
    case 29:
      f = (d[3] >> 8) & 0xFF;
      break;
    case 30:
      f = (d[3] >> 16) & 0xFF;
      break;
    case 31:
      f = (d[3] >> 24) & 0xFF;
      break;
  }

  switch (b) {
    case 0:
      g = (c[0] >> 0) & 0xff;
      c[0] = (c[0] & 0xffffff00) | f << 0;
      break;
    case 1:
      g = (c[0] >> 8) & 0xff;
      c[0] = (c[0] & 0xffff00ff) | f << 8;
      break;
    case 2:
      g = (c[0] >> 16) & 0xff;
      c[0] = (c[0] & 0xff00ffff) | f << 16;
      break;
    case 3:
      g = (c[0] >> 24) & 0xff;
      c[0] = (c[0] & 0x00ffffff) | f << 24;
      break;
    case 4:
      g = (c[1] >> 0) & 0xff;
      c[1] = (c[1] & 0xffffff00) | f << 0;
      break;
    case 5:
      g = (c[1] >> 8) & 0xff;
      c[1] = (c[1] & 0xffff00ff) | f << 8;
      break;
    case 6:
      g = (c[1] >> 16) & 0xff;
      c[1] = (c[1] & 0xff00ffff) | f << 16;
      break;
    case 7:
      g = (c[1] >> 24) & 0xff;
      c[1] = (c[1] & 0x00ffffff) | f << 24;
      break;
    case 8:
      g = (c[2] >> 0) & 0xff;
      c[2] = (c[2] & 0xffffff00) | f << 0;
      break;
    case 9:
      g = (c[2] >> 8) & 0xff;
      c[2] = (c[2] & 0xffff00ff) | f << 8;
      break;
    case 10:
      g = (c[2] >> 16) & 0xff;
      c[2] = (c[2] & 0xff00ffff) | f << 16;
      break;
    case 11:
      g = (c[2] >> 24) & 0xff;
      c[2] = (c[2] & 0x00ffffff) | f << 24;
      break;
    case 12:
      g = (c[3] >> 0) & 0xff;
      c[3] = (c[3] & 0xffffff00) | f << 0;
      break;
    case 13:
      g = (c[3] >> 8) & 0xff;
      c[3] = (c[3] & 0xffff00ff) | f << 8;
      break;
    case 14:
      g = (c[3] >> 16) & 0xff;
      c[3] = (c[3] & 0xff00ffff) | f << 16;
      break;
    case 15:
      g = (c[3] >> 24) & 0xff;
      c[3] = (c[3] & 0x00ffffff) | f << 24;
      break;
    case 16:
      g = (d[0] >> 0) & 0xff;
      d[0] = (d[0] & 0xffffff00) | f << 0;
      break;
    case 17:
      g = (d[0] >> 8) & 0xff;
      d[0] = (d[0] & 0xffff00ff) | f << 8;
      break;
    case 18:
      g = (d[0] >> 16) & 0xff;
      d[0] = (d[0] & 0xff00ffff) | f << 16;
      break;
    case 19:
      g = (d[0] >> 24) & 0xff;
      d[0] = (d[0] & 0x00ffffff) | f << 24;
      break;
    case 20:
      g = (d[1] >> 0) & 0xff;
      d[1] = (d[1] & 0xffffff00) | f << 0;
      break;
    case 21:
      g = (d[1] >> 8) & 0xff;
      d[1] = (d[1] & 0xffff00ff) | f << 8;
      break;
    case 22:
      g = (d[1] >> 16) & 0xff;
      d[1] = (d[1] & 0xff00ffff) | f << 16;
      break;
    case 23:
      g = (d[1] >> 24) & 0xff;
      d[1] = (d[1] & 0x00ffffff) | f << 24;
      break;
    case 24:
      g = (d[2] >> 0) & 0xff;
      d[2] = (d[2] & 0xffffff00) | f << 0;
      break;
    case 25:
      g = (d[2] >> 8) & 0xff;
      d[2] = (d[2] & 0xffff00ff) | f << 8;
      break;
    case 26:
      g = (d[2] >> 16) & 0xff;
      d[2] = (d[2] & 0xff00ffff) | f << 16;
      break;
    case 27:
      g = (d[2] >> 24) & 0xff;
      d[2] = (d[2] & 0x00ffffff) | f << 24;
      break;
    case 28:
      g = (d[3] >> 0) & 0xff;
      d[3] = (d[3] & 0xffffff00) | f << 0;
      break;
    case 29:
      g = (d[3] >> 8) & 0xff;
      d[3] = (d[3] & 0xffff00ff) | f << 8;
      break;
    case 30:
      g = (d[3] >> 16) & 0xff;
      d[3] = (d[3] & 0xff00ffff) | f << 16;
      break;
    case 31:
      g = (d[3] >> 24) & 0xff;
      d[3] = (d[3] & 0x00ffffff) | f << 24;
      break;
  }

  switch (a) {
    case 0:
      c[0] = (c[0] & 0xffffff00) | g << 0;
      break;
    case 1:
      c[0] = (c[0] & 0xffff00ff) | g << 8;
      break;
    case 2:
      c[0] = (c[0] & 0xff00ffff) | g << 16;
      break;
    case 3:
      c[0] = (c[0] & 0x00ffffff) | g << 24;
      break;
    case 4:
      c[1] = (c[1] & 0xffffff00) | g << 0;
      break;
    case 5:
      c[1] = (c[1] & 0xffff00ff) | g << 8;
      break;
    case 6:
      c[1] = (c[1] & 0xff00ffff) | g << 16;
      break;
    case 7:
      c[1] = (c[1] & 0x00ffffff) | g << 24;
      break;
    case 8:
      c[2] = (c[2] & 0xffffff00) | g << 0;
      break;
    case 9:
      c[2] = (c[2] & 0xffff00ff) | g << 8;
      break;
    case 10:
      c[2] = (c[2] & 0xff00ffff) | g << 16;
      break;
    case 11:
      c[2] = (c[2] & 0x00ffffff) | g << 24;
      break;
    case 12:
      c[3] = (c[3] & 0xffffff00) | g << 0;
      break;
    case 13:
      c[3] = (c[3] & 0xffff00ff) | g << 8;
      break;
    case 14:
      c[3] = (c[3] & 0xff00ffff) | g << 16;
      break;
    case 15:
      c[3] = (c[3] & 0x00ffffff) | g << 24;
      break;
    case 16:
      d[0] = (d[0] & 0xffffff00) | g << 0;
      break;
    case 17:
      d[0] = (d[0] & 0xffff00ff) | g << 8;
      break;
    case 18:
      d[0] = (d[0] & 0xff00ffff) | g << 16;
      break;
    case 19:
      d[0] = (d[0] & 0x00ffffff) | g << 24;
      break;
    case 20:
      d[1] = (d[1] & 0xffffff00) | g << 0;
      break;
    case 21:
      d[1] = (d[1] & 0xffff00ff) | g << 8;
      break;
    case 22:
      d[1] = (d[1] & 0xff00ffff) | g << 16;
      break;
    case 23:
      d[1] = (d[1] & 0x00ffffff) | g << 24;
      break;
    case 24:
      d[2] = (d[2] & 0xffffff00) | g << 0;
      break;
    case 25:
      d[2] = (d[2] & 0xffff00ff) | g << 8;
      break;
    case 26:
      d[2] = (d[2] & 0xff00ffff) | g << 16;
      break;
    case 27:
      d[2] = (d[2] & 0x00ffffff) | g << 24;
      break;
    case 28:
      d[3] = (d[3] & 0xffffff00) | g << 0;
      break;
    case 29:
      d[3] = (d[3] & 0xffff00ff) | g << 8;
      break;
    case 30:
      d[3] = (d[3] & 0xff00ffff) | g << 16;
      break;
    case 31:
      d[3] = (d[3] & 0x00ffffff) | g << 24;
      break;
  }

  return e;
}

inline u32 DM(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) << 1) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) << 1) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) << 1) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) << 1) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) << 1) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) << 1) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) << 1) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) << 1) & f);
      break;
  }

  return e;
}

inline u32 DN(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) >> 1) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) >> 1) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) >> 1) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) >> 1) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) >> 1) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) >> 1) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) >> 1) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) >> 1) & f);
      break;
  }

  return e;
}

inline u32 DO(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  const u32 h = 0x01010101 & f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) + h) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) + h) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) + h) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) + h) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) + h) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) + h) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) + h) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) + h) & f);
      break;
  }

  return e;
}

inline u32 DP(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a >= e)
    return (e);

  const u32 f = 0xffu << ((a & 3) * 8);
  const u32 g = ~f;

  const u32 h = 0x01010101 & f;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & g) | (((c[0] & f) - h) & f);
      break;
    case 1:
      c[1] = (c[1] & g) | (((c[1] & f) - h) & f);
      break;
    case 2:
      c[2] = (c[2] & g) | (((c[2] & f) - h) & f);
      break;
    case 3:
      c[3] = (c[3] & g) | (((c[3] & f) - h) & f);
      break;
    case 4:
      d[0] = (d[0] & g) | (((d[0] & f) - h) & f);
      break;
    case 5:
      d[1] = (d[1] & g) | (((d[1] & f) - h) & f);
      break;
    case 6:
      d[2] = (d[2] & g) | (((d[2] & f) - h) & f);
      break;
    case 7:
      d[3] = (d[3] & g) | (((d[3] & f) - h) & f);
      break;
  }

  return e;
}

inline u32 DQ(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if ((a + 1) >= e)
    return (e);

  u32 f[4];
  u32 g[4];

  CA(c, d, f, g);

  const u32 h = 0xffu << ((a & 3) * 8);
  const u32 i = ~h;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (f[0] & h);
      break;
    case 1:
      c[1] = (c[1] & i) | (f[1] & h);
      break;
    case 2:
      c[2] = (c[2] & i) | (f[2] & h);
      break;
    case 3:
      c[3] = (c[3] & i) | (f[3] & h);
      break;
    case 4:
      d[0] = (d[0] & i) | (g[0] & h);
      break;
    case 5:
      d[1] = (d[1] & i) | (g[1] & h);
      break;
    case 6:
      d[2] = (d[2] & i) | (g[2] & h);
      break;
    case 7:
      d[3] = (d[3] & i) | (g[3] & h);
      break;
  }

  return e;
}

inline u32 DR(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a == 0)
    return (e);

  if (a >= e)
    return (e);

  u32 f[4];
  u32 g[4];

  CB(c, d, f, g);

  const u32 h = 0xffu << ((a & 3) * 8);
  const u32 i = ~h;

  switch (a / 4) {
    case 0:
      c[0] = (c[0] & i) | (f[0] & h);
      break;
    case 1:
      c[1] = (c[1] & i) | (f[1] & h);
      break;
    case 2:
      c[2] = (c[2] & i) | (f[2] & h);
      break;
    case 3:
      c[3] = (c[3] & i) | (f[3] & h);
      break;
    case 4:
      d[0] = (d[0] & i) | (g[0] & h);
      break;
    case 5:
      d[1] = (d[1] & i) | (g[1] & h);
      break;
    case 6:
      d[2] = (d[2] & i) | (g[2] & h);
      break;
    case 7:
      d[3] = (d[3] & i) | (g[3] & h);
      break;
  }

  return e;
}

inline u32 DS(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a > e)
    return (e);

  if ((e + a) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  g[0] = c[0];
  g[1] = c[1];
  g[2] = c[2];
  g[3] = c[3];
  h[0] = d[0];
  h[1] = d[1];
  h[2] = d[2];
  h[3] = d[3];

  BY(g, h, a);

  CD(c, d, c, d, a);

  c[0] |= g[0];
  c[1] |= g[1];
  c[2] |= g[2];
  c[3] |= g[3];
  d[0] |= h[0];
  d[1] |= h[1];
  d[2] |= h[2];
  d[3] |= h[3];

  f += a;

  return f;
}

inline u32 DT(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  if (a > e)
    return (e);

  if ((e + a) >= 32)
    return (e);

  u32 f = e;

  u32 g[4];
  u32 h[4];

  CD(c, d, g, h, a);

  BZ(g, h, f);

  c[0] |= g[0];
  c[1] |= g[1];
  c[2] |= g[2];
  c[3] |= g[3];
  d[0] |= h[0];
  d[1] |= h[1];
  d[2] |= h[2];
  d[3] |= h[3];

  f += a;

  return f;
}

inline u32 DU(const u32 a, const u32 b, u32 c[4], u32 d[4], const u32 e) {
  c[0] |= (BX(c[0]));
  c[1] |= (BX(c[1]));
  c[2] |= (BX(c[2]));
  c[3] |= (BX(c[3]));
  d[0] |= (BX(d[0]));
  d[1] |= (BX(d[1]));
  d[2] |= (BX(d[2]));
  d[3] |= (BX(d[3]));
  u32 f[4];
  u32 g[4];

  const uchar4 h = (uchar4)(' ');
  const uchar4 i = (uchar4)(0x00);
  const uchar4 j = (uchar4)(0xff);

  uchar4 k;

  k = __builtin_astype(c[0], uchar4);
  k = ((k == h) ? (j) : (i));
  f[0] = __builtin_astype(k, uint);
  k = __builtin_astype(c[1], uchar4);
  k = ((k == h) ? (j) : (i));
  f[1] = __builtin_astype(k, uint);
  k = __builtin_astype(c[2], uchar4);
  k = ((k == h) ? (j) : (i));
  f[2] = __builtin_astype(k, uint);
  k = __builtin_astype(c[3], uchar4);
  k = ((k == h) ? (j) : (i));
  f[3] = __builtin_astype(k, uint);
  k = __builtin_astype(d[0], uchar4);
  k = ((k == h) ? (j) : (i));
  g[0] = __builtin_astype(k, uint);
  k = __builtin_astype(d[1], uchar4);
  k = ((k == h) ? (j) : (i));
  g[1] = __builtin_astype(k, uint);
  k = __builtin_astype(d[2], uchar4);
  k = ((k == h) ? (j) : (i));
  g[2] = __builtin_astype(k, uint);
  k = __builtin_astype(d[3], uchar4);
  k = ((k == h) ? (j) : (i));
  g[3] = __builtin_astype(k, uint);

  CB(f, g, f, g);
  f[0] |= 0xff;

  c[0] &= ~(BX(c[0]) & f[0]);
  c[1] &= ~(BX(c[1]) & f[1]);
  c[2] &= ~(BX(c[2]) & f[2]);
  c[3] &= ~(BX(c[3]) & f[3]);
  d[0] &= ~(BX(d[0]) & g[0]);
  d[1] &= ~(BX(d[1]) & g[1]);
  d[2] &= ~(BX(d[2]) & g[2]);
  d[3] &= ~(BX(d[3]) & g[3]);

  return e;
}

inline u32 BU(const u32 a, const u32 b, const u32 c, u32 d[4], u32 e[4], const u32 f) {
  u32 g = f;

  switch (a) {
    case 'l':
      g = CH(b, c, d, e, g);
      break;
    case 'u':
      g = CI(b, c, d, e, g);
      break;
    case 'c':
      g = CJ(b, c, d, e, g);
      break;
    case 'C':
      g = CK(b, c, d, e, g);
      break;
    case 't':
      g = CL(b, c, d, e, g);
      break;
    case 'T':
      g = CM(b, c, d, e, g);
      break;
    case 'r':
      g = CN(b, c, d, e, g);
      break;
    case 'd':
      g = CO(b, c, d, e, g);
      break;
    case 'p':
      g = CP(b, c, d, e, g);
      break;
    case 'f':
      g = CQ(b, c, d, e, g);
      break;
    case '$':
      g = CR(b, c, d, e, g);
      break;
    case '^':
      g = CS(b, c, d, e, g);
      break;
    case '{':
      g = CT(b, c, d, e, g);
      break;
    case '}':
      g = CU(b, c, d, e, g);
      break;
    case '[':
      g = CV(b, c, d, e, g);
      break;
    case ']':
      g = CW(b, c, d, e, g);
      break;
    case 'D':
      g = CX(b, c, d, e, g);
      break;
    case 'x':
      g = CY(b, c, d, e, g);
      break;
    case 'O':
      g = CZ(b, c, d, e, g);
      break;
    case 'i':
      g = DA(b, c, d, e, g);
      break;
    case 'o':
      g = DB(b, c, d, e, g);
      break;
    case '\'':
      g = DC(b, c, d, e, g);
      break;
    case 's':
      g = DD(b, c, d, e, g);
      break;

    case 'z':
      g = DG(b, c, d, e, g);
      break;
    case 'Z':
      g = DH(b, c, d, e, g);
      break;
    case 'q':
      g = DI(b, c, d, e, g);
      break;
    case 'k':
      g = DJ(b, c, d, e, g);
      break;
    case 'K':
      g = DK(b, c, d, e, g);
      break;
    case '*':
      g = DL(b, c, d, e, g);
      break;
    case 'L':
      g = DM(b, c, d, e, g);
      break;
    case 'R':
      g = DN(b, c, d, e, g);
      break;
    case '+':
      g = DO(b, c, d, e, g);
      break;
    case '-':
      g = DP(b, c, d, e, g);
      break;
    case '.':
      g = DQ(b, c, d, e, g);
      break;
    case ',':
      g = DR(b, c, d, e, g);
      break;
    case 'y':
      g = DS(b, c, d, e, g);
      break;
    case 'Y':
      g = DT(b, c, d, e, g);
      break;
    case 'E':
      g = DU(b, c, d, e, g);
      break;
  }

  return g;
}

inline u32 BV(const __global u32* a, u32 b[4], u32 c[4], const u32 d) {
  u32 e = d;

  for (u32 f = 0; a[f] != 0; f++) {
    const u32 g = a[f];

    const u32 h = (g >> 0) & 0xff;
    const u32 i = (g >> 8) & 0xff;
    const u32 j = (g >> 16) & 0xff;

    e = BU(h, i, j, b, c, e);
  }

  return e;
}

inline u32x BW(const u32 a[4], const u32 b[4], const u32 c, const __global kernel_rule_t* d, const u32 e, u32x f[4], u32x g[4]) {
  f[0] = a[0];
  f[1] = a[1];
  f[2] = a[2];
  f[3] = a[3];
  g[0] = b[0];
  g[1] = b[1];
  g[2] = b[2];
  g[3] = b[3];

  return BV(d[e].cmds, f, g, c);
}
inline u32x DV(__global bf_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].i);
  return c;
}

inline u32x DW(__global comb_t* a, const u32 b) {
  const u32x c = (u32x)(a[b + 0].pw_len);
  return c;
}

inline u32x DX(__global comb_t* a, const u32 b, const int c) {
  const u32x d = (u32x)(a[b + 0].i[c]);
  return d;
}
__constant u32 Ga[256] = {

    0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x3f, 0x40, 0x41, 0x50, 0x43, 0x44, 0x45, 0x4b, 0x47, 0x48, 0x4d, 0x4e, 0x54, 0x51, 0x53, 0x46, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x56, 0x55, 0x5c, 0x49, 0x5d, 0x4a,
    0x42, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x58, 0x5b, 0x59, 0xff, 0x52, 0x4c, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x57, 0x5e, 0x5a, 0x4f, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};

__constant u32 Gb[48] = {0x14, 0x77, 0xf3, 0xd4, 0xbb, 0x71, 0x23, 0xd0, 0x03, 0xff, 0x47, 0x93, 0x55, 0xaa, 0x66, 0x91, 0xf2, 0x88, 0x6b, 0x99, 0xbf, 0xcb, 0x32, 0x1a, 0x19, 0xd9, 0xa7, 0x82, 0x22, 0x49, 0xa2, 0x51, 0xe2, 0xb7, 0x33, 0x71, 0x8b, 0x9f, 0x5d, 0x01, 0x44, 0x70, 0xae, 0x11, 0xef, 0x28, 0xf0, 0x0d};

u32 DY(const u32 a) {
  u32 b = 0;

  b |= (Ga[(a >> 0) & 0xff]) << 0;
  b |= (Ga[(a >> 8) & 0xff]) << 8;
  b |= (Ga[(a >> 16) & 0xff]) << 16;
  b |= (Ga[(a >> 24) & 0xff]) << 24;

  return b;
}

u32 DZ(const u32 a[4], const u32 b, const u32 c[4], const u32 d, const u32 e, const u32 f, const u32 g, const u32 h, u32 i[16]) {
  i[0] = 0;
  i[1] = 0;
  i[2] = 0;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  i[6] = 0;
  i[7] = 0;
  i[8] = 0;
  i[9] = 0;
  i[10] = 0;
  i[11] = 0;
  i[12] = 0;
  i[13] = 0;
  i[14] = 0;
  i[15] = 0;

  u32 j = ((e >> 24) & 3) + ((e >> 16) & 3) + ((e >> 8) & 3) + ((e >> 0) & 3) + ((f >> 8) & 3);

  j |= 0x20;

  const u32 k[2] = { a0], a1] };

  const u32 l[3] c u32 m[4] = {e, f, g, h};

  u32 n = 0;
  u32 o = 0;
  u32 p = 0;

  u32 q = 0;

  if ((h >> 24) & 1) {
    q |= Gb[47] << 0;
    q |= (k[0] & 0xff) << 8;
    q |= (l[0] & 0xff) << 16;
    q |= Gb[1] << 24;

    n = 1;
    o = 5;
    p = 1;
  } else {
    q |= (k[0] & 0xff) << 0;
    q |= (l[0] & 0xff) << 8;
    q |= Gb[0] << 16;

    n = 1;
    o = 4;
    p = 1;
  }

  i[0] = q;

  while ((n < b) && (p < d)) {
    u32 r = 0;

    u32 s = o;

    if ((((m)[(15 - n) / 4] >> (((15 - n) & 3) * 8)) & 0xff) & 1) {
      r |= Gb[48 - 1 - n] << 0;
      o++;
      r |= (((k)[(n) / 4] >> (((n)&3) * 8)) & 0xff) << 8;
      o++;
      n++;
      r |= (((l)[(p) / 4] >> (((p)&3) * 8)) & 0xff) << 16;
      o++;
      p++;
      r |= Gb[o - n - p] << 24;
      o++;
      o++;
    } else {
      r |= (((k)[(n) / 4] >> (((n)&3) * 8)) & 0xff) << 0;
      o++;
      n++;
      r |= (((l)[(p) / 4] >> (((p)&3) * 8)) & 0xff) << 8;
      o++;
      p++;
      r |= Gb[o - n - p] << 16;
      o++;
      o++;
    }

    {
      const u32 l = ((s)&3) * 8;
      const u64 t = (u64)(r) << l;
      (i)[((s) / 4) + 0] &= ~(0xff << ((s & 3) * 8));
      (i)[((s) / 4) + 0] |= t;
      (i)[((s) / 4) + 1] = t >> 32;
    };

    if (o >= j) {
      return j;
    }
  }

  while ((n < b) || (p < d)) {
    if (n < b) {
      if ((((m)[(15 - n) / 4] >> (((15 - n) & 3) * 8)) & 0xff) & 1) {
        ((i)[(o) / 4] = (((i)[(o) / 4] & ~(0xff << (((o)&3) * 8))) | ((Gb[48 - 1 - n]) << (((o)&3) * 8))));

        o++;
      }

      ((i)[(o) / 4] = (((i)[(o) / 4] & ~(0xff << (((o)&3) * 8))) | (((((k)[(n) / 4] >> (((n)&3) * 8)) & 0xff)) << (((o)&3) * 8))));

      n++;
      o++;
    } else {
      ((i)[(o) / 4] = (((i)[(o) / 4] & ~(0xff << (((o)&3) * 8))) | (((((l)[(p) / 4] >> (((p)&3) * 8)) & 0xff)) << (((o)&3) * 8))));

      o++;
      p++;
    }

    ((i)[(o) / 4] = (((i)[(o) / 4] & ~(0xff << (((o)&3) * 8))) | ((Gb[o - n - p]) << (((o)&3) * 8))));

    o++;
    o++;

    if (o >= j) {
      return j;
    }
  }

  while (o < j) {
    ((i)[(o) / 4] = (((i)[(o) / 4] & ~(0xff << (((o)&3) * 8))) | ((Gb[o - n - p]) << (((o)&3) * 8))));

    o++;
    o++;
  }

  return j;
}

__kernel void EA(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_local_id(0);

  const u32 ah = get_global_id(0);

  if (ah >= af)
    return;

  u32 ai[4];
  u32 aj[4];

  ai[0] = a[ah].i[0];
  ai[1] = a[ah].i[1];
  ai[2] = a[ah].i[2];
  ai[3] = a[ah].i[3];
  aj[0] = a[ah].i[4];
  aj[1] = a[ah].i[5];
  aj[2] = a[ah].i[6];
  aj[3] = a[ah].i[7];

  const u32 ak = a[ah].pw_len;

  u32 al[4];

  al[0] = r[y].salt_buf[0];
  al[1] = r[y].salt_buf[1];
  al[2] = r[y].salt_buf[2];
  al[3] = 0;

  const u32 am = r[y].salt_len;

  al[0] = DY(al[0]);
  al[1] = DY(al[1]);
  al[2] = DY(al[2]);

  for (u32 an = 0; an < ab; an += 1) {
    u32x ao[4] = {0};
    u32x ap[4] = {0};
    u32x aq[4] = {0};
    u32x ar[4] = {0};

    const u32x as = BW(ai, aj, ak, b, an, ao, ap);

    if (as > 8)
      continue;

    ao[0] = DY(ao[0]);
    ao[1] = DY(ao[1]);

    u32 at[4];
    u32 au[4];
    u32 av[4];
    u32 aw[4];

    at[0] = al[0];
    at[1] = al[1];
    at[2] = al[2];
    at[3] = 0;
    au[0] = 0;
    au[1] = 0;
    au[2] = 0;
    au[3] = 0;
    av[0] = 0;
    av[1] = 0;
    av[2] = 0;
    av[3] = 0;
    aw[0] = 0;
    aw[1] = 0;
    aw[2] = 0;
    aw[3] = 0;

    AU(at, au, av, aw, as);

    const u32 ax = as + am;

    u32 ay[16];

    ay[0] = at[0] | ao[0];
    ay[1] = at[1] | ao[1];
    ay[2] = at[2];
    ay[3] = at[3];
    ay[4] = au[0];
    ay[5] = 0;
    ay[6] = 0;
    ay[7] = 0;
    ay[8] = 0;
    ay[9] = 0;
    ay[10] = 0;
    ay[11] = 0;
    ay[12] = 0;
    ay[13] = 0;
    ay[14] = ax * 8;
    ay[15] = 0;

    ((ay)[(ax) / 4] = (((ay)[(ax) / 4] & ~(0xff << (((ax)&3) * 8))) | ((0x80) << (((ax)&3) * 8))));

    u32 az = 0x67452301u;
    u32 ba = 0xefcdab89u;
    u32 bb = 0x98badcfeu;
    u32 bc = 0x10325476u;

    {
      az += 0xd76aa478u;
      az += ay[0];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0xe8c7b756u;
      bc += ay[1];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0x242070dbu;
      bb += ay[2];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0xc1bdceeeu;
      ba += ay[3];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };
    {
      az += 0xf57c0fafu;
      az += ay[4];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0x4787c62au;
      bc += ay[5];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0xa8304613u;
      bb += ay[6];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0xfd469501u;
      ba += ay[7];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };
    {
      az += 0x698098d8u;
      az += ay[8];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0x8b44f7afu;
      bc += ay[9];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0xffff5bb1u;
      bb += ay[10];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0x895cd7beu;
      ba += ay[11];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };
    {
      az += 0x6b901122u;
      az += ay[12];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0xfd987193u;
      bc += ay[13];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0xa679438eu;
      bb += ay[14];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0x49b40821u;
      ba += ay[15];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };

    {
      az += 0xf61e2562u;
      az += ay[1];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0xc040b340u;
      bc += ay[6];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0x265e5a51u;
      bb += ay[11];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0xe9b6c7aau;
      ba += ay[0];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };
    {
      az += 0xd62f105du;
      az += ay[5];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0x02441453u;
      bc += ay[10];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0xd8a1e681u;
      bb += ay[15];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0xe7d3fbc8u;
      ba += ay[4];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };
    {
      az += 0x21e1cde6u;
      az += ay[9];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0xc33707d6u;
      bc += ay[14];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0xf4d50d87u;
      bb += ay[3];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0x455a14edu;
      ba += ay[8];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };
    {
      az += 0xa9e3e905u;
      az += ay[13];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0xfcefa3f8u;
      bc += ay[2];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0x676f02d9u;
      bb += ay[7];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0x8d2a4c8au;
      ba += ay[12];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };

    {
      az += 0xfffa3942u;
      az += ay[5];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0x8771f681u;
      bc += ay[8];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0x6d9d6122u;
      bb += ay[11];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0xfde5380cu;
      ba += ay[14];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };
    {
      az += 0xa4beea44u;
      az += ay[1];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0x4bdecfa9u;
      bc += ay[4];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0xf6bb4b60u;
      bb += ay[7];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0xbebfbc70u;
      ba += ay[10];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };
    {
      az += 0x289b7ec6u;
      az += ay[13];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0xeaa127fau;
      bc += ay[0];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0xd4ef3085u;
      bb += ay[3];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0x04881d05u;
      ba += ay[6];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };
    {
      az += 0xd9d4d039u;
      az += ay[9];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0xe6db99e5u;
      bc += ay[12];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0x1fa27cf8u;
      bb += ay[15];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0xc4ac5665u;
      ba += ay[2];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };

    {
      az += 0xf4292244u;
      az += ay[0];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0x432aff97u;
      bc += ay[7];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0xab9423a7u;
      bb += ay[14];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0xfc93a039u;
      ba += ay[5];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };
    {
      az += 0x655b59c3u;
      az += ay[12];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0x8f0ccc92u;
      bc += ay[3];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0xffeff47du;
      bb += ay[10];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0x85845dd1u;
      ba += ay[1];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };
    {
      az += 0x6fa87e4fu;
      az += ay[8];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0xfe2ce6e0u;
      bc += ay[15];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0xa3014314u;
      bb += ay[6];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0x4e0811a1u;
      ba += ay[13];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };
    {
      az += 0xf7537e82u;
      az += ay[4];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0xbd3af235u;
      bc += ay[11];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0x2ad7d2bbu;
      bb += ay[2];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0xeb86d391u;
      ba += ay[9];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };

    az += 0x67452301u;
    ba += 0xefcdab89u;
    bb += 0x98badcfeu;
    bc += 0x10325476u;

    const u32 bd = DZ(ao, as, al, am, az, ba, bb, bc, ay);

    {
      const u32 be = ((bd)&3) * 8;
      const u64 bf = (u64)(0x80) << be;
      (ay)[((bd) / 4) + 0] &= ~(0xff << ((bd & 3) * 8));
      (ay)[((bd) / 4) + 0] |= bf;
      (ay)[((bd) / 4) + 1] = bf >> 32;
    };

    ay[14] = bd * 8;

    az = 0x67452301u;
    ba = 0xefcdab89u;
    bb = 0x98badcfeu;
    bc = 0x10325476u;

    {
      az += 0xd76aa478u;
      az += ay[0];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0xe8c7b756u;
      bc += ay[1];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0x242070dbu;
      bb += ay[2];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0xc1bdceeeu;
      ba += ay[3];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };
    {
      az += 0xf57c0fafu;
      az += ay[4];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0x4787c62au;
      bc += ay[5];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0xa8304613u;
      bb += ay[6];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0xfd469501u;
      ba += ay[7];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };
    {
      az += 0x698098d8u;
      az += ay[8];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0x8b44f7afu;
      bc += ay[9];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0xffff5bb1u;
      bb += ay[10];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0x895cd7beu;
      ba += ay[11];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };
    {
      az += 0x6b901122u;
      az += ay[12];
      az += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
      az = P(az, 7u);
      az += ba;
    };
    {
      bc += 0xfd987193u;
      bc += ay[13];
      bc += ((((bb)) ^ (((az)) & (((ba)) ^ ((bb))))));
      bc = P(bc, 12u);
      bc += az;
    };
    {
      bb += 0xa679438eu;
      bb += ay[14];
      bb += ((((ba)) ^ (((bc)) & (((az)) ^ ((ba))))));
      bb = P(bb, 17u);
      bb += bc;
    };
    {
      ba += 0x49b40821u;
      ba += ay[15];
      ba += ((((az)) ^ (((bb)) & (((bc)) ^ ((az))))));
      ba = P(ba, 22u);
      ba += bb;
    };

    {
      az += 0xf61e2562u;
      az += ay[1];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0xc040b340u;
      bc += ay[6];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0x265e5a51u;
      bb += ay[11];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0xe9b6c7aau;
      ba += ay[0];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };
    {
      az += 0xd62f105du;
      az += ay[5];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0x02441453u;
      bc += ay[10];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0xd8a1e681u;
      bb += ay[15];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0xe7d3fbc8u;
      ba += ay[4];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };
    {
      az += 0x21e1cde6u;
      az += ay[9];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0xc33707d6u;
      bc += ay[14];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0xf4d50d87u;
      bb += ay[3];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0x455a14edu;
      ba += ay[8];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };
    {
      az += 0xa9e3e905u;
      az += ay[13];
      az += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
      az = P(az, 5u);
      az += ba;
    };
    {
      bc += 0xfcefa3f8u;
      bc += ay[2];
      bc += ((((ba)) ^ (((bb)) & (((az)) ^ ((ba))))));
      bc = P(bc, 9u);
      bc += az;
    };
    {
      bb += 0x676f02d9u;
      bb += ay[7];
      bb += ((((az)) ^ (((ba)) & (((bc)) ^ ((az))))));
      bb = P(bb, 14u);
      bb += bc;
    };
    {
      ba += 0x8d2a4c8au;
      ba += ay[12];
      ba += ((((bc)) ^ (((az)) & (((bb)) ^ ((bc))))));
      ba = P(ba, 20u);
      ba += bb;
    };

    {
      az += 0xfffa3942u;
      az += ay[5];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0x8771f681u;
      bc += ay[8];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0x6d9d6122u;
      bb += ay[11];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0xfde5380cu;
      ba += ay[14];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };
    {
      az += 0xa4beea44u;
      az += ay[1];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0x4bdecfa9u;
      bc += ay[4];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0xf6bb4b60u;
      bb += ay[7];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0xbebfbc70u;
      ba += ay[10];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };
    {
      az += 0x289b7ec6u;
      az += ay[13];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0xeaa127fau;
      bc += ay[0];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0xd4ef3085u;
      bb += ay[3];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0x04881d05u;
      ba += ay[6];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };
    {
      az += 0xd9d4d039u;
      az += ay[9];
      az += ((ba) ^ (bb) ^ (bc));
      az = P(az, 4u);
      az += ba;
    };
    {
      bc += 0xe6db99e5u;
      bc += ay[12];
      bc += ((az) ^ (ba) ^ (bb));
      bc = P(bc, 11u);
      bc += az;
    };
    {
      bb += 0x1fa27cf8u;
      bb += ay[15];
      bb += ((bc) ^ (az) ^ (ba));
      bb = P(bb, 16u);
      bb += bc;
    };
    {
      ba += 0xc4ac5665u;
      ba += ay[2];
      ba += ((bb) ^ (bc) ^ (az));
      ba = P(ba, 23u);
      ba += bb;
    };

    {
      az += 0xf4292244u;
      az += ay[0];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0x432aff97u;
      bc += ay[7];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0xab9423a7u;
      bb += ay[14];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0xfc93a039u;
      ba += ay[5];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };
    {
      az += 0x655b59c3u;
      az += ay[12];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0x8f0ccc92u;
      bc += ay[3];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0xffeff47du;
      bb += ay[10];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0x85845dd1u;
      ba += ay[1];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };
    {
      az += 0x6fa87e4fu;
      az += ay[8];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0xfe2ce6e0u;
      bc += ay[15];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0xa3014314u;
      bb += ay[6];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0x4e0811a1u;
      ba += ay[13];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };
    {
      az += 0xf7537e82u;
      az += ay[4];
      az += ((bb) ^ ((ba) | ~(bc)));
      az = P(az, 6u);
      az += ba;
    };
    {
      bc += 0xbd3af235u;
      bc += ay[11];
      bc += ((ba) ^ ((az) | ~(bb)));
      bc = P(bc, 10u);
      bc += az;
    };
    {
      bb += 0x2ad7d2bbu;
      bb += ay[2];
      bb += ((az) ^ ((bc) | ~(ba)));
      bb = P(bb, 15u);
      bb += bc;
    };
    {
      ba += 0xeb86d391u;
      ba += ay[9];
      ba += ((bc) ^ ((bb) | ~(az)));
      ba = P(ba, 21u);
      ba += bb;
    };

    az += 0x67452301u;
    ba += 0xefcdab89u;
    bb += 0x98badcfeu;
    bc += 0x10325476u;

    az ^= bb;
    ba ^= bc;
    bb = 0;
    bc = 0;

    {
      const u32 bg[4] = {azz, baa, bbb, bcc};
      if (Z(bg, g, h, i, j, k, l, m, n, v, w, x)) {
        int bh = X(bg, ac, &p[ad]);
        if (bh != -1) {
          const u32 bi = ad + bh;
          if (atomic_add(&q[bi], 1) == 0) {
            AA(o, t, y, bh, bi, ah, an);
          }
        }
      }
    };
  }
}

__kernel void EB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void ED(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
  const u32 ag = get_local_id(0);

  const u32 ah = get_global_id(0);

  if (ah >= af)
    return;

  u32 ai[4];
  u32 aj[4];

  ai[0] = a[ah].i[0];
  ai[1] = a[ah].i[1];
  ai[2] = a[ah].i[2];
  ai[3] = a[ah].i[3];
  aj[0] = a[ah].i[4];
  aj[1] = a[ah].i[5];
  aj[2] = a[ah].i[6];
  aj[3] = a[ah].i[7];

  const u32 ak = a[ah].pw_len;

  u32 al[4];

  al[0] = r[y].salt_buf[0];
  al[1] = r[y].salt_buf[1];
  al[2] = r[y].salt_buf[2];
  al[3] = 0;

  const u32 am = r[y].salt_len;

  al[0] = DY(al[0]);
  al[1] = DY(al[1]);
  al[2] = DY(al[2]);

  const u32 an[4] =
ad[ad[1],
    0,
    0
};

for (u32 ao = 0; ao < ab; ao += 1) {
  u32x ap[4] = {0};
  u32x aq[4] = {0};
  u32x ar[4] = {0};
  u32x as[4] = {0};

  const u32x at = BW(ai, aj, ak, b, ao, ap, aq);

  if (at > 8)
    continue;

  ap[0] = DY(ap[0]);
  ap[1] = DY(ap[1]);

  u32 au[4];
  u32 av[4];
  u32 aw[4];
  u32 ax[4];

  au[0] = al[0];
  au[1] = al[1];
  au[2] = al[2];
  au[3] = 0;
  av[0] = 0;
  av[1] = 0;
  av[2] = 0;
  av[3] = 0;
  aw[0] = 0;
  aw[1] = 0;
  aw[2] = 0;
  aw[3] = 0;
  ax[0] = 0;
  ax[1] = 0;
  ax[2] = 0;
  ax[3] = 0;

  AU(au, av, aw, ax, at);

  const u32 ay = at + am;

  u32 az[16];

  az[0] = au[0] | ap[0];
  az[1] = au[1] | ap[1];
  az[2] = au[2];
  az[3] = au[3];
  az[4] = av[0];
  az[5] = 0;
  az[6] = 0;
  az[7] = 0;
  az[8] = 0;
  az[9] = 0;
  az[10] = 0;
  az[11] = 0;
  az[12] = 0;
  az[13] = 0;
  az[14] = ay * 8;
  az[15] = 0;

  ((az)[(ay) / 4] = (((az)[(ay) / 4] & ~(0xff << (((ay)&3) * 8))) | ((0x80) << (((ay)&3) * 8))));

  u32 ba = 0x67452301u;
  u32 bb = 0xefcdab89u;
  u32 bc = 0x98badcfeu;
  u32 bd = 0x10325476u;

  {
    ba += 0xd76aa478u;
    ba += az[0];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0xe8c7b756u;
    bd += az[1];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0x242070dbu;
    bc += az[2];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0xc1bdceeeu;
    bb += az[3];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };
  {
    ba += 0xf57c0fafu;
    ba += az[4];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0x4787c62au;
    bd += az[5];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0xa8304613u;
    bc += az[6];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0xfd469501u;
    bb += az[7];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };
  {
    ba += 0x698098d8u;
    ba += az[8];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0x8b44f7afu;
    bd += az[9];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0xffff5bb1u;
    bc += az[10];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0x895cd7beu;
    bb += az[11];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };
  {
    ba += 0x6b901122u;
    ba += az[12];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0xfd987193u;
    bd += az[13];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0xa679438eu;
    bc += az[14];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0x49b40821u;
    bb += az[15];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };

  {
    ba += 0xf61e2562u;
    ba += az[1];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0xc040b340u;
    bd += az[6];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0x265e5a51u;
    bc += az[11];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0xe9b6c7aau;
    bb += az[0];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };
  {
    ba += 0xd62f105du;
    ba += az[5];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0x02441453u;
    bd += az[10];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0xd8a1e681u;
    bc += az[15];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0xe7d3fbc8u;
    bb += az[4];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };
  {
    ba += 0x21e1cde6u;
    ba += az[9];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0xc33707d6u;
    bd += az[14];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0xf4d50d87u;
    bc += az[3];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0x455a14edu;
    bb += az[8];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };
  {
    ba += 0xa9e3e905u;
    ba += az[13];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0xfcefa3f8u;
    bd += az[2];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0x676f02d9u;
    bc += az[7];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0x8d2a4c8au;
    bb += az[12];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };

  {
    ba += 0xfffa3942u;
    ba += az[5];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0x8771f681u;
    bd += az[8];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0x6d9d6122u;
    bc += az[11];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0xfde5380cu;
    bb += az[14];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };
  {
    ba += 0xa4beea44u;
    ba += az[1];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0x4bdecfa9u;
    bd += az[4];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0xf6bb4b60u;
    bc += az[7];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0xbebfbc70u;
    bb += az[10];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };
  {
    ba += 0x289b7ec6u;
    ba += az[13];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0xeaa127fau;
    bd += az[0];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0xd4ef3085u;
    bc += az[3];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0x04881d05u;
    bb += az[6];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };
  {
    ba += 0xd9d4d039u;
    ba += az[9];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0xe6db99e5u;
    bd += az[12];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0x1fa27cf8u;
    bc += az[15];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0xc4ac5665u;
    bb += az[2];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };

  {
    ba += 0xf4292244u;
    ba += az[0];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0x432aff97u;
    bd += az[7];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0xab9423a7u;
    bc += az[14];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0xfc93a039u;
    bb += az[5];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };
  {
    ba += 0x655b59c3u;
    ba += az[12];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0x8f0ccc92u;
    bd += az[3];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0xffeff47du;
    bc += az[10];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0x85845dd1u;
    bb += az[1];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };
  {
    ba += 0x6fa87e4fu;
    ba += az[8];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0xfe2ce6e0u;
    bd += az[15];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0xa3014314u;
    bc += az[6];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0x4e0811a1u;
    bb += az[13];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };
  {
    ba += 0xf7537e82u;
    ba += az[4];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0xbd3af235u;
    bd += az[11];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0x2ad7d2bbu;
    bc += az[2];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0xeb86d391u;
    bb += az[9];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };

  ba += 0x67452301u;
  bb += 0xefcdab89u;
  bc += 0x98badcfeu;
  bd += 0x10325476u;

  const u32 be = DZ(ap, at, al, am, ba, bb, bc, bd, az);

  {
    const u32 bf = ((be)&3) * 8;
    const u64 bg = (u64)(0x80) << bf;
    (az)[((be) / 4) + 0] &= ~(0xff << ((be & 3) * 8));
    (az)[((be) / 4) + 0] |= bg;
    (az)[((be) / 4) + 1] = bg >> 32;
  };

  az[14] = be * 8;

  ba = 0x67452301u;
  bb = 0xefcdab89u;
  bc = 0x98badcfeu;
  bd = 0x10325476u;

  {
    ba += 0xd76aa478u;
    ba += az[0];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0xe8c7b756u;
    bd += az[1];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0x242070dbu;
    bc += az[2];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0xc1bdceeeu;
    bb += az[3];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };
  {
    ba += 0xf57c0fafu;
    ba += az[4];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0x4787c62au;
    bd += az[5];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0xa8304613u;
    bc += az[6];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0xfd469501u;
    bb += az[7];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };
  {
    ba += 0x698098d8u;
    ba += az[8];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0x8b44f7afu;
    bd += az[9];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0xffff5bb1u;
    bc += az[10];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0x895cd7beu;
    bb += az[11];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };
  {
    ba += 0x6b901122u;
    ba += az[12];
    ba += ((((bd)) ^ (((bb)) & (((bc)) ^ ((bd))))));
    ba = P(ba, 7u);
    ba += bb;
  };
  {
    bd += 0xfd987193u;
    bd += az[13];
    bd += ((((bc)) ^ (((ba)) & (((bb)) ^ ((bc))))));
    bd = P(bd, 12u);
    bd += ba;
  };
  {
    bc += 0xa679438eu;
    bc += az[14];
    bc += ((((bb)) ^ (((bd)) & (((ba)) ^ ((bb))))));
    bc = P(bc, 17u);
    bc += bd;
  };
  {
    bb += 0x49b40821u;
    bb += az[15];
    bb += ((((ba)) ^ (((bc)) & (((bd)) ^ ((ba))))));
    bb = P(bb, 22u);
    bb += bc;
  };

  {
    ba += 0xf61e2562u;
    ba += az[1];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0xc040b340u;
    bd += az[6];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0x265e5a51u;
    bc += az[11];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0xe9b6c7aau;
    bb += az[0];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };
  {
    ba += 0xd62f105du;
    ba += az[5];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0x02441453u;
    bd += az[10];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0xd8a1e681u;
    bc += az[15];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0xe7d3fbc8u;
    bb += az[4];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };
  {
    ba += 0x21e1cde6u;
    ba += az[9];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0xc33707d6u;
    bd += az[14];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0xf4d50d87u;
    bc += az[3];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0x455a14edu;
    bb += az[8];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };
  {
    ba += 0xa9e3e905u;
    ba += az[13];
    ba += ((((bc)) ^ (((bd)) & (((bb)) ^ ((bc))))));
    ba = P(ba, 5u);
    ba += bb;
  };
  {
    bd += 0xfcefa3f8u;
    bd += az[2];
    bd += ((((bb)) ^ (((bc)) & (((ba)) ^ ((bb))))));
    bd = P(bd, 9u);
    bd += ba;
  };
  {
    bc += 0x676f02d9u;
    bc += az[7];
    bc += ((((ba)) ^ (((bb)) & (((bd)) ^ ((ba))))));
    bc = P(bc, 14u);
    bc += bd;
  };
  {
    bb += 0x8d2a4c8au;
    bb += az[12];
    bb += ((((bd)) ^ (((ba)) & (((bc)) ^ ((bd))))));
    bb = P(bb, 20u);
    bb += bc;
  };

  {
    ba += 0xfffa3942u;
    ba += az[5];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0x8771f681u;
    bd += az[8];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0x6d9d6122u;
    bc += az[11];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0xfde5380cu;
    bb += az[14];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };
  {
    ba += 0xa4beea44u;
    ba += az[1];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0x4bdecfa9u;
    bd += az[4];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0xf6bb4b60u;
    bc += az[7];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0xbebfbc70u;
    bb += az[10];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };
  {
    ba += 0x289b7ec6u;
    ba += az[13];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0xeaa127fau;
    bd += az[0];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0xd4ef3085u;
    bc += az[3];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0x04881d05u;
    bb += az[6];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };
  {
    ba += 0xd9d4d039u;
    ba += az[9];
    ba += ((bb) ^ (bc) ^ (bd));
    ba = P(ba, 4u);
    ba += bb;
  };
  {
    bd += 0xe6db99e5u;
    bd += az[12];
    bd += ((ba) ^ (bb) ^ (bc));
    bd = P(bd, 11u);
    bd += ba;
  };
  {
    bc += 0x1fa27cf8u;
    bc += az[15];
    bc += ((bd) ^ (ba) ^ (bb));
    bc = P(bc, 16u);
    bc += bd;
  };
  {
    bb += 0xc4ac5665u;
    bb += az[2];
    bb += ((bc) ^ (bd) ^ (ba));
    bb = P(bb, 23u);
    bb += bc;
  };

  {
    ba += 0xf4292244u;
    ba += az[0];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0x432aff97u;
    bd += az[7];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0xab9423a7u;
    bc += az[14];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0xfc93a039u;
    bb += az[5];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };
  {
    ba += 0x655b59c3u;
    ba += az[12];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0x8f0ccc92u;
    bd += az[3];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0xffeff47du;
    bc += az[10];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0x85845dd1u;
    bb += az[1];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };
  {
    ba += 0x6fa87e4fu;
    ba += az[8];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0xfe2ce6e0u;
    bd += az[15];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0xa3014314u;
    bc += az[6];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0x4e0811a1u;
    bb += az[13];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };
  {
    ba += 0xf7537e82u;
    ba += az[4];
    ba += ((bc) ^ ((bb) | ~(bd)));
    ba = P(ba, 6u);
    ba += bb;
  };
  {
    bd += 0xbd3af235u;
    bd += az[11];
    bd += ((bb) ^ ((ba) | ~(bc)));
    bd = P(bd, 10u);
    bd += ba;
  };
  {
    bc += 0x2ad7d2bbu;
    bc += az[2];
    bc += ((ba) ^ ((bd) | ~(bb)));
    bc = P(bc, 15u);
    bc += bd;
  };
  {
    bb += 0xeb86d391u;
    bb += az[9];
    bb += ((bd) ^ ((bc) | ~(ba)));
    bb = P(bb, 21u);
    bb += bc;
  };

  ba += 0x67452301u;
  bb += 0xefcdab89u;
  bc += 0x98badcfeu;
  bd += 0x10325476u;

  ba ^= bc;
  bb ^= bd;
  bc = 0;
  bd = 0;

  {
    if (((ba) == an[0]) && ((bb) == an[1]) && ((bc) == an[2]) && ((bd) == an[3])) {
      const u32 bh = ad + 0;
      if (atomic_add(&q[bh], 1) == 0) {
        AA(o, t, y, 0, bh, ah, ao);
      }
    }
  };
}
}

__kernel void EE(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void EF(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global void* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa, const u32 ab,
                 const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}