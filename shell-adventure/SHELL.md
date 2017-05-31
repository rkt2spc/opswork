# SHELL CHARACTERISTICS
### Interactive vs Non-Interactive
**Interactive:**  
Shell that allows you to type stuff in, can popup prompts and ask you for input  

**Non-Interactive:**  
Examples that start a non-interactive shell are:  
 - Running scripts within a script via sub-shell
 - Cron Job  

### Login vs Non-Login
**Login:**  
Shell that spawn when you login, typically through ssh  

**Non-Login:**  
Shell that start without login in (or after login in)  

# SHELL CONFIG
### For Bash, they work as follows. Read down the appropriate column. Executes A, then B, then C, etc. The B1, B2, B3 means it executes only the first of those files found.  

|                | Interactive login | Interactive non-login | Script |
|----------------|:-----------------:|:---------------------:|:------:|
|/etc/profile    |         A         |                       |        |
|/etc/bash.bashrc|                   |           A           |        |
|~/.bashrc       |                   |           B           |        |
|~/.bash_profile |         B1        |                       |        |
|~/.bash_login   |         B2        |                       |        |
|~/.profile      |         B3        |                       |        |
|BASH_ENV        |                   |                       |   A    |
|~/.bash_logout  |         C         |                       |        |

### For zsh: [Note that zsh seems to read ~/.profile as well, if ~/.zshrc is not present.]  
|                | Interactive login | Interactive non-login | Script |
|----------------|:-----------------:|:---------------------:|:------:|
|/etc/zshenv     |         A         |           A           |   A    |
|~/.zshenv       |         B         |           B           |   B    |
|/etc/zprofile   |         C         |                       |        |
|~/.zprofile     |         D         |                       |        |
|/etc/zshrc      |         E         |           C           |        |
|~/.zshrc        |         F         |           D           |        |
|/etc/zlogin     |         G         |                       |        |
|~/.zlogin       |         H         |                       |        |
|~/.zlogout      |         I         |                       |        |
|/etc/zlogout    |         J         |                       |        |  

# Moral
For bash, put stuff in ~/.bashrc, and make ~/.bash_profile source it.  
For zsh, put stuff in ~/.zshrc, which is always executed.