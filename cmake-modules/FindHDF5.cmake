if (HDF5_ROOT)
    # force re-find programs
    set(HDF5_LIBRARY NOTFOUND CACHE FILE "hdf5 library, version 1.8.x" FORCE)
    set(HDF5_HL_LIBRARY NOTFOUND CACHE FILE "hdf5_hl library, version 1.8.x" FORCE)
    set(HDF5_INCLUDE_DIR NOTFOUND CACHE PATH "path to HDF5 version 1.8.x public headers" FORCE)
endif (HDF5_ROOT)

find_library(HDF5_LIBRARY hdf5 HINTS ${HDF5_ROOT} PATH_SUFFIXES "lib" DOC "hdf5 library, version 1.8.x")
find_library(HDF5_HL_LIBRARY hdf5_hl HINTS ${HDF5_ROOT} PATH_SUFFIXES "lib" DOC "hdf5_hl library, version 1.8.x")
find_path(HDF5_INCLUDE_DIR H5PTpublic.h HINTS ${HDF5_ROOT} PATH_SUFFIXES "include" DOC "path to HDF5 version 1.8.x public headers")

if (HDF5_INCLUDE_DIR)
   foreach(CHECK_INCLUDE_FILE H5Fpublic.h H5Tpublic.h H5Apublic.h H5LTpublic.h)
     find_file(HDF5_HAS_INCLUDE_${CHECK_INCLUDE_FILE} NAMES ${CHECK_INCLUDE_FILE} PATHS ${HDF5_INCLUDE_DIR} NO_DEFAULT_PATH)
     set(HDF5_HAS_INCLUDE_${CHECK_INCLUDE_FILE} ${HDF5_HAS_INCLUDE_${CHECK_INCLUDE_FILE}} CACHE INTERNAL "mydoc")
     if (NOT HDF5_HAS_INCLUDE_${CHECK_INCLUDE_FILE})
       if (NOT HDF5_FIND_QUIETLY)
           message(WARNING " cannot find HDF5 header ${CHECK_INCLUDE_FILE} in HDF5 include dir: ${HDF5_INCLUDE_DIR}")
       endif (NOT HDF5_FIND_QUIETLY)
       set(HDF5_INCLUDE_DIR NOTFOUND CACHE STRING "HDF5 include directory" FORCE)
       break()
     endif (NOT HDF5_HAS_INCLUDE_${CHECK_INCLUDE_FILE})
   endforeach(CHECK_INCLUDE_FILE)
endif (HDF5_INCLUDE_DIR)


if (HDF5_INCLUDE_DIR AND HDF5_LIBRARY AND HDF5_HL_LIBRARY)
   set(HDF5_FOUND TRUE)
endif (HDF5_INCLUDE_DIR AND HDF5_LIBRARY AND HDF5_HL_LIBRARY)

if (HDF5_FOUND)
   if (NOT HDF5_FIND_QUIETLY)
      message(STATUS "Found HDF5: ${HDF5_LIBRARY}")
   endif (NOT HDF5_FIND_QUIETLY)
else (HDF5_FOUND)
   if (HDF5_FIND_REQUIRED)
      message(WARNING "Could not find HDF5")
   endif (HDF5_FIND_REQUIRED)
endif (HDF5_FOUND)
