%{
 /**************************************************
  * Lex file for project 2
  * by Kaylin Zaroukian
  * Creates tokens for zoomjoystrong
  **************************************************/

  #include <stdio.h>
  #include "zoomjoystrong.h" 
  #include "zoomjoystrong.tab.h"


%}

%option noyywrap

%%

end	    {
		return END;
	    }

[+-]?[0-9]+  {
		yylval.intValue = atoi(yytext);
		return INT;
	     }
		
^[-+][0-9]+\.[0-9]+[eE][-+]?[0-9]+$ { 
			    yylval.floatValue = atof(yytext);
			    return FLOAT;
			}


(circle)    {
		return CIRCLE;
	    }


(point)    {
		return POINT;
	   }

(line)     {
		return LINE;
	   }

(rectangle) {
	 	return RECTANGLE;
 	    }

(set_color) {
		return SET_COLOR;
	    }


;$	    {
		return END_STATEMENT;
	    }

\s         ;  
[^(point)|(circle)|(line)|(set_color)|(end)|;|[0-9]] { 
							return ERROR_INVALID;
					       	}


%%
