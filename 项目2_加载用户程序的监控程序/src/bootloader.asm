%include "header.asm"
org  7C00h                     ; BIOS���������������ص�0:7C00h��������ʼִ��

start:
    mov	ax, cs                 ; �������μĴ���ֵ��CS��ͬ
    mov	ds, ax                 ; ���ݶ�
    mov	bp, Message            ; BP=��ǰ����ƫ�Ƶ�ַ
    mov	ax, ds                 ; ES:BP = ����ַ
    mov	es, ax                 ; ��ES=DS
    mov	cx, msglen             ; CX = ������=9��
    mov	ax, 1301h              ; AH = 13h�����ܺţ���AL = 01h��������ڴ�β��
    mov	bx, 0007h              ; ҳ��Ϊ0(BH = 0) �ڵװ���(BL = 07h)
    mov dh, 0                  ; �к�=0
    mov	dl, 0                  ; �к�=0
    int	10h                    ; BIOS��10h���ܣ���ʾһ���ַ�

LoadOsKernel:                  ; �����̻�Ӳ���ϵ����������������ڴ��ES:BX����
    mov ax,cs                  ; �ε�ַ ; ������ݵ��ڴ����ַ
    mov es,ax                  ; ���öε�ַ������ֱ��mov es,�ε�ַ��
    mov bx, offset_oskernel    ; ƫ�Ƶ�ַ; ������ݵ��ڴ�ƫ�Ƶ�ַ
    mov ah,2                   ; ���ܺ�
    mov al,1                   ; ������
    mov dl,0                   ; �������� ; ����Ϊ0��Ӳ�̺�U��Ϊ80H
    mov dh,0                   ; ��ͷ�� ; ��ʼ���Ϊ0
    mov ch,0                   ; ����� ; ��ʼ���Ϊ0
    mov cl,2                   ; ��ʼ������ ; ��ʼ���Ϊ1
    int 13H                    ; ���ö�����BIOS��13h����

LoadUsrProg1:
    mov ax,cs                  ; �ε�ַ ; ������ݵ��ڴ����ַ
    mov es,ax                  ; ���öε�ַ������ֱ��mov es,�ε�ַ��
    mov bx, offset_usrprog1    ; ƫ�Ƶ�ַ; ������ݵ��ڴ�ƫ�Ƶ�ַ
    mov ah,2                   ; ���ܺ�
    mov al,2                   ; ������
    mov dl,0                   ; �������� ; ����Ϊ0��Ӳ�̺�U��Ϊ80H
    mov dh,0                   ; ��ͷ�� ; ��ʼ���Ϊ0
    mov ch,0                   ; ����� ; ��ʼ���Ϊ0
    mov cl,3                   ; ��ʼ������ ; ��ʼ���Ϊ1
    int 13H                    ; ���ö�����BIOS��13h����

LoadUsrProg2:
    mov ax,cs                  ; �ε�ַ ; ������ݵ��ڴ����ַ
    mov es,ax                  ; ���öε�ַ������ֱ��mov es,�ε�ַ��
    mov bx, offset_usrprog2    ; ƫ�Ƶ�ַ; ������ݵ��ڴ�ƫ�Ƶ�ַ
    mov ah,2                   ; ���ܺ�
    mov al,2                   ; ������
    mov dl,0                   ; �������� ; ����Ϊ0��Ӳ�̺�U��Ϊ80H
    mov dh,0                   ; ��ͷ�� ; ��ʼ���Ϊ0
    mov ch,0                   ; ����� ; ��ʼ���Ϊ0
    mov cl,5                   ; ��ʼ������ ; ��ʼ���Ϊ1
    int 13H                    ; ���ö�����BIOS��13h����

LoadUsrProg3:
    mov ax,cs                  ; �ε�ַ ; ������ݵ��ڴ����ַ
    mov es,ax                  ; ���öε�ַ������ֱ��mov es,�ε�ַ��
    mov bx, offset_usrprog3    ; ƫ�Ƶ�ַ; ������ݵ��ڴ�ƫ�Ƶ�ַ
    mov ah,2                   ; ���ܺ�
    mov al,2                   ; ������
    mov dl,0                   ; �������� ; ����Ϊ0��Ӳ�̺�U��Ϊ80H
    mov dh,0                   ; ��ͷ�� ; ��ʼ���Ϊ0
    mov ch,0                   ; ����� ; ��ʼ���Ϊ0
    mov cl,7                   ; ��ʼ������ ; ��ʼ���Ϊ1
    int 13H                    ; ���ö�����BIOS��13h����

LoadUsrProg4:
    mov ax,cs                  ; �ε�ַ ; ������ݵ��ڴ����ַ
    mov es,ax                  ; ���öε�ַ������ֱ��mov es,�ε�ַ��
    mov bx, offset_usrprog4    ; ƫ�Ƶ�ַ; ������ݵ��ڴ�ƫ�Ƶ�ַ
    mov ah,2                   ; ���ܺ�
    mov al,2                   ; ������
    mov dl,0                   ; �������� ; ����Ϊ0��Ӳ�̺�U��Ϊ80H
    mov dh,0                   ; ��ͷ�� ; ��ʼ���Ϊ0
    mov ch,0                   ; ����� ; ��ʼ���Ϊ0
    mov cl,9                   ; ��ʼ������ ; ��ʼ���Ϊ1
    int 13H                    ; ���ö�����BIOS��13h����

EnterOs:
    jmp offset_oskernel        ; ��ת������ϵͳ�ں�ִ��

AfterRun:
    jmp $                      ; ����ѭ��

DataArea:
    Message db 'Bootloader is loading operating system and user programmes...'
    msglen  equ ($-Message)

SectorEnding:
    times 510-($-$$) db 0
    db 0x55,0xaa