$env.path ++= ["/usr/local/bin", "/opt/homebrew/bin/", "/home/justinprime/go/bin/", "/usr/local/go/bin"]

$env.config.buffer_editor = "nvim"
$env.config.show_banner = false

alias z = zoxide
alias ll = ls -lah

# source ~/.oh-my-posh.nu
source ~/github/smooth-box/.config/nushell/.zoxide.nu
