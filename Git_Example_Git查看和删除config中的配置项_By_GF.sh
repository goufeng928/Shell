# Git查看和删除config中的配置项

# 一 直接编辑.gitconfig文件

# 一般在 C盘 / 用户 / [你的用户名] 下有一个.gitconfig文件，可以直接编辑该文件来进行增删改。

# 二 使用git命令

# 例如，使用如下命令，就可以把http.version配置项删除啦

git config --global --unset http.version

# 添加 / 修改 / 查看的命令 :

# 添加修改

git config --global http.version HTTP/1.1

# 查看

git config --global http.version

# 或查看全部

git config --global -l

# - END -