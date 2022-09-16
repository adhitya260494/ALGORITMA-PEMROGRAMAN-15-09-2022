#include <stdio.h>
int main(){
    int angka;
    printf("inputkan angka bulat :");
    scanf("%d",&angka);
    if (angka % 2 == 0)
        printf("ini angka Genap\n");
    else
        printf("ini angka Ganjil\n");
    return 0;
}   
