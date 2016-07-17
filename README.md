##shellcode_framework
	暂时不是一个完整的框架，只提供了x86下的进程内存搜索函数的功能。
	并且有局限性，如果进程不是通过显示加载dll的情况下，就不能搜索到相关库中的函数。
##文件说明
	search_api.asp		内存搜素函数地址功能部分
	loadlibrarya.asm	示例，通过搜索LoadLibraryA函数，加载制定的Dll
	messageboxa.asm		示例，获取MessageBoxA，弹出提示框

##编译方式:
	通过[nasm](http://www.nasm.us)进行编译，生成bin文件<br/>
	例如 nasm -f bin xxxx.asm -o xxxx.bin
	

##函数说明
	GetFuncAddress(标准C调用方式)		通过PEB得到函数地址
	str2dw(标准C调用方式)				把函数字符串转化为一个双字的值(thanks assimiliano Tomassoli)	

