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
    "git"
    "aria2"
    "7zip"
)

$PROGRAMMING_ENV = @(
    "nodejs"
    "deno"
    "go"
    "python"
)

$TOOLS = @(
    "fzf"
    "gh"
    "ghq"
    "llvm"
    "mingw"
    "bat"
    "fd"
    "neovim-nightly"
    "posh-git"
    "ripgrep"
    "scoop-completion"
    "slack"
    "starship"
    "ueli"
    "vscode"
    "wezterm"
    "wget"
)

# scoopが使用出来るなら実行
if(canUse("scoop")){
    scoop install $UTILS
    scoop bucket add extras
    scoop bucket add versions
    scoop update *
    scoop install $PROGRAMMING_ENV
    scoop install $TOOLS
}

if(canUse("git")){
    #CRLFに変換しない
    git config --global core.autoCRLF false

    # SSH認証を必ず有効にする
    git config --global url.git@github.com:.insteadOf https://github.com/
}

#dotfilesを配置する
if (Test-Path ("$DOTFILES")) {
  # Set-Location $DOTFILES
  # git pull
} else {
  # git clone https://github.com/koutarn/dotfiles.git $DOTFILES
}

# gh
if(canUse("gh")){
    gh extension install kawarimidoll/gh-q
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
)

foreach ($GOPACKAGE in $GOPACKAGES) {
  go install $GOPACKAGE
}

