-- Adjust this setting to control where the objects get created.
SET search_path = public;

--
-- Turn off echoing so that expected file
-- does not depend on contents of this file.
--
SET client_min_messages = warning;
\set ECHO none
\i ts_toolkit.sql
\set ECHO all
RESET client_min_messages;

-- ts_score

SELECT ts_score(to_tsvector('english', '1 2 3 4 5'), to_tsquery('english', '1'));
SELECT ts_score(to_tsvector('english', '1 2 3 4 5'), to_tsquery('english', '1&2'));
SELECT ts_score(to_tsvector('english', '1 2 3 4 5'), to_tsquery('english', '1|2'));

SELECT ts_score(to_tsvector('english', '1 2 3 2 1'), to_tsquery('english', '1&2'));
SELECT ts_score(to_tsvector('english', '1 2 3 2 1'), to_tsquery('english', '1|2'));

