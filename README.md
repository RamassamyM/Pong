A little game on Gosu
------------------
Hy guys, during LeWagon formation I had to do a small game with 
[Gosu](https://www.libgosu.org/ruby.html) 
library. This is not a perfect app but have fun, clone it and improve it if you want.
Refactoring is necessary. 

# Installation
You need to install Gosu.
```bash
$ gem install gosu
```

## Structure
```
.
├── lib
│   ├── ball.rb
│   ├── game.rb
│   ├── player.rb
│   ├── song.rb
│   └── ui.rb
└── media
    ├── b1.png
    ├── b3.png
    ├── b5.png
    ├── beep2.wav
    ├── charles.png
    ├── fin.mp3
    ├── lewagon.png
    ├── muz.mp3
    ├── p1.jpg
    ├── p2.jpg
    ├── p3.jpg
    ├── redpad.png
    ├── t1.png
    ├── y1.png
    ├── y3.png
    └── y4.png
```

In `lib/` you will find :
`game.rb`which is the file to launch to start the game : in the terminal, go in the pong directory and type in your terminal
`ruby lib/game.rb `
 
 Files ball.rb, player.rb, song.rb  relates to operating ball, player and music; ui.rb makes the scores and ending messages.
 In the media directory, you'll find backgrounds, sounds, player and ball images.Fell free to customize your Pong.
 
 Would be great to put all messages in ui even for the beginning and add levels with speed in balls. Why not add special capsules adding 3 balls...


# Further

See [Gosu's github tutorial](https://github.com/gosu/gosu/wiki/Ruby-Tutorial) for a full example.
[Documentation](http://www.rubydoc.info/github/gosu/gosu)
