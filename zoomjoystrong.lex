%{
 /**************************************************
  * Lex file for project 2
  * by Kaylin Zaroukian
  * Creates tokens for zoomjoystrong
  **************************************************/

  #include <stdio.h>
  #include "zoomjoystrong.h"
  #include "zoomjoystrong.tab.h"

/** could not include comments describing tokens below so
* will include them here **/

/** end token that will end program **/
/** int token that identifies ints **/
/** float token identifies floating point types **/
/** circle token finds circle **/
/** point token finds a point **/
/** rectangle token finds/identifies a rectangle **/
/** line token finds a line **/
/** set_color identifies color choice **/
/** ignores white space **/
/** end line token **/
/** token that identifies everything that isn't a previous token **/
/** referrenced http://www.rexegg.com/regex-quickstart.html to understand reg exrules * */
%}

%option noyywrap

%%

end         {
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


;$          {
                return END_STATEMENT;
            }

\s         ;
(point)|(circle)|(line)|(set_color)|(end)|;|[0-9]] {
                                                        return ERROR_INVALID;
                                                }


%%

                                            
