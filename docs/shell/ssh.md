# ssh

**ssh** -- OpenSSH SSH client (remote login program)

## EXAMPLES

Login to remote host

```sh
$ ssh -l jsmith remotehost.example.com
```

Debug ssh client

```sh
$ ssh -v -l jsmith remotehost.example.com
```

Display ssh client version

```sh
$ ssh -V
```

## DESCRIPTION

`-l login_name`, Specifies the user to log in as on the remote machine.

`-v`, Verbose mode. Cause **ssh** to print debugging messages about its progress.

`-V`, Display the version number and exit.
