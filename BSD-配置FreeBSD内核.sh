# BSD-配置FreeBSD内核：

# Create By GF 2023-05-24 21:19

# --------------------------------------------------

# 建立并安装一个定制的内核

# 首先对内核构建目录做一个快速的浏览。 

# 这里所提到的所有目录都在 /usr/src/sys 目录中； 也可以通过 /sys 来访问它。 

# 这里的众多子目录包含了内核的不同部分， 但对我们所要完成的任务最重要的目录是 arch/conf， 您将在这里编辑定制的内核配置； 以及 compile， 编译过程中的文件将放置在这里。

# arch 表示 i386、 amd64、 ia64、 powerpc、 sparc64， 或 pc98 (在日本比较流行的另一种 PC 硬件开发分支)。 

# 在特定硬件架构目录中的文件只和特定的硬件有关； 而其余代码则是与机器无关的， 则所有已经或将要移植并运行 FreeBSD 的平台上都共享这些代码。

# 文件目录是按照逻辑组织的， 所支持的硬件设备、 文件系统， 以及可选的组件通常都在它们自己的目录中。

# 这一章提供的例子假定您使用 i386 架构的计算机。 如果您的情况不是这样， 只需对目录名作相应的调整即可。

# --------------------------------------------------

# Note: 如果您的系统中 没有/usr/src/sys 这样一个目录， 则说明没有安装内核源代码。

    # 安装它最简单的方法是通过以 root 身份运行 sysinstall， 选择 Configure， 然后是 Distributions、 src， 选中其中的 base 和 sys。

    # 如果您不喜欢 sysinstall 并且有一张 "官方的" FreeBSD CDROM， 也可以使用下列命令， 从命令行来安装源代码。

        mount /cdrom
        mkdir -p /usr/src/sys
        ln -s /usr/src/sys /sys
        cat /cdrom/src/ssys.[a-d]* | tar -xzvf -
        cat /cdrom/src/sbase.[a-d]* | tar -xzvf -

# 接下来， 进入 arch/conf 目录下面， 复制 GENERIC 配置文件， 并给这个文件起一个容易辨认的名称， 它就是您的内核名称。例如：

    cd /usr/src/sys/i386/conf
    cp GENERIC MYKERNEL

# 通常，这个名称是大写的，如果您正维护着多台不同硬件的FreeBSD机器， 以您机器的域名来命名是非常好的主意。我们把它命名为 MYKERNEL就是这个原因。

# Tips: 将您的内核配置文件直接保存在 /usr/src 可能不是一个好主意。 如果您遇到问题， 删掉 /usr/src 并重新开始很可能是一个诱人的选择。 

    # 一旦开始做这件事， 您可能几秒钟之后才会意识到您同时会删除定制的内核配置文件。 

    # 另外， 也不要直接编辑 GENERIC， 因为下次您 更新代码 时它会被覆盖， 而您的修改也就随之丢失了。

    # 您也可以考虑把内核配置文件放到别的地方， 然后再到 i386 目录中创建一个指向它的符号链接。

    # 例如：

        cd /usr/src/sys/i386/conf
        mkdir /root/kernels
        cp GENERIC /root/kernels/MYKERNEL
        ln -s /root/kernels/MYKERNEL

# Note: 必须以 root 身份执行这些和接下来命令， 否则就会得到 的错误提示。

# 现在就可以用您喜欢的文本编辑器来编辑 MYKERNEL 了。 

# 如果您刚刚开始使用 FreeBSD， 唯一可用的编辑器很可能是 vi， 它的使用比较复杂， 限于篇幅， 这里不予介绍， 您可以在 参考书目 一章中找到很多相关书籍。 

# 不过， FreeBSD 也提供了一个更好用的编辑器， 它叫做 ee， 对于新手来说， 这很可能是一个不错的选择。 

# 您可以修改配置文件中的注释以反映您的配置， 或其他与 GENERIC 不同的地方。

# 如果您在SunOS™或者其他BSD系统下定制过内核，那这个文件中的绝大部分将对您非常熟悉。 

# 如果您使用的是诸如DOS这样的系统，那GENERIC配置文件看起来就非常困难， 所以在下面的 配置文件章节将慢慢地、仔细地进行介绍。

# Note: 如果您和 FreeBSD project 进行了 代码同步， 则一定要在进行任何更新之前查看 /usr/src/UPDATING。 

    # 这个文件中描述了更新过的代码中出现的重大问题或需要注意的地方。 /usr/src/UPDATING 总是和您的 FreeBSD 源代码对应， 因此能够提供比手册更具时效性的新内容。

# --------------------------------------------------

# 现在应该编译内核的源代码了。

# Procedure: 联编内核

    # 1. 进入 /usr/src 目录：

        cd /usr/src

    # 2. 编译内核：

        make buildkernel KERNCONF=MYKERNEL

    # 3. 安装新内核：

        make installkernel KERNCONF=MYKERNEL

# Note: 使用这种方法联编内核时， 需要安装完整的 FreeBSD 源代码。

# Tips: 默认情况下， 在联编您所定制的内核时， 全部 内核模块也会同时参与构建。 

    # 如果您希望更快地升级内核， 或者只希望联编您所需要的模块， 则应在联编之前编辑 /etc/make.conf：

        MODULES_OVERRIDE = linux acpi sound/sound sound/driver/ds1 ntfs

    # 这个变量的内容是所希望构建的模块列表。

        WITHOUT_MODULES = linux acpi sound ntfs

    # 这个变量的内容是将不在联编过程中编译的顶级模块列表。 如果希望了解更多与构建内核有关的变量， 请参见 make.conf(5) 联机手册。

# 新内核将会被复制到 /boot/kernel 目录中成为 /boot/kernel/kernel 而旧的则被移到 /boot/kernel.old/kernel。 

# 现在关闭系统， 然后用新的内核启动计算机。 如果出现问题， 后面的一些 故障排除方法 将帮您摆脱困境。 如果您的内核 无法启动， 请参考那一节。

# Note: 其他与启动过程相关的文件， 如 loader(8) 及其配置， 则放在 /boot。 

    # 第三方或定制的模块也可以放在 /boot/kernel， 不过应该注意保持模块和内核的同步时很重要的， 否则会导致不稳定和错误。

# --------------------------------------------------
# EOF