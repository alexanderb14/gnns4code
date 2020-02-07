int sum_array(int** array, int size_1, int size_2) {
    int sum = 0;

    for(int i=0; i < size_1; i++) {
        for(int j=0; j < size_2; j++) {
            sum += array[i][j];
        }
    }

    return sum;
}