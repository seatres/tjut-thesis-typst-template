// ============================================================
// tjutthesis-pandoc.typ —— 查重/AIGC 检测导出专用的简化模版
//
// 仅供 pandoc 把论文转成 docx 时使用（pandoc 的 Typst 解释器
// 不支持正式模版里的高级语法）。本文件提供同名函数的纯内容版本：
// 只保留文字和结构，不做排版——查重和 AIGC 检测只看文字。
//
// 用法（终端，需安装 pandoc）：
//   sed 's/"tjutthesis.typ"/"tjutthesis-pandoc.typ"/' main.typ > _export.typ
//   pandoc _export.typ -o 论文-查重版.docx && rm _export.typ
//
// 正式排版、终稿 PDF 仍用 tjutthesis.typ，与本文件无关。
//
// Copyright (c) 2026 seatres (https://github.com/seatres)
// 依据 LaTeX Project Public License 1.3c（或更新版本）发布；许可全文见 LICENSE。
// ============================================================

#let tjut-thesis(grad-year: "", doc) = doc

#let cn-abstract(title: "", subtitle: none, keywords: (), body) = {
  heading(level: 1, outlined: false, numbering: none, title)
  if subtitle != none { heading(level: 2, outlined: false, numbering: none, subtitle) }
  heading(level: 2, outlined: false, numbering: none, [摘要])
  body
  par[关键词：#keywords.join("；")]
}

#let en-abstract(title: "", subtitle: none, keywords: (), body) = {
  heading(level: 1, outlined: false, numbering: none, title)
  if subtitle != none { heading(level: 2, outlined: false, numbering: none, subtitle) }
  heading(level: 2, outlined: false, numbering: none, [ABSTRACT])
  body
  par[Key Words: #keywords.join("; ")]
}

#let toc() = none   // 查重版不需要目录

#let mainmatter(grad-year: "", doc) = doc

#let minisection(body) = par(strong(body))

#let paratitle(body) = strong(body)

#let references(body) = {
  heading(level: 1, numbering: none, [参考文献])
  body
}

#let appendix(numbered: true, doc) = doc

#let acknowledgements(body) = {
  heading(level: 1, numbering: none, [致谢])
  body
}
