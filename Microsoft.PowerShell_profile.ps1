#ロケーション
Set-Location C:

#alias
$desktop = [System.Environment]::GetFolderPath("Desktop")
$user = [System.Environment]::GetFolderPath("UserProfile")
$dotfiles = $user + "\dotfiles"
Set-Alias o Invoke-Item

function edit{nvim $profile}
function .. {cd ../}
function e {explorer .}
function pwdc() {Set-Clipboard "$pwd"}

$PSReadlineOptions = @{
    #ビープ音の無効化
    BellStyle = "None"

    #キーバインドをEmacs風にする
    EditMode = "Emacs"

    #重複した履歴を保存しない
    HistoryNoDuplicates = $true
}

Set-PSReadlineOption @PSReadlineOptions

#補完
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

function prompt {
$isRoot = (([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
$marker = if ($isRoot) {"[root]$"}   else {"$"}

Write-Host "$env:USERNAME " -ForegroundColor White -NoNewline
  Write-Host "$pwd " -ForegroundColor Green -NoNewline
  Write-Host $marker -ForegroundColor Yellow -NoNewline
  return " "
}
