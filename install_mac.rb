require 'open3'

def run
  init
  install_homebrew
  install_dependencies
  set_zsh_default
  install_oh_my_zsh
  link_dotfiles
  success
end

def init
  @time_start = Time.now
  @dotfiles_path = File.absolute_path(__dir__)
  @home_path = ENV['HOME']
  @xdg_config_path = ENV['XDG_CONFIG_PATH'] || File.join(@home_path, '.config')
end

def install_homebrew
  log "Installing Homebrew..."
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

def set_zsh_default
  zsh_path = shell('which zsh')[:stdout]
  log "Setting #{zsh_path} to default shell..."
  if shell("cat /etc/shells | grep #{zsh_path}")[:success?]
    log "#{zsh_path} is already default shell. Skipping..."
  else
    shell("sudo sh -c \"echo #{zsh_path} >> /etc/shells\"")
    shell("chsh -s #{zsh_path}")
    log "Successfully set #{zsh_path} as default shell."
  end
end

def install_oh_my_zsh
  log "Installing oh-my-zsh..."
  if shell("test -e #{home_path('.oh-my-zsh')}")[:success?]
    log "oh-my-zsh already exists. Skipping..."
  else
    if shell('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
      log "Successfully installed oh-my-zsh."
    else
      log "There was a problem installing oh-my-zsh."
      exit 1
    end
  end
end

def link_dotfiles
  log "Linking dotfiles..."
  dotfiles.each do |dotfile|
    link_from = dotfile[:link_from]
    link_to = dotfile[:link_to]
    log "Linking #{link_from} to #{link_to}..."
    mkdir(dirname(link_to))
    rimraf(link_to)
    if link(link_from, link_to)
      log "Successfully linked #{link_from} to #{link_to}."
    else
      log "There was a problem linking #{link_from} to #{link_to}."
      exit 1
    end
  end
end

def success
  @time_end = Time.now
  log "Done! Took #{@time_end - @time_start}s."
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

def mkdir(path)
  shell("mkdir -p #{path}")
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

def dirname(path)
  File.dirname(path)
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
