#!/usr/bin/env fish
# 这是关于 fcitx5 的配置文件

# 关于 Xim 的环境变量配置
set -gx XMODIFIERS '@im=fcitx'

# 关于 GTK 输入法模块
set -gx GTK_IM_MODULE 'fcitx'

# 关于 Qt 输入法模块
set -gx QT4_IM_MODULE 'fcitx'
set -gx QT_IM_MODULE 'fcitx'

# 系统语系设置
# 极少使用，一般只用于 emacs 或者 java
