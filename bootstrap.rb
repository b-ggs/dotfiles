require 'yaml'

@dotfiles = YAML.load_file('dotfiles.yml')
@pwd = `pwd`.chomp

def symlink(original, target)
  %x[rm -rf #{target}]
  puts "Linking #{original} to #{target}."
  %x[ln -sf #{@pwd}/#{original} #{target}]
end

def init_install_path(path)
  %x[mkdir -p #{path}]
end

def link_dotfile(dotfile)
  install_path = dotfile['install_path']
  paths = dotfile['paths']
  init_install_path(install_path)
  paths.each do |path|
    target_path = "#{install_path}/#{path['target']}"
    symlink(path['original'], target_path)
  end
end

def for_this_platform(dotfile_platforms)
  dotfile_platforms.find { |p| RUBY_PLATFORM =~ /#{p}/ }
end

def message(message, index)
  puts "(#{index + 1} of #{@dotfiles.length}) #{message}"
end 

@dotfiles.each_with_index do |dotfile, index|
  name = dotfile['name']
  unless for_this_platform dotfile['platforms']
    message "Skipping #{name}.", index
    next
  end
  resp = nil
  while resp.nil?
    message "Symlink #{name}? (Y/n) ", index
    resp = gets.chomp
    if resp == 'y' || resp == ''
      link_dotfile dotfile
    elsif resp == 'n'
      puts "Skipping #{name}."
    else
      puts 'Invalid input.'
      resp = nil
    end
  end
end
