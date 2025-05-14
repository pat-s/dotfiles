function gitopen
    # Ensure we're inside a Git repository.
    if not git rev-parse --is-inside-work-tree > /dev/null 2>&1
        echo "Not in a Git repository."
        return 1
    end

    # Get the remote URL.
    set remote (git config --get remote.origin.url)
    if test -z "$remote"
        echo "No remote 'origin' found."
        return 1
    end

    # Convert SSH and ssh:// URLs to HTTPS.
    if string match -q "git@*" $remote
        # git@github.com:user/repo.git → https://github.com/user/repo
        set remote (string replace -r 'git@([^:]+):([^/]+/[^/]+)(\.git)?$' 'https://$1/$2' $remote)
    else if string match -q "ssh://*" $remote
        # ssh://git@github.com/user/repo.git → https://github.com/user/repo
        set remote (string replace -r 'ssh://git@([^/]+)/([^/]+/[^/]+)(\.git)?$' 'https://$1/$2' $remote)
    else if string match -q "https://*" $remote
        # Remove trailing .git if it exists.
        set remote (string replace -r '\.git$' '' $remote)
    end

    # Open the URL in the default browser.
    open $remote
end

