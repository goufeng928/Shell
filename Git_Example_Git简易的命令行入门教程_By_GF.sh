# 简易的命令行入门教程:

# Git 全局设置:

git config --global user.name "XXX(Name or UserName)"
git config --global user.email "XXXXXX@XXX.com"

# 创建 git 仓库:

mkdir operation-notes-of-git
cd operation-notes-of-git
git init 
touch README.md
git add README.md
git commit -m "first commit"
git remote add origin https://gitee.com/XXXX(UserName)/operation-notes-of-git.git
git push -u origin "master"

# 已有仓库?

cd existing_git_repo
git remote add origin https://gitee.com/XXXX(UserName)/operation-notes-of-git.git
git push -u origin "master"

# - END -