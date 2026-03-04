# 🔍 猜词百科 - 汉字填空猜词游戏

![Godot](https://img.shields.io/badge/Godot-4.0%2B-478CBF?logo=godot-engine&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey)

**猜词百科** 是一款基于汉字揭示机制的猜词游戏，完全复刻自“猜盐”小游戏的经典玩法。所有文字初始完全隐藏，你通过输入汉字来逐步揭示百科介绍，最终猜出目标词条。

> 🎮 核心玩法：输入一个汉字，百科介绍中所有相同的汉字都会显现——用最少的输入次数猜出正确答案！

---

## 🎯 游戏简介

这是一个考验知识储备和策略猜词的趣味挑战：

- **🔍 全隐藏文本** - 百科介绍的所有汉字初始都是隐藏状态，显示为“__”
- **⌨️ 输入揭示** - 你输入任意汉字，文中所有匹配的汉字都会显示出来
- **💡 逐步推理** - 根据逐渐显现的文字碎片，推断出完整词条
- **🏆 挑战记录** - 用最少的输入次数猜对，挑战自己的推理能力

---

## ✨ 核心特色

| 特色 | 说明 |
|------|------|
| **纯正复刻** | 完美还原“猜盐”猜词百科的玩法和体验 |
| **丰富词库** | 内置多种分类词条（历史人物、地名、文化常识等） |
| **输入计数** | 记录你的输入次数，挑战更高分数 |
| **简洁界面** | 清爽的UI设计，专注于猜词本身 |
| **开源免费** | 完全开源，欢迎二次创作 |

---

## 🛠️ 技术栈

- **引擎**：[Godot Engine 4.3](https://godotengine.org/)
- **语言**：GDScript
- **平台**：跨平台（Windows/macOS/Linux）

---

## 🚀 如何运行


### 方法二：从源码运行
1. 安装 [Godot Engine 4.x](https://godotengine.org/download)
2. 克隆本仓库：
   ```bash
   git clone https://github.com/stranger1sag/guessing_encylopedia.git
   ```
3. 打开Godot，点击“导入”并选择项目文件夹
4. 点击“运行”开始游戏
5. 或者直接下载.apk后缀的手机版本

---

## 🎮 如何游玩

1. **开始新游戏** - 随机选择一个词条开始挑战
2. **观察布局** - 页面显示若干横线，代表隐藏的文字
3. **输入汉字** - 在输入框中键入你认为可能存在的汉字
4. **逐步揭示** - 如果百科中包含该字，所有相同汉字都会显示
5. **推理猜测** - 根据已显示的文字碎片，推断完整词条
6. **提交答案** - 当你猜到是什么词时，输入完整词条提交
7. **挑战自我** - 尝试用更少的输入次数通关！

---

## 📦 项目结构

```
guess-word/
├── assets/          # 游戏资源（字体、音效等）
├── scenes/          # 场景文件
├── src/         # GDScript代码
├── text.json   # 词库数据
└── project.godot    # 项目配置文件
```

---

## 🤝 贡献指南

欢迎任何形式的贡献！

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的改动 (`git commit -m '添加了某个特性'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

### 可以贡献的方向
- 📖 扩充词库
- 🎨 优化UI界面
- 🔊 添加音效
- 🌐 多语言支持
- 🐛 修复Bug

---

## 📄 许可证

本项目采用 MIT 许可证 - 详情请查看 [LICENSE](LICENSE) 文件

---

## 🙏 致谢

- 感谢 [Godot Engine](https://godotengine.org/) 开源游戏引擎
- 感谢所有贡献者和玩家的支持

---

---

**⭐ 如果喜欢这个项目，别忘了点个Star！**

---
