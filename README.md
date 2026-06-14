# 天津理工大学本科毕业设计说明书 Typst 模版

依据《天津理工大学本科毕业设计说明书（毕业论文）撰写规范(2025)》制作。

**学生请先编译 `使用指南.typ` 阅读**——零基础上手教程 + 速查卡 + 排错表 +
提交前自查清单（PDF 含版权字体，未随仓库分发，请自行编译生成）。

## 文件说明

| 文件 | 作用 |
|---|---|
| `使用指南.typ` | **从这里开始**：学生使用教程（本身即 Typst 排版，编译后阅读） |
| `tjutthesis.typ` | 模版，封装全部格式要求（不要修改） |
| `main.typ` | 示例主文件，在此基础上写论文（含详细用法注释） |
| `fonts/` | **字体须自行放入**，见 [`fonts/README.md`](fonts/README.md)（版权字体未随仓库分发） |
| `tjutthesis-pandoc.typ` | 查重/AIGC 检测导出 docx 专用的简化模版（配合 pandoc，见指南 FAQ） |
| `guide-assets/` | 指南用的效果图 |
| `LICENSE` | LPPL-1.3c 许可（仅覆盖模版源文件，不含字体） |

## 本机编译

### 安装 Typst

**Windows**（任选其一）：

```powershell
winget install --id Typst.Typst      # 方式一：winget（Win10/11 自带，推荐）
scoop install typst                  # 方式二：Scoop（需先装 Scoop）
```

或**手动安装**：到 <https://github.com/typst/typst/releases> 下载
`typst-x86_64-pc-windows-msvc.zip`，解压得到 `typst.exe`，把它放进某个目录
（如 `C:\Tools\typst\`）并将该目录加入系统环境变量 **PATH**。

装好后**重开一个 PowerShell / 终端**，执行 `typst --version` 能看到版本号即成功。

> macOS：`brew install typst`；Linux：`snap install typst` 或 `cargo install --locked typst-cli`。
> 完全不想安装？用下方的 typst.app 网页版，零安装、实时预览。

### 编译

```powershell
typst compile --font-path ./fonts main.typ   # 编译一次（生成 main.pdf）
typst watch   --font-path ./fonts main.typ   # 监视模式，保存即重编（约 0.1 秒）
```

> Windows 上路径用 `./fonts` 或 `.\fonts` 均可；`--font-path ./fonts` 不能省略，
> 否则会因找不到中易字体而报 `unknown font family`。

## typst.app 网页版（类似 Overleaf，免费无编译时长限制）

1. 打开 typst.app → 新建项目；
2. 把本目录全部文件拖入项目，并按 [`fonts/README.md`](fonts/README.md)
   把字体文件一并上传到 `fonts/`；
3. 即可实时编辑预览，无需任何编译器设置。

## 写作语法速查（对比 Word/LaTeX 的心智负担）

| 想要 | 写法 |
|---|---|
| 章（第一章 ×××） | `= 绪论` |
| 节（1.1） | `== 研究背景与意义` |
| 小节（1.1.1） | `=== 国内研究现状` |
| 插图 | `#figure(image("xx.png", width: 60%), caption: [图题]) <fig-xx>` |
| 表格 | 见 `main.typ` 中三线表示例 |
| 公式 | `$ F = mu m g $ <eq-xx>`（自动按章编号，序号靠右） |
| 引用图/表/式 | `@fig-xx` `@tab-xx` `@eq-xx`（自动变成“图 2.1”等） |
| 上标文献引用 | `#super[\[1\]]` |
| 参考文献 | `#references[ + 条目… ]`（每条以 `+` 开头，自动编 [1][2]…） |

字体、字号、行距、缩进、页眉页码、编号格式全部由模版自动处理，
正文里**不需要**任何字体字号设置。

## 注意事项

- **中文段落建议一段写一行**（编辑器开自动换行即可）：段落中间手动换行
  会在换行处引入一个西文空格。
- 小标题序号按规范用顿号「1、」；如要写「1.」需转义成 `1\.`，
  否则会被解析成有序列表。
- 标题层级最多三级（`===`），不要用 `====`。
- 本模版不含封皮、首页、原创性声明、选题审批表、任务书、开题报告、底图，
  这些用教务处统一模板单独制作后合并装订。

## 已落实的规范要点

与 LaTeX 模版相同：A4 页边距 2.5cm；正文小四宋体 1.25 倍行距、段首缩进
两个汉字；西文 Times New Roman；章三号黑体居中「第一章」且另起一页、
节小三黑体居中、小节四号黑体左起、标题 1.5 倍行距；页眉宋体五号居中加线
（从正文至致谢）、页码宋体小五居中从正文起；目录章名黑体四号、其余小四宋体、
点线连接页码右对齐；摘要楷体四号固定 20 磅、「摘 要」「目 录」「致 谢」
空格规则；图题表题五号楷体（图下表上）、按章编号；公式按章编号靠右；
参考文献三号黑体居中、条目小四宋体悬挂缩进、[1] 连续编号；附录三号黑体、
5 号正文固定 18 磅行距。

## 字体（重要）

规范要求的中文字体是 Windows/Word 的**中易字体**（宋/黑/楷/仿宋），属版权字体，
**未包含在本仓库中**。请按 [`fonts/README.md`](fonts/README.md) 从你拥有授权的
设备自行获取后放入 `fonts/`（命令行用 `--font-path ./fonts`，typst.app 一并上传）。

## 版权与许可

模版源文件 © 2026 **seatres**（https://github.com/seatres），依据
[**LaTeX Project Public License 1.3c**](LICENSE)（或更新版本）发布，与配套的
[LaTeX 版模版](https://github.com/seatres/tjut-thesis-latex-template)许可一致：

- 可自由使用、修改、再分发（**包括商业用途**）；
- 维护状态 `maintained`，**当前维护者：seatres**（https://github.com/seatres）；
- 再分发**修改后**的版本时，须按 LPPL 要求更改文件名/作品标识、标注修改者为
  新的“当前维护者”，并**保留原作者 seatres 的署名与许可信息**，使原版不被冒名或混淆。

> **字体不在许可范围内**：中易字体、Times New Roman 等为第三方版权字体，
> 未随本模版分发，须使用者自行从授权设备获取，详见 [`fonts/README.md`](fonts/README.md)。
