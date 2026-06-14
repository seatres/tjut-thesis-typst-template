// ============================================================
// 《天津理工大学毕业设计说明书 Typst 模版使用指南》
// 本指南自身即用 Typst 排版：typst compile --font-path ./fonts 使用指南.typ
//
// Copyright (c) 2026 seatres (https://github.com/seatres)
// 依据 LaTeX Project Public License 1.3c（或更新版本）发布；许可全文见 LICENSE。
// ============================================================

#set page(paper: "a4", margin: (x: 2.2cm, y: 2.4cm), numbering: "1 / 1",
  footer: context align(center, text(size: 9pt,
    counter(page).display("1 / 1", both: true))))
#set text(font: ("Times New Roman", "SimSun"), size: 11pt, lang: "zh")
#set par(justify: true, leading: 0.75em, spacing: 1em)
#set heading(numbering: "1.1  ")
#show heading: set text(font: ("Times New Roman", "SimHei"), weight: "regular")
#show heading.where(level: 1): it => block(above: 22pt, below: 12pt,
  text(size: 16pt, it))
#show heading.where(level: 2): it => block(above: 14pt, below: 8pt,
  text(size: 13pt, it))
#show raw.where(block: true): it => block(fill: luma(248),
  stroke: 0.5pt + luma(200), inset: 9pt, radius: 3pt, width: 100%, it)
#show raw: set text(font: ("DejaVu Sans Mono", "SimHei"), size: 9.2pt)
#set table(stroke: 0.5pt + luma(140), inset: 6pt)
#show link: set text(fill: rgb("#1a56a0"))

// 提示框
#let tip(title, body) = block(width: 100%, inset: 9pt, radius: 3pt,
  fill: rgb("#fff7e0"), stroke: (left: 2.5pt + rgb("#e6a23c")))[
  #text(font: ("Times New Roman", "SimHei"))[#title]#linebreak()#body]

// 效果图
#let shot(path, w) = align(center,
  box(stroke: 0.6pt + luma(160), clip: true, image(path, width: w)))

// ---------- 封面区 ----------
#v(3em)
#align(center)[
  #text(font: ("Times New Roman", "SimHei"), size: 24pt)[毕业设计说明书 Typst 模版\ 使用指南]
  #v(1em)
  #text(size: 12pt, fill: luma(80))[依据《天津理工大学本科毕业设计说明书（毕业论文）撰写规范(2025)》]
  #v(0.2em)
  #text(size: 11pt, fill: luma(120))[零基础可用 · 格式全自动 · 交稿即合规]
]
#v(1.5em)

#tip[写在最前面][
  你不需要学会“排版”。模版已经把字体、字号、行距、缩进、页眉、页码、编号
  全部自动化——你只需要按本指南把*内容*填进去。全文你要记住的语法不超过 10 个。
]

#v(1em)
#outline(title: [本指南目录], depth: 2, indent: auto)
#pagebreak()

= 这个模版能做什么、不做什么

*能做的*：从中英文摘要开始，到目录、正文、参考文献、附录、致谢为止的
*全部自动排版*。章节编号（第一章 / 1.1 / 1.1.1）、图表编号（图 3.2、表 5.4）、
公式编号 (4.2)、目录页码、页眉页码，全部自动生成和更新，永远不会错乱。

*不做的*：以下 7 个前置件使用教务处统一模板*单独制作*，不写在 Typst 里：
封皮、首页、原创性声明、选题审批表、任务书、开题报告、底图。
终稿打印后按规范装订顺序与正文合并。

*终稿提交*：导出的 PDF 即为终稿。查重 / AIGC 检测如需 Word 版，
见“常见问题”一节的导出方法（检测对格式不敏感，转出来能用即可）。

= 五分钟上手

模版文件夹里你会用到的文件：

#table(columns: (auto, 1fr),
  table.header([文件], [说明]),
  [`main.typ`], [*唯一需要你编辑的文件*。示例内容齐全，照着替换成自己的内容],
  [`tjutthesis.typ`], [模版本体，*不要修改、不要删除*],
  [`fonts/` 内 8 个字体文件], [宋体/黑体/楷体/仿宋 + Times New Roman 全系列，保证和 Word 效果一致，*必须随项目一起存在*],
  [`figures/`], [自己新建的文件夹，论文插图都放这里],
)

== 路线 A：typst.app 网页版（推荐，免安装）

+ 浏览器打开 #link("https://typst.app")[typst.app]，注册免费账号；
+ 新建空项目（Start from scratch / Empty document）；
+ 把 `main.typ`、`tjutthesis.typ` 拖进左侧文件面板；新建 `fonts` 文件夹，
  把 `fonts/` 里的*全部 8 个字体文件*传进去（中文 4 个 + Times New Roman 4 个，
  少传会导致字体不符或编译警告；字体在项目里任何位置都会被自动识别）；
+ 打开 `main.typ`，右侧即出现实时预览——每敲一个字立刻看到排版结果；
+ 把第 37 行 `grad-year: "2026"` 改成自己的届别，开始写作；
+ 写完点顶部 Export → PDF 导出终稿。

#tip[为什么不用担心“免费时长”][
  typst.app 免费版没有编译时长限制（编译本来也只要零点几秒），
  也不需要像 Overleaf 那样选编译器。
]

== 路线 B：本机 VS Code（适合喜欢本地工作的同学）

+ 安装 Typst：macOS 终端执行 `brew install typst`；
  Windows 执行 `winget install --id Typst.Typst`；
+ VS Code 安装扩展 *Tinymist Typst*（编辑、预览、自动补全一体）；
+ 在模版文件夹打开终端，执行：

```bash
typst watch --font-path ./fonts main.typ
```

保存文件即自动重新编译（约 0.1 秒），`main.pdf` 始终是最新版。
`--font-path ./fonts` 不能省略，否则中文字体不对。

= 按论文结构逐节填写

下面按你写论文的顺序，每一部分给出：规范要求一句话 → 你要写的代码 →
真实排版效果。所有片段都可以直接抄进 `main.typ` 改内容。

== 中英文摘要与关键词

规范：中文标题黑体二号（≤36 字）；摘要正文楷体四号；关键词 3--8 个。
这些都自动，你只填内容：

```typst
#cn-abstract(
  title: "你的论文标题",
  keywords: ("关键词一", "关键词二", "关键词三"),
)[
  这里写中文摘要正文，一般 300–800 字……
]

#en-abstract(
  title: "Your Thesis Title in English",
  keywords: ("Keyword One", "Keyword Two", "Keyword Three"),
)[
  Your English abstract here ...
]
```

只有两人以上合作课题才需要副标题，在 `title:` 下一行加
`subtitle: "副标题",`；单人课题不写这一行。

英文关键词每个首字母大写；中英文关键词*个数必须一致*。

#shot("guide-assets/example-1.png", 56%)

== 目录

什么都不用做。`main.typ` 里的 `#toc()` 会自动生成符合规范的目录
（章名黑体四号、点线连接、页码右对齐），章节增删后自动更新。

#shot("guide-assets/example-2.png", 56%)

== 章节标题

用等号开头，等号个数 = 标题级别，*等号后必须有一个空格*：

```typst
= 绪论                  // 自动变成：第一章 绪论（三号黑体居中，自动另起一页）
== 课题的背景和意义      // 自动变成：1.1 课题的背景和意义（小三黑体居中）
=== 国内研究现状         // 自动变成：1.1.1 国内研究现状（四号黑体左起）
```

编号全自动——你*永远不要*自己输入“第一章”“1.1”这些数字。
标题最多三级（`===`），规范不允许更深。

小节内还要分层时，用规范规定的序号体系手写（小标题用 `#minisection`）：

```typst
#minisection[1、机构动力学等效集中参数模型]   // 黑体小四独占一行

（1）#paratitle[建模假设]#h(1em)正文从这里继续……   // 段落标题加黑
```

#shot("guide-assets/example-3.png", 56%)

== 正文段落

直接打字就行。两个段落之间空一行；*每个自然段写成源文件里的一行*
（编辑器会自动软换行，不要按回车断行，否则断行处会出现多余空格）。
段首缩进两字符是自动的，不要敲空格。

== 插图

把图片文件（png / jpg / svg）放进 `figures/` 文件夹，然后：

```typst
检测线的工艺流程如@fig-flow 所示。     // ① 图的前文必须有“如图x.x”引用

#figure(
  image("figures/flow.png", width: 60%),  // ② width 控制图占版心的宽度
  caption: [检测线工艺流程图],            // ③ 图题，不写编号（自动生成）
) <fig-flow>                              // ④ 给图起个标签名，供 ① 引用
```

`@fig-flow` 会自动变成“图 2.1”这样的编号，图随章节移动编号自动更新。
注意规范要求：图内标注一律用中文；引用他人的图要在图题右上角标文献号
（图题里写 `caption: [某某结构图#super[\[3\]]]`）。

== 表格

规范要求三线表（顶线、栏目线、底线），照抄这个骨架改内容即可：

```typst
实验结果如@tab-result 所示。

#figure(
  table(
    columns: 4,                  // 列数
    stroke: none,
    table.hline(stroke: 1pt),    // 顶线
    [序号], [项目], [厂商], [型号],
    table.hline(stroke: 0.5pt),  // 栏目线
    [1], [CPU], [西门子], [CPU 1215C],
    [2], [触摸屏], [西门子], [TP1200],
    table.hline(stroke: 1pt),    // 底线
  ),
  caption: [硬件选型表],
) <tab-result>
```

表题自动出现在表的*上方*，表内文字自动为五号。
表内不要写“同上”“同左”，空白即代表无此项。

== 公式

行内小公式用一对 `$` 紧贴内容：`$F = mu m g$` → $F = mu m g$。
独立成行并自动编号的公式，`$` 和内容之间*留空格*，并加标签：

```typst
输送阻力按@eq-f 计算：

$ F = mu m g = 0.5 times 150 times 9.8 = 735 "N" $ <eq-f>
```

常用写法对照：

#table(columns: (1fr, 1fr, 1fr, 1fr),
  table.header([想要], [写法], [想要], [写法]),
  [上标 $x^2$], [`x^2`], [下标 $x_1$], [`x_1`],
  [分数 $F/m$], [`F/m`], [乘号 $times$], [`times`],
  [希腊字母 $mu, eta, Delta$], [`mu eta Delta`], [正负 $plus.minus$], [`plus.minus`],
  [单位（正体）], [`"N·m"`（加引号）], [约等于 $approx$], [`approx`],
)

#shot("guide-assets/example-4.png", 56%)

== 文献的引用与列表

正文引用处加上角标：

```typst
某某人对此作了研究#super[\[1\]]；数学模型见文献[2,5]。
```

文末列表每条以 `+` 开头，`[1][2]…` 自动编号：

```typst
#references[
  + 冯杰,武卫东.储能液冷热管理技术研究进展[J].制冷与空调,2024,24(11):1-11.
  + 张耀武.基于数字孪生的生产线调试及监测系统研究[D].大连交通大学,2024.
]
```

三条铁律：① *前引后列*——列表里每一条都必须在正文中被引用过；
② 按正文引用的先后顺序排列；③ 著录格式按 GB/T 7714—2015，
各类型示例（照着换内容）：

#table(columns: (auto, 1fr),
  table.header([类型], [著录格式示例]),
  [期刊 [J]], [作者.题名[J].期刊名,年,卷(期):页码.],
  [学位论文 [D]], [作者.题名[D].城市:大学名称,年.],
  [图书 [M]], [作者.书名[M].版本.出版地:出版社,年:页码.],
  [网页 [EB/OL]], [作者.题名[EB/OL].(发布日期)[引用日期].网址.],
  [外文期刊], [SMITH J, BROWN K, et al. Title[J]. Journal, 2023, 180: 105-118.],
)

作者 ≤3 人全列；超过 3 人列前三，中文加“等”、英文加“et al.”。
文献应以期刊、学位论文、网页资料为主，包含外文文献，
且至少 10% 是近 5 年发表的。

#shot("guide-assets/example-6.png", 56%)

== 附录与致谢

```typst
#show: appendix      // 此行之后的 = 标题自动编为“附录1 ×××”

= PLC 程序图

附录内容（自动变为 5 号字、固定 18 磅行距）……

#acknowledgements[
  这里写致谢正文……
]
```

没有附录就删掉 `#show: appendix` 到致谢之前的内容。
致谢标题“致#h(2em)谢”的空格是自动的。

= 哪些事模版替你管了，哪些要你自己负责

*模版自动保证*（你完全不用想）：纸张页边距、所有字体字号行距、段首缩进、
页眉页码及其起止范围、章节/图/表/公式编号及目录、标题居中与另起页、
图题表题位置与字体、参考文献悬挂缩进、附录与致谢的版式。

*你自己要保证*（机器替代不了的内容性要求）：

#table(columns: (auto, 1fr),
  table.header([项目], [规范要求]),
  [标题], [≤36 个汉字，避免生僻缩略语],
  [摘要], [300–800 字，不加注释评论，能独立成文],
  [关键词], [3–8 个，中英文个数一致，英文首字母大写],
  [图], [图前文字必须先出现“如图 x.x”；图内标注用中文；引用他人图标注文献号],
  [表], [表前文字必须先出现“如表 x.x”；不用“同上”“同左”],
  [文献], [前引后列、按引用顺序、含外文、≥10% 近 5 年、网页给出具体页面],
  [层次], [标题不超过三级；更深用 1、⑴、A、a 序号体系],
)

= 常见报错与坑 <sec-err>

#table(columns: (1fr, 1.4fr),
  table.header([现象 / 报错], [原因与解决]),
  [字体不对 / `unknown font family` 警告],
  [字体没找到：网页版检查 8 个字体文件是否全部上传（含 Times New Roman）；本机检查编译命令是否带 `--font-path ./fonts`],
  [`file not found (searched at ...)`],
  [图片路径或文件名打错了（注意大小写、扩展名），按报错里的路径核对],
  [`label <fig-xx> does not exist`],
  [`@fig-xx` 引用的标签没定义，或 `<fig-xx>` 忘了写、写错了名字],
  [标题没变成“第一章”样式],
  [等号后面少了空格：`=绪论` ✗ → `= 绪论` ✓],
  [写“1. 标题”整行消失或变成列表],
  [行首的 `1.` 是有序列表语法：改用顿号 `1、`，或转义 `1\.`],
  [段落中间莫名出现空格],
  [源文件里段落中途按了回车：一个自然段保持一行，靠编辑器自动换行],
  [公式里中文/单位变成斜体],
  [公式里的文字要加引号：`$25 "L/min"$`],
)

= 常见问题 <sec-faq>

*怎么交终稿？* 导出 PDF 即可（网页版 Export → PDF；本机编译产物就是 PDF）。

*查重 / AIGC 检测要 Word 版怎么办？* 检测平台多数支持直接上传 PDF 或
txt；如果必须 docx，两个办法任选其一（检测只看文字，格式无所谓，
终稿仍以 PDF 为准）：

*方法一（推荐，文字最干净）*：模版自带查重导出专用文件
`tjutthesis-pandoc.typ`，在电脑上装好 pandoc
（macOS：`brew install pandoc`；Windows：到 pandoc.org 下载安装包；
typst.app 用户先把项目下载到本地），然后在模版文件夹执行：

```bash
sed 's/"tjutthesis.typ"/"tjutthesis-pandoc.typ"/' main.typ > _export.typ
pandoc _export.typ -o 论文-查重版.docx && rm _export.typ
```

得到的 docx 正文、文献、表格俱全且没有页眉杂质。
注意它*不用于排版*——版式以 PDF 为准。

*方法二（零安装）*：用 Word 或 WPS 直接*打开导出的 PDF*，
自动转换后另存为 .docx。缺点是每页的页眉文字会混进正文，
对检测结果影响很小。

*摘要字数怎么数？* 把摘要文字粘贴到 Word 或任意在线字数统计工具里数。

*能多人协作 / 给导师看吗？* typst.app 项目可以生成分享链接；
导师批注建议直接批在导出的 PDF 上。

*图片用什么格式？* png、jpg、svg 都行。截图导出时尽量选高分辨率，
打印才清晰。

*写一半想本地、网页两边切换？* 可以。项目文件（main.typ + tjutthesis.typ +
fonts + figures）在哪边都是这一套，下载/上传即可迁移。

= 提交前自查清单

打印或对照下表逐项打勾：

#let chk = [☐]
#table(columns: (auto, 1fr),
  [#chk], [`grad-year` 已改成自己的届别（页眉里显示正确）],
  [#chk], [标题 ≤36 字；中英文标题一致],
  [#chk], [摘要 300–800 字；关键词 3–8 个且中英文个数相同、英文首字母大写],
  [#chk], [翻看目录页：条目、层级、页码无异常（自动生成，一般不会错）],
  [#chk], [每张图：前文有“如图 x.x”，图内标注是中文，图片清晰],
  [#chk], [每张表：前文有“如表 x.x”，三线表，无“同上/同左”],
  [#chk], [每个编号公式都在正文中被提及],
  [#chk], [参考文献：每条都被正文引用、顺序与引用先后一致、著录项齐全、含外文、≥10% 近五年],
  [#chk], [附录有名称；致谢已写],
  [#chk], [从头翻一遍导出的 PDF：无“?”样的悬空引用、无明显空页],
  [#chk], [前置件（封皮、声明、任务书等）已用教务处模板单独备齐],
)

#pagebreak()

= 附：一页语法速查卡

#v(0.5em)
#table(columns: (auto, 1fr),
  table.header([想要什么], [怎么写]),
  [章（第一章 ×××）], [`= 绪论`（等号后有空格）],
  [节（1.1）], [`== 研究背景与意义`],
  [小节（1.1.1，最多三级）], [`=== 国内研究现状`],
  [小节内小标题], [`#minisection[1、×××]`],
  [段落标题（加黑）], [`（1）#paratitle[建模假设]#h(1em)正文……`],
  [新段落], [空一行；一个自然段保持一行不按回车],
  [插图], [`#figure(image("figures/x.png", width: 60%), caption: [图题]) <fig-x>`],
  [三线表], [`#figure(table(columns: n, stroke: none, table.hline(stroke: 1pt), …), caption: [表题]) <tab-x>`],
  [行内公式], [`$F = mu m g$`（`$` 紧贴内容）],
  [编号公式], [`$ F = m a $ <eq-x>`（`$` 内留空格 + 标签）],
  [引用图/表/式], [`@fig-x` `@tab-x` `@eq-x` → 自动变“图 2.1 / 表 2.1 / 式 (2.1)”],
  [上标文献引用], [`#super[\[1\]]`],
  [参考文献列表], [`#references[` 每条一行以 `+` 开头 `]`],
  [附录], [`#show: appendix` 之后用 `= 附录名`],
  [致谢], [`#acknowledgements[……]`],
  [加粗 / 强调], [`*加粗*`；中文正文一般不用斜体],
  [特殊符号], [`℃` `±` `×` 直接打；公式里用 `times` `plus.minus`],
)

#v(0.5em)
#align(center, text(fill: luma(110), size: 9.5pt)[
  字体·字号·行距·缩进·编号·页眉·页码均由模版自动处理，正文中无需任何格式设置。\
  编译：网页版自动；本机 `typst watch --font-path ./fonts main.typ`
])
