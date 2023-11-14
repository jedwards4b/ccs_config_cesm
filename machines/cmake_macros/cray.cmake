if (compile_threaded)
  string(APPEND CFLAGS " -fopenmp")
endif()
if (DEBUG)
  string(APPEND CFLAGS " -g -O0")
endif()
if (NOT DEBUG)
  string(APPEND CFLAGS " -O2")
endif()
string(APPEND CPPDEFS " -DFORTRANUNDERSCORE -DNO_R16 -DCPRCRAY")
if (COMP_NAME STREQUAL pop)
  string(APPEND CPPDEFS " -DDIR=NOOP")
endif()
if (COMP_NAME STREQUAL moby)
  string(APPEND CPPDEFS " -DDIR=NOOP")
endif()
set(FC_AUTO_R8 "-s real64")
string(APPEND FFLAGS " -h byteswapio -x dir -ef")
set(FREEFLAGS " -f free")
set(FIXEDFLAGS " -f fixed -N 1023")
if (compile_threaded)
  string(APPEND FFLAGS " -h omp")
endif()
if (DEBUG)
  string(APPEND FFLAGS " -g -O0 -K trap=fp  -m1")
endif()
if (NOT DEBUG)
  string(APPEND FFLAGS " -O2,ipa2 -em")
endif()
set(FFLAGS_NOOPT "-O1,fp2,ipa0,scalar0,vector0")
set(HAS_F2008_CONTIGUOUS "TRUE")
set(LDFLAGS "-Wl,--allow-multiple-definition ")
