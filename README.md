vim-biblegateway
================

Vim-biblegateway is a simple vim plugin that makes it easy to insert a Bible passage
into vim. The plugin is inspired by [this plugin][1] and makes heavy use of
[this python script][2].

To use the plugin, run `:call biblegateway#InsertBible()` in vim and enter your query.
You can also map the command like described in [Using the plugin](#using-the-plugin).

**Note:** You need to have python3 installed.


Installation
------------

With [Pathogen][3]:

    cd ~/.vim/bundle
    git clone git://github.com/superzanti/vim-biblegateway.git


Settings
--------

### g:BiblegatewayVersion

This is the default Bible translation that will be used. 

Abreviations can be found on biblegatway.com

In your ~/.vimrc specify the translation like this:

    let g:BibleTranslation = "KJV"
    
### g:BiblegatewayNumbers

Set either to a 0 or a 1 in order to hide the verse numbers or show them.

In your ~/.vimrc specify if numbers should be shown like this:

    let g:BiblegatewayNumbers = 1
    
### g:BiblegatewayAscii

Weather or not to convert the pulled content to pure ascii (better formatting imo).

In your ~/.vimrc specify if ascii format shoudl be used like this:

    let g:BiblegatewayAscii = 1

Using the plugin
----------------

The following arguments can be passed to bible#insert_quote():

    biblegateway#InsertQuote(query, version, numbers, ascii)

`query`: This is the bible reference to be inserted. If set to "" or omitted, 
the user will be prompted for the query.

`version`: The bible translation to be used. If set to "" or omitted, the
default translation will be used (g:BiblegatewayVersion), and if the default
translation is not set, the user will be prompted for the translation.

`numbers`: If verse numbers should be shown. If set to "" or omitted, the
default numbering scheme will be used (g:BiblegatewayNumbers), and if the default
numbering scheme is not set, the user will be prompted for the numbering scheme.

`ascii`: If ASCII format should be used. If set to "" or omitted, the
default format will be used (g:BiblegatewayAscii), and if the default
format is not set, the user will be prompted for the ASCII format.

If you don't use several translations the easiest way to configure the plugin
is by setting up the global defaults. Here is an example:
```
let g:BiblegatewayVersion = "NLT"
let g:BiblegatewayNumbers = 0
let g:BiblegatewayAscii = 0

nnoremap <leader>b y :call bible#InsertBible()<CR>
vnoremap <leader>b y :call bible#InsertBible(@")<CR>
```

With those mappings you can type `<leader>b` in normal mode, enter the 
query, and the text is inserted. You may also select a query in visual
mode and run `<leader>b` to insert the corresponding Bible passage.

Contributors
------------

[1]: https://github.com/robertrosman/vim-bible 
[2]: https://github.com/covode/bible-fetch
[3]: https://github.com/tpope/vim-pathogen

