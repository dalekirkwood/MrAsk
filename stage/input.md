Please build a tool that works with command line on debian based systems.

Here is what is should do, when in terminal, I should be able to 

`ask QUESTION HERE`

It should then ask AI about the command - using an openrouter endpoint (that can be config'd using some like `ask -config).`

It should then after searching AI the question, offer the commands in selectable list (I think its called fzf the tool but I really dont know).

Then I select the one I want and press enter and it runs the command. 

If I can also press `i` when hovering a command, it should offer some kind of explanation of what it does. It should also store a history that I can access by pressing something like `ask -h` and then also displays a selectable table like ggh with explanation and live filtering.

- User should be able to set model in config using standard openrouter formatting
- we should have a `.deb` file at the end to install
