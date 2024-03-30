#!/bin/bash

# Defining arrays for alias names and corresponding commands
alias_names=(chb del Del delre delall setb setupb ac cp acp)
alias_commands=(
 '\!f() { git checkout -b "\$@"; }; f'
 '\!f() { git branch -d "\$@"; }; f'
 '\!f() { git branch -D "\$@"; }; f'
 '\!f() { git push origin -d "\$@"; }; f'
 '\!f() { git branch -d "\$@" && git push origin -d "\$@"; }; f'
 'push -u origin HEAD'
 '\!f() { git checkout -b "\$@" && git push -u origin "\$@"; }; f'
 '\!f() { git add . && git commit -m "\$@"; }; f'
 '\!f() { git commit -m "\$@" && git push origin HEAD; }; f'
 '\!f() { git add . && git commit -m "\$@" && git push origin HEAD; }; f'
)

# Applying each alias to git config
for i in "${!alias_names[@]}"; do
    alias_name=${alias_names[i]}
    alias_command=${alias_commands[i]}

    if git config --global alias."$alias_name" "$alias_command"; then
        echo "Alias '$alias_name' added successfully."
    else
        echo "Error adding alias '$alias_name'."
        exit 1
    fi
done

echo "All aliases have been added."
