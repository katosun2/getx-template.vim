"=============================================================================
"     FileName: getx-template.vim
"         Desc: 
"       Author: Ryu
"      Version: 0.1.1
"   LastChange: 2021-07-20 14:45:15
"=============================================================================
if exists("b:loaded_getxTemplate")
  finish
endif
let b:loaded_getxTemplate = 1

"定义模板路径
if !exists('g:getx_templates_path')
  let g:getx_templates_path=$VIM.'/vimfiles/bundle/getx-template.vim/templates/'
endif

"驼峰转成小写下划线
"https://github.com/tpope/vim-abolish/blob/master/plugin/abolish.vim
function! s:snakecase(word)
  let word = substitute(a:word,'::','/','g')
  let word = substitute(word,'\(\u\+\)\(\u\l\)','\1_\2','g')
  let word = substitute(word,'\(\l\|\d\)\(\u\)','\1_\2','g')
  let word = substitute(word,'[.-]','_','g')
  let word = tolower(word)
  return word
endfunction

func! g:GeneratePage(name, getxType)
  "编辑中的文件所在工程目录
  let path = fnameescape(expand("%:p:h"))
  "模板所在的类型
  let tplPath = g:getx_templates_path.a:getxType

  "读取目录下的模板dart
  let tplDartFiles = split(globpath(l:tplPath, '*.dart'), '\n')
  let snakecase = s:snakecase(a:name)
  let pagePath = path.'/'.snakecase

  "创建页面目录
  if !isdirectory(pagePath)
    call mkdir(pagePath, 'p', 0700)
  else
    echoerr a:name.'目录已存在，生成失败！'
    return
  endif

  "读取模板列表并复制
  for item in tplDartFiles
    "读取文件
    let tplData = readfile(item)
    let fileName = fnamemodify(item, ':t')
    let targetFile = pagePath.'/'.fileName
    let lineList = []

    "替换关键词
    for line in tplData
      call add(lineList, substitute(line, '@name', a:name, 'g'))
    endfor

    "生成新文件
    if writefile(lineList, targetFile)
      echoerr '文件写入失败!'
    else
      echo '生成 '.fileName.' 成功'
    endif
  endfor
endfunc

func! g:GenerateAdapter(name, fishType)
  call g:GeneratePage(a:name, a:fishType, 1)
endfunc

" 定义命令
command! -nargs=* GetxGenerate :call g:GeneratePage(<f-args>)
command! -nargs=* GetxGenerateNormal :call g:GeneratePage(<f-args>, 'easy')
command! -nargs=* GetxGenerateEasy :call g:GeneratePage(<f-args>, 'normal')
