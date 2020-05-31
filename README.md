# Dotfiles  

## Contents  
1. vimrc (vimtex is incomplete)
2. zshrc files
	* zshrc
	* aliases.sh
	* zsh\_scripts.sh
3. tmux.conf files (currently incomplete)
	* tmux.conf
	* tmux-status.conf  

## Vimrc  
### General Configurations 
	* Indentation set to 2 spaces
	* Colour column at 80 chars for each line
	* Allows usage of the mouse  

### General Remaps
	* Esc mapped to jj in insert mode
	* Esc mapped to <Return> in visual mode
	* Shift+k (K) to turn off search highlights
	* Both j and k mapped to gj and gk for navigating line wraps, but commands
	like 5j and 5k remain the same (does not count line wraps)
	* % mapped to <Tab>
	* Leader mapped to <Space>

### Leader Remaps
	* <Leader> k to toggle colour column
	* <Leader> y for yanking to Mac's clipboard
	* <Leader> d for deleting and yanking to Mac's clipboard
	* <Leader> p for pasting from Mac's clipboard  

### Plugin-specific Remaps  
	* + used for toggling between comments and code
	* <Leader> f to toggle nerdtree (files in current directory)  

### Some Other Plugin Explanations
	* Quickscope underlines first or second occurrences of characters when
	f, F, t, or T are pressed
	* Ale is for syntax checking in Vim  

Please note that vimtex configurations are not complete and will be updated
at a later date.

## Zshrc (oh-my-zsh)
### Features
	* command-line autosuggestions  
	* z plugin used to directly jump to recently used directories 
	* extract command used to extract various compressed files
	* git aliases
	* cd + ls functions for navigating
	* functions for compiling and executing c and c++ files

## Tmux   
Currently contains basic remappings. tmux.conf will be updated again in the future. 
