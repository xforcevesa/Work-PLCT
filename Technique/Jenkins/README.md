# Jenkins调研报告

# 系统环境

- OpenEuler 22.03 V1 RISC-V preview

## 安装教程

### 第1步：导入Jenkins仓库

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
```

### 第2步：使用dnf包管理器安装Jenkins

```bash
sudo dnf install fontconfig java-11-openjdk jenkins -y
sudo alternatives --config java
# 选择java-11-openjdk 即 输入2 回车
```

![](./img/Screenshot_20221205_180804.png)

- 验证一下是否安装成功

![](./img/Screenshot_20221205_181759.png)

## 使用方法

```bash
jenkins --httpPort=8080
```

- 随后浏览器打开 http://127.0.0.1:8080

- 初始化后按照[官方教程](https://www.jenkins.io/zh/doc/)进行操作
