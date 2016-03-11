# shellcode_framework

shellcode framework并不是一个完整shellcode框架,也不能自动生成shellcode只提供x86下内存函数搜索的功能,这点要注意，不然可能让你失望了。<br/>
如果你有好的应用或是扩展，可能联系我，加入到示例中x64版本会在以后有时间上传。

##在此提供两个示例说明应用

- loadlibrarya.asm通过搜索LoadLibraryA函数，加载制定的Dll
- messageboxa.asm获取MessageBoxA，弹出提示框

##编译方式:
通过[nasm](http://www.nasm.us)进行编译，生成bin文件<br/>
例如 nasm -f bin xxxx.asm -o xxxx.bin


##库包含函数说明:
- GetFuncAddress(标准C调用方式)&nbsp;&nbsp;&nbsp;通过PEB得到函数地址
- str2dw(标准C调用方式)&nbsp;&nbsp;&nbsp;&nbsp;把函数字符串转化为一个双字的值(thanks assimiliano Tomassoli)	

