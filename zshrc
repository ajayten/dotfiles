# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ajuretzka/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin:/home/ajuretzka/.local/bin


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="strug"
#ZSH_THEME="bureau"
#ZSH_THEME="rkj-repos"
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="ys"
#ZSH_THEME="strug"
#ZSH_THEME="agnoster"


### test prompt
#export PS1="[\[\e[36m\]\u\[\e[m\] @\[\e[32m\] \$(hostname --fqdn)\[\e[m\]: \[\e[33m\]\w \[\e[m\]- \$?]\n$ "

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# ignore History doubles
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
oc
vscode
zsh-autosuggestions
kubetail
)


source $ZSH/oh-my-zsh.sh

# oc completion client 4.9 bugfix
# https://access.redhat.com/solutions/6896731
#autoload oc completion zsh | sed -e 's/kubectl/oc/g' > "${fpath[1]}/_oc"

# kubectl completion
source <(kubectl completion zsh) 

# helm completion
source <(helm completion zsh)

# User configuration

# make the * match
setopt +o nomatch

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias h="history"
alias c='clear'
alias s='ssh'
alias g='grep'
alias update='sudo apt update && sudo apt upgrade'
alias vpn='cd /etc/openvpn/client && sudo openvpn L105-UDP-ajuretzka.heinlein-support.de.conf'
alias lr='ls -ltr'
alias k='kubectl'
alias mk='minikube'
alias rich='rich -ng'
alias prich='rich -ng --pager'

# switch aws profile
alias daws='export AWS_PROFILE=default'
alias kaws='export AWS_PROFILE=kurs'


##########
# MODSEC #
##########
# Aliases to extract individual fields of an apache access log in extended format
# Order follows the individual fields
# Some values are transformed
# Every alias comes with a 2nd variant that also includes the unique request id
alias alip='cut -d\  -f1'
alias alipid='cut -d\" -f1,11 | cut -d\  -f1,7'
alias alcountry='cut -d\  -f2'
alias alcountryid='cut -d\" -f1,11 | cut -d\  -f2,7'
alias aluser='cut -d\  -f3'
alias aluserid='cut -d\" -f1,11 | cut -d\  -f3,7'
alias altimestamp='cut -d\  -f4,5 | tr -d "[]"'
alias altimestampid='cut -d\" -f1,11 | cut -d\  -f4,5,7 | tr -d "[]"'
alias alrequestline='cut -d\" -f2'
alias alrequestlineid='cut -d\" -f2,11 | cut -d\  -f1,2,3,4 | tr -d \"'
alias almethod='cut -d\" -f2 | cut -d\  -f1 | sed "s/^-$/**NONE**/"'
alias almethodid='cut -d\" -f2,11 | cut -d\  -f1,4'
alias aluri='cut -d\" -f2 | cut -d\  -f2 | sed "s/^-$/**NONE**/"'
alias aluriid='cut -d\" -f2,11 | cut -d\  -f2,4'
alias alprotocol='cut -d\" -f2 | cut -d\  -f3 | sed "s/^-$/**NONE**/"'
alias alprotocolid='cut -d\" -f2,11 | cut -d\  -f3,4 | tr -d \"'
alias alstatus='cut -d\" -f3 | cut -d\  -f2'
alias alstatusid='cut -d\" -f3,11 | cut -d\  -f2,5'
alias alresponsebodysize='cut -d\" -f3 | cut -d\  -f3'
alias alresponsebodysizeid='cut -d\" -f3,11 | cut -d\  -f3,5'
alias alreferer='cut -d\" -f4 | sed "s/^-$/**NONE**/"'
alias alrefererid='cut -d\" -f4,11 | cut -d\  -f1,2 | tr -d \"'
alias alreferrer='cut -d\" -f4 | sed "s/^-$/**NONE**/"'
alias alreferrerid='cut -d\" -f4,11 | cut -d\  -f1,2 | tr -d \"'
alias aluseragent='cut -d\" -f6 | sed "s/^-$/**NONE**/"'
alias aluseragentid='cut -d\" -f6,11 | sed -e "s/\(\"\ [^ ]*\).*/\1/" -e "s/-/**NONE**/" | tr -d \"'
alias alcontenttype='cut -d\" -f8'
alias alcontenttypeid='cut -d\" -f8,11 | cut -d\  -f1,2 | tr -d \"'
alias alclientport='cut -d\" -f9 | cut -d\  -f2'
alias alclientportid='cut -d\" -f9,11 | cut -d\  -f2,10'
alias alremoteport='cut -d\" -f9 | cut -d\  -f2'
alias alremoteportid='cut -d\" -f9,11 | cut -d\  -f2,10'
alias alservername='cut -d\" -f9 | cut -d\  -f3'
alias alservernameid='cut -d\" -f9,11 | cut -d\  -f3,10'
alias allocalip='cut -d\" -f9 | cut -d\  -f4'
alias allocalipid='cut -d\" -f9,11 | cut -d\  -f4,10'
alias alcanonicalport='cut -d\" -f9 | cut -d\  -f5'
alias alcanonicalportid='cut -d\" -f9,11 | cut -d\  -f5,10'
alias alport='cut -d\" -f9 | cut -d\  -f5'
alias alportid='cut -d\" -f9,11 | cut -d\  -f5,10'
alias alhandler='cut -d\" -f9 | cut -d\  -f6'
alias alhandlerid='cut -d\" -f9,11 | cut -d\  -f6,10'
alias albalroute='cut -d\" -f9 | cut -d\  -f7'
alias albalrouteid='cut -d\" -f9,11 | cut -d\  -f7,10'
alias alconnstatus='cut -d\" -f9 | cut -d\  -f8'
alias alconnstatusid='cut -d\" -f9,11 | cut -d\  -f8,10'
alias altrkcookie='cut -d\" -f10'
alias altrkcookieid='cut -d\" -f10,11 | cut -d\  -f1,2 | tr -d \"'
alias alreqid="egrep  -o '\" [a-zA-Z0-9@-]{24,27} ' | cut -b3- | tr -d ' '"
alias aluniqueid='cut -d\" -f11 | cut -d\  -f2'
alias alsslprotocol='cut -d\" -f11 | cut -d\  -f3'
alias alsslprotocolid='cut -d\" -f11 | cut -d\  -f2,3 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias alsslcipher='cut -d\" -f11 | cut -d\  -f4'
alias alsslcipherid='cut -d\" -f11 | cut -d\  -f2,4 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias alioin='cut -d\" -f11 | cut -d\  -f5'
alias alioinid='cut -d\" -f11 | cut -d\  -f2,5 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias alioout='cut -d\" -f11 | cut -d\  -f6'
alias aliooutid='cut -d\" -f11 | cut -d\  -f2,6 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias aldeflateratio='cut -d\" -f11 | cut -d\  -f7 | tr -d %'
alias aldeflateratioid='cut -d\" -f11 | cut -d\  -f2,7 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | tr -d %'
alias alduration='cut -d\" -f11 | cut -d\  -f8'
alias aldurationid='cut -d\" -f11 | cut -d\  -f2,8 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias aldurationin='cut -d\" -f11 | cut -d\  -f9'
alias aldurationinid='cut -d\" -f11 | cut -d\  -f2,9 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias aldurationapp='cut -d\" -f11 | cut -d\  -f10'
alias aldurationappid='cut -d\" -f11 | cut -d\  -f2,10 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias aldurationout='cut -d\" -f11 | cut -d\  -f11'
alias aldurationoutid='cut -d\" -f11 | cut -d\  -f2,11 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias alscoreinpls='cut -d\" -f11 | cut -d\  -f12'
alias alscoreinplsid='cut -d\" -f11 | cut -d\  -f2,12 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias alscoreinpl1='cut -d\" -f11 | cut -d\  -f12 | cut -d- -f1'
alias alscoreinpl1id='cut -d\" -f11 | cut -d\  -f2,12 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f1,4  | sed -e "s/-[0-9]*\ / /"'
alias alscoreinpl2='cut -d\" -f11 | cut -d\  -f12 | cut -d- -f2'
alias alscoreinpl2id='cut -d\" -f11 | cut -d\  -f2,12 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f2,4  | sed -e "s/-[0-9]*\ / /"'
alias alscoreinpl3='cut -d\" -f11 | cut -d\  -f12 | cut -d- -f3'
alias alscoreinpl3id='cut -d\" -f11 | cut -d\  -f2,12 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f3,4  | sed -e "s/-[0-9]*\ / /"'
alias alscoreinpl4='cut -d\" -f11 | cut -d\  -f12 | cut -d- -f4'
alias alscoreinpl4id='cut -d\" -f11 | cut -d\  -f2,12 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f4'
alias alscoreoutpls='cut -d\" -f11 | cut -d\  -f13'
alias alscoreoutplsid='cut -d\" -f11 | cut -d\  -f2,13 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'
alias alscoreoutpl1='cut -d\" -f11 | cut -d\  -f13 | cut -d- -f1'
alias alscoreoutpl1id='cut -d\" -f11 | cut -d\  -f2,13 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f1,4  | sed -e "s/-[0-9]*\ / /"'
alias alscoreoutpl2='cut -d\" -f11 | cut -d\  -f13 | cut -d- -f2'
alias alscoreoutpl2id='cut -d\" -f11 | cut -d\  -f2,13 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f2,4  | sed -e "s/-[0-9]*\ / /"'
alias alscoreoutpl3='cut -d\" -f11 | cut -d\  -f13 | cut -d- -f3'
alias alscoreoutpl3id='cut -d\" -f11 | cut -d\  -f2,13 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f3,4  | sed -e "s/-[0-9]*\ / /"'
alias alscoreoutpl4='cut -d\" -f11 | cut -d\  -f13 | cut -d- -f4'
alias alscoreoutpl4id='cut -d\" -f11 | cut -d\  -f2,13 | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }" | cut -d- -f4'
alias alscorein='cut -d\" -f11 | cut -d\  -f14 | tr "-" "0"'
alias alscoreinid='cut -d\" -f11 | cut -d\  -f2,14 | tr "-" "0" | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"' 
alias alscoreout='cut -d\" -f11 | cut -d\  -f15 | tr "-" "0"'
alias alscoreoutid='cut -d\" -f11 | cut -d\  -f2,15 | tr "-" "0" | awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"' 
alias alscores='egrep -o "[0-9-]+ [0-9-]+$" | tr " " ";" | tr "-" "0"'
alias alscoresid='cut -d\" -f11 | cut -d\  -f2,14,15 | awk "{ t = \$1; \$1 = \$2; \$2 = \$3; \$3 = t; print; }" | sed "s/ /;/" | tr "-" "0"'

# Concatenation bringing a request summary
alias altimestatusmethoduri="awk '{ print \$4 \" \" \$5 \" \" \$9 \" \" \$6 \" \" \$7}' | tr -d \\\""
alias altsmu="awk '{ print \$4 \" \" \$5 \" \" \$9 \" \" \$6 \" \" \$7}' | tr -d \\\""
alias altimestatusmethoduriid='cut -d\" -f1,2,3,11 | cut -d\  -f4,5,6,7,9,12 | tr -d \" | awk " { print \$1 \" \" \$2 \" \" \$5  \" \" \$3 \" \" \$4 \" \" \$6 } "'
alias altsmuid='cut -d\" -f1,2,3,11 | cut -d\  -f4,5,6,7,9,12 | tr -d \" | awk " { print \$1 \" \" \$2 \" \" \$5  \" \" \$3 \" \" \$4 \" \" \$6 } "'
alias altsmui='cut -d\" -f1,2,3,11 | cut -d\  -f4,5,6,7,9,12 | tr -d \" | awk " { print \$1 \" \" \$2 \" \" \$5  \" \" \$3 \" \" \$4 \" \" \$6 } "'

alias col1='awk "{ print \$1 }"'
alias col2='awk "{ print \$2 }"'
alias col3='awk "{ print \$3 }"'
alias col4='awk "{ print \$4 }"'
alias col5='awk "{ print \$5 }"'
alias col6='awk "{ print \$6 }"'
alias col7='awk "{ print \$7 }"'
alias col8='awk "{ print \$8 }"'
alias col9='awk "{ print \$9 }"'
alias col10='awk "{ print \$10 }"'
alias col11='awk "{ print \$11 }"'
alias col12='awk "{ print \$12 }"'
alias col13='awk "{ print \$13 }"'
alias col14='awk "{ print \$14 }"'
alias col15='awk "{ print \$15 }"'
alias col16='awk "{ print \$16 }"'
alias col17='awk "{ print \$17 }"'
alias col18='awk "{ print \$18 }"'
alias col19='awk "{ print \$19 }"'
alias col20='awk "{ print \$20 }"'
alias col1-1='awk "{ print \$1, \$1 }"'
alias col1-2='awk "{ print \$1, \$2 }"'
alias col1-3='awk "{ print \$1, \$3 }"'
alias col1-4='awk "{ print \$1, \$4 }"'
alias col1-5='awk "{ print \$1, \$5 }"'
alias col1-6='awk "{ print \$1, \$6 }"'
alias col1-7='awk "{ print \$1, \$7 }"'
alias col1-8='awk "{ print \$1, \$8 }"'
alias col1-9='awk "{ print \$1, \$9 }"'
alias col1-10='awk "{ print \$1, \$10 }"'
alias meldata='grep -o "\[data [^]]*" | cut -d\" -f2'
alias melfile='grep -o "\[file [^]]*" | cut -d\" -f2'
alias melhostname='grep -o "\[hostname [^]]*" | cut -d\" -f2'
alias melid='grep -o "\[id [^]]*" | cut -d\" -f2'
alias melidmsg='grep "ModSecurity: " | sed -e "/\(compiled version\|Status engine is currently\)/d" -e "s/.*\[id \"//" -e "s/\([0-9]*\).*\[msg \"/\1 /" -e "s/\"\].*//" -e "s/(Total .*/(Total ...) .../" -e "s/Incoming and Outgoing Score: [0-9]* [0-9]*/Incoming and Outgoing Score: .../"'
alias melip='grep -o "\[client [^]]*" | cut -b9-'
alias melline='grep -o "\[line [^]]*" | cut -d\" -f2'
alias melmatch='grep -o " at [^\ ]*\. \[file" | sed -e "s/\. \[file//" | cut -b5-'
alias melmsg='grep -o "\[msg [^]]*" | cut -d\" -f2 | sed -e "s/(Total .*/(Total ...) .../"'
alias melsummary='grep -o -E " (at|against) .*\[file.*\[id \"[0-9]+.*\[msg \"[^\"]+" | tr -d \" | sed -e "s/ at the end of input at/ at/" -e "s/ required. /. /" -e "s/\[rev .*\[msg/[msg/" -e "s/\. / /" -e "s/(Total .*/(Total ...) .../" | tr -d \] | cut -d\  -f3,9,11- | sed -e "s/^\([^ ]*\) \([^ ]*\)/\2 \1/" | awk "{ printf \"%+6s %-35s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s\n\", \$1, \$2, \$3, \$4, \$5, \$6, \$7, \$8, \$9, \$10, \$11, \$12, \$13, \$14, \$15, \$16, \$17, \$18, \$19, \$20 }" | sed -e "s/\ *$//"'
# melsummary description: We grep for the various ModSec alert messages and take the content from the at/against via the parameter name, the id up and including the message. tr and sed and again tr are then used to strip this down. Now cut is used to extract (1) the parameter, (2) the id and (3) the message. Then we use sed to swap the position of the parameter and the id. Then we used awk to print the three fields in a clean table. This demands the used of a lot of %s fields, which results in a lot of empty spaces at the end of the line, which are finally removed.
alias meltags='tr "]" "\n" | tr "[" "\n" | grep "tag \"" | cut -b6- | tr -d "\""'
alias meltimestamp='cut -b2-25'
alias melunique_id='grep -o "\[unique_id [^]]*" | cut -d\" -f2'
alias meluri='grep -o "\[uri [^]]*" | cut -d\" -f2'

alias pathsegs1='cut -d\/ -f1-2'
alias pathsegs2='cut -d\/ -f1-3'
alias pathsegs3='cut -d\/ -f1-4'
alias pathsegs4='cut -d\/ -f1-5'
alias pathsegs5='cut -d\/ -f1-6'
alias sucs='sort | uniq -c | sort -n'
alias sucspercent='sort | uniq -c | sort -n | $HOME/bin/percent.awk'
alias sucspercentsorted='sort | uniq -c | sort -k2 | $HOME/bin/percent.awk'
alias swapcolumns='awk "{ t = \$1; \$1 = \$2; \$2 = t; print; }"'

alias grepcrs='egrep "id \"9[0-9]{5,6}\""'
alias greppl1='egrep "\"(901001|901450|905100|905110|910000|910100|910150|910160|910170|910180|911100|912120|912170|913100|913110|913120|920100|920120|920130|920140|920160|920170|920180|920190|920210|920220|920240|920250|920260|920270|920280|920290|920310|920311|920330|920340|920350|920360|920370|920380|920390|920400|920410|920420|920430|920440|920450|921100|921110|921120|921130|921140|921150|921160|930100|930110|930120|930130|931100|931110|931120|932100|932105|932110|932115|932120|932130|932140|932150|932160|932170|932171|933100|933110|933120|933130|933140|933150|933160|933170|933180|941100|941110|941120|941130|941140|941150|941160|941170|941180|941190|941200|941210|941220|941230|941240|941250|941260|941270|941280|941290|941300|941310|941350|941370|942100|942140|942160|942170|942190|942220|942230|942240|942250|942270|942280|942290|942320|942350|942360|943100|943110|943120|944100|944110|944120|944130|949100|949110|950130|951110|951120|951130|951140|951150|951160|951170|951180|951190|951200|951210|951220|951230|951240|951250|951260|952100|952110|953100|953110|953120|954100|954110|954120|954130|959100|980100|980110|980120|980130|980140|9001000|9001110|9001112|9001114|9001116|9001120|9001122|9001124|9001126|9001128|9001140|9001150|9001170|9001180|9001182|9001184|9001200|9001202|9001204|9001206|9001208|9001210|9001212|9001214|9001216|9002000|9002001|9002100|9002120|9002130|9002150|9002160|9002200|9002400|9002401|9002410|9002420|9002520|9002530|9002540|9002700|9002710|9002720|9002730|9002740|9002750|9002800|9002810|9002820|9002900)\""'
alias greppl2='egrep "\"(912171|913101|913102|920200|920201|920230|920271|920300|920320|921151|931130|933151|941320|941330|941340|942110|942120|942130|942150|942180|942200|942210|942260|942300|942310|942330|942340|942370|942380|942390|942400|942410|942430|942440|942450|942510|944200|944210|944240|944250|950100)\""'
alias greppl3='egrep "\"(920272|921180|933111|933131|933161|942251|942420|942431|942460|942511|944300)\""'
alias greppl4='egrep "\"(920202|920273|920274|920460|942421|942432)\""'

alias greppl1-2='egrep "\"(901001|901450|905100|905110|910000|910100|910150|910160|910170|910180|911100|912120|912170|913100|913110|913120|920100|920120|920130|920140|920160|920170|920180|920190|920210|920220|920240|920250|920260|920270|920280|920290|920310|920311|920330|920340|920350|920360|920370|920380|920390|920400|920410|920420|920430|920440|920450|921100|921110|921120|921130|921140|921150|921160|930100|930110|930120|930130|931100|931110|931120|932100|932105|932110|932115|932120|932130|932140|932150|932160|932170|932171|933100|933110|933120|933130|933140|933150|933160|933170|933180|941100|941110|941120|941130|941140|941150|941160|941170|941180|941190|941200|941210|941220|941230|941240|941250|941260|941270|941280|941290|941300|941310|941350|941370|942100|942140|942160|942170|942190|942220|942230|942240|942250|942270|942280|942290|942320|942350|942360|943100|943110|943120|944100|944110|944120|944130|944200|944210|944240|944250|949100|949110|950130|951110|951120|951130|951140|951150|951160|951170|951180|951190|951200|951210|951220|951230|951240|951250|951260|952100|952110|953100|953110|953120|954100|954110|954120|954130|959100|980100|980110|980120|980130|980140|9001000|9001110|9001112|9001114|9001116|9001120|9001122|9001124|9001126|9001128|9001140|9001150|9001170|9001180|9001182|9001184|9001200|9001202|9001204|9001206|9001208|9001210|9001212|9001214|9001216|9002000|9002001|9002100|9002120|9002130|9002150|9002160|9002200|9002400|9002401|9002410|9002420|9002520|9002530|9002540|9002700|9002710|9002720|9002730|9002740|9002750|9002800|9002810|9002820|9002900|912171|913101|913102|920200|920201|920230|920271|920300|920320|921151|931130|933151|941320|941330|941340|942110|942120|942130|942150|942180|942200|942210|942260|942300|942310|942330|942340|942370|942380|942390|942400|942410|942430|942440|942450|942510|950100|920171|920470|920480|932180|920121|920341|941101|942361|942470|942480|944220)\""'
alias greppl1-3='egrep "\"(901001|901450|905100|905110|910000|910100|910150|910160|910170|910180|911100|912120|912170|913100|913110|913120|920100|920120|920130|920140|920160|920170|920180|920190|920210|920220|920240|920250|920260|920270|920280|920290|920310|920311|920330|920340|920350|920360|920370|920380|920390|920400|920410|920420|920430|920440|920450|921100|921110|921120|921130|921140|921150|921160|930100|930110|930120|930130|931100|931110|931120|932100|932105|932110|932115|932120|932130|932140|932150|932160|932170|932171|933100|933110|933120|933130|933140|933150|933160|933170|933180|941100|941110|941120|941130|941140|941150|941160|941170|941180|941190|941200|941210|941220|941230|941240|941250|941260|941270|941280|941290|941300|941310|941350|941370|942100|942140|942160|942170|942190|942220|942230|942240|942250|942270|942280|942290|942320|942350|942360|943100|943110|943120|944100|944110|944120|944130|944200|944210|944240|944250|944300|949100|949110|950130|951110|951120|951130|951140|951150|951160|951170|951180|951190|951200|951210|951220|951230|951240|951250|951260|952100|952110|953100|953110|953120|954100|954110|954120|954130|959100|980100|980110|980120|980130|980140|9001000|9001110|9001112|9001114|9001116|9001120|9001122|9001124|9001126|9001128|9001140|9001150|9001170|9001180|9001182|9001184|9001200|9001202|9001204|9001206|9001208|9001210|9001212|9001214|9001216|9002000|9002001|9002100|9002120|9002130|9002150|9002160|9002200|9002400|9002401|9002410|9002420|9002520|9002530|9002540|9002700|9002710|9002720|9002730|9002740|9002750|9002800|9002810|9002820|9002900|912171|913101|913102|920200|920201|920230|920271|920300|920320|921151|931130|933151|941320|941330|941340|942110|942120|942130|942150|942180|942200|942210|942260|942300|942310|942330|942340|942370|942380|942390|942400|942410|942430|942440|942450|942510|942511|950100|920272|921180|933111|933131|933161|942251|942420|942431|942460|920171|920470|920480|932180|920121|920341|941101|942361|942470|942480|944220|921170|932106|932190|933190|942490)\""'
alias greppl1-4='egrep "\"(901001|901450|905100|905110|910000|910100|910150|910160|910170|910180|911100|912120|912170|913100|913110|913120|920100|920120|920130|920140|920160|920170|920180|920190|920210|920220|920240|920250|920260|920270|920280|920290|920310|920311|920330|920340|920350|920360|920370|920380|920390|920400|920410|920420|920430|920440|920450|921100|921110|921120|921130|921140|921150|921160|930100|930110|930120|930130|931100|931110|931120|932100|932105|932110|932115|932120|932130|932140|932150|932160|932170|932171|933100|933110|933120|933130|933140|933150|933160|933170|933180|941100|941110|941120|941130|941140|941150|941160|941170|941180|941190|941200|941210|941220|941230|941240|941250|941260|941270|941280|941290|941300|941310|941370|941350|942100|942140|942160|942170|942190|942220|942230|942240|942250|942270|942280|942290|942320|942350|942360|943100|943110|943120|944100|944110|944120|944130|944200|944210|944240|944250|944300|949100|949110|950130|951110|951120|951130|951140|951150|951160|951170|951180|951190|951200|951210|951220|951230|951240|951250|951260|952100|952110|953100|953110|953120|954100|954110|954120|954130|959100|980100|980110|980120|980130|980140|9001000|9001110|9001112|9001114|9001116|9001120|9001122|9001124|9001126|9001128|9001140|9001150|9001170|9001180|9001182|9001184|9001200|9001202|9001204|9001206|9001208|9001210|9001212|9001214|9001216|9002000|9002001|9002100|9002120|9002130|9002150|9002160|9002200|9002400|9002401|9002410|9002420|9002520|9002530|9002540|9002700|9002710|9002720|9002730|9002740|9002750|9002800|9002810|9002820|9002900|912171|913101|913102|920200|920201|920230|920271|920300|920320|921151|931130|933151|941320|941330|941340|942110|942120|942130|942150|942180|942200|942210|942260|942300|942310|942330|942340|942370|942380|942390|942400|942410|942430|942440|942450|942510|942511|950100|920272|921180|933111|933131|933161|942251|942420|942431|942460|920202|920273|920274|920460|942421|942432)\""'
alias mappl='sed -e "s/901001\|901450\|905100\|905110\|910000\|910100\|910150\|910160\|910170\|910180\|911100\|912120\|912170\|913100\|913110\|913120\|920100\|920120\|920130\|920140\|920160\|920170\|920180\|920190\|920210\|920220\|920240\|920250\|920260\|920270\|920280\|920290\|920310\|920311\|920330\|920340\|920350\|920360\|920370\|920380\|920390\|920400\|920410\|920420\|920430\|920440\|920450\|921100\|921110\|921120\|921130\|921140\|921150\|921160\|930100\|930110\|930120\|930130\|931100\|931110\|931120\|932100\|932105\|932110\|932115\|932120\|932130\|932140\|932150\|932160\|932170\|932171\|933100\|933110\|933120\|933130\|933140\|933150\|933160\|933170\|933180\|941100\|941110\|941120\|941130\|941140\|941150\|941160\|941170\|941180\|941190\|941200\|941210\|941220\|941230\|941240\|941250\|941260\|941270\|941280\|941290\|941300\|941310\|941350\|941370\|942100\|942140\|942160\|942170\|942190\|942220\|942230\|942240\|942250\|942270\|942280\|942290\|942320\|942350\|942360\|943100\|943110\|943120\|944100\|944110\|944120\|944130\|949100\|949110\|950130\|951110\|951120\|951130\|951140\|951150\|951160\|951170\|951180\|951190\|951200\|951210\|951220\|951230\|951240\|951250\|951260\|952100\|952110\|953100\|953110\|953120\|954100\|954110\|954120\|954130\|959100\|980100\|980110\|980120\|980130\|980140\|9001000\|9001110\|9001112\|9001114\|9001116\|9001120\|9001122\|9001124\|9001126\|9001128\|9001140\|9001150\|9001170\|9001180\|9001182\|9001184\|9001200\|9001202\|9001204\|9001206\|9001208\|9001210\|9001212\|9001214\|9001216\|9002000\|9002001\|9002100\|9002120\|9002130\|9002150\|9002160\|9002200\|9002400\|9002401\|9002410\|9002420\|9002520\|9002530\|9002540\|9002700\|9002710\|9002720\|9002730\|9002740\|9002750\|9002800\|9002810\|9002820\|9002900\|920171\|920470\|920480\|932180/& PL1/" -e "s/912171\|913101\|913102\|920200\|920201\|920230\|920271\|920300\|920320\|921151\|931130\|933151\|941320\|941330\|941340\|942110\|942120\|942130\|942150\|942180\|942200\|942210\|942260\|942300\|942310\|942330\|942340\|942370\|942380\|942390\|942400\|942410\|942430\|942440\|942450\|942510\|944200\|944210\|944240\|944250\|950100\|920121\|920341\|941101\|942361\|942470\|942480\|944220/& PL2/" -e "s/920272\|921180\|933111\|933131\|933161\|942251\|942420\|942431\|942460\|942511\|944300\|921170\|932106\|932190\|933190\|942490/& PL3/" -e "s/920202\|920273\|920274\|920460\|942421\|942432/& PL4/"'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ajuretzka/playground/kubernetes-the-hard-way/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ajuretzka/playground/kubernetes-the-hard-way/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ajuretzka/playground/kubernetes-the-hard-way/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ajuretzka/playground/kubernetes-the-hard-way/google-cloud-sdk/completion.zsh.inc'; fi
