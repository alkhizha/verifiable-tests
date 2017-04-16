grammar Predicates;

predicate : NEGATION? (TRUE | FALSE)         # bool_const_expr
          | NEGATION? '(' predicate ')'      # paret_predicate
          | int_expr comparison_op int_expr  # comparison_expr
          | vector_equality                  # vector_eq_pred
          | ascending_chain_cmp              # asc_chain_pred
          | descending_chain_cmp             # desc_chain_pred
          | perm                             # perm_pred
          | predicate '&&' predicate         # and_expr
          | predicate '||' predicate         # or_expr
          | predicate '=>' predicate         # implies_expr
          | predicate '<=>' predicate        # iff_expr
          ;

vector_equality : int_expr '=' int_expr                       # vector_eq_base
                | int_expr ',' vector_equality ',' int_expr   # vector_eq_rec
                ;

perm : 'perm' '(' even_var_list ')' ;

even_var_list : int_expr ',' int_expr                    # even_var_list_base
              | int_expr ',' even_var_list ',' int_expr  # even_var_list_rec
              ;

ascending_chain_cmp : int_expr (LESS | LESS_EQ) int_expr            # asc_chain_cmp_base
                    | ascending_chain_cmp (LESS | LESS_EQ) int_expr # asc_chain_cmp_rec
                    ;

descending_chain_cmp : int_expr (GREATER | GREATER_EQ) int_expr             # desc_chain_cmp_base
                     | descending_chain_cmp (GREATER | GREATER_EQ) int_expr # desc_chain_cmp_rec
                     ;

int_expr : MINUS? INT                        # int_const_expr
         | MINUS? variable                   # variable_expr
         | MINUS? '(' int_expr ')'           # paret_int_expr
         | int_expr '*' int_expr             # mult_expr
         | int_expr (PLUS | MINUS) int_expr  # add_expr
         ;

comparison_op : '<'  # lt
              | '>'  # gt
              | '<=' # leq
              | '>=' # geq
              | '='  # eq
              | '<>' # neq
              ;

variable : NAME selectors? ;

selectors : selector+ ;
selector : '[' int_expr ']' ;

LESS : '<' ;
LESS_EQ : '<=' ;
GREATER : '>' ;
GREATER_EQ : '>=' ;

NEGATION : '~' ;

MINUS : '-' ;
PLUS : '+' ;

TRUE : 'T';
FALSE : 'F';

NAME : [a-zA-Z_] [0-9a-zA-Z_]* ;
INT : '0' | [1-9] [0-9]* ;

WS : [ \t\r\n] + -> skip ;   // Skipping all the whitespaces.
