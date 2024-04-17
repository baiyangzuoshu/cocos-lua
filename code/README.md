# 嘿嘿2

## Run
1. 执行 `远程.bat`或 `本地.bat`
2. 执行 `./simulator/win32/Dahua.exe`

## Win32资源发布 脚本说明 
* 依赖于脚本 MakeRes.py，配置文件为 `config.ini` 和 `resource.ini`
* MakeRes.py接受两个参数 `local`|`remote` `cache`|`nocache`

```shell
python MakeRes.py remote cache
```
1. 拷贝资源到 **work_path/`项目名`/** 没有指定work_path 则为`系统临时目录`  
  *local*  *读取resource中所有* **`config.project.path`/`resource.XXX.local`** *路径中的资源*  
  *remote*  *从svn中拉取`resource.ini`中所有* **`config.svn.url`/`config.project.name`/`resource.XXX.remote`***路径中的资源*

2. 将所有资源按照**`resource.XXX.order`**逆序拷贝资源到 **脚本所在目录/`resource.XXX.out`**
