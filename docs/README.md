# Haxe and Unity (C#)

With most of the documentation I wrote, it was something that I needed. Because this type of documentation is valuable only when you have no idea how to start. It's the basic stuff that I run into when I start with a new Haxe target.

I would suggest you would visit [Haxe and System Targets](https://matthijskamstra.github.io/haxesys/) as well because it covers the system targets and C# is that as well.

This documentation is focussed on Unity and Haxe and specifics to get it working in with Unity.

#### Visit [http://matthijskamstra.github.io/haxeunity/](http://matthijskamstra.github.io/haxeunity/)


## How to contribute?

Read more about that [here](contribute.md).
But it boils down to: **JUST DO IT!**

#### Visit [https://github.com/MatthijsKamstra/haxeunity](https://github.com/MatthijsKamstra/haxeunity) to modify the "source" aka markdown files.

Found any "bug" or have a great idea? Please create a [new issue](https://github.com/MatthijsKamstra/haxeunity/issues/new).


## How to build?

I will be using [Gitbook](https://github.com/GitbookIO/gitbook#how-to-use-it) to export to static `html`.
You need to install Node.js and then you automatically have NPM:

Install gitbook

```bash
npm install gitbook-cli -g
```

or if you have gitbook installed, update it

```bash
gitbook update
```

I wanted to make the editing of these file as-easy-as-possible.
This gitbook plugin helps with that: [gitbook plugin edit link](https://www.npmjs.com/package/gitbook-plugin-edit-link).
And if all fails, I used [Disqus comments on your books](https://github.com/GitbookIO/plugin-disqus) to add comments at the bottom of each page.

Activate the plugins with:

```bash
gitbook install
```

Export everything to `html`

```bash
gitbook build
```

----

## NPM build

I created a little script with NPM to make my life somewhat easier:

```bash
npm run gitbook
```

Will install and update gitbook

```bash
npm run build
```

Will remove old `docs`- and `_book`-folder, build new gitbook and rename `_book`- to `docs`-folder.

```bash
npm run deploy
```

Will just push everything without consideration


### What is Gitbook?

![Gitbook logo](https://avatars0.githubusercontent.com/u/7111340?v=3&s=200)

I will be using [gitbook](https://github.com/GitbookIO/gitbook) to generate the website.

Primarily reason for this: I have never used it, it uses markdown as input files and it also generates a static `html` site.


### What is Markdown

![Markdown logo](img/markdown-logo-200.png)
A familiar way to write documentation for developers.
This should make it easier to **contribute**!

**Markdown** is a plain text formatting syntax created by John Gruber, aiming to provide a easy-to-read and feasible markup. You can find the original Markdown syntax specification [here](http://daringfireball.net/projects/markdown/syntax).


![MacDown logo](img/macdown-logo-200.png)
**MacDown** is a simple-to-use editor for Markdown documents. It renders your Markdown contents real-time into HTML, and display them in a preview panel. You can download it [here](http://macdown.uranusjr.com/).

