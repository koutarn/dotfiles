$USER = $env:USERPROFILE
$DOTFILES = $USER + "\dotfiles"

# セキュリティポリシーの変更
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

function canUse($command){
    if (Get-Command * | Where-Object { $_.Name -match $command }) {
        return $true
    }
    return $false
}

# scoopのインストール
try {
  Get-Command -Name scoop -ErrorAction Stop
}
catch [System.Management.Automation.CommandNotFoundException] {
  Invoke-Expression (new-object net.webclient).downloadstring("https://get.scoop.sh")
}

$UTILS = @(
    "sudo"
    "aria2"
    "7zip"
    "dark"
    "lessmsi"
    "git"
    "gzip"
    "openssl"
    "tar"
)

$PROGRAMMING_ENV = @(
    "deno"
    "go"
    "nodejs"
    "python"
    "lua"
)

$TOOLS = @(
    "cacert"
    "sourcetree"
    "fzf"
    "gh"
    "ghq"
    "llvm"
    "mingw"
    "neovim-nightly"
    "posh-git"
    "scoop-completion"
    "slack"
    "terminal-icons"
    "ueli"
    "vscode"
    "wezterm"
    "wget"
    "broot"
    "pastel"
    "powershell"
    "winmerge-jp"
    "less"
    "source-han-code-jp"
    "psfzf"
    "jp-util-font"
)


# scoopが使用出来るなら実行
if(canUse("scoop")){
    scoop install $UTILS
    scoop bucket add extras
    scoop bucket add versions
    scoop bucket add dorado https://github.com/chawyehsu/dorado
    scoop bucket add jp https://github.com/dooteeen/scoop-for-jp
    scoop update *
    scoop install $PROGRAMMING_ENV
    scoop install $TOOLS
}

$GHPACKAGES = @(
    "kawarimidoll/gh-q"
)

# gh
if(canUse("gh")){
    gh extension install $GHPACKAGES
}

$NPMPACKAGES = @(
    "yarn"
    "npm-check-updates"
    "neovim"
)

# nodejs
if (canUse("nodejs")){
    npm install -g $NPMPACKAGES
}

#後からglobal configを使うだろうけど一旦設定
if(canUse("git")){
    #SSH認証を必ず有効にする
    git config --global url.git@github.com:.insteadOf https://github.com/

    #workspaceの設定
    git config --global ghq.root '~/workspace/src'
}
