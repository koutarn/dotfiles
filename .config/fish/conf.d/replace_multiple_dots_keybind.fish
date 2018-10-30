function __register_replace_multiple_dots_keybind --on-event fish_prompt
    bind '.' __replace_multiple_dots
    functions -e __register_replace_multiple_dots_keybind
end
