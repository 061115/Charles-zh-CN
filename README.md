# Charles 5.2 简体中文汉化

Charles 5.2（Windows）界面简体中文语言包。

菜单栏、右键菜单、设置对话框、工具提示等界面文字均为简体中文，共 385 条文案。

---

## 下载

到 [Releases](../../releases) 页面下载 `Charles_5.2_汉化包.zip`，解压后包含：

| 文件 | 用途 |
|---|---|
| `charles.jar` | 汉化后的程序包 |
| `安装汉化.bat` | 一键安装（自动备份原版） |
| `还原英文.bat` | 一键还原 |
| `charles.jar.official-backup` | 官方原版备份 |

---

## 安装

1. **完全退出 Charles**
   右键任务栏图标退出，确认任务管理器里没有 `Charles.exe`
2. 双击 **`安装汉化.bat`**
   - Charles 装在默认位置会自动识别
   - 否则把 Charles 文件夹（含 `Charles.exe` 那一层）拖进窗口，回车
3. 启动 Charles，界面即为中文

> Charles 装在 `C:\Program Files\Charles` 时，需**右键 → 以管理员身份运行**。

---

## 还原英文

双击 **`还原英文.bat`**，选一次 Charles 目录即可恢复原版。

---

## 手动安装

1. 退出 Charles
2. 把 `Charles\lib\charles.jar` 改名备份
3. 用本包的 `charles.jar` 覆盖
4. 启动 Charles

---

## 常见问题

**双击 bat 一闪而过？**
Charles 还在后台运行，去任务管理器结束所有 `Charles.exe` 再试。

**提示写入失败 / 拒绝访问？**
装在 Program Files 目录下，右键脚本 → 以管理员身份运行。

**装了还是英文？**
确认替换的是 `Charles\lib\charles.jar`，并且 Charles 已完全重启。

**部分文字还是英文？**
表格列头（Status / Method / Host / Path）、`Overview` / `Contents` 等标签页、响应体内容属于程序硬编码或抓包数据，不在语言资源范围内，属正常现象。这些是 HTTP 协议术语，保留原文反而便于对照抓包结果。

**以后想升级 Charles？**
先跑 `还原英文.bat`，再升级。升级会覆盖整个 `lib` 目录，汉化会失效，需要等新版汉化包。

---

## 兼容性

- 仅适用于 **Charles 5.2**
- 只修改语言资源文件，程序主体逻辑未改动

---

## 法律声明

本项目**不包含**任何 Charles 的二进制程序或反编译代码。

Charles 是 XK72 Ltd. 的商业软件，版权归原作者所有。
使用本汉化包请先自行购买正版 Charles 授权。

本项目与 XK72 Ltd. 无任何关联，未获其背书。
