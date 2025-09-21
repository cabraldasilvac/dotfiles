# SPACESHIP CONFIG
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  python        # Python section
  java          # Java section
  lua           # Lua section
  exec_time     # Execution time
  line_sep      # Line break
 # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# PROMPT 
SPACESHIP_TIME_SHOW=false
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="✓"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PACKAGE_SYMBOL="🛅 "

# Do not truncate path in repos
SPACESHIP_DIR_TRUNC_REPO=false
