# shellcode_framework
x86 shellcode framework 

shellcode framework并不是一个完整shellcode框架，也不能自动生成shellcode
只提供x86下内存函数搜索的功能，这点要注意，不然可能让你失望了。
如果你有好的应用或是扩展，可能联系我，加入到示例中
x64版本会在以后有时间上传。

在此提供两个示例说明应用
loadlibrarya.asm    通过搜索LoadLibraryA函数，加载制定的Dll
messageboxa.asm     获取MessageBoxA，弹出提示框

编译方式:
下载nasm http://www.nasm.us/ 
编译方式是生成bin,nasm -f bin xxxx.asm -o xxxx.bin

库包含函数说明:
GetFuncAddress(标准C调用方式)   通过PEB得到函数地址
str2dw(标准C调用方式)           把函数字符串转化为一个双字的值(thanks massimiliano Tomassoli)	

