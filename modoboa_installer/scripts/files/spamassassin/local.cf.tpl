# This is the right place to customize your installation of SpamAssassin.
#
# See 'perldoc Mail::SpamAssassin::Conf' for details of what can be
# tweaked.
#
# Only a small subset of options are listed below
#
###########################################################################

#   Add *****SPAM***** to the Subject header of spam e-mails
#
# rewrite_header Subject *****SPAM*****


#   Save spam messages as a message/rfc822 MIME attachment instead of
#   modifying the original message (0: off, 2: use text/plain instead)
#
# report_safe 1


#   Set which networks or hosts are considered 'trusted' by your mail
#   server (i.e. not spammers)
#
# trusted_networks 212.17.35.


#   Set file-locking method (flock is not safe over NFS, but is faster)
#
# lock_method flock


#   Set the threshold at which a message is considered spam (default: 5.0)
#
# required_score 5.0


#   Use Bayesian classifier (default: 1)
#
# use_bayes 1


#   Bayesian classifier auto-learning (default: 1)
#
# bayes_auto_learn 1

bayes_store_module    %store_module
bayes_sql_dsn         %dsn
bayes_sql_username    %dbname
bayes_sql_password    %dbpassword

#   Set headers which may provide inappropriate cues to the Bayesian
#   classifier
#
# bayes_ignore_header X-Bogosity
# bayes_ignore_header X-Spam-Flag
# bayes_ignore_header X-Spam-Status


#   Some shortcircuiting, if the plugin is enabled
# 
ifplugin Mail::SpamAssassin::Plugin::Shortcircuit
#
#   default: strongly-whitelisted mails are *really* whitelisted now, if the
#   shortcircuiting plugin is active, causing early exit to save CPU load.
#   Uncomment to turn this on
#
# shortcircuit USER_IN_WHITELIST       on
# shortcircuit USER_IN_DEF_WHITELIST   on
# shortcircuit USER_IN_ALL_SPAM_TO     on
# shortcircuit SUBJECT_IN_WHITELIST    on

#   the opposite; blacklisted mails can also save CPU
#
# shortcircuit USER_IN_BLACKLIST       on
# shortcircuit USER_IN_BLACKLIST_TO    on
# shortcircuit SUBJECT_IN_BLACKLIST    on

#   if you have taken the time to correctly specify your "trusted_networks",
#   this is another good way to save CPU
#
# shortcircuit ALL_TRUSTED             on

#   and a well-trained bayes DB can save running rules, too
#
# shortcircuit BAYES_99                spam
# shortcircuit BAYES_00                ham

endif # Mail::SpamAssassin::Plugin::Shortcircuit

# Razor
use_razor2      1
razor_config    /etc/razor/razor-agent.conf

# Pyzor
use_pyzor       1
pyzor_path      /usr/bin/pyzor

# DCC
%{dcc_enabled}use_dcc         1
