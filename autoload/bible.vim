let s:path = expand('<sfile>:p:h')

function! bible#InsertBible(...) abort

    let bgquery = exists('a:1') && a:1 != "" ? a:1 : input("Query: ")
    let bgversion = exists('a:2') && a:2 != "" ? a:2 : (exists('g:BiblegatewayVersion') ? g:BiblegatewayVersion : input("Biblegateway version: "))
    let bgnumbers = exists('a:3') && a:3 != "" ? a:3 : (exists('g:BiblegatewayNumbers') ? g:BiblegatewayNumbers : input("Biblegateway numbers: "))
    let bgascii = exists('a:4') && a:4 != "" ? a:4 : (exists('g:BiblegatewayAscii') ? g:BiblegatewayAscii : input("Biblegateway ascii: "))
py3 << EOF
import sys
import os
script_path = vim.eval('s:path')

lib_path = os.path.join(script_path, '.') 
sys.path.insert(0, lib_path)                                       

import vim
import bible

bgquery = vim.eval('bgquery')
bgversion = vim.eval('bgversion')
bgnumbers = vim.eval('bgnumbers')
bgascii = vim.eval('bgascii')

result = bible.manual_load(bgquery, bgversion, bgnumbers, bgascii)

vim.command("let result = '%s'"% result)
EOF
put = result
endfunction
