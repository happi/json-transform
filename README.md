json-transform
==============

The parse transform json_parser lets you write Json structures
directly in your Erlang code, and it will be translated into Erlang
terms in accordance with EEP-18.

For now it only handles one of the suggested formats in EEP-18, one
could possibly implement options to the transform to get other
translations.

You use the special marker: <<{ Json-Term }>> to use the json syntax:

An empty json object {} is translated into [{}].

An json object with fields {Label : Term} is translated into
[{<<"Label>>, translate(Term)}].

A json array [1,2,3] is translated into a list: [1,2,3].

A json string "foo" is translated into a binary string <<"foo">>.

A json integer is translated into an Erlang integer and a float into a float.

The json constants _true_, _false_, and _null_ are translated into the
atoms 'true', 'false', and 'null'.

A variable reference is left as it is, it is assumed to contain an
Erlang representation of a json object.

Example:

  foo() ->
    <<{ { "foo" : 42 } }>>.

is translated into
  foo() ->
    [{<<"foo">>, 42}].

Due to the precedence rules of the ":" and "-" operators in Erlang
there is a small inconvenience, you have to put negative numbers in
objects within parentheses.

i.e.
    <<{ { "foo" : (-42) } }>>.
is ok but not
    <<{ { "foo" : -42 } }>>.
Note that negative numbers are ok by them selves or in arrays:
    <<{ [-42] }>>.
is ok.


