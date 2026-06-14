# 字体获取说明（请手动放入本目录）

> ⚠️ **本目录不含字体文件**。中易字体（宋/黑/楷/仿宋）与 Times New Roman 是
> 随 Windows / macOS 授权分发的**版权字体**，不能公开再分发，因此未包含在本
> 仓库中（已被 `.gitignore` 排除）。请按下面的步骤，从你**拥有合法授权**的
> 设备自行获取后放入本目录。

## 一、需要哪些文件（共 8 个）

| 文件名 | 字体 | 来源 |
|---|---|---|
| `simsun.ttf` | 宋体 SimSun | Windows `C:\Windows\Fonts`（见下方“拆分”说明） |
| `simhei.ttf` | 黑体 SimHei | Windows `C:\Windows\Fonts\simhei.ttf` |
| `simkai.ttf` | 楷体 KaiTi | Windows `C:\Windows\Fonts\simkai.ttf` |
| `simfang.ttf` | 仿宋 FangSong | Windows `C:\Windows\Fonts\simfang.ttf` |
| `Times New Roman.ttf` | Times New Roman 常规 | macOS `/System/Library/Fonts/Supplemental/` 或 Windows |
| `Times New Roman Bold.ttf` | 粗体 | 同上 |
| `Times New Roman Italic.ttf` | 斜体 | 同上 |
| `Times New Roman Bold Italic.ttf` | 粗斜体 | 同上 |

> **宋体须是 `.ttf` 而非 `.ttc`**：Windows 自带的是 `simsun.ttc`（字体集合），
> typst.app 网页版的上传器不接受 `.ttc`。请用工具把其中的 SimSun 提取为
> `simsun.ttf`（例如 Python：`from fontTools.ttLib import TTCollection;
> TTCollection("simsun.ttc").fonts[0].save("simsun.ttf")`）。本地命令行版
> Typst 可直接用 `.ttc`，但为与网页版一致，建议统一用 `simsun.ttf`。

## 二、放好之后怎么用

### 本地命令行
```bash
typst compile --font-path ./fonts main.typ      # 编译
typst watch   --font-path ./fonts main.typ      # 实时预览
```
`--font-path ./fonts` 不能省略，否则字体不对或报 `unknown font family`。

### typst.app 网页版
把本目录的**全部 8 个字体文件**上传到项目中（位置不限，会被自动识别）。
缺文件会导致字体不符或编译警告。

## 三、版权声明

中易字体（SimSun/SimHei/KaiTi/FangSong）版权归**北京中易/微软**所有，
Times New Roman 版权归**Monotype**所有，均随系统授权分发。请仅在你拥有
合法授权的设备上使用，**切勿公开传播**字体文件本身。本模版只提供获取与
使用方法，不分发字体。
