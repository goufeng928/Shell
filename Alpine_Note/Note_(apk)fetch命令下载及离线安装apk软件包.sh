# fetch命令下载及离线安装apk软件包

# 使用 apk fetch 命令下载软件包到本地 (.apk 文件):

apk fetch [<OPTIONS>...] PACKAGES... # 从配置的软件包仓库中下载软件包到本地。

# apk fetch --help 命令参数 (Fetch options):
#     -L, --link            如果可能的话, 创建硬链接。
#     -o, --output DIR      下载到指定文件夹（默认为当前文件夹）。
#     -R, --recursive       下载软件包及其依赖项。
#     -s, --stdout          将 .apk 文件转储到标准输出。
#     --simulate            模拟请求的操作，不做任何更改。

# 下载软件包及其依赖项并离线安装示例:

$ apk fetch -R <package>            # 下载软件包及其依赖项。
$
$ ls                                # 下载的软件包是 .apk 格式。
xxxx.apk.   xxxx.apk    ...
$
$ apk add xxxx.apk xxxx.apk ...     # 离线安装 apk 软件包及其依赖项。

# - END -