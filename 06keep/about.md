# About

This is a little bit weird subject that I am not sure how to name it.

The idea is that it's possible to create classes that are not used by the Main class.

Normally Haxe will not generate classes that you will use. Better functions that you are not using will not be used.

It's called [Dead Code Elimination or DCE](https://haxe.org/manual/cr-dce.html).

> DCE has three modes which are set when invoking the command line:
>
> `-dce std`: Only classes in the Haxe Standard Library are affected by DCE. This is the default setting on all targets.
> `-dce no`: No DCE is performed.
> `-dce full`: All classes are affected by DCE.

But because this is a really powerfull feature its better to just make sure you have more controle over it.