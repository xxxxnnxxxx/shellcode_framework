## 工程说明
    支持x86，x64下的内存搜索API函数

## 文件说明
	search_api.asm              x86下内存搜索API
	search_api_x64.asm          x64下内存搜索API
	loadlibrarya.asm            x86示例，通过搜索LoadLibraryA函数，加载shellcode末尾偏移500位置指定路径的dll
	loadlibrarya_x64.asmm       x64示例，通过搜索LoaLibraryA函数，加载shellcode末尾偏移500位置指定路径的dll
	messageboxa.asm             示例，获取MessageBoxA，弹出提示框

## 编译方式:
	通过[nasm](http://www.nasm.us)进行编译，生成bin文件<br/>
	例如 nasm -f bin xxxx.asm -o xxxx.bin


