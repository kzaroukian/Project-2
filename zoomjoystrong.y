%{

/****************************************
*
* bison file for CIS 343 Project 2
* by Kaylin Zaroukian 10/25/17
* creates grammar for zoom joy strong
*****************************************/

#include<stdio.h>
#include "zoomjoystrong.h"
%}

%start program
/** creates token types **/
%{
int yylex();
void yyerror(char *s);

%}

%union{
        int intValue;
        float floatValue;

}

/** int token **/
%token <intValue> INT
/** float token **/
%token <floatValue> FLOAT
/** circle token **/
%token CIRCLE
/** end token ends program **/
%token END
/** end statement ends line **/
%token END_STATEMENT
/** line token **/
%token LINE
/** rectangle token **/
%token RECTANGLE
/** sets color token **/
%token SET_COLOR
/** point token **/
%token POINT
/** error token **/
%token ERROR_INVALID
%%
/** Context Free Grammar **/

/** defines the grammar **/
program: list end_state;
/**     { setup();}; **/
/** defines a list of statements **/
list:   stat
        |
        stat list;
/** defines statements **/
stat:   point
        |
        circle
        | 
        line
        |
        rectangle
        |
        set_color
        |
        error_invalid
        ;
/** defines point **/
point:  POINT INT INT END_STATEMENT
        {
           if($2 > 1024 || $2 < 0){
                yyerror("Out of Range");
        }

        if($3 > 768 || $3 < 0){

            yyerror("Out of Range");
        }
        point($2, $3);
        }
        ;
/** defines circle **/
circle: CIRCLE INT INT INT END_STATEMENT
        {
           if($2 > 1024 || $2 < 0){

               yyerror("Out of Range");
        }

        if($3 > 768 || $3 < 0){

            yyerror("Out of Range");
        if($4 > 1024 || $4 < 0){

            yyerror("Out of Range");
        }
        circle($2, $3, $4);
        }
        ;
end_state:      END END_STATEMENT                       {finish();exit(0);}
/** defines line **/
line:   LINE INT INT INT INT END_STATEMENT
 {
       if($2 > 1024 || $2 < 0){

          yyerror("Out of Range");

             }

          if($3 > 768 || $3 < 0){

            yyerror("Out of Range");

          }
          if($4 > 1024 || $4 < 0){
              yyerror("Out of Range");
          }
          if($5 > 768 || $5 < 0){
                  yyerror("Out of Range");
          }
           line($2,$3,$4,$5);
          }
          ;
/** defines rectangle **/
rectangle: RECTANGLE INT INT INT INT END_STATEMENT
         {
           if($2 > 1024 || $2 < 0){
                yyerror("Out of Range");
        }

        if($3 > 768 || $3 < 0){
                yyerror("Out of Range");
        }
                                                                                                                                   138,1         61%
	if($4 > 1024 || $4 < 0){
                yyerror("Out of Range");
        }
        if($5 > 768 || $5 < 0){
                yyerror("Out of Range");
        }
        rectangle($2,$3,$4,$5);
        }
        ;
/** defines set_color **/
set_color: SET_COLOR INT INT INT END_STATEMENT
           {
             if($2 > 255 || $2 < 0){
                yyerror("Out of Range");
                }
             if($3 > 255 || $3 < 0){
                yyerror("Out of Range");
                }
             if($4 > 255 || $4 < 0){
                yyerror("Out of Range");
                }
             set_color($2, $3, $4);
        }
        ;
/** catches error if nontoken is typed **/
error_invalid: ERROR_INVALID
        {
                yyerror("Invalid Input");
        };

%%
/**********************************
* main function that calls yyparse
* @param argc num arguments
* @param argv list of arguments
* @return 0
************************************/
int main(int argc, char** argv){
        setup();
        yyparse();
        return 0;
}
/**************************************************************************
* handles errors found in CFG
* @param char *s string of error
*
* referrenced:
* https://www.gnu.org/software/bison/manual/html_node/Error-Reporting.html
****************************************************************************/
void yyerror(char *s){
        fprintf(stderr,"%s\n", s);
}
