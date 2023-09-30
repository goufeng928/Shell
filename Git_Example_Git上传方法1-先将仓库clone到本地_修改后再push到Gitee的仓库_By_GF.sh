# Git上传方法1-先将仓库 clone 到本地，修改后再 push 到 GitHub / Gitee 的仓库

git clone https://gitee.com/用户个性地址/HelloGit.git #将远程仓库克隆到本地

# 在克隆过程中，如果仓库是一个私有仓库，将会要求用户输入 GitHub / Gitee 的账号和密码。按照提示输入即可。

# 当然，用户也可以通过配置本地的git配置信息，执行git config命令预先配置好相关的用户信息，配置执行如下：

git config --global user.name "你的名字或昵称"
git config --global user.email "你的邮箱"

# 在 GitHub / Gitee 平台中，强烈建议您在【设置-多邮箱管理】中的“提交邮箱”与上面配置信息中的邮箱地址保持一致，这样平台就能及时地统计您在平台中提交代码的贡献了。

# 修改代码后，在仓库目录下执行下面命令

git add . #将当前目录所有文件添加到git暂存区
git commit -m "my first commit" #提交并备注提交信息
git push origin master #将本地提交推送到远程仓库

# - END -