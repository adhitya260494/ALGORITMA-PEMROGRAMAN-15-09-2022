section .data
    pesan_benar db "angka 1 > angka 2", 0Ah ; panjang karakter 18 byte
    pesan_salah db "angka 1 < angka 2" , 0Ah
segment .bss
    angka1 resb 2 ; alokasi space di memorty untuk input angka1 sebanyak 2 byte
    angka2 resb 2
section .text
    global _start
_start:
    ;blok input angka1
    mov ecx, angka1
    mov edx, 2 ; byte
    mov ebx, 2 ;konstanta stdin
    mov eax, 3 ; konstanta sys read dari keyboard
    int 80h

    ;blok input angka2
    mov ecx, angka2
    mov edx, 2 ; byte
    mov ebx, 2 ;konstanta stdin
    mov eax, 3 ; konstanta sys read dari keyboard
    int 80h

    ;blok membandingkan (compare)
    mov al, [angka1] ; pindahkan nilai dari memory ke register accumulator low (AL)
    mov ah, [angka2] ; pindahkan nilai dari memory ke register accumulator hight (AH)
    cmp al, ah ; bandingkan (compare/cmp) nilai AL dengan AH

    ;blok decision making
    jg benar ; jika angka1 lebih besar (greater) angka2, maka loncat (jump) ke blok benar
    jmp salah ; jika angka1 tidak lebih besar angka2, maka loncat (jump) ke blok salah
benar:
    mov ecx, pesan_benar
    mov edx, 18 ; alokasi tempat sebanyak 18 byte
    mov ebx, 1 ; konstanta stdout
    mov eax, 4 ; konstanta sys write / menulis ke monitor
    int 80h
    jmp stop ; jika selesai mengeksekusi blok ini maka loncat (jump) ke blok stop
salah:
    mov ecx, pesan_salah
    mov edx, 18 ; alokasi tempat sebanyak 18 byte
    mov ebx, 1 ; konstanta stdout
    mov eax, 4 ; konstanta sys write / menulis ke monitor
    int 80h
    jmp stop ; jika selesai mengeksekusi blok ini maka loncat (jump) ke blok stop
stop:
    mov eax, 1 ; konstanta sys exit
    mov ebx, 0 
    int 80h
