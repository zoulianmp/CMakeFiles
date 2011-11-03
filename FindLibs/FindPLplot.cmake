# Find PLplot headers and libraries
# AF, October 2010


# Check for the presence of the PLplot headers and libraries
#
# This CMake module defines the following variables:
#  PLplot_FOUND        =  Libraries and headers found; TRUE/FALSE
#  PLplot_INCLUDES     =  Path to the PLplot header files
#  PLplot_LIBRARIES    =  Path to all parts of the PLplot libraries
#  PLplot_LIBRARY_DIRS =  Path to the directories containing the PLplot libraries



# Standard locations where to look for required components:
include( CMakeLocations )



# Check for the header files:
find_path( PLplot_INCLUDE_DIR
  #NAMES plplot.h
  NAMES plplot.mod
  PATHS ${include_locations} ${lib_locations}
  PATH_SUFFIXES plplot fortran/modules/plplot
)



# Check for the libraries:
if( PLplot_INCLUDE_DIR )
  
  find_library( PLplot_LIBRARY
    NAMES plplotd
    PATHS ${lib_locations}
    )
  
  if( PLplot_LIBRARY )
    set( PLplot_LIBRARY_DIR "" )
    get_filename_component( PLplot_LIBRARY_DIRS ${PLplot_LIBRARY} PATH )
    # Set uncached variables as per standard.
    set( PLplot_FOUND TRUE )
    set( PLplot_INCLUDES ${PLplot_INCLUDE_DIR} )
    set( PLplot_LIBRARIES ${PLplot_LIBRARY} )
    
  else( PLplot_LIBRARY )
    
    set( PLplot_FOUND FALSE )
    message( WARNING "FindPLplot: Could not find PLplot libraries" )
  endif( PLplot_LIBRARY )
  
  
  
  
  # Find cxx bindings:
  find_library( PLplot_cxx_LIBRARY
    NAMES plplotcxxd
    PATHS ${lib_locations}
  )
  if( PLplot_cxx_LIBRARY )
    set( PLplot_LIBRARIES ${PLplot_LIBRARIES} ${PLplot_cxx_LIBRARY} )
  endif( PLplot_cxx_LIBRARY )
  
  
  # Find F77 bindings:
  find_library( PLplot_f77_LIBRARY
    NAMES plplotf77d
    PATHS ${lib_locations}
  )
  if( PLplot_f77_LIBRARY )
    set( PLplot_LIBRARIES ${PLplot_LIBRARIES} ${PLplot_f77_LIBRARY} )
  endif( PLplot_f77_LIBRARY )
  
  
  # Find F90 bindings:
  find_library( PLplot_f90_LIBRARY
    NAMES plplotf90d
    PATHS ${lib_locations}
  )
  if( PLplot_f90_LIBRARY )
    set( PLplot_LIBRARIES ${PLplot_LIBRARIES} ${PLplot_f90_LIBRARY} )
  endif( PLplot_f90_LIBRARY )
  
  
  # Find F95 bindings:
  find_library( PLplot_f95_LIBRARY
    NAMES plplotf95d
    PATHS ${lib_locations}
  )
  if( PLplot_f95_LIBRARY )
    set( PLplot_LIBRARIES ${PLplot_LIBRARIES} ${PLplot_f95_LIBRARY} )
  endif( PLplot_f95_LIBRARY )
  
  # Find F95c bindings:
  find_library( PLplot_f95c_LIBRARY
    NAMES plplotf95cd
    PATHS ${lib_locations}
  )
  if( PLplot_f95c_LIBRARY )
    set( PLplot_LIBRARIES ${PLplot_LIBRARIES} ${PLplot_f95c_LIBRARY} )
  endif( PLplot_f95c_LIBRARY )
  
  
  # Find wxwidgets bindings:
  find_library( PLplot_wxwidgets_LIBRARY
    NAMES plplotwxwidgetsd
    PATHS ${lib_locations}
  )
  if( PLplot_wxwidgets_LIBRARY )
    set( PLplot_LIBRARIES ${PLplot_LIBRARIES} ${PLplot_wxwidgets_LIBRARY} )
  endif( PLplot_wxwidgets_LIBRARY )
  
  
else( PLplot_INCLUDE_DIR )
  
  set( PLplot_FOUND FALSE )
  message( WARNING "FindPLplot: Could not find PLplot headers" )
  
endif( PLplot_INCLUDE_DIR )


	    
if( PLplot_FOUND )
  
  if( NOT PLplot_FIND_QUIETLY )
    message( STATUS "FindPLplot: Found both PLplot headers and libraries" )
    message( STATUS "PLplot_INCLUDES  = ${PLplot_INCLUDES}" )
    message( STATUS "PLplot_LIBRARIES = ${PLplot_LIBRARIES}" )
  endif( NOT PLplot_FIND_QUIETLY )
  
else( PLplot_FOUND )
  
  if( PLplot_FIND_REQUIRED )
    message( FATAL_ERROR "FindPLplot: Could not find PLplot headers or libraries" )
  endif( PLplot_FIND_REQUIRED )
  
endif( PLplot_FOUND )

