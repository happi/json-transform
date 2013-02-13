all: ebin/json_parser.beam ebin/test.beam


ebin/json_parser.beam: src/json_parser.erl
	@erlc -o ebin src/json_parser.erl


ebin/test.beam: src/test.erl ebin/json_parser.beam
	@erlc -pa "ebin" -o ebin src/test.erl

clean:
	@rm -rf ebin/*.beam
