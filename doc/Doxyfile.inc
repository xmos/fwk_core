# This file provides overrides to the Doxyfile configuration

PROJECT_NAME = XCORE Core Framework
PROJECT_BRIEF = "XCORE Core Framework"

PREDEFINED = __DOXYGEN__=1 
PREDEFINED += DWORD_ALIGNED=
PREDEFINED += __attribute__((weak))=
PREDEFINED += C_API= MA_C_API= C_API_START= C_API_END= EXTERN_C=

# library APIs
INPUT += ../modules/xs3_math 

USE_MATHJAX = YES
MATHJAX_FORMAT = HTML-CSS
MATHJAX_RELPATH = https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/

# Make short MATHJAX sequences prettier
ALIASES += math{1}="@f$\1@f$"
ALIASES += vector{1}="@f$\bar \1@f$"
ALIASES += operation{1}="@par Operation Performed:^^@f{align*}{ \1 @f}"
ALIASES += "beginrst=^^\verbatim embed:rst^^"
ALIASES += "endrst=\endverbatim"
