string(APPEND CFLAGS " -gopt  -time")
if (compile_threaded)
  string(APPEND CFLAGS " -mp")
endif()
if (NOT DEBUG)
  string(APPEND CFLAGS " -O -Mnofma")
  string(APPEND FFLAGS " -O -Mnofma")
endif()

string(APPEND CPPDEFS " -DFORTRANUNDERSCORE -DNO_SHR_VMATH -DNO_R16  -DCPRPGI")
set(CXX_LINKER "CXX")
set(FC_AUTO_R8 "-r8")
string(APPEND FFLAGS " -i4 -gopt  -time -Mextend -byteswapio -Mflushz -Kieee")
if (compile_threaded)
  string(APPEND FFLAGS " -mp")
endif()
if (DEBUG)
  string(APPEND FFLAGS " -O0 -g -Ktrap=fp -Mbounds -Kieee")
endif()
if (COMP_NAME STREQUAL datm)
  string(APPEND FFLAGS " -Mnovect")
endif()
if (COMP_NAME STREQUAL dlnd)
  string(APPEND FFLAGS " -Mnovect")
endif()
if (COMP_NAME STREQUAL drof)
  string(APPEND FFLAGS " -Mnovect")
endif()
if (COMP_NAME STREQUAL dwav)
  string(APPEND FFLAGS " -Mnovect")
endif()
if (COMP_NAME STREQUAL dice)
  string(APPEND FFLAGS " -Mnovect")
endif()
if (COMP_NAME STREQUAL docn)
  string(APPEND FFLAGS " -Mnovect")
endif()
set(FFLAGS_NOOPT "-O0")
set(FIXEDFLAGS "-Mfixed")
set(FREEFLAGS "-Mfree")
set(HAS_F2008_CONTIGUOUS "FALSE")
set(LDFLAGS "-time -Wl,--allow-multiple-definition")
if (compile_threaded)
  string(APPEND LDFLAGS " -mp")
endif()
set(MPICC "mpicc")
set(MPICXX "mpicxx")
set(MPIFC "mpif90")
set(SCC "nvc")
set(SCXX "nvc++")
set(SFC "nvfortran")
if (GPU_TYPE STREQUAL v100 AND GPU_OFFLOAD STREQUAL openacc)
   string(APPEND GPUFLAGS  " -acc -gpu=cc70,lineinfo,nofma -Minfo=accel ")
endif()
if (GPU_TYPE STREQUAL v100 AND GPU_OFFLOAD STREQUAL openmp)
   string(APPEND GPUFLAGS  " -mp=gpu -gpu=cc70,lineinfo,nofma -Minfo=accel ")
endif()
if (GPU_TYPE STREQUAL v100 AND GPU_OFFLOAD STREQUAL combined)
   string(APPEND GPUFLAGS  " -acc -gpu=cc70,lineinfo,nofma -mp=gpu -Minfo=accel ")
endif()
if (GPU_TYPE STREQUAL a100 AND GPU_OFFLOAD STREQUAL openacc)
   string(APPEND GPUFLAGS  " -acc -gpu=cc80,lineinfo,nofma -Minfo=accel ")
endif()
if (GPU_TYPE STREQUAL a100 AND GPU_OFFLOAD STREQUAL openmp)
   string(APPEND GPUFLAGS  " -mp=gpu -gpu=cc80,lineinfo,nofma -Minfo=accel ")
endif()
if (GPU_TYPE STREQUAL a100 AND GPU_OFFLOAD STREQUAL combined)
   string(APPEND GPUFLAGS  " -acc -gpu=cc80,lineinfo,nofma -mp=gpu -Minfo=accel")
endif()
