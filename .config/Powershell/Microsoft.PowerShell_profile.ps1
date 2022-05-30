
#alias
$workspace = 'C:\workspace'
$desktop = [System.Environment]::GetFolderPath("Desktop")
$user = [System.Environment]::GetFolderPath("UserProfile")
$dotfiles = $user + "/dotfiles"
$nvim = $user + "/dotfiles/.config/nvim"
$wezterm = $user + '/.config/wezterm'

Set-Alias o Invoke-Item
Set-Alias poweroff! Stop-Computer -Force
Set-Alias poweroff Stop-Computer
Set-Alias reboot! Restart-Computer
Set-Alias reboot Restart-Computer -Force

#ロケーション
Set-Location $workspace

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

function prompt {
$isRoot = (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
$marker = if ($isRoot) {"[root]$"}   else {"$"}

Write-Host "$env:USERNAME " -ForegroundColor White -NoNewline
  Write-Host "$pwd " -ForegroundColor Green -NoNewline
  Write-Host $marker -ForegroundColor Yellow -NoNewline
  return " "
}

Set-PSReadLineOption -EditMode Emacs -BellStyle None
Set-PSReadLineKeyHandler -Key Ctrl+i -Function Complete
Set-PSReadLineKeyHandler -Key Ctrl+j -Function AcceptLine
Set-PSReadLineKeyHandler -Key Ctrl+p -Function Paste
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteChar
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
# Set-PSReadLineOption -PredictionSource History

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
