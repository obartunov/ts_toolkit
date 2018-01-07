-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION ts_toolkit" to load this file. \quit

-- Adjust this setting to control where the objects get created.
SET search_path = public;

CREATE OR REPLACE FUNCTION ts_score( float4[], tsvector, tsquery )
RETURNS float4
AS '$libdir/ts_toolkit', 'ts_score_wtt'
LANGUAGE C STRICT VOLATILE;

CREATE OR REPLACE FUNCTION ts_score( float4[], tsvector, tsquery, integer )
RETURNS float4
AS '$libdir/ts_toolkit', 'ts_score_wttf'
LANGUAGE C STRICT VOLATILE;

CREATE OR REPLACE FUNCTION ts_score( tsvector, tsquery )
RETURNS float4
AS '$libdir/ts_toolkit', 'ts_score_tt'
LANGUAGE C STRICT VOLATILE;

CREATE OR REPLACE FUNCTION ts_score( tsvector, tsquery, integer )
RETURNS float4
AS '$libdir/ts_toolkit', 'ts_score_ttf'
LANGUAGE C STRICT VOLATILE;
