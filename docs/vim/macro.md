# Macro

Macro is record and play feature.

## Start recording

To start recording press <kbd>q</kbd> followed by any lower case letter as a macro name.

## Perform Vim actions

In this step you can perform any Vim actions. You can see these actions by executing following command:

```sh
:registers
```

## Stop recording

Once you are done with actions, press <kbd>q</kbd> again to stop recording.

## Play recording

To play execute below command:

```sh
@{macro-name}
```

For example to execute macro "a", execute below command:

```sh
@a
```

## REF

1. [Vim - Macros](https://www.tutorialspoint.com/vim/vim_macros.htm)
