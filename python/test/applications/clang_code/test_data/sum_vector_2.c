int sum_vec(int* vec, int size) {
    int sum = 0;

    int i = 0;
    while(i < size) {
        sum += sum;
        i++;
    }

    return sum;
}