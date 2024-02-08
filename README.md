# personal scripts

These are some scripts I made for my laptop. The idea is just to automate some 
tasks I usually do. Some of them I map to a keyboard shortcut, others I call from
Maybe I can give a full description of each one someday, but right now I just
want to mantain this as a sort of backup. Feel free to ask me about anything or
to make suggestions. 

## mostrar

`mostrar` (which means literally `to show` in Portuguese) is a simple script I use as 
substitute `ls`. Of course, it is actually using `ls` to show objects and, since it is 
a bash script using for loops within conditional statements, it has a poor 
performance. This means it can take a long time to list all of the content of a really 
highly populated directory. But it works just fine for most directories, and the poor 
performance produces a nice effect of things gradually being shown. As of now, it does 
not support any options.

It just clears the terminal's screen without clearing the terminal's scrollback buffer 
(it runs `clear -x`), then it displays a list of content: directories shown first, 
bold and purple, and files right bellow, in green, preceeded by their respective sizes 
in human readable format.

It can be used just by being called: 
`mostrar`

or, it can be used with a target directory as an argument: 
`mostrar <your_favorite_directory>`

## brilhante
In my personal machine, I use Arch Linux with bspwm as a window manager. Right after installing it, I realized my laptop brightness keys were not working out of 
the box, so I made `brilhante`, a script that changes screen brightness, and mapped it to a keyboard shortcut using `sxhkd`. 

#### TODO: 
`mostrar` does not give a decent output when used to list an empty directory. Should I fix this? Maybe I should just make a golang utility that could possibly be 
an alternative to `ls`.
