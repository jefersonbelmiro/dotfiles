# tmux tips


# switch window

C-b {window_index} :  C-0, C-5, C-9...

Use C-b ' to select the window index.
Use C-b w to get an interactive index to choose from (0-9a-z).

Add bindings to cycle through quickly in tmux.conf
```sh
bind -r C-h select-window -t :-
bind -r C-l select-window -t :+
```
>> The -r in the last one lets you repeat the key without having to repeat C-b. Typically the second one is the least number of keystrokes.
