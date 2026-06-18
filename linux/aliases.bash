# aliases

setopt NO_NOMATCH

export PSA_TOUCH_FRONTEND=~/code/touch/touch-frontend

alias pdf='cd $PSA_TOUCH_FRONTEND'
alias pdci='cd ~/code/touch/touch-cordova-iphone'
alias pdc='cd ~/code/touch/touch-cordova-ipad'
alias pdca='cd ~/code/touch/touch-cordova-android-phone'
alias pdcat='cd ~/code/touch/touch-cordova-android-tablet'
alias dha='cd ~/code/dxhub/dxhub-neocrm-api'
alias dhg='cd ~/code/dxhub/dxhub-neocrm-gui'

alias cop="cordova prepare --dev-html --localsrc --no-grunt-exec --skip-version"
alias copa="cordova prepare --dev-html --localsrc --no-grunt-exec --skip-version && git checkout platforms/android/app/src/main/AndroidManifest.xml"

alias coc="unset JAVA_OPTS && java --version &&  cordova compile"
# alias cob="export JAVA_HOME=$JAVA_17_HOME; cordova build --dev-html --localsrc --no-grunt-exec --skip-version"
alias coi="adb install -r platforms/android/app/build/outputs/apk/arm64/debug/app-arm64-debug.apk"

export JAVA_11_HOME=$(/usr/libexec/java_home -v 11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v 17)
export JAVA_21_HOME=$(/usr/libexec/java_home -v 21)

alias jdk11=" export JAVA_HOME=$JAVA_11_HOME; export PATH=\"$JAVA_11_HOME/bin/:$PATH\"; java -version"
alias jdk17=" export JAVA_HOME=$JAVA_17_HOME; export PATH=\"$JAVA_17_HOME/bin/:$PATH\"; java -version"
alias jdk21=" export JAVA_HOME=$JAVA_21_HOME; export PATH=\"$JAVA_21_HOME/bin/:$PATH\"; java -version"

alias ali='cat  ~/.zshrc  ~/scripts/aliases.bash '
alias nali='mate  ~/scripts/aliases.bash &'

# alias tcs="/usr/local/opt/tomcat@8/libexec/bin/startup.sh"
alias ytd="yt-dlp --no-mtime  --extract-audio --audio-format mp3 $1"
alias ytdpl="yt-dlp   --download-archive   --download-archive '%(playlist_title)s/downloaded.txt' --no-overwrites -o '%(playlist_title)s/%(playlist_index)03d-%(title)s.%(ext)s'  --extract-audio --audio-format mp3 $1"

# alias btp="pushd $PSA_TOUCH_FRONTEND/build/grunt &&  grunt ts:core && popd && cordova prepare --dev-html --localsrc --no-grunt-exec --skip-version && osascript -e 'display notification \"finished\"'"
# alias bap="pushd $PSA_TOUCH_FRONTEND/build/grunt &&  grunt && popd && cordova prepare --dev-html --localsrc --no-grunt-exec --skip-version && osascript -e 'display notification \"finished\"'"
# alias kfew="tmux kill-session -t dev8"

alias ll='ls -la'

function copSshPw() {
  pass -c jr/aws-ssh
}

# alias sshTunAws="ss# h -L 16040:192.168.91.124:16040 -o TCPKeepAlive=yes -o ServerAliveCountMax=20 -o ServerAliveInterval=15 -N ws-do"
# alias sshTunAwsSvs="ssh -L 16042:192.168.91.124:16042 -o TCPKeepAlive=yes -o ServerAliveCountMax=20 -o ServerAliveInterval=15 -N ws-do"
# alias sshTunAwsDb="ssh -L 1521:192.168.91.10:1521 -o TCPKeepAlive=yes -o ServerAliveCountMax=20 -o ServerAliveInterval=15 -N ws-do"
# DB was 192.168.91.215

alias cnc="sudo npm cache clean --force "

alias rps="ssh do@192.168.0.45"
alias rpsw="ssh do@192.168.0.139"

# export JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"
export TOMCAT_DIR="/opt/homebrew/Cellar/tomcat@9/9.0.104/libexec"

alias tcs="cd $TOMCAT_DIR/bin && JAVA_OPTS=$JAVA_OPTS-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005 ./catalina.sh start"
alias tcsp="cd $TOMCAT_DIR/bin && ./catalina.sh stop && pkill -9 -f tomcat"
# alias tcspk="pkill -9 -f tomcat"

export PS1="%1~ %# "

# alias sshTunBld="copSshPw && ssh psabldgui -F ~/.ssh/config.psabldgui -N"
alias sshTunPfl="copSshPw && ssh Pflitsch -F ~/.ssh/config.plflitch -N"
alias sshTunHek="copSshPw && ssh HEK -F ~/.ssh/config.hekatron -N"
alias sshTunHam="copSshPw && ssh hammelmann -F ~/.ssh/config.hammel -N"
alias sshTunHai="copSshPw && ssh haimer -F ~/.ssh/config.haimer -N"
alias sshTunGem="copSshPw && ssh gemu -F ~/.ssh/config.gemu -N"
alias sshTunEwm="copSshPw && ssh ewm -F ~/.ssh/config.ewm -N"
alias sshTunAri="copSshPw && ssh ari -F ~/.ssh/config.ari -N"
alias sshTunSup="copSshPw && ssh SUP -F ~/.ssh/config.sup -N"
alias sshTunTst="copSshPw && ssh psatst -F ~/.ssh/config.psatst -N"
alias sshTunCod="copSshPw && ssh codesys -F ~/.ssh/config.codesys -N"
alias sshTunBd="copSshPw && ssh BD -F ~/.ssh/config.bd -N"

alias sshWsDoPrt="copSshPw && ssh ws-do -N"

export PSA_PLUGIN_UPLOAD_URL=http://localhost:16042/

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias myph="ssh -p 8022 u0_a80@192.168.0.230"

alias or='nvm use 22 && omniroute'
alias rqwen='/Users/daniel/scripts/run_qwen.sh'

function my-prs() { /Users/daniel/scripts/my-prs.sh "$@"; }
