#Requires AutoHotkey v2.0

; git alias

; [P]push, pull
::gp::git push ; 推送
::gpom::git push origin master ; 推送到origin
::gpr::git pull --rebase --autostash ; 变基拉取
::gpp::git pull --rebase --autostash && git push ; 同步
; [R]rebase, reset
::gr::git rebase ; 变基
::gra::git rebase --abort ; 结束变基
::grc::git rebase --continue ; 继续变基
::grhh::git reset HEAD --hard ; 重置所有内容
; [S]state
::gst::git status -sb ; 状态
; [L]log
::gl::git log ; 日志
::glo::git log --pretty=format:"%h - %an, %ar : %s" ; 日志单行
::glg::git log --pretty=format:"%h - %an, %ar : %s" --graph ; 日志图
; [C]commit, config, checkout
::gci::git commit ; 提交
::gcia::git commit --amend --no-edit ; 修改提交
::gcp::git cherry-pick ; 摘取
::gcfg::git config ; 本地配置
::gco::git checkout ; 分支切换，文件检出
; [B]branch
::gbr::git branch ; 分支