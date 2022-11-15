if (NOT DEBUG)
  string(APPEND FFLAGS " -target=zen3 -Minline -Mcache_align")
endif()
