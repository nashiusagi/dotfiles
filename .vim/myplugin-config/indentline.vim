" 縦線を表示させるためconceallevelを設定
set conceallevel=2
let g:indentLine_conceallevel = 2

" json, markdownではconceallevelの影響で文字が消えるため除外
let g:indentLine_fileTypeExclude = ['json', 'markdown']
