# Bitwarden Backups

This directory contains encrypted backups of my Bitwarden passwords.
Specifically, they are encrypted using [gpg](https://www.gnupg.org/) with
symmetric AES256 encryption.

## Decryption Instructions

To decrypt them you can simply run the decrypt script by opening a terminal and
typing

```sh
~/backup/bitwarden/decrypt
```

Followed by the Enter key.

You should be prompted for the master password for my
[Bitwarden](https://bitwarden.com/) account. The terminal will not show the
characters you are entering but it is registering them if you are focused in the
window. If the password is entered correctly, the `.gpg` encrypted files should
be decrypted into the same directory `~backup/bitwarden/`. The `.csv` file is
easily human readable and the `.json` file can be used to
[import all the passwords to a Bitwarden vault](https://bitwarden.com/help/import-data/#import-to-your-individual-vault).

## After Decrypting

The `.gpg` files should be kept and are secure since they are encrypted. These
should be kept in case you lose access again \(or updated regularly to keep back
ups of the most recent passwords\). The decrypted files should be deleted as
soon as possible since they are not secure and can be read by anyone with access
to them.
