# shellcode_framework
x86 shellcode framework 

shellcode framework������һ������shellcode��ܣ�Ҳ�����Զ�����shellcode
ֻ�ṩx86���ڴ溯�������Ĺ��ܣ����Ҫע�⣬��Ȼ��������ʧ���ˡ�
������кõ�Ӧ�û�����չ��������ϵ�ң����뵽ʾ����
x64�汾�����Ժ���ʱ���ϴ���

�ڴ��ṩ����ʾ��˵��Ӧ��
loadlibrarya.asm    ͨ������LoadLibraryA�����������ƶ���Dll
messageboxa.asm     ��ȡMessageBoxA��������ʾ��

���뷽ʽ:
����nasm http://www.nasm.us/ 
���뷽ʽ������bin,nasm -f bin xxxx.asm -o xxxx.bin

���������˵��:
GetFuncAddress(��׼C���÷�ʽ)   ͨ��PEB�õ�������ַ
str2dw(��׼C���÷�ʽ)           �Ѻ����ַ���ת��Ϊһ��˫�ֵ�ֵ(thanks massimiliano Tomassoli)	

