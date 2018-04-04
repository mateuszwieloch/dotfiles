# ENV VARIABLES
set -x UBER_HOME "$HOME/Uber"
set -x UBER_OWNER "mwieloch@uber.com"
set -x UBER_LDAP_UID mwieloch
set -x VAGRANT_DEFAULT_PROVIDER aws

# PATH
set -gx PATH $HOME/bin $PATH
