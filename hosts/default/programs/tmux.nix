{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs; [ 
      # { 
      #   plugin = tmuxPlugins.catppuccin;
      #   extraConfig = "";
      # }
      { 
        plugin = tmuxPlugins.tilish;
        extraConfig = "";
      }
    ];
    extraConfig = ''
      set -g status-interval 1

      set -ogq @thm_bg "#1e1e2e"
      set -ogq @thm_fg "#cdd6f4"
      
      # Colors
      set -ogq @thm_rosewater "#f5e0dc"
      set -ogq @thm_flamingo "#f2cdcd"
      set -ogq @thm_rosewater "#f5e0dc"
      set -ogq @thm_pink "#f5c2e7"
      set -ogq @thm_mauve "#cba6f7"
      set -ogq @thm_red "#f38ba8"
      set -ogq @thm_maroon "#eba0ac"
      set -ogq @thm_peach "#fab387"
      set -ogq @thm_yellow "#f9e2af"
      set -ogq @thm_green "#a6e3a1"
      set -ogq @thm_teal "#94e2d5"
      set -ogq @thm_sky "#89dceb"
      set -ogq @thm_sapphire "#74c7ec"
      set -ogq @thm_blue "#89b4fa"
      set -ogq @thm_lavender "#b4befe"
      
      # Surfaces and overlays
      set -ogq @thm_subtext_1 "#a6adc8"
      set -ogq @thm_subtext_0 "#bac2de"
      set -ogq @thm_overlay_2 "#9399b2"
      set -ogq @thm_overlay_1 "#7f849c"
      set -ogq @thm_overlay_0 "#6c7086"
      set -ogq @thm_surface_2 "#585b70"
      set -ogq @thm_surface_1 "#45475a"
      set -ogq @thm_surface_0 "#313244"
      set -ogq @thm_mantle "#181825"
      set -ogq @thm_crust "#11111b"

      # defaults
      set -g default-terminal screen-256color
      set -g mouse on

      # prefix
      unbind C-b
      set-option -g prefix C-space
      bind-key C-space send-prefix

      # split panes
      bind L split-window -h
      bind H split-window -hb
      bind J split-window -v
      bind K split-window -vb
      unbind '"'
      unbind %

      # move trough panes
      bind l select-pane -R
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U

      # kill pane
      bind q kill-pane

      # windows
      bind n new-window
      bind r command-prompt -I "#W" "rename-window '%%'"
      bind , previous-window
      bind . next-window

      # ricing
      # set -g status-position bo
      # set -g status-justify left
      # set -g status-left '#[fg=#{@thm_teal},bg=#{@thm_crust}]   sus'
      # set -g status-left-length 20

      # set -g status-right '#[fg=#{@thm_crust},bg=#{@thm_teal}] session: #S '
      # # set -g status-right ' %Y-%m-%d %H:%M '
      # set -g status-right-length 50

      # setw -g window-status-current-format ' #I #W #F ' 
      # set -g pane-active-border-style ""

      set -g status-style bg="#{@thm_crust}",fg="#{@thm_teal}"
      set -g status-left "#[bg=#{@thm_teal},fg=#{@thm_crust}]  #{session_name} #[bg=#{@thm_crust},fg=#{@thm_teal}]#[bg=#{@thm_crust},fg=#{@thm_crust}]"
      set -g window-status-format "#[bg=#{@thm_crust},fg=#{@thm_surface_0}]#[bg=#{@thm_surface_0},fg=#{@thm_subtext_1}] #{window_index}-#{window_name} #[bg=#{@thm_crust},fg=#{@thm_surface_0}]"
      set -g window-status-current-format "#[bg=#{@thm_crust},fg=#{@thm_pink}]#[bg=#{@thm_pink},fg=#{@thm_crust}] #{window_index}-#{window_name} #[bg=#{@thm_crust},fg=#{@thm_pink}]"

      set -g status-right-length 500
      set -g status-right "#[bg=#{@thm_crust},fg=#{@thm_subtext_0}]#(echo '#{pane_current_path}' | sed 's#$HOME#~#; s#\\([^/]*/[^/]*/\\).*\\(/[^/]*/.*\\)$#\\1 ... \\2#; s#/#  #g') #[bg=#{@thm_crust},fg=#{@thm_crust}]#[bg=#{@thm_crust},fg=#{@thm_mauve}]#[bg=#{@thm_mauve},fg=#{@thm_crust}] %d-%m %H:%M " 

      set -g pane-base-index 1
      set -g pane-border-format "#[?pane_active,#[bg=#{@thm_mauve},fg=#{@thm_crust}] #{pane_index}-#{pane_current_command} #[bg=#{@thm_mauve},fg=#{@thm_crust}]] "
    '';
  };
}
