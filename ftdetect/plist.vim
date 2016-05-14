  autocmd BufReadPre,FileReadPre *.plist setf plist
  autocmd FileType plist set binary syntax=xml
  autocmd BufReadPost *.plist call MyBinaryPlistReadPost()
  autocmd FileReadPost *.plist call MyBinaryPlistReadPost() | let b:saveAsBinaryPlist = 0
  autocmd BufWritePre,FileWritePre *.plist call MyBinaryPlistWritePre()
  autocmd BufWritePost,FileWritePost *.plist call MyBinaryPlistWritePost()
