### Workflow
1. Check availability of public key
2. Let user confirm gpg key 
3. Or: Paste Pubkey into textarea

### Configuration

* Pre-define recipient(s) + key
  * Hide recipient field completely
  * Offer select menu

* Sendmail / mail backend (also: TLS config)

* TODO: where to store config?

* Keyservers
  * Allowed to ask remote?
  
### Distribution
* Create and test on vagrant box w/o GPG installed

* Ideally:
  * `gem install ivybox`
  * `ivybox --bind 1.2.3.4 --port 9876 --config-option1=foo` # => runs server
  * `ivybox new my_directory` # => creates from template
  * capistrano recipe