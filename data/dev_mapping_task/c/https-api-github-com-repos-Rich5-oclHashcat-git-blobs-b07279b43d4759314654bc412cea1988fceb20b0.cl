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

typedef struct { u32 digest_buf[5]; } digest_t;

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
  if (a[1] > b[4])
    return (1);
  if (a[1] < b[4])
    return (-1);
  if (a[0] > b[3])
    return (1);
  if (a[0] < b[3])
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
void BX(u32x a[16], const u32 b, u32x c[16]) {
  const u32 d = b & 3;
  const u32 e = b / 4;

  u32 f;
  u32 g;
  u32 h;
  u32 i;
  u32 j;
  u32 k;
  u32 l;
  u32 m;
  u32 n;
  u32 o;
  u32 p;
  u32 q;
  u32 r;
  u32 s;
  u32 t;
  u32 u;
  u32 v;
  f = U(0, c[0], b);
  g = U(c[0], c[1], b);
  h = U(c[1], c[2], b);
  i = U(c[2], c[3], b);
  j = U(c[3], c[4], b);
  k = U(c[4], c[5], b);
  l = U(c[5], c[6], b);
  m = U(c[6], c[7], b);
  n = U(c[7], c[8], b);
  o = U(c[8], c[9], b);
  p = U(c[9], c[10], b);
  q = U(c[10], c[11], b);
  r = U(c[11], c[12], b);
  s = U(c[12], c[13], b);
  t = U(c[13], c[14], b);
  u = U(c[14], c[15], b);
  v = U(c[15], 0, b);

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

  switch (e) {
    case 0:
      a[0] |= f;
      a[1] = g;
      a[2] = h;
      a[3] = i;
      a[4] = j;
      a[5] = k;
      a[6] = l;
      a[7] = m;
      a[8] = n;
      a[9] = o;
      a[10] = p;
      a[11] = q;
      a[12] = r;
      a[13] = s;
      a[14] = t;
      a[15] = u;
      c[0] = v;
      break;
    case 1:
      a[1] |= f;
      a[2] = g;
      a[3] = h;
      a[4] = i;
      a[5] = j;
      a[6] = k;
      a[7] = l;
      a[8] = m;
      a[9] = n;
      a[10] = o;
      a[11] = p;
      a[12] = q;
      a[13] = r;
      a[14] = s;
      a[15] = t;
      c[0] = u;
      c[1] = v;
      break;
    case 2:
      a[2] |= f;
      a[3] = g;
      a[4] = h;
      a[5] = i;
      a[6] = j;
      a[7] = k;
      a[8] = l;
      a[9] = m;
      a[10] = n;
      a[11] = o;
      a[12] = p;
      a[13] = q;
      a[14] = r;
      a[15] = s;
      c[0] = t;
      c[1] = u;
      c[2] = v;
      break;
    case 3:
      a[3] |= f;
      a[4] = g;
      a[5] = h;
      a[6] = i;
      a[7] = j;
      a[8] = k;
      a[9] = l;
      a[10] = m;
      a[11] = n;
      a[12] = o;
      a[13] = p;
      a[14] = q;
      a[15] = r;
      c[0] = s;
      c[1] = t;
      c[2] = u;
      c[3] = v;
      break;
    case 4:
      a[4] |= f;
      a[5] = g;
      a[6] = h;
      a[7] = i;
      a[8] = j;
      a[9] = k;
      a[10] = l;
      a[11] = m;
      a[12] = n;
      a[13] = o;
      a[14] = p;
      a[15] = q;
      c[0] = r;
      c[1] = s;
      c[2] = t;
      c[3] = u;
      c[4] = v;
      break;
    case 5:
      a[5] |= f;
      a[6] = g;
      a[7] = h;
      a[8] = i;
      a[9] = j;
      a[10] = k;
      a[11] = l;
      a[12] = m;
      a[13] = n;
      a[14] = o;
      a[15] = p;
      c[0] = q;
      c[1] = r;
      c[2] = s;
      c[3] = t;
      c[4] = u;
      c[5] = v;
      break;
    case 6:
      a[6] |= f;
      a[7] = g;
      a[8] = h;
      a[9] = i;
      a[10] = j;
      a[11] = k;
      a[12] = l;
      a[13] = m;
      a[14] = n;
      a[15] = o;
      c[0] = p;
      c[1] = q;
      c[2] = r;
      c[3] = s;
      c[4] = t;
      c[5] = u;
      c[6] = v;
      break;
    case 7:
      a[7] |= f;
      a[8] = g;
      a[9] = h;
      a[10] = i;
      a[11] = j;
      a[12] = k;
      a[13] = l;
      a[14] = m;
      a[15] = n;
      c[0] = o;
      c[1] = p;
      c[2] = q;
      c[3] = r;
      c[4] = s;
      c[5] = t;
      c[6] = u;
      c[7] = v;
      break;
    case 8:
      a[8] |= f;
      a[9] = g;
      a[10] = h;
      a[11] = i;
      a[12] = j;
      a[13] = k;
      a[14] = l;
      a[15] = m;
      c[0] = n;
      c[1] = o;
      c[2] = p;
      c[3] = q;
      c[4] = r;
      c[5] = s;
      c[6] = t;
      c[7] = u;
      c[8] = v;
      break;
    case 9:
      a[9] |= f;
      a[10] = g;
      a[11] = h;
      a[12] = i;
      a[13] = j;
      a[14] = k;
      a[15] = l;
      c[0] = m;
      c[1] = n;
      c[2] = o;
      c[3] = p;
      c[4] = q;
      c[5] = r;
      c[6] = s;
      c[7] = t;
      c[8] = u;
      c[9] = v;
      break;
    case 10:
      a[10] |= f;
      a[11] = g;
      a[12] = h;
      a[13] = i;
      a[14] = j;
      a[15] = k;
      c[0] = l;
      c[1] = m;
      c[2] = n;
      c[3] = o;
      c[4] = p;
      c[5] = q;
      c[6] = r;
      c[7] = s;
      c[8] = t;
      c[9] = u;
      c[10] = v;
      break;
    case 11:
      a[11] |= f;
      a[12] = g;
      a[13] = h;
      a[14] = i;
      a[15] = j;
      c[0] = k;
      c[1] = l;
      c[2] = m;
      c[3] = n;
      c[4] = o;
      c[5] = p;
      c[6] = q;
      c[7] = r;
      c[8] = s;
      c[9] = t;
      c[10] = u;
      c[11] = v;
      break;
    case 12:
      a[12] |= f;
      a[13] = g;
      a[14] = h;
      a[15] = i;
      c[0] = j;
      c[1] = k;
      c[2] = l;
      c[3] = m;
      c[4] = n;
      c[5] = o;
      c[6] = p;
      c[7] = q;
      c[8] = r;
      c[9] = s;
      c[10] = t;
      c[11] = u;
      c[12] = v;
      break;
    case 13:
      a[13] |= f;
      a[14] = g;
      a[15] = h;
      c[0] = i;
      c[1] = j;
      c[2] = k;
      c[3] = l;
      c[4] = m;
      c[5] = n;
      c[6] = o;
      c[7] = p;
      c[8] = q;
      c[9] = r;
      c[10] = s;
      c[11] = t;
      c[12] = u;
      c[13] = v;
      break;
    case 14:
      a[14] |= f;
      a[15] = g;
      c[0] = h;
      c[1] = i;
      c[2] = j;
      c[3] = k;
      c[4] = l;
      c[5] = m;
      c[6] = n;
      c[7] = o;
      c[8] = p;
      c[9] = q;
      c[10] = r;
      c[11] = s;
      c[12] = t;
      c[13] = u;
      c[14] = v;
      break;
    case 15:
      a[15] |= f;
      c[0] = g;
      c[1] = h;
      c[2] = i;
      c[3] = j;
      c[4] = k;
      c[5] = l;
      c[6] = m;
      c[7] = n;
      c[8] = o;
      c[9] = p;
      c[10] = q;
      c[11] = r;
      c[12] = s;
      c[13] = t;
      c[14] = u;
      c[15] = v;
      break;
  }
}

__kernel void BY(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
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

  const u32 al = s[y].pc_offset;

  u32 am[5];

  am[0] = s[y].pc_digest[0];
  am[1] = s[y].pc_digest[1];
  am[2] = s[y].pc_digest[2];
  am[3] = s[y].pc_digest[3];
  am[4] = s[y].pc_digest[4];

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = G(s[y].salt_buf[al + 0]);
  an[1] = G(s[y].salt_buf[al + 1]);
  an[2] = G(s[y].salt_buf[al + 2]);
  an[3] = G(s[y].salt_buf[al + 3]);
  ao[0] = G(s[y].salt_buf[al + 4]);
  ao[1] = G(s[y].salt_buf[al + 5]);
  ao[2] = G(s[y].salt_buf[al + 6]);
  ao[3] = G(s[y].salt_buf[al + 7]);
  ap[0] = G(s[y].salt_buf[al + 8]);
  ap[1] = G(s[y].salt_buf[al + 9]);
  ap[2] = G(s[y].salt_buf[al + 10]);
  ap[3] = G(s[y].salt_buf[al + 11]);
  aq[0] = G(s[y].salt_buf[al + 12]);
  aq[1] = G(s[y].salt_buf[al + 13]);
  aq[2] = G(s[y].salt_buf[al + 14]);
  aq[3] = G(s[y].salt_buf[al + 15]);

  const u32 ar = s[y].salt_len;

  for (u32 as = 0; as < ab; as += 1) {
    const u32x at = BV(c, as);

    const u32x au = ak + at;

    u32x av[4] = {0};
    u32x aw[4] = {0};
    u32x ax[4] = {0};
    u32x ay[4] = {0};

    av[0] = ai[0];
    av[1] = ai[1];
    av[2] = ai[2];
    av[3] = ai[3];
    aw[0] = aj[0];
    aw[1] = aj[1];
    aw[2] = aj[2];
    aw[3] = aj[3];

    u32x az[4] = {0};
    u32x ba[4] = {0};
    u32x bb[4] = {0};
    u32x bc[4] = {0};

    az[0] = BW(c, as, 0);
    az[1] = BW(c, as, 1);
    az[2] = BW(c, as, 2);
    az[3] = BW(c, as, 3);
    ba[0] = BW(c, as, 4);
    ba[1] = BW(c, as, 5);
    ba[2] = BW(c, as, 6);
    ba[3] = BW(c, as, 7);

    if (ae == 10001) {
      BP(az, ba, bb, bc, ak);
    } else {
      BP(av, aw, ax, ay, at);
    }

    u32x bd[4];
    u32x be[4];
    u32x bf[4];
    u32x bg[4];

    bd[0] = av[0] | az[0];
    bd[1] = av[1] | az[1];
    bd[2] = av[2] | az[2];
    bd[3] = av[3] | az[3];
    be[0] = aw[0] | ba[0];
    be[1] = aw[1] | ba[1];
    be[2] = aw[2] | ba[2];
    be[3] = aw[3] | ba[3];

    BR(bd, be, au);

    AC(be, bf, bg);
    AC(bd, bd, be);

    const u32x bh = au * 2;

    const u32x bi = bh + ar;

    u32x bj[16];

    bj[0] = M(bd[0]);
    bj[1] = M(bd[1]);
    bj[2] = M(bd[2]);
    bj[3] = M(bd[3]);
    bj[4] = M(be[0]);
    bj[5] = M(be[1]);
    bj[6] = M(be[2]);
    bj[7] = M(be[3]);
    bj[8] = M(bf[0]);
    bj[9] = M(bf[1]);
    bj[10] = M(bf[2]);
    bj[11] = M(bf[3]);
    bj[12] = M(bg[0]);
    bj[13] = M(bg[1]);
    bj[14] = M(bg[2]);
    bj[15] = M(bg[3]);

    u32x bk[16];

    bk[0] = an[0];
    bk[1] = an[1];
    bk[2] = an[2];
    bk[3] = an[3];
    bk[4] = ao[0];
    bk[5] = ao[1];
    bk[6] = ao[2];
    bk[7] = ao[3];
    bk[8] = ap[0];
    bk[9] = ap[1];
    bk[10] = ap[2];
    bk[11] = ap[3];
    bk[12] = aq[0];
    bk[13] = aq[1];
    bk[14] = aq[2];
    bk[15] = aq[3];

    BX(bk, ar & 0x3f, bj);

    u32x bl = am[0];
    u32x bm = am[1];
    u32x bn = am[2];
    u32x bo = am[3];
    u32x bp = am[4];

    if (((ar & 0x3f) + bh) >= 56) {
      u32x bq = bk[0];
      u32x br = bk[1];
      u32x bs = bk[2];
      u32x bt = bk[3];
      u32x bu = bk[4];
      u32x bv = bk[5];
      u32x bw = bk[6];
      u32x bx = bk[7];
      u32x by = bk[8];
      u32x bz = bk[9];
      u32x ca = bk[10];
      u32x cb = bk[11];
      u32x cc = bk[12];
      u32x cd = bk[13];
      u32x ce = bk[14];
      u32x cf = bk[15];

      {
        bp += 0x5a827999u;
        bp += bq;
        bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      {
        bo += 0x5a827999u;
        bo += br;
        bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      {
        bn += 0x5a827999u;
        bn += bs;
        bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      {
        bm += 0x5a827999u;
        bm += bt;
        bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      {
        bl += 0x5a827999u;
        bl += bu;
        bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      {
        bp += 0x5a827999u;
        bp += bv;
        bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      {
        bo += 0x5a827999u;
        bo += bw;
        bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      {
        bn += 0x5a827999u;
        bn += bx;
        bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      {
        bm += 0x5a827999u;
        bm += by;
        bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      {
        bl += 0x5a827999u;
        bl += bz;
        bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      {
        bp += 0x5a827999u;
        bp += ca;
        bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      {
        bo += 0x5a827999u;
        bo += cb;
        bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      {
        bn += 0x5a827999u;
        bn += cc;
        bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      {
        bm += 0x5a827999u;
        bm += cd;
        bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      {
        bl += 0x5a827999u;
        bl += ce;
        bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      {
        bp += 0x5a827999u;
        bp += cf;
        bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bq = P((cd ^ by ^ bs ^ bq), 1u);
      {
        bo += 0x5a827999u;
        bo += bq;
        bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      br = P((ce ^ bz ^ bt ^ br), 1u);
      {
        bn += 0x5a827999u;
        bn += br;
        bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bs = P((cf ^ ca ^ bu ^ bs), 1u);
      {
        bm += 0x5a827999u;
        bm += bs;
        bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      bt = P((bq ^ cb ^ bv ^ bt), 1u);
      {
        bl += 0x5a827999u;
        bl += bt;
        bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };

      bu = P((br ^ cc ^ bw ^ bu), 1u);
      {
        bp += 0x6ed9eba1u;
        bp += bu;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bv = P((bs ^ cd ^ bx ^ bv), 1u);
      {
        bo += 0x6ed9eba1u;
        bo += bv;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      bw = P((bt ^ ce ^ by ^ bw), 1u);
      {
        bn += 0x6ed9eba1u;
        bn += bw;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bx = P((bu ^ cf ^ bz ^ bx), 1u);
      {
        bm += 0x6ed9eba1u;
        bm += bx;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      by = P((bv ^ bq ^ ca ^ by), 1u);
      {
        bl += 0x6ed9eba1u;
        bl += by;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      bz = P((bw ^ br ^ cb ^ bz), 1u);
      {
        bp += 0x6ed9eba1u;
        bp += bz;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      ca = P((bx ^ bs ^ cc ^ ca), 1u);
      {
        bo += 0x6ed9eba1u;
        bo += ca;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      cb = P((by ^ bt ^ cd ^ cb), 1u);
      {
        bn += 0x6ed9eba1u;
        bn += cb;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      cc = P((bz ^ bu ^ ce ^ cc), 1u);
      {
        bm += 0x6ed9eba1u;
        bm += cc;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      cd = P((ca ^ bv ^ cf ^ cd), 1u);
      {
        bl += 0x6ed9eba1u;
        bl += cd;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      ce = P((cb ^ bw ^ bq ^ ce), 1u);
      {
        bp += 0x6ed9eba1u;
        bp += ce;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      cf = P((cc ^ bx ^ br ^ cf), 1u);
      {
        bo += 0x6ed9eba1u;
        bo += cf;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      bq = P((cd ^ by ^ bs ^ bq), 1u);
      {
        bn += 0x6ed9eba1u;
        bn += bq;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      br = P((ce ^ bz ^ bt ^ br), 1u);
      {
        bm += 0x6ed9eba1u;
        bm += br;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      bs = P((cf ^ ca ^ bu ^ bs), 1u);
      {
        bl += 0x6ed9eba1u;
        bl += bs;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      bt = P((bq ^ cb ^ bv ^ bt), 1u);
      {
        bp += 0x6ed9eba1u;
        bp += bt;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bu = P((br ^ cc ^ bw ^ bu), 1u);
      {
        bo += 0x6ed9eba1u;
        bo += bu;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      bv = P((bs ^ cd ^ bx ^ bv), 1u);
      {
        bn += 0x6ed9eba1u;
        bn += bv;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bw = P((bt ^ ce ^ by ^ bw), 1u);
      {
        bm += 0x6ed9eba1u;
        bm += bw;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      bx = P((bu ^ cf ^ bz ^ bx), 1u);
      {
        bl += 0x6ed9eba1u;
        bl += bx;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };

      by = P((bv ^ bq ^ ca ^ by), 1u);
      {
        bp += 0x8f1bbcdcu;
        bp += by;
        bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bz = P((bw ^ br ^ cb ^ bz), 1u);
      {
        bo += 0x8f1bbcdcu;
        bo += bz;
        bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      ca = P((bx ^ bs ^ cc ^ ca), 1u);
      {
        bn += 0x8f1bbcdcu;
        bn += ca;
        bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      cb = P((by ^ bt ^ cd ^ cb), 1u);
      {
        bm += 0x8f1bbcdcu;
        bm += cb;
        bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      cc = P((bz ^ bu ^ ce ^ cc), 1u);
      {
        bl += 0x8f1bbcdcu;
        bl += cc;
        bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      cd = P((ca ^ bv ^ cf ^ cd), 1u);
      {
        bp += 0x8f1bbcdcu;
        bp += cd;
        bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      ce = P((cb ^ bw ^ bq ^ ce), 1u);
      {
        bo += 0x8f1bbcdcu;
        bo += ce;
        bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      cf = P((cc ^ bx ^ br ^ cf), 1u);
      {
        bn += 0x8f1bbcdcu;
        bn += cf;
        bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bq = P((cd ^ by ^ bs ^ bq), 1u);
      {
        bm += 0x8f1bbcdcu;
        bm += bq;
        bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      br = P((ce ^ bz ^ bt ^ br), 1u);
      {
        bl += 0x8f1bbcdcu;
        bl += br;
        bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      bs = P((cf ^ ca ^ bu ^ bs), 1u);
      {
        bp += 0x8f1bbcdcu;
        bp += bs;
        bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bt = P((bq ^ cb ^ bv ^ bt), 1u);
      {
        bo += 0x8f1bbcdcu;
        bo += bt;
        bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      bu = P((br ^ cc ^ bw ^ bu), 1u);
      {
        bn += 0x8f1bbcdcu;
        bn += bu;
        bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bv = P((bs ^ cd ^ bx ^ bv), 1u);
      {
        bm += 0x8f1bbcdcu;
        bm += bv;
        bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      bw = P((bt ^ ce ^ by ^ bw), 1u);
      {
        bl += 0x8f1bbcdcu;
        bl += bw;
        bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      bx = P((bu ^ cf ^ bz ^ bx), 1u);
      {
        bp += 0x8f1bbcdcu;
        bp += bx;
        bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      by = P((bv ^ bq ^ ca ^ by), 1u);
      {
        bo += 0x8f1bbcdcu;
        bo += by;
        bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      bz = P((bw ^ br ^ cb ^ bz), 1u);
      {
        bn += 0x8f1bbcdcu;
        bn += bz;
        bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      ca = P((bx ^ bs ^ cc ^ ca), 1u);
      {
        bm += 0x8f1bbcdcu;
        bm += ca;
        bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      cb = P((by ^ bt ^ cd ^ cb), 1u);
      {
        bl += 0x8f1bbcdcu;
        bl += cb;
        bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };

      cc = P((bz ^ bu ^ ce ^ cc), 1u);
      {
        bp += 0xca62c1d6u;
        bp += cc;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      cd = P((ca ^ bv ^ cf ^ cd), 1u);
      {
        bo += 0xca62c1d6u;
        bo += cd;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      ce = P((cb ^ bw ^ bq ^ ce), 1u);
      {
        bn += 0xca62c1d6u;
        bn += ce;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      cf = P((cc ^ bx ^ br ^ cf), 1u);
      {
        bm += 0xca62c1d6u;
        bm += cf;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      bq = P((cd ^ by ^ bs ^ bq), 1u);
      {
        bl += 0xca62c1d6u;
        bl += bq;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      br = P((ce ^ bz ^ bt ^ br), 1u);
      {
        bp += 0xca62c1d6u;
        bp += br;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bs = P((cf ^ ca ^ bu ^ bs), 1u);
      {
        bo += 0xca62c1d6u;
        bo += bs;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      bt = P((bq ^ cb ^ bv ^ bt), 1u);
      {
        bn += 0xca62c1d6u;
        bn += bt;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bu = P((br ^ cc ^ bw ^ bu), 1u);
      {
        bm += 0xca62c1d6u;
        bm += bu;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      bv = P((bs ^ cd ^ bx ^ bv), 1u);
      {
        bl += 0xca62c1d6u;
        bl += bv;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      bw = P((bt ^ ce ^ by ^ bw), 1u);
      {
        bp += 0xca62c1d6u;
        bp += bw;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      bx = P((bu ^ cf ^ bz ^ bx), 1u);
      {
        bo += 0xca62c1d6u;
        bo += bx;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      by = P((bv ^ bq ^ ca ^ by), 1u);
      {
        bn += 0xca62c1d6u;
        bn += by;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      bz = P((bw ^ br ^ cb ^ bz), 1u);
      {
        bm += 0xca62c1d6u;
        bm += bz;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      ca = P((bx ^ bs ^ cc ^ ca), 1u);
      {
        bl += 0xca62c1d6u;
        bl += ca;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };
      cb = P((by ^ bt ^ cd ^ cb), 1u);
      {
        bp += 0xca62c1d6u;
        bp += cb;
        bp += ((bm) ^ (bn) ^ (bo));
        bp += P(bl, 5u);
        bm = P(bm, 30u);
      };
      cc = P((bz ^ bu ^ ce ^ cc), 1u);
      {
        bo += 0xca62c1d6u;
        bo += cc;
        bo += ((bl) ^ (bm) ^ (bn));
        bo += P(bp, 5u);
        bl = P(bl, 30u);
      };
      cd = P((ca ^ bv ^ cf ^ cd), 1u);
      {
        bn += 0xca62c1d6u;
        bn += cd;
        bn += ((bp) ^ (bl) ^ (bm));
        bn += P(bo, 5u);
        bp = P(bp, 30u);
      };
      ce = P((cb ^ bw ^ bq ^ ce), 1u);
      {
        bm += 0xca62c1d6u;
        bm += ce;
        bm += ((bo) ^ (bp) ^ (bl));
        bm += P(bn, 5u);
        bo = P(bo, 30u);
      };
      cf = P((cc ^ bx ^ br ^ cf), 1u);
      {
        bl += 0xca62c1d6u;
        bl += cf;
        bl += ((bn) ^ (bo) ^ (bp));
        bl += P(bm, 5u);
        bn = P(bn, 30u);
      };

      bl += am[0];
      bm += am[1];
      bn += am[2];
      bo += am[3];
      bp += am[4];

      bk[0] = bj[0];
      bk[1] = bj[1];
      bk[2] = bj[2];
      bk[3] = bj[3];
      bk[4] = bj[4];
      bk[5] = bj[5];
      bk[6] = bj[6];
      bk[7] = bj[7];
      bk[8] = bj[8];
      bk[9] = bj[9];
      bk[10] = bj[10];
      bk[11] = bj[11];
      bk[12] = bj[12];
      bk[13] = bj[13];
      bk[14] = bj[14];
      bk[15] = bj[15];
    }

    u32x bq = bk[0];
    u32x br = bk[1];
    u32x bs = bk[2];
    u32x bt = bk[3];
    u32x bu = bk[4];
    u32x bv = bk[5];
    u32x bw = bk[6];
    u32x bx = bk[7];
    u32x by = bk[8];
    u32x bz = bk[9];
    u32x ca = bk[10];
    u32x cb = bk[11];
    u32x cc = bk[12];
    u32x cd = bk[13];
    u32x ce = 0;
    u32x cf = bi * 8;

    u32x cg = bl;
    u32x ch = bm;
    u32x ci = bn;
    u32x cj = bo;
    u32x ck = bp;

    {
      bp += 0x5a827999u;
      bp += bq;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    {
      bo += 0x5a827999u;
      bo += br;
      bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    {
      bn += 0x5a827999u;
      bn += bs;
      bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    {
      bm += 0x5a827999u;
      bm += bt;
      bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    {
      bl += 0x5a827999u;
      bl += bu;
      bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    {
      bp += 0x5a827999u;
      bp += bv;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    {
      bo += 0x5a827999u;
      bo += bw;
      bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    {
      bn += 0x5a827999u;
      bn += bx;
      bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    {
      bm += 0x5a827999u;
      bm += by;
      bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    {
      bl += 0x5a827999u;
      bl += bz;
      bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    {
      bp += 0x5a827999u;
      bp += ca;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    {
      bo += 0x5a827999u;
      bo += cb;
      bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    {
      bn += 0x5a827999u;
      bn += cc;
      bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    {
      bm += 0x5a827999u;
      bm += cd;
      bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    {
      bl += 0x5a827999u;
      bl += ce;
      bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    {
      bp += 0x5a827999u;
      bp += cf;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bq = P((cd ^ by ^ bs ^ bq), 1u);
    {
      bo += 0x5a827999u;
      bo += bq;
      bo += ((((bn)) ^ (((bl)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bn += 0x5a827999u;
      bn += br;
      bn += ((((bm)) ^ (((bp)) & (((bl)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bm += 0x5a827999u;
      bm += bs;
      bm += ((((bl)) ^ (((bo)) & (((bp)) ^ ((bl))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bt = P((bq ^ cb ^ bv ^ bt), 1u);
    {
      bl += 0x5a827999u;
      bl += bt;
      bl += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };

    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += bu;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += bv;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += bw;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += bx;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    by = P((bv ^ bq ^ ca ^ by), 1u);
    {
      bl += 0x6ed9eba1u;
      bl += by;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += bz;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += ca;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += cb;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += cc;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bl += 0x6ed9eba1u;
      bl += cd;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    ce = P((cb ^ bw ^ bq ^ ce), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += ce;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += cf;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    bq = P((cd ^ by ^ bs ^ bq), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += bq;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += br;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bl += 0x6ed9eba1u;
      bl += bs;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bt = P((bq ^ cb ^ bv ^ bt), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += bt;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += bu;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += bv;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += bw;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bl += 0x6ed9eba1u;
      bl += bx;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };

    by = P((bv ^ bq ^ ca ^ by), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += by;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += bz;
      bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += ca;
      bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += cb;
      bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bl += 0x8f1bbcdcu;
      bl += cc;
      bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += cd;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    ce = P((cb ^ bw ^ bq ^ ce), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += ce;
      bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += cf;
      bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bq = P((cd ^ by ^ bs ^ bq), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += bq;
      bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bl += 0x8f1bbcdcu;
      bl += br;
      bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += bs;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bt = P((bq ^ cb ^ bv ^ bt), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += bt;
      bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += bu;
      bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += bv;
      bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bl += 0x8f1bbcdcu;
      bl += bw;
      bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += bx;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    by = P((bv ^ bq ^ ca ^ by), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += by;
      bo += (((((bl)) & ((bm))) | (((bn)) & (((bl)) ^ ((bm))))));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += bz;
      bn += (((((bp)) & ((bl))) | (((bm)) & (((bp)) ^ ((bl))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += ca;
      bm += (((((bo)) & ((bp))) | (((bl)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bl += 0x8f1bbcdcu;
      bl += cb;
      bl += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };

    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bp += 0xca62c1d6u;
      bp += cc;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bo += 0xca62c1d6u;
      bo += cd;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    ce = P((cb ^ bw ^ bq ^ ce), 1u);
    {
      bn += 0xca62c1d6u;
      bn += ce;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bm += 0xca62c1d6u;
      bm += cf;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bq = P((cd ^ by ^ bs ^ bq), 1u);
    {
      bl += 0xca62c1d6u;
      bl += bq;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bp += 0xca62c1d6u;
      bp += br;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bo += 0xca62c1d6u;
      bo += bs;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    bt = P((bq ^ cb ^ bv ^ bt), 1u);
    {
      bn += 0xca62c1d6u;
      bn += bt;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bm += 0xca62c1d6u;
      bm += bu;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bl += 0xca62c1d6u;
      bl += bv;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bp += 0xca62c1d6u;
      bp += bw;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bo += 0xca62c1d6u;
      bo += bx;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    by = P((bv ^ bq ^ ca ^ by), 1u);
    {
      bn += 0xca62c1d6u;
      bn += by;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bm += 0xca62c1d6u;
      bm += bz;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bl += 0xca62c1d6u;
      bl += ca;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bp += 0xca62c1d6u;
      bp += cb;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bl, 5u);
      bm = P(bm, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bo += 0xca62c1d6u;
      bo += cc;
      bo += ((bl) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bl = P(bl, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bn += 0xca62c1d6u;
      bn += cd;
      bn += ((bp) ^ (bl) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    ce = P((cb ^ bw ^ bq ^ ce), 1u);
    {
      bm += 0xca62c1d6u;
      bm += ce;
      bm += ((bo) ^ (bp) ^ (bl));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bl += 0xca62c1d6u;
      bl += cf;
      bl += ((bn) ^ (bo) ^ (bp));
      bl += P(bm, 5u);
      bn = P(bn, 30u);
    };

    bl += cg;
    bm += ch;
    bn += ci;
    bo += cj;
    bp += ck;

    {
      const u32 cl[4] = {boo, bpp, bnn, bmm};
      if (Z(cl, g, h, i, j, k, l, m, n, v, w, x)) {
        int cm = X(cl, ac, &p[ad]);
        if (cm != -1) {
          const u32 cn = ad + cm;
          if (atomic_add(&q[cn], 1) == 0) {
            AA(o, t, y, cm, cn, ah, as);
          }
        }
      }
    };
  }
}

__kernel void BZ(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CA(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CB(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
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

  const u32 al = s[y].pc_offset;

  u32 am[5];

  am[0] = s[y].pc_digest[0];
  am[1] = s[y].pc_digest[1];
  am[2] = s[y].pc_digest[2];
  am[3] = s[y].pc_digest[3];
  am[4] = s[y].pc_digest[4];

  u32 an[4];
  u32 ao[4];
  u32 ap[4];
  u32 aq[4];

  an[0] = G(s[y].salt_buf[al + 0]);
  an[1] = G(s[y].salt_buf[al + 1]);
  an[2] = G(s[y].salt_buf[al + 2]);
  an[3] = G(s[y].salt_buf[al + 3]);
  ao[0] = G(s[y].salt_buf[al + 4]);
  ao[1] = G(s[y].salt_buf[al + 5]);
  ao[2] = G(s[y].salt_buf[al + 6]);
  ao[3] = G(s[y].salt_buf[al + 7]);
  ap[0] = G(s[y].salt_buf[al + 8]);
  ap[1] = G(s[y].salt_buf[al + 9]);
  ap[2] = G(s[y].salt_buf[al + 10]);
  ap[3] = G(s[y].salt_buf[al + 11]);
  aq[0] = G(s[y].salt_buf[al + 12]);
  aq[1] = G(s[y].salt_buf[al + 13]);
  aq[2] = G(s[y].salt_buf[al + 14]);
  aq[3] = G(s[y].salt_buf[al + 15]);

  const u32 ar = s[y].salt_len;

  const u32 as[4] =
ad[ad[ad[ad[1]
};

for (u32 at = 0; at < ab; at += 1) {
  const u32x au = BV(c, at);

  const u32x av = ak + au;

  u32x aw[4] = {0};
  u32x ax[4] = {0};
  u32x ay[4] = {0};
  u32x az[4] = {0};

  aw[0] = ai[0];
  aw[1] = ai[1];
  aw[2] = ai[2];
  aw[3] = ai[3];
  ax[0] = aj[0];
  ax[1] = aj[1];
  ax[2] = aj[2];
  ax[3] = aj[3];

  u32x ba[4] = {0};
  u32x bb[4] = {0};
  u32x bc[4] = {0};
  u32x bd[4] = {0};

  ba[0] = BW(c, at, 0);
  ba[1] = BW(c, at, 1);
  ba[2] = BW(c, at, 2);
  ba[3] = BW(c, at, 3);
  bb[0] = BW(c, at, 4);
  bb[1] = BW(c, at, 5);
  bb[2] = BW(c, at, 6);
  bb[3] = BW(c, at, 7);

  if (ae == 10001) {
    BP(ba, bb, bc, bd, ak);
  } else {
    BP(aw, ax, ay, az, au);
  }

  u32x be[4];
  u32x bf[4];
  u32x bg[4];
  u32x bh[4];

  be[0] = aw[0] | ba[0];
  be[1] = aw[1] | ba[1];
  be[2] = aw[2] | ba[2];
  be[3] = aw[3] | ba[3];
  bf[0] = ax[0] | bb[0];
  bf[1] = ax[1] | bb[1];
  bf[2] = ax[2] | bb[2];
  bf[3] = ax[3] | bb[3];

  BR(be, bf, av);

  AC(bf, bg, bh);
  AC(be, be, bf);

  const u32x bi = av * 2;

  const u32x bj = bi + ar;

  u32x bk[16];

  bk[0] = M(be[0]);
  bk[1] = M(be[1]);
  bk[2] = M(be[2]);
  bk[3] = M(be[3]);
  bk[4] = M(bf[0]);
  bk[5] = M(bf[1]);
  bk[6] = M(bf[2]);
  bk[7] = M(bf[3]);
  bk[8] = M(bg[0]);
  bk[9] = M(bg[1]);
  bk[10] = M(bg[2]);
  bk[11] = M(bg[3]);
  bk[12] = M(bh[0]);
  bk[13] = M(bh[1]);
  bk[14] = M(bh[2]);
  bk[15] = M(bh[3]);

  u32x bl[16];

  bl[0] = an[0];
  bl[1] = an[1];
  bl[2] = an[2];
  bl[3] = an[3];
  bl[4] = ao[0];
  bl[5] = ao[1];
  bl[6] = ao[2];
  bl[7] = ao[3];
  bl[8] = ap[0];
  bl[9] = ap[1];
  bl[10] = ap[2];
  bl[11] = ap[3];
  bl[12] = aq[0];
  bl[13] = aq[1];
  bl[14] = aq[2];
  bl[15] = aq[3];

  BX(bl, ar & 0x3f, bk);

  u32x bm = am[0];
  u32x bn = am[1];
  u32x bo = am[2];
  u32x bp = am[3];
  u32x bq = am[4];

  if (((ar & 0x3f) + bi) >= 56) {
    u32x br = bl[0];
    u32x bs = bl[1];
    u32x bt = bl[2];
    u32x bu = bl[3];
    u32x bv = bl[4];
    u32x bw = bl[5];
    u32x bx = bl[6];
    u32x by = bl[7];
    u32x bz = bl[8];
    u32x ca = bl[9];
    u32x cb = bl[10];
    u32x cc = bl[11];
    u32x cd = bl[12];
    u32x ce = bl[13];
    u32x cf = bl[14];
    u32x cg = bl[15];

    {
      bq += 0x5a827999u;
      bq += br;
      bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    {
      bp += 0x5a827999u;
      bp += bs;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    {
      bo += 0x5a827999u;
      bo += bt;
      bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    {
      bn += 0x5a827999u;
      bn += bu;
      bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    {
      bm += 0x5a827999u;
      bm += bv;
      bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    {
      bq += 0x5a827999u;
      bq += bw;
      bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    {
      bp += 0x5a827999u;
      bp += bx;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    {
      bo += 0x5a827999u;
      bo += by;
      bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    {
      bn += 0x5a827999u;
      bn += bz;
      bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    {
      bm += 0x5a827999u;
      bm += ca;
      bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    {
      bq += 0x5a827999u;
      bq += cb;
      bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    {
      bp += 0x5a827999u;
      bp += cc;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    {
      bo += 0x5a827999u;
      bo += cd;
      bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    {
      bn += 0x5a827999u;
      bn += ce;
      bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    {
      bm += 0x5a827999u;
      bm += cf;
      bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    {
      bq += 0x5a827999u;
      bq += cg;
      bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bp += 0x5a827999u;
      bp += br;
      bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bo += 0x5a827999u;
      bo += bs;
      bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    bt = P((cg ^ cb ^ bv ^ bt), 1u);
    {
      bn += 0x5a827999u;
      bn += bt;
      bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bm += 0x5a827999u;
      bm += bu;
      bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };

    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bq += 0x6ed9eba1u;
      bq += bv;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += bw;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += bx;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    by = P((bv ^ cg ^ ca ^ by), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += by;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += bz;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bq += 0x6ed9eba1u;
      bq += ca;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += cb;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += cc;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += cd;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    ce = P((cb ^ bw ^ cg ^ ce), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += ce;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bq += 0x6ed9eba1u;
      bq += cf;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    cg = P((cd ^ by ^ bs ^ cg), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += cg;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += br;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += bs;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bt = P((cg ^ cb ^ bv ^ bt), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += bt;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bq += 0x6ed9eba1u;
      bq += bu;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bp += 0x6ed9eba1u;
      bp += bv;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bo += 0x6ed9eba1u;
      bo += bw;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bn += 0x6ed9eba1u;
      bn += bx;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    by = P((bv ^ cg ^ ca ^ by), 1u);
    {
      bm += 0x6ed9eba1u;
      bm += by;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };

    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bq += 0x8f1bbcdcu;
      bq += bz;
      bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += ca;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += cb;
      bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += cc;
      bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += cd;
      bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    ce = P((cb ^ bw ^ cg ^ ce), 1u);
    {
      bq += 0x8f1bbcdcu;
      bq += ce;
      bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += cf;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    cg = P((cd ^ by ^ bs ^ cg), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += cg;
      bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += br;
      bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += bs;
      bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bt = P((cg ^ cb ^ bv ^ bt), 1u);
    {
      bq += 0x8f1bbcdcu;
      bq += bt;
      bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += bu;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += bv;
      bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += bw;
      bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += bx;
      bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    by = P((bv ^ cg ^ ca ^ by), 1u);
    {
      bq += 0x8f1bbcdcu;
      bq += by;
      bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bp += 0x8f1bbcdcu;
      bp += bz;
      bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bo += 0x8f1bbcdcu;
      bo += ca;
      bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bn += 0x8f1bbcdcu;
      bn += cb;
      bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bm += 0x8f1bbcdcu;
      bm += cc;
      bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };

    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bq += 0xca62c1d6u;
      bq += cd;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    ce = P((cb ^ bw ^ cg ^ ce), 1u);
    {
      bp += 0xca62c1d6u;
      bp += ce;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bo += 0xca62c1d6u;
      bo += cf;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    cg = P((cd ^ by ^ bs ^ cg), 1u);
    {
      bn += 0xca62c1d6u;
      bn += cg;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    br = P((ce ^ bz ^ bt ^ br), 1u);
    {
      bm += 0xca62c1d6u;
      bm += br;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bs = P((cf ^ ca ^ bu ^ bs), 1u);
    {
      bq += 0xca62c1d6u;
      bq += bs;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    bt = P((cg ^ cb ^ bv ^ bt), 1u);
    {
      bp += 0xca62c1d6u;
      bp += bt;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    bu = P((br ^ cc ^ bw ^ bu), 1u);
    {
      bo += 0xca62c1d6u;
      bo += bu;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    bv = P((bs ^ cd ^ bx ^ bv), 1u);
    {
      bn += 0xca62c1d6u;
      bn += bv;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    bw = P((bt ^ ce ^ by ^ bw), 1u);
    {
      bm += 0xca62c1d6u;
      bm += bw;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    bx = P((bu ^ cf ^ bz ^ bx), 1u);
    {
      bq += 0xca62c1d6u;
      bq += bx;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    by = P((bv ^ cg ^ ca ^ by), 1u);
    {
      bp += 0xca62c1d6u;
      bp += by;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    bz = P((bw ^ br ^ cb ^ bz), 1u);
    {
      bo += 0xca62c1d6u;
      bo += bz;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    ca = P((bx ^ bs ^ cc ^ ca), 1u);
    {
      bn += 0xca62c1d6u;
      bn += ca;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cb = P((by ^ bt ^ cd ^ cb), 1u);
    {
      bm += 0xca62c1d6u;
      bm += cb;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };
    cc = P((bz ^ bu ^ ce ^ cc), 1u);
    {
      bq += 0xca62c1d6u;
      bq += cc;
      bq += ((bn) ^ (bo) ^ (bp));
      bq += P(bm, 5u);
      bn = P(bn, 30u);
    };
    cd = P((ca ^ bv ^ cf ^ cd), 1u);
    {
      bp += 0xca62c1d6u;
      bp += cd;
      bp += ((bm) ^ (bn) ^ (bo));
      bp += P(bq, 5u);
      bm = P(bm, 30u);
    };
    ce = P((cb ^ bw ^ cg ^ ce), 1u);
    {
      bo += 0xca62c1d6u;
      bo += ce;
      bo += ((bq) ^ (bm) ^ (bn));
      bo += P(bp, 5u);
      bq = P(bq, 30u);
    };
    cf = P((cc ^ bx ^ br ^ cf), 1u);
    {
      bn += 0xca62c1d6u;
      bn += cf;
      bn += ((bp) ^ (bq) ^ (bm));
      bn += P(bo, 5u);
      bp = P(bp, 30u);
    };
    cg = P((cd ^ by ^ bs ^ cg), 1u);
    {
      bm += 0xca62c1d6u;
      bm += cg;
      bm += ((bo) ^ (bp) ^ (bq));
      bm += P(bn, 5u);
      bo = P(bo, 30u);
    };

    bm += am[0];
    bn += am[1];
    bo += am[2];
    bp += am[3];
    bq += am[4];

    bl[0] = bk[0];
    bl[1] = bk[1];
    bl[2] = bk[2];
    bl[3] = bk[3];
    bl[4] = bk[4];
    bl[5] = bk[5];
    bl[6] = bk[6];
    bl[7] = bk[7];
    bl[8] = bk[8];
    bl[9] = bk[9];
    bl[10] = bk[10];
    bl[11] = bk[11];
    bl[12] = bk[12];
    bl[13] = bk[13];
    bl[14] = bk[14];
    bl[15] = bk[15];
  }

  u32x br = bl[0];
  u32x bs = bl[1];
  u32x bt = bl[2];
  u32x bu = bl[3];
  u32x bv = bl[4];
  u32x bw = bl[5];
  u32x bx = bl[6];
  u32x by = bl[7];
  u32x bz = bl[8];
  u32x ca = bl[9];
  u32x cb = bl[10];
  u32x cc = bl[11];
  u32x cd = bl[12];
  u32x ce = bl[13];
  u32x cf = 0;
  u32x cg = bj * 8;

  u32x ch = bm;
  u32x ci = bn;
  u32x cj = bo;
  u32x ck = bp;
  u32x cl = bq;

  {
    bq += 0x5a827999u;
    bq += br;
    bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  {
    bp += 0x5a827999u;
    bp += bs;
    bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  {
    bo += 0x5a827999u;
    bo += bt;
    bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  {
    bn += 0x5a827999u;
    bn += bu;
    bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  {
    bm += 0x5a827999u;
    bm += bv;
    bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  {
    bq += 0x5a827999u;
    bq += bw;
    bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  {
    bp += 0x5a827999u;
    bp += bx;
    bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  {
    bo += 0x5a827999u;
    bo += by;
    bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  {
    bn += 0x5a827999u;
    bn += bz;
    bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  {
    bm += 0x5a827999u;
    bm += ca;
    bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  {
    bq += 0x5a827999u;
    bq += cb;
    bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  {
    bp += 0x5a827999u;
    bp += cc;
    bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  {
    bo += 0x5a827999u;
    bo += cd;
    bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  {
    bn += 0x5a827999u;
    bn += ce;
    bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  {
    bm += 0x5a827999u;
    bm += cf;
    bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  {
    bq += 0x5a827999u;
    bq += cg;
    bq += ((((bp)) ^ (((bn)) & (((bo)) ^ ((bp))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  br = P((ce ^ bz ^ bt ^ br), 1u);
  {
    bp += 0x5a827999u;
    bp += br;
    bp += ((((bo)) ^ (((bm)) & (((bn)) ^ ((bo))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  bs = P((cf ^ ca ^ bu ^ bs), 1u);
  {
    bo += 0x5a827999u;
    bo += bs;
    bo += ((((bn)) ^ (((bq)) & (((bm)) ^ ((bn))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  bt = P((cg ^ cb ^ bv ^ bt), 1u);
  {
    bn += 0x5a827999u;
    bn += bt;
    bn += ((((bm)) ^ (((bp)) & (((bq)) ^ ((bm))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  bu = P((br ^ cc ^ bw ^ bu), 1u);
  {
    bm += 0x5a827999u;
    bm += bu;
    bm += ((((bq)) ^ (((bo)) & (((bp)) ^ ((bq))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };

  bv = P((bs ^ cd ^ bx ^ bv), 1u);
  {
    bq += 0x6ed9eba1u;
    bq += bv;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  bw = P((bt ^ ce ^ by ^ bw), 1u);
  {
    bp += 0x6ed9eba1u;
    bp += bw;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  bx = P((bu ^ cf ^ bz ^ bx), 1u);
  {
    bo += 0x6ed9eba1u;
    bo += bx;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  by = P((bv ^ cg ^ ca ^ by), 1u);
  {
    bn += 0x6ed9eba1u;
    bn += by;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  bz = P((bw ^ br ^ cb ^ bz), 1u);
  {
    bm += 0x6ed9eba1u;
    bm += bz;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  ca = P((bx ^ bs ^ cc ^ ca), 1u);
  {
    bq += 0x6ed9eba1u;
    bq += ca;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  cb = P((by ^ bt ^ cd ^ cb), 1u);
  {
    bp += 0x6ed9eba1u;
    bp += cb;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  cc = P((bz ^ bu ^ ce ^ cc), 1u);
  {
    bo += 0x6ed9eba1u;
    bo += cc;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  cd = P((ca ^ bv ^ cf ^ cd), 1u);
  {
    bn += 0x6ed9eba1u;
    bn += cd;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  ce = P((cb ^ bw ^ cg ^ ce), 1u);
  {
    bm += 0x6ed9eba1u;
    bm += ce;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  cf = P((cc ^ bx ^ br ^ cf), 1u);
  {
    bq += 0x6ed9eba1u;
    bq += cf;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  cg = P((cd ^ by ^ bs ^ cg), 1u);
  {
    bp += 0x6ed9eba1u;
    bp += cg;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  br = P((ce ^ bz ^ bt ^ br), 1u);
  {
    bo += 0x6ed9eba1u;
    bo += br;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  bs = P((cf ^ ca ^ bu ^ bs), 1u);
  {
    bn += 0x6ed9eba1u;
    bn += bs;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  bt = P((cg ^ cb ^ bv ^ bt), 1u);
  {
    bm += 0x6ed9eba1u;
    bm += bt;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  bu = P((br ^ cc ^ bw ^ bu), 1u);
  {
    bq += 0x6ed9eba1u;
    bq += bu;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  bv = P((bs ^ cd ^ bx ^ bv), 1u);
  {
    bp += 0x6ed9eba1u;
    bp += bv;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  bw = P((bt ^ ce ^ by ^ bw), 1u);
  {
    bo += 0x6ed9eba1u;
    bo += bw;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  bx = P((bu ^ cf ^ bz ^ bx), 1u);
  {
    bn += 0x6ed9eba1u;
    bn += bx;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  by = P((bv ^ cg ^ ca ^ by), 1u);
  {
    bm += 0x6ed9eba1u;
    bm += by;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };

  bz = P((bw ^ br ^ cb ^ bz), 1u);
  {
    bq += 0x8f1bbcdcu;
    bq += bz;
    bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  ca = P((bx ^ bs ^ cc ^ ca), 1u);
  {
    bp += 0x8f1bbcdcu;
    bp += ca;
    bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  cb = P((by ^ bt ^ cd ^ cb), 1u);
  {
    bo += 0x8f1bbcdcu;
    bo += cb;
    bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  cc = P((bz ^ bu ^ ce ^ cc), 1u);
  {
    bn += 0x8f1bbcdcu;
    bn += cc;
    bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  cd = P((ca ^ bv ^ cf ^ cd), 1u);
  {
    bm += 0x8f1bbcdcu;
    bm += cd;
    bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  ce = P((cb ^ bw ^ cg ^ ce), 1u);
  {
    bq += 0x8f1bbcdcu;
    bq += ce;
    bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  cf = P((cc ^ bx ^ br ^ cf), 1u);
  {
    bp += 0x8f1bbcdcu;
    bp += cf;
    bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  cg = P((cd ^ by ^ bs ^ cg), 1u);
  {
    bo += 0x8f1bbcdcu;
    bo += cg;
    bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  br = P((ce ^ bz ^ bt ^ br), 1u);
  {
    bn += 0x8f1bbcdcu;
    bn += br;
    bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  bs = P((cf ^ ca ^ bu ^ bs), 1u);
  {
    bm += 0x8f1bbcdcu;
    bm += bs;
    bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  bt = P((cg ^ cb ^ bv ^ bt), 1u);
  {
    bq += 0x8f1bbcdcu;
    bq += bt;
    bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  bu = P((br ^ cc ^ bw ^ bu), 1u);
  {
    bp += 0x8f1bbcdcu;
    bp += bu;
    bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  bv = P((bs ^ cd ^ bx ^ bv), 1u);
  {
    bo += 0x8f1bbcdcu;
    bo += bv;
    bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  bw = P((bt ^ ce ^ by ^ bw), 1u);
  {
    bn += 0x8f1bbcdcu;
    bn += bw;
    bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  bx = P((bu ^ cf ^ bz ^ bx), 1u);
  {
    bm += 0x8f1bbcdcu;
    bm += bx;
    bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  by = P((bv ^ cg ^ ca ^ by), 1u);
  {
    bq += 0x8f1bbcdcu;
    bq += by;
    bq += (((((bn)) & ((bo))) | (((bp)) & (((bn)) ^ ((bo))))));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  bz = P((bw ^ br ^ cb ^ bz), 1u);
  {
    bp += 0x8f1bbcdcu;
    bp += bz;
    bp += (((((bm)) & ((bn))) | (((bo)) & (((bm)) ^ ((bn))))));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  ca = P((bx ^ bs ^ cc ^ ca), 1u);
  {
    bo += 0x8f1bbcdcu;
    bo += ca;
    bo += (((((bq)) & ((bm))) | (((bn)) & (((bq)) ^ ((bm))))));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  cb = P((by ^ bt ^ cd ^ cb), 1u);
  {
    bn += 0x8f1bbcdcu;
    bn += cb;
    bn += (((((bp)) & ((bq))) | (((bm)) & (((bp)) ^ ((bq))))));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  cc = P((bz ^ bu ^ ce ^ cc), 1u);
  {
    bm += 0x8f1bbcdcu;
    bm += cc;
    bm += (((((bo)) & ((bp))) | (((bq)) & (((bo)) ^ ((bp))))));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };

  cd = P((ca ^ bv ^ cf ^ cd), 1u);
  {
    bq += 0xca62c1d6u;
    bq += cd;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  ce = P((cb ^ bw ^ cg ^ ce), 1u);
  {
    bp += 0xca62c1d6u;
    bp += ce;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  cf = P((cc ^ bx ^ br ^ cf), 1u);
  {
    bo += 0xca62c1d6u;
    bo += cf;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  cg = P((cd ^ by ^ bs ^ cg), 1u);
  {
    bn += 0xca62c1d6u;
    bn += cg;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  br = P((ce ^ bz ^ bt ^ br), 1u);
  {
    bm += 0xca62c1d6u;
    bm += br;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  bs = P((cf ^ ca ^ bu ^ bs), 1u);
  {
    bq += 0xca62c1d6u;
    bq += bs;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  bt = P((cg ^ cb ^ bv ^ bt), 1u);
  {
    bp += 0xca62c1d6u;
    bp += bt;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  bu = P((br ^ cc ^ bw ^ bu), 1u);
  {
    bo += 0xca62c1d6u;
    bo += bu;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  bv = P((bs ^ cd ^ bx ^ bv), 1u);
  {
    bn += 0xca62c1d6u;
    bn += bv;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  bw = P((bt ^ ce ^ by ^ bw), 1u);
  {
    bm += 0xca62c1d6u;
    bm += bw;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  bx = P((bu ^ cf ^ bz ^ bx), 1u);
  {
    bq += 0xca62c1d6u;
    bq += bx;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  by = P((bv ^ cg ^ ca ^ by), 1u);
  {
    bp += 0xca62c1d6u;
    bp += by;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  bz = P((bw ^ br ^ cb ^ bz), 1u);
  {
    bo += 0xca62c1d6u;
    bo += bz;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  ca = P((bx ^ bs ^ cc ^ ca), 1u);
  {
    bn += 0xca62c1d6u;
    bn += ca;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  cb = P((by ^ bt ^ cd ^ cb), 1u);
  {
    bm += 0xca62c1d6u;
    bm += cb;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };
  cc = P((bz ^ bu ^ ce ^ cc), 1u);
  {
    bq += 0xca62c1d6u;
    bq += cc;
    bq += ((bn) ^ (bo) ^ (bp));
    bq += P(bm, 5u);
    bn = P(bn, 30u);
  };
  cd = P((ca ^ bv ^ cf ^ cd), 1u);
  {
    bp += 0xca62c1d6u;
    bp += cd;
    bp += ((bm) ^ (bn) ^ (bo));
    bp += P(bq, 5u);
    bm = P(bm, 30u);
  };
  ce = P((cb ^ bw ^ cg ^ ce), 1u);
  {
    bo += 0xca62c1d6u;
    bo += ce;
    bo += ((bq) ^ (bm) ^ (bn));
    bo += P(bp, 5u);
    bq = P(bq, 30u);
  };
  cf = P((cc ^ bx ^ br ^ cf), 1u);
  {
    bn += 0xca62c1d6u;
    bn += cf;
    bn += ((bp) ^ (bq) ^ (bm));
    bn += P(bo, 5u);
    bp = P(bp, 30u);
  };
  cg = P((cd ^ by ^ bs ^ cg), 1u);
  {
    bm += 0xca62c1d6u;
    bm += cg;
    bm += ((bo) ^ (bp) ^ (bq));
    bm += P(bn, 5u);
    bo = P(bo, 30u);
  };

  bm += ch;
  bn += ci;
  bo += cj;
  bp += ck;
  bq += cl;

  {
    if (((bp) == as[0]) && ((bq) == as[1]) && ((bo) == as[2]) && ((bn) == as[3])) {
      const u32 cm = ad + 0;
      if (atomic_add(&q[cm], 1) == 0) {
        AA(o, t, y, 0, cm, ah, at);
      }
    }
  };
}
}

__kernel void CC(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}

__kernel void CD(__global pw_t* a, __global kernel_rule_t* b, __global comb_t* c, __global bf_t* d, __global void* e, __global void* f, __global u32* g, __global u32* h, __global u32* i, __global u32* j, __global u32* k, __global u32* l, __global u32* m, __global u32* n, __global plain_t* o, __global digest_t* p, __global u32* q, __global salt_t* r, __global pstoken_t* s, __global u32* t, __global u32* u, const u32 v, const u32 w, const u32 x, const u32 y, const u32 z, const u32 aa,
                 const u32 ab, const u32 ac, const u32 ad, const u32 ae, const u32 af) {
}