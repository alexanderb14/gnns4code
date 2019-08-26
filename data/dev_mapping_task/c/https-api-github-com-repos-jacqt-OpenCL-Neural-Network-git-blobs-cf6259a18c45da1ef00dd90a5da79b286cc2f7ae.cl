typedef struct Node {
  int numberOfWeights;
  float weights[3400];
  float output;
  float input;
  float errorGradient;
} Node;

typedef struct Layer {
  int numberOfNodes;
  Node nodes[3400];
} Layer;

typedef struct Filter {
  int filterDim;
  int filterNumber;
  float weights[15 * 15];
  float bias;
  float costs[15];
  float errorGradient;
} Filter;

typedef struct ConvolutionalLayer {
  int numberOfFilters;
  Filter filters[20];
} ConvolutionalLayer;

float inline A(float a) {
  if (a < -100)
    return 0;
  if (a > 100)
    return 1;
  return 1 / (1 + exp(-a));
}

void inline B(int a, constant int* restrict b, int* restrict c, int* restrict d) {
  for (unsigned int e = 1;; ++e) {
    int f = b[e];
    bool g = f <= a;
    if (g)
      a += -f;
    else {
      *c = e;
      *d = a;
      break;
    }
  }
}

kernel void C(global Layer* restrict a, global float* restrict b, int c) {
  const int d = get_global_size(0);
  const int e = get_global_id(0);
  b[e] = a[c].nodes[e].output;
}

kernel void D(global Layer* restrict a, constant int* restrict b) {
  const int c = get_global_size(0);
  const int d = get_global_id(0);

  int e, f, g;
  float h;
  B(d, b, &e, &f);
  g = a[e].nodes[f].numberOfWeights;

  h = 0;
  for (unsigned int i = 0; i != g; ++i)
    h += a[e].nodes[f].weights[i] * a[e - 1].nodes[i].output;

  a[e].nodes[f].output = A(h);
}

kernel void E(global Layer* restrict a, constant int* restrict b) {
  const int c = get_global_size(0);
  const int d = get_global_id(0);

  int e, f, g;
  float h;
  B(d, b, &e, &f);
  g = a[e].nodes[f].numberOfWeights;

  h = 0;
  for (unsigned int i = 0; i != g; i += 5) {
    h += a[e].nodes[f].weights[i] * a[e - 1].nodes[i].output;
    h += a[e].nodes[f].weights[i + 1] * a[e - 1].nodes[i + 1].output;
    h += a[e].nodes[f].weights[i + 2] * a[e - 1].nodes[i + 2].output;
    h += a[e].nodes[f].weights[i + 3] * a[e - 1].nodes[i + 3].output;
    h += a[e].nodes[f].weights[i + 4] * a[e - 1].nodes[i + 4].output;
  }

  a[e].nodes[f].output = A(h);
}

kernel void F(global Layer* a, constant float* b) {
  const int c = get_global_id(0);
  a[0].nodes[c].output = b[c];
}

kernel void G(global Layer* restrict a, constant int* restrict b) {
  const int c = get_global_size(0);
  const int d = get_global_id(0);

  int e, f, g, h;
  float i, j, k;
  B(d, b, &e, &f);
  g = a[e].nodes[f].numberOfWeights;
  h = a[e + 1].numberOfNodes;
  k = a[e].nodes[f].output;

  i = 0;
  for (uint l = 0; l != h; ++l)
    i += a[e + 1].nodes[l].errorGradient * a[e + 1].nodes[l].weights[f];
  i *= k * (1 - k);

  float m = 0.0005 * i;
  for (uint l = 0; l != g; ++l)
    a[e].nodes[f].weights[l] += m * a[e - 1].nodes[l].output;
  a[e].nodes[f].errorGradient = i;
}

kernel void H(global Layer* restrict a, constant int* restrict b) {
  const int c = get_global_size(0);
  const int d = get_global_id(0);

  int e, f, g, h;
  float i, j, k;
  B(d, b, &e, &f);
  g = a[e].nodes[f].numberOfWeights;
  j = a[e].nodes[f].output;
  h = a[e + 1].numberOfNodes;

  i = 0;
  for (uint l = 0; l != h; l += 5) {
    i += a[e + 1].nodes[l].errorGradient * a[e + 1].nodes[l].weights[f];
    i += a[e + 1].nodes[l + 1].errorGradient * a[e + 1].nodes[l + 1].weights[f];
    i += a[e + 1].nodes[l + 2].errorGradient * a[e + 1].nodes[l + 2].weights[f];
    i += a[e + 1].nodes[l + 3].errorGradient * a[e + 1].nodes[l + 3].weights[f];
    i += a[e + 1].nodes[l + 4].errorGradient * a[e + 1].nodes[l + 4].weights[f];
  }
  i *= j * (1 - j);

  float m = 0.0005 * i;
  for (uint l = 0; l != g; l += 5) {
    a[e].nodes[f].weights[l] += m * a[e - 1].nodes[l].output;
    a[e].nodes[f].weights[l + 1] += m * a[e - 1].nodes[l + 1].output;
    a[e].nodes[f].weights[l + 2] += m * a[e - 1].nodes[l + 2].output;
    a[e].nodes[f].weights[l + 3] += m * a[e - 1].nodes[l + 3].output;
    a[e].nodes[f].weights[l + 4] += m * a[e - 1].nodes[l + 4].output;
  }
  a[e].nodes[f].errorGradient = i;
}

kernel void I(global Layer* restrict a, constant int* restrict b, constant int* restrict c) {
  const int d = get_global_size(0);
  const int e = get_global_id(0);

  int f, g, h;
  float i, j, k;
  B(e, b, &f, &g);
  h = a[f].nodes[g].numberOfWeights;
  j = a[f].nodes[g].output;

  i = (c[g] - j) * j * (1 - j);

  float l = 0.0005 * i;
  for (uint m = 0; m != h; m += 5) {
    a[f].nodes[g].weights[m] += l * a[f - 1].nodes[m].output;
    a[f].nodes[g].weights[m + 1] += l * a[f - 1].nodes[m + 1].output;
    a[f].nodes[g].weights[m + 2] += l * a[f - 1].nodes[m + 2].output;
    a[f].nodes[g].weights[m + 3] += l * a[f - 1].nodes[m + 3].output;
    a[f].nodes[g].weights[m + 4] += l * a[f - 1].nodes[m + 4].output;
  }
  a[f].nodes[g].errorGradient = i;
}