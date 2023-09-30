# Unix and Linux Compile, Configure By Shell Script Memo.

#### Bash介绍
* Bash，Unix shell的一种，在1987年由布莱恩·福克斯为了GNU计划而编写。1989年发布第一个正式版本，原先是计划用在GNU操作系统上，但能运行于大多数类Unix系统的操作系统之上，包括Linux与Mac OS X v10.4都将它作为默认shell。
* Bash是Bourne shell的后继兼容版本与开放源代码版本，它的名称来自Bourne shell（sh）的一个双关语（Bourne again / born again）：Bourne-Again SHell。
* Bash是一个命令处理器，通常运行于文本窗口中，并能执行用户直接输入的命令。Bash还能从文件中读取命令，这样的文件称为脚本。和其他Unix shell 一样，它支持文件名替换（通配符匹配）、管道、here文档、命令替换、变量，以及条件判断和循环遍历的结构控制语句。包括关键字、语法在内的基本特性全部是从sh借鉴过来的。其他特性，例如历史命令，是从csh和ksh借鉴而来。总的来说，Bash虽然是一个满足POSIX规范的shell，但有很多扩展。

#### Csh介绍
* CSH，是一种计算机中的Linux、Unix命令，用来调用C shell。
* AC shell 是一个交互式命令解释器和一种命令编程语言，采用的语法类似于 C 编程语言。shell 是交互式地从终端键盘或者是从一个文件来执行命令的。这个 csh 命令调用了 C shell。
* 当调用 csh 命令时就会执行，这是通过查找根目录和执行命令从 .cshrc 文件（用来存储用户化的用户信息）中，执行的条件是命令存在。如果 csh 命令作为一个登录 shell 运行，就会从 .cshrc 和 .login 文件中执行命令。
* 当 Shell 处理完标志参数后，如果 -i、-c、-s和 -t 标志都未被指定，并且 File [Parameter] 被指定，那么 Shell 就会执行脚本文件，此文件指定于 File [Parameter]，包含了任何指定的参数。指定的脚本文件必须拥有读取权限；shell 忽略了任何 setuid 和 setgid 设置。
* 注意： 不应指定一个脚本文件如果采用的 csh 命令含有 -c 或 -s 标志。
* 如果指定一个脚本文件，这个命令打开文件和保存脚本文件，可能的再置命名是换通过 $0 （美元符号，0）。脚本的执行是通过 csh。保持参数初始化 argv 变量。

#### Tcsh介绍
* Tcsh是csh的增强版，并且完全兼容csh。它不但具有csh的全部功能，还具有命令行编辑、拼写校正、可编程字符集、历史纪录、作业控制等功能，以及C语言风格的语法结构。

#### 参与贡献

1.  GF Fork 本仓库
2.  GF 新建 master 分支
3.  GF 提交代码
4.  GF 新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
