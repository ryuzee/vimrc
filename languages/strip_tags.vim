" タグを除去する
:command! StripTags :%s/<.\{-}>//cg
:command! StripTagsAll :%s/<.\{-}>//g
