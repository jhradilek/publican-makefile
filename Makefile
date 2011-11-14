# A universal makefile for Publican-managed DocBook projects
# Copyright (C) 2011 Jaromir Hradilek <jhradilek@redhat.com>

# This program is  free software:  you can  redistribute it  and/or  modify it
# under the terms of the GNU General Public License  as published by the  Free
# Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,  but WITHOUT
# ANY WARRANTY;  without even the implied warranty of  MERCHANTABILITY or FIT-
# NESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License  for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

SHELL     = /bin/sh

# General settings;  change the path to the publican executable,  the language
# in  which the  document  is authored, the default configuration file, or the
# main file of your DocBook project:
PUBLICAN  = publican
LANGUAGE  = en-US
CONFIG    = publican.cfg
MAINFILE  = $(if $(findstring Book_Info.xml, $(FILES)),Book,Article)_Info.xml

# Known file extensions:
FILEEXTS  = XML xml ENT ent
IMAGEEXTS = BMP bmp CGM cgm DVI dvi EPS eps EQN eqn FAX fax GIF gif IGS igs \
            PCX pcx PDF pdf PIC pic PNG png SVG svg SWF swf TLB tbl TEX tex \
            WMF wmf WPG wpg PS ps SGML sgml TIFF tiff

# Known directories:
FILEDIR  := $(LANGUAGE)
IMAGEDIR := $(LANGUAGE)/images
ICONDIR  := $(LANGUAGE)/icons
BUILDDIR := tmp/$(LANGUAGE)
PUBDIR    = publish/$(LANGUAGE)/$(PRODNAME)/$(PRODNUM)

# Essential prerequisites:
FILES    := $(foreach ext, $(FILEEXTS),  $(wildcard $(FILEDIR)/*.$(ext)))
IMAGES   := $(foreach ext, $(IMAGEEXTS), $(wildcard $(IMAGEDIR)/*.$(ext)))
ICONS    := $(foreach ext, $(IMAGEEXTS), $(wildcard $(ICONDIR)/*.$(ext)))

# Helper functions:
getoption = $(shell ( grep -qe '^[ \t]*$(1):' $(CONFIG) && sed -ne 's/^[ \t]*$(1):[ \t]*\([a-zA-Z0-9._ ]\+\).*/\1/p' $(CONFIG) || sed -ne 's/^.*<$(2)>\(.\+\)<\/$(2)>.*/\1/ip' $(FILEDIR)/$(MAINFILE) ) | sed -e 's/[ \t]*$$//')

# Helper variables:
EMPTY    :=
SPACE    := $(EMPTY) $(EMPTY)
PRODNUM  := $(subst $(SPACE),_,$(call getoption,version,productnumber))
PRODNAME := $(subst $(SPACE),_,$(call getoption,product,productname))

# The following are the make rules;  do not edit  these unless you really know
# what you are doing:
.PHONY: html-desktop
html-desktop: $(BUILDDIR)/html-desktop

.PHONY: html-single
html-single: $(BUILDDIR)/html-single

.PHONY: html
html: $(BUILDDIR)/html

.PHONY: epub
epub: $(BUILDDIR)/epub

.PHONY: pdf
pdf: $(BUILDDIR)/pdf

.PHONY: txt
txt: $(BUILDDIR)/txt

.PHONY: man
man: $(BUILDDIR)/man

.PHONY: eclipse
eclipse: $(BUILDDIR)/eclipse

.PHONY: all
all: html-desktop html-single html epub pdf txt man eclipse

.PHONY: publish
publish: $(addprefix $(PUBDIR)/, html-single html epub pdf)

.PHONY: clean
clean:
	$(PUBLICAN) clean

.PHONY: test
test: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format test

$(BUILDDIR)/html-desktop: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format html-desktop && touch $@

$(BUILDDIR)/html-single: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format html-single && touch $@

$(BUILDDIR)/html: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format html && touch $@

$(BUILDDIR)/epub: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format epub && touch $@

$(BUILDDIR)/pdf: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format pdf && touch $@

$(BUILDDIR)/txt: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format txt && touch $@

$(BUILDDIR)/man: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format man && touch $@

$(BUILDDIR)/eclipse: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format eclipse && touch $@

$(PUBDIR)/html-single: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --publish --embedtoc --lang $(LANGUAGE) --format html-single && touch $@

$(PUBDIR)/html: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --publish --embedtoc --lang $(LANGUAGE) --format html && touch $@

$(PUBDIR)/epub: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --publish --embedtoc --lang $(LANGUAGE) --format epub && touch $@

$(PUBDIR)/pdf: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --publish --embedtoc --lang $(LANGUAGE) --format pdf && touch $@

