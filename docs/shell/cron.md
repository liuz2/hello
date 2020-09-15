# cron

The `cron` and `at` services enable sysadmins to schedule tasks to run at a specific time in the future. The `at` service specifies a one-time task that runs at a certain time. The `cron` service can schedule tasks on a repetitive basis, such as daily, weekly, or monthly.

The `crond` daemon is the background service that enables cron functionality.

The cron service checks for files in the `/var/spool/cron` and `/etc/cron.d` directories and the `/etc/anacrontab` file. The contents of these files define cron jobs that are to be run at various intervals. The individual user cron files are located in `/var/spool/cron`, and system services and applications generally add cron job files in the `/etc/cron.d` directory. The `/etc/anacrontab` is a special case that will be covered later in this article.

> The macOS doesn't have these files and directories.

TODO:

## REF

1. [How to use cron in Linux](https://opensource.com/article/17/11/how-use-cron-linux), by *David Both*, 2017/11
