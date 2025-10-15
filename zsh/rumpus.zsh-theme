# Rumpus - A 1970s-inspired zsh theme
# Based on authentic mid-century modern furniture colors
# URL: https://github.com/715d/rumpus

# Enable prompt substitution.
setopt prompt_subst

# Autoload zsh colors module if not already loaded.
autoload -U colors && colors

# Define color codes for easier reference.
# Using %F{color} for foreground and %K{color} for background.
# Colors are specified using hex values with # prefix.

# Primary Rumpus colors.
RUMPUS_WALNUT="#2A1810"
RUMPUS_TAN="#F4DDB3"
RUMPUS_HARVEST_GOLD="#E9A131"
RUMPUS_BURNT_ORANGE="#F67422"
RUMPUS_AVOCADO_GREEN="#79966d"
RUMPUS_SLATE_BLUE="#5B7C99"
RUMPUS_MUSTARD_YELLOW="#D3BE47"
RUMPUS_RUST_RED="#E84A38"
RUMPUS_LIGHT_BROWN="#84563B"
RUMPUS_CHOCOLATE_BROWN="#5F3822"

# Git prompt information.
# Shows current branch and dirty state.
function git_prompt_info() {
  local ref
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo " %F{$RUMPUS_SLATE_BLUE}[%F{$RUMPUS_AVOCADO_GREEN}${ref#refs/heads/}$(parse_git_dirty)%F{$RUMPUS_SLATE_BLUE}]%f"
}

# Shows an asterisk if the working directory is dirty.
function parse_git_dirty() {
  local STATUS
  STATUS=$(git status --porcelain 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]; then
    echo "%F{$RUMPUS_RUST_RED}*%f"
  fi
}

# Return code indicator - shows red X if last command failed.
function return_code() {
  echo "%(?..%F{$RUMPUS_RUST_RED}✗%f )"
}

# Configure LS_COLORS for colorized ls output.
# Uses 256-color codes and bold/underline attributes.
# Format: filetype=attribute;color
export LS_COLORS="\
di=1;38;2;233;161;49:\
fi=0;38;2;244;221;179:\
ln=0;38;2;91;124;153:\
pi=0;38;2;211;190;71:\
so=0;38;2;211;190;71:\
bd=1;38;2;246;116;34:\
cd=1;38;2;246;116;34:\
or=1;38;2;232;74;56:\
ex=1;38;2;121;150;109:\
*.tar=0;38;2;232;74;56:\
*.tgz=0;38;2;232;74;56:\
*.zip=0;38;2;232;74;56:\
*.z=0;38;2;232;74;56:\
*.gz=0;38;2;232;74;56:\
*.bz2=0;38;2;232;74;56:\
*.jpg=0;38;2;211;190;71:\
*.jpeg=0;38;2;211;190;71:\
*.png=0;38;2;211;190;71:\
*.gif=0;38;2;211;190;71:\
*.bmp=0;38;2;211;190;71:\
*.svg=0;38;2;211;190;71:\
*.mp3=0;38;2;91;124;153:\
*.mp4=0;38;2;91;124;153:\
*.avi=0;38;2;91;124;153:\
*.mov=0;38;2;91;124;153:\
*.pdf=0;38;2;246;116;34:\
*.doc=0;38;2;246;116;34:\
*.docx=0;38;2;246;116;34:\
*.md=0;38;2;121;150;109:\
*.txt=0;38;2;244;221;179:\
*.sh=1;38;2;121;150;109:\
*.py=1;38;2;121;150;109:\
*.js=1;38;2;121;150;109:\
*.json=0;38;2;211;190;71:\
*.xml=0;38;2;211;190;71:\
*.yaml=0;38;2;211;190;71:\
*.yml=0;38;2;211;190;71:\
*.toml=0;38;2;211;190;71:\
*.conf=0;38;2;246;116;34:\
*.log=0;38;2;132;86;59"

# Enable colorized ls output on macOS and Linux.
if [[ "$OSTYPE" == darwin* ]]; then
  # macOS uses LSCOLORS instead of LS_COLORS.
  # LSCOLORS format: 11 pairs of letters for foreground/background.
  # Letters map: a=black, b=red, c=green, d=brown, e=blue, f=magenta, g=cyan, h=light grey, x=default.
  # Approximating Rumpus colors with available LSCOLORS options.
  export LSCOLORS="dxfxcxdxbxegedabagacad"
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

# Define the prompt.
# Structure: [return_code] user@host:directory [git_info]
# prompt_char (%) on new line.
PROMPT='$(return_code)%F{$RUMPUS_BURNT_ORANGE}%n%f%F{$RUMPUS_TAN}@%f%F{$RUMPUS_HARVEST_GOLD}%m%f%F{$RUMPUS_TAN}:%f%F{$RUMPUS_AVOCADO_GREEN}%~%f$(git_prompt_info)
%F{$RUMPUS_HARVEST_GOLD}%#%f '

# Right prompt shows current time.
RPROMPT='%F{$RUMPUS_LIGHT_BROWN}[%*]%f'
