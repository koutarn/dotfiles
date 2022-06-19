$target_home = $env:USERPROFILE
$dotfiles = Split-Path -Parent $(Split-Path -Parent $PSScriptRoot)

$dot_config = "\.config"
$dot_home = "\.home"
$dot_other = "\.other"

$DIRECTORYS = @(
    $dot_home + "\ideavim"
    $dot_config + "\nvim"
    $dot_home + "\Powershell"
    $dot_config + "\starship\starship.toml"
    $dot_config + "\wezterm"
)

#フォルダがなければ作成する
function createDirectoryIfDoseNotExist($path){
    if (Test-Path $path -PathType Container) {
        mkdir -Verbose $path
    }
}

#configファイルの作成
createDirectoryIfDoseNotExist($home_config)

# New-Item -Force -ItemType SymbolicLink -Value $dotfiles + $DIRECTORYS -Path $target_home + $DIRECTORYS
