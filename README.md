# sh_tools
A collection of simple tools for bash and zsh

### zshup
How many times has this happened to you?

    $ pwd
    ~/project/directory/src/util/catpix/main/java/com/kittyflair/dev/

You want to get to
`~/project/directory/src/util/catpix/`

So that means you either have to fire off a barrage of `cd ..` commands, or you can explicitly get there with
`$ cd ~/project/directory/src/util/catpix/`

Either way that's too much typing. 

#### Installation ####
Download or copy over the file zshup.sh. Bear in mind that only zsh is supported for now. Put the file in a directory anywhere that works for you. Personally, I keep it in `/usr/local/bin/zshupsrc`. You can run:

`$ mv /path/to/zshup.sh /usr/local/bin/up`
`$ chmod +x /usr/local/bin/up`

#### Usage ####
Back to our earlier example, if you wanted to get from

`~/project/directory/src/util/catpix/main/java/com/kittyflair/dev/`
to
`~/project/directory/src/util/catpix/`

you would run

`. up catpix`

Note the need for the `.`. zshup works by running in the *same* process as the current instance of zsh. If this drives you nuts, you can easily use an alias:
`$ alias u='. up '`

And now your directory is only one character away!
`$ u <nameOfDirectory>`

#### Notes ####
If you have nested directories with the same name, as in
`/path/to/file/named/file`
zshup will select the first instance - the higher order directory. This is in need of improvement.

For convenience, running zshup with no arguments behaves the same way as `cd` with no arguments: it just navigates you to your home directory, represented as `~`.



