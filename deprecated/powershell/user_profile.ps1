# oh-my-posh theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/velvet.omp.json" | Invoke-Expression

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# import module
# Install-Module -Name Terminal-Icons
Import-Module -Name Terminal-Icons

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Environmental variables
# nvim xdg path. :h xdg
Set-Content -Path env:XDG_CONFIG_HOME -Value "$env:USERPROFILE\.config"
Set-Content -Path env:XDG_DATA_HOME -Value "$env:USERPROFILE\.local\share"
