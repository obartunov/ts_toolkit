#  ts_toolkit/Makefile

EXTENSION = ts_toolkit
MODULE_big = ts_toolkit
OBJS = tsscore.o
REGRESS = ts_toolkit

DATA = ts_toolkit--1.0.sql

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/ts_toolkit
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
