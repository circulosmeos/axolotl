axolotl
=======

Minimum and efficient documentation system.   
See [Description](https://github.com/circulosmeos/axolotl/).

Installation
============

Choose intructions for linux or for Windows and **after that**, please, edit *.vim/syntax/axolotl.vim* file to change the string "**YOUR_NAME_HERE**" for your name or initials, as preferred.

### Installation in linux

Here are the configuration files for keybindings (**Alt+1** to **Alt+9**) and color highlighting for text files edited with [vim](https://www.editplus.com/). *Note: tested with vim >= v8.0*.   
Make a backup first if you wish!: some files may be overwritten.

Copy these files to the *~user* directory:    

* *.vimrc* - If your're using Windows, copy *.vimrc.WINDOWS* file and rename it *.vimrc*
* *.vim/scripts.vim* - this file contains the rules to detect an axolotl file
* *.vim/syntax/axolotl.vim* - this file contains the key bindings for axolotl: Alt+1 to Alt+9.

### Installation in Windows

In Windows *vim* can be used installed with pacman (*pacman -S vim*) after [MSYS2](https://msys2.github.io/) has been installed.

vim's msys2 *user directory*:   
	**%PROGRAMFILES%\\msys64\\home\\USERNAME\\**

Other packages may use:
	**%USERPROFILE%\\.vim\\**

Copy these files to the *user directory*:    

* *.vimrc.WINDOWS*  **and rename it as** *.vimrc* 
* *.vim\\scripts.vim*
* *.vim\\syntax\\axolotl.vim*

Start vim and open or create some text file:   
now you can check your Alt+ 1 to 9 new key bindings and highlights.

Notes on syntax
===============

In order to be able to use "ajolote" as synonym for "axolotl" when manually indicating a syntax:

     :set syntax=ajolote

A symbolic link can be made (in both linux and Windows) from *axolotl.vim* to *ajolote.vim*:

	 $ ln -s axolotl.vim ajolote.vim

	 ADMIN> mklink ajolote.vim axolotl.vim

or just make a copy of *axolotl.vim*

Notes on file type detection
============================

Please, note that in order for a file to be detected as *axolotl* its first line must be either:

* an axolotl key word (may be followed by more keywords): *[[some keyword]]* ...

or   

* the big (magenta) line separator (*79i-<ESC>*), which keybinding is *Alt+1*

Documentation system description
================================

See [README](https://github.com/circulosmeos/axolotl/) on project's root.

License
=======

Distributed [under GPL 3](http://www.gnu.org/licenses/gpl-3.0.html)
