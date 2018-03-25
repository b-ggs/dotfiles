require 'open3'

def run
  init
  install_homebrew
  install_dependencies
  link_dotfiles
end

def init
  @dotfiles_path = File.absolute_path(__dir__)
  @home_path = ENV['HOME']
  @xdg_config_path = ENV['XDG_CONFIG_PATH'] || File.join(@home_path, '.config')
end

def install_homebrew
  log "Installing Homebrew.."
  if type('brew')[:success?]
    log 'Homebrew already exists. Skipping...'
  else
    log 'Installing Homebrew...'
    if shell('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')[:success?]
      log 'Successfully installed Homebrew.'
    else
      log 'There was a problem installing Homebrew.'
      exit 1
    end
  end
end

def install_dependencies
  log "Installing dependencies..."
  dependencies.each do |dependency|
    log "Installing #{dependency}..."
    if shell("brew list #{dependency}")[:success?]
      log "#{dependency} already exists. Skipping..."
    else
      if shell("brew install #{dependency}")
        log "Successfully installed #{dependency}."
      else
        log "There was a problem installing #{dependency}."
        exit 1
      end
    end
  end
end

def link_dotfiles
  log "Linking dotfiles..."
  dotfiles.each do |dotfile|
    link_from = dotfile[:link_from]
    link_to = dotfile[:link_to]
    log "Linking #{link_from} to #{link_to}..."
    rimraf(link_to)
    if link(link_from, link_to)
      log "Successfully linked #{link_from} to #{link_to}."
    else
      log "There was a problem linking #{link_from} to #{link_to}."
      exit 1
    end
  end
end

def dependencies
  %w(git nvim vim zsh tmux gpg fzf the_silver_searcher)
end

def dotfiles
  [
    {
      link_from: dotfiles_path('neovim/init.vim'),
      link_to: xdg_config_path('nvim/init.vim')
    },
    {
      link_from: dotfiles_path('tmux/tmux.conf'),
      link_to: home_path('.tmux.conf')
    },
    {
      link_from: dotfiles_path('tmux/themes'),
      link_to: home_path('.tmux-themes')
    },
    {
      link_from: dotfiles_path('tmuxinator'),
      link_to: home_path('.tmuxinator')
    },
    {
      link_from: dotfiles_path('zsh/zshrc'),
      link_to: home_path('.zshrc')
    },
    {
      link_from: dotfiles_path('zsh/themes'),
      link_to: home_path('.oh-my-zsh/custom/themes')
    },
    {
      link_from: dotfiles_path('slate/slate.js'),
      link_to: home_path('.slate.js')
    },
    {
      link_from: dotfiles_path('uebersicht'),
      link_to: home_path('.uebersicht')
    },
    {
      link_from: dotfiles_path('iterm2'),
      link_to: home_path('.iterm2')
    }
  ]
end

# Helper methods

def rimraf(path)
  shell("rm -rf #{path}")
end

def link(from, to)
  shell("ln -sf #{from} #{to}")
end

def type(arg)
  shell("type #{arg}")
end

def shell(command)
  # log "Running #{command}..."
  stdout, stderr, status = Open3.capture3(command)
  status = status.exitstatus
  {
    stdout: stdout.chomp,
    stderr: stderr.chomp,
    status: status,
    success?: status.zero?
  }
end

def dotfiles_path(path)
  File.join(@dotfiles_path, path)
end

def home_path(path)
  File.join(@home_path, path)
end

def xdg_config_path(path)
  File.join(@xdg_config_path, path)
end

def log(message)
  time = Time.now.to_s
  output = "[#{time}] - #{message}"
  puts output
end

run
