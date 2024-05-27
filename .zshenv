. "$HOME/.cargo/env"


# System-specific configurations
case "$(uname)" in
  Darwin)
    # macOS specific settings
    export PATH="/Users/hitomi/.local/bin:$PATH"
    export PATH="/usr/local/bin:$PATH"
   
    # flutter
    export PATH="$PATH:/home/hitomi/Developer/flutter/bin"
    
    # pnpm
    export PNPM_HOME="/Users/hitomi/Library/pnpm"
    
    export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    ;;
  Linux)
    # Linux specific settings
    export PATH="/usr/bin:$PATH"
    
    # pnpm
    export PNPM_HOME="/home/hitomi/.local/share/pnpm"
    
    # flutter
    export PATH="$HOME/Developer/opensource/flutter/bin:$PATH"

    # poetry
    export PATH="/home/hitomi/.local/bin:$PATH"

    # gobin
    export PATH="/home/hitomi/go/bin/:$PATH"

    # fly.io
    export FLYCTL_INSTALL="/home/hitomi/.fly"
    export PATH="$FLYCTL_INSTALL/bin:$PATH"

    export PATH="/home/hitomi/.shorebird/bin:$PATH"
    
    ;;
esac

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# pnpm
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun end
