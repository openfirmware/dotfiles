# RVM check

if [[ -f "$rvm_path/VERSION" ]]; then
    rvm_current=`cat "$rvm_path/VERSION"`

    #Searches for highest available version for the given pattern
    # fetch_version 1.10. -> 1.10.3
    # fetch_version 1. -> 1.11.0
    # fetch_version "" -> 2.0.1
    rvm_latest=`curl -s https://api.github.com/repos/wayneeseguin/rvm/tags |
        sed -n '/"name": / {s/^.*".*": "\(.*\)".*$/\1/; p;}' |
        sort -t. -k 1,1n -k 2,2n -k 3,3n -k 4,4n -k 5,5n |
        GREP_OPTIONS="" \grep "^${1:-}" | tail -n 1`

    _vercomp $rvm_current $rvm_latest
    if [[ "$?" -eq 2 ]]; then
        echo 'RVM Update Available';;
    fi
fi
