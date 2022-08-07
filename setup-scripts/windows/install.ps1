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
    "ripgrep"
    "rga"
    "starship"
    "bat"
    "fd"
    "delta"
    "zoxide"
    "lsd"
    "csview"
    "broot"
    "tokei"
    "pastel"
    "gitui"
    "sd"
    "tealdeer"
    "powershell"
    "nkf"
    "winmerge-jp"
    "less"
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

# go
$GOPACKAGES = @(
  "golang.org/x/tools/cmd/goimports@latest"
  "golang.org/x/tools/cmd/godoc@latest"
  "github.com/rhysd/dotfiles@latest"
  "github.com/sheepla/qiitaz@latest"
  "github.com/sheepla/fzwiki@latest"
)

if (canUse("go")){
    foreach ($GOPACKAGE in $GOPACKAGES) {
        go install $GOPACKAGE
    }
}

#後からglobal configを使うだろうけど一旦設定
if(canUse("git")){
    #SSH認証を必ず有効にする
    git config --global url.git@github.com:.insteadOf https://github.com/

    #workspaceの設定
    git config --global ghq.root '~/workspace/src'
}
