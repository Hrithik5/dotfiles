# ⚙️ Hrithik's Dotfiles

A modern, minimal, and modular set of dotfiles for **macOS** crafted for productivity, DevOps, and a clean terminal aesthetic.  
Built with love for tools like **Zsh**, **Starship**, **Tmux**, **Neovim**, **fzf**, **Docker**, **Kubernetes**, and more.

> 🔗 GitHub: [https://github.com/Hrithik5/dotfiles](https://github.com/Hrithik5/dotfiles)

---

## 📦 Features

✅ Minimal `starship` prompt with icons and DevOps-friendly info  
✅ Smart `fzf-tab` completions (with previews) for commands, `cd`, history, etc.  
✅ Fast `tmux` session management with `tss`  
✅ Modular `.zshrc` for easy config and navigation  
✅ Aliases for Git, Docker, Kubernetes, Terraform, and more  
✅ Configured with `stow` for easy symlink management  
✅ Pre-configured with tools like `eza`, `bat`, `zoxide`, and `fzf`

---

## 🚀 How to Use This Dotfiles Repo

You can use this repo for your own system setup by following these steps:

1. ⚙️ Installation Steps [Prerequisites]
    ```bash
    brew install stow starship zoxide fzf bat eza tmux \
      kubectl awscli terraform gh \
      zsh-autosuggestions zsh-syntax-highlighting
    ```

2. Additional Step for better [Tab-completion preview when using commands like cd, git]
    ```bash
    git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

3. Fork or the repo:
   ```bash
   git clone https://github.com/Hrithik5/dotfiles.git ~/dotfiles
   cd ~/dotfiles

4. Symlink all the configs
    ```bash
    stow . 

## 🛠 Dotfiles Customization

Want to tweak something?

1. .zshrc is cleanly organized by category (plugins, aliases, UI, completions)
2. You can add your own scripts to ~/dotfiles/scripts and source them
3. Modify Starship appearance via .config/starship.toml
4. Add/remove modules from stow as needed

## 📄 License

MIT License. Use it freely, customize it, and improve your terminal life 💻

“Dotfiles are meant to be personal — make them yours.”
