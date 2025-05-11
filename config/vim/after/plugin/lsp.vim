call LspOptionsSet(#{
        \   aleSupport: v:false,
        \   autoComplete: v:false,
        \   autoHighlight: v:false,
        \   autoHighlightDiags: v:true,
        \   autoPopulateDiags: v:false,
        \   completionMatcher: 'case',
        \   completionMatcherValue: 1,
        \   diagSignErrorText: 'E>',
        \   diagSignHintText: 'H>',
        \   diagSignInfoText: 'I>',
        \   diagSignWarningText: 'W>',
        \   echoSignature: v:false,
        \   hideDisabledCodeActions: v:false,
        \   highlightDiagInline: v:true,
        \   hoverInPreview: v:false,
        \   ignoreMissingServer: v:false,
        \   keepFocusInDiags: v:true,
        \   keepFocusInReferences: v:true,
        \   completionTextEdit: v:true,
        \   diagVirtualTextAlign: 'after',
        \   diagVirtualTextWrap: 'default',
        \   noNewlineInCompletion: v:true,
        \   omniComplete: v:true,
        \   outlineOnRight: v:false,
        \   outlineWinSize: 20,
        \   popupBorder: v:true,
        \   popupBorderHighlight: 'Title',
        \   popupBorderHighlightPeek: 'Special',
        \   popupBorderSignatureHelp: v:false,
        \   popupHighlightSignatureHelp: v:false,
        \   popupHighlight: 'Normal',
        \   semanticHighlight: v:true,
        \   showDiagInBalloon: v:true,
        \   showDiagInPopup: v:true,
        \   showDiagOnStatusLine: v:false,
        \   showDiagWithSign: v:true,
        \   showDiagWithVirtualText: v:true,
        \   showInlayHints: v:true,
        \   showSignature: v:true,
        \   snippetSupport: v:false,
        \   ultisnipsSupport: v:false,
        \   useBufferCompletion: v:true,
        \   usePopupInCodeAction: v:true,
        \   useQuickfixForLocations: v:false,
        \   vsnipSupport: v:false,
        \   bufferCompletionTimeout: 100,
        \   customCompletionKinds: v:false,
        \   completionKinds: {},
        \   filterCompletionDuplicates: v:false,
	\ })

set completeopt+=popup

call LspAddServer([#{
	\    name: 'clangd',
	\    filetype: ['c', 'cpp'],
	\    path: '/usr/bin/clangd',
	\    args: ['--background-index']
	\  }])
call LspAddServer([#{
	\    name: 'rust-analyzer',
	\    filetype: ['rust'],
	\    path: '/usr/bin/rust-analyzer',
	\    args: []
	\  }])
call LspAddServer([#{
	\    name: 'jedi-language-server',
	\    filetype: ['python'],
	\    path: '/usr/bin/jedi-language-server',
	\    args: []
	\  }])

nnoremap <buffer> gd <cmd>LspGotoDefinition<CR>
nnoremap <buffer> gD <cmd>LspDiag<CR>
nnoremap <buffer> g] <cmd>LspDiag next<CR>
nnoremap <buffer> g[ <cmd>LspDiag prev<CR>
nnoremap <buffer> gG <cmd>LspCodeAction<CR>
nnoremap <buffer> K <cmd>LspHover<CR>
