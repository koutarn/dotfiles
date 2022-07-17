#-------------------------
#env
#-------------------------
$desktop = [System.Environment]::GetFolderPath("Desktop")
$user = [System.Environment]::GetFolderPath("UserProfile")
$nvim = $user + "/dotfiles/.config/nvim"
$wezterm = $user + '/.config/wezterm'
$EDITOR = "nvim"

#-------------------------
#alas
#-------------------------
Set-Alias o Invoke-Item
Set-Alias poweroff! Stop-Computer -Force
Set-Alias poweroff Stop-Computer
Set-Alias restart! Restart-Computer
Set-Alias restart Restart-Computer -Force
Set-Alias br broot
Set-Alias ls lsd

#-------------------------
#function
#-------------------------
function edit{nvim $profile}
function .. {cd ../}
function ... {cd ../../}
function e {explorer .}
function pwdc() {Set-Clipboard "$pwd"}

function qz($arg,$mode="created",$page=4) {
    qiitaz -n $page -p -s $mode $arg
}

function wiki($arg){
    fzwiki -l ja -o $arg
}

function q {
    $select = $(ghq list | fzf)
    cd $($(ghq root) + "/" + $select)
}

#-------------------------
# PSReadLine Option
#-------------------------
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadlineOption -HistoryNoDuplicates
Set-PSReadLineKeyHandler -Key Ctrl+i -Function Complete
Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptLine
Set-PSReadLineKeyHandler -Key Ctrl+p -Function Paste
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar
Set-PSReadLineKeyHandler -Key Ctrl+o -Function ForwardWord
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineOption -Colors @{
    InlinePrediction = "#363636"
}

# PowerShell Core7でもConsoleのデフォルトエンコーディングはsjisなので必要
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# git logなどのマルチバイト文字を表示させるため (絵文字含む)
$env:LESSCHARSET = "utf-8"

# startshipを有効化
Invoke-Expression (&starship init powershell)

#scoopの補完
Import-Module "$($(Get-Item $(Get-Command scoop.ps1).Path).Directory.Parent.FullName)\modules\scoop-completion"

# ghコマンドの補完
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

# posh git
Import-Module posh-git

#zoxide
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

#PSFzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'
