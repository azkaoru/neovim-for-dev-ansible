neovim-for-dev-ansible
===============

# setup ssh for ansible

ansibleがsshで接続するansibleユーザを各ホストに作成する。

```
adduser ansible
passwd ansible
```

ansibleで接続する全ホストにansibleユーザを追加、それぞれのホストのansibleユーザに対して、visudoでパスワード入力を省略するようにNOPASSWDを設定する。

```
## Same thing without a password
# %wheel        ALL=(ALL)       NOPASSWD: ALL
ansible     ALL=NOPASSWD:       ALL
```

# host setting in ansible node

```
cat > ~/.ssh/config  << EOF

Host 192.168.122.55
    HostName 192.168.122.55
    User ansible
    Port 22
    IdentityFile ~/.ssh/id_rsa
    ServerAliveInterval 60

EOF
```

鍵作成&登録

```
ssh-keygen -b 2048 -t rsa -f  ~/.ssh/id_rsa -q -N ""
ssh-copy-id 192.168.122.55
```

workstatioにてssh接続確認

```
ssh 192.168.122.55
```

# run

```
testrun.sh
```

