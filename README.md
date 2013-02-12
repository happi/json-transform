json-transform
==============

The parse transform json-transfom lets you write Json structures directly in your Erlang code, and it will be translated into Erlang terms in accordance with EEP-18.

For now it only handles one of the suggested formats in EEP-18, one could possibly implement options to the transform to get other translations.

You use the special marker: <<"json">> = Json-Term to use the json syntax:

An empty json object {} is translated into [{}].

An json object with fields {Label : Term} is translated into [{<<"Label>>, translate(Term)}].

A json array [1,2,3] is translated into a list: [1,2,3].

A json string "foo" is translated into a binary string <<"foo">>.

A json integer is translated into an erlang integer and a float into a float.

The json constants _true_, _false_, and _null_ are translated into the atoms 'true', 'false', and 'null'.

A variable referens is left as it is, it is assumed to contain an Erlang representation of a json object.

Example:
  
  foo() ->
    <<"json">> = { "foo" : 42 }.

is translated into 
  foo() ->
    [{<<"foo">>, 42}].

 