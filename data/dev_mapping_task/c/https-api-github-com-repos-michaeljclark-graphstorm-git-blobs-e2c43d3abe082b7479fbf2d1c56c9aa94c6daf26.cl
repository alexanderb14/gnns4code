struct tree_node {
  float4 containerCenter;
  float4 containerHalf;
  float4 centerOfGravity;
  int entries[4];
  uint childCount[4];
  uint state;
  int depth;
  int parent;
  float mass;
};

__kernel void A(__global float4* a, __global float4* b, __global float* c, const float d, __global struct tree_node* e) {
  const int f = get_global_id(0);

  float4 g = a[f];
  float h = c[f];
  float4 i = 0;
  float j = length(e[0].containerHalf) / 4.0;

  int k = 0;
  uint l[8] = {0};
  uint m[8] = {0};

  do {
    __global struct tree_node* n = e + l[k];
    int o = n->entries[m[k]];
    int p = n->state;

    if (o >= 0) {
      if (p == 2) {
        __global struct tree_node* q = e + o;
        float4 r = g - q->centerOfGravity;
        float s = length(r);

        if (s > j && s > length(q->containerHalf) * 2.0) {
          r *= (float)1 / fmax(s, (float)0.1f);

          float t = d / fmax(s * s * (float)0.5f, (float)0.005f);
          float4 u = r * t * q->mass;
          i += u * ((float)1 / h);

        } else {
          k++;
          l[k] = o;
          m[k] = 0;
          continue;
        }

      } else if (p == 3) {
        float4 r = g - a[o];
        float s = length(r);
        r *= (float)1 / fmax(s, (float)0.1f);

        float t = d / fmax(s * s * (float)0.5f, (float)0.005f);
        float4 u = r * t;
        i += u * ((float)1 / h);
      }
    }

    m[k]++;

    while (k > 0 && m[k] >= 4) {
      k--;
      m[k]++;
    }

  } while (m[k] < 4);

  b[f] += i;
}