IF (MPG123_ROOT)
    # force re-find programs
    set(MPG123_LIBRARY NOTFOUND CACHE FILE "" FORCE)
    set(MPG123_INCLUDE_DIR NOTFOUND CACHE PATH "" FORCE)
ENDIF (MPG123_ROOT)

FIND_LIBRARY(MPG123_LIBRARY mpg123 HINTS ${MPG123_ROOT} PATH_SUFFIXES "lib") 
find_path(MPG123_INCLUDE_DIR NAMES mpg123.h HINTS ${MPG123_ROOT} PATH_SUFFIXES "include")

IF (MPG123_INCLUDE_DIR AND MPG123_LIBRARY)
   SET(MPG123_FOUND TRUE)
ENDIF (MPG123_INCLUDE_DIR AND MPG123_LIBRARY)


IF (MPG123_FOUND)
   IF (NOT MPG123_FIND_QUIETLY)
      MESSAGE(STATUS "Found MPG123: ${MPG123_LIBRARY}")
   ENDIF (NOT MPG123_FIND_QUIETLY)
ELSE (MPG123_FOUND)
   IF (MPG123_FIND_REQUIRED)
      MESSAGE(WARNING "Could not find MPG123")
   ENDIF (MPG123_FIND_REQUIRED)
ENDIF (MPG123_FOUND)
