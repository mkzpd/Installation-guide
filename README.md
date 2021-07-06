# Installation-guide

统信uos安装验证模块指导步骤：

1. 修改/usr/share/dde-session-ui/dde-session-ui.conf

使其内容变为如下：

	[Power]
	sleep=true
	hibernate=true
	[OS]
	isDeepin=true
	[General]
	loginPromptAvatar=true
	loginPromptInput=true
	[Lock]
	#[always | ondemand | disabled]
	showSwitchUserButton=ondemand

保存退出

2. 接下来进入到/etc/pam.d，修改deepin_pam_unix

在deepin_pam_unix文件头两行加入如下内容：

    auth sufficient sensepam.so
    account sufficient sensepam.so

保存退出 
