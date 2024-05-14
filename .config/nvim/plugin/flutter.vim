" Project-specific settings when working in the Flutter engine codebase.
if expand('%:p:h') ==# expand('~/Developer/flutter/engine/src/flutter')
  set path+=shell/platform/darwin/ios/**
  set path+=shell/platform/darwin/common/**
  set path+=shell/platform/darwin/graphics/**
endif
