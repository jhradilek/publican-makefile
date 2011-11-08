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


# General settings; change the path to the publican executable or the language
# in which the document is authored as appropriate:
SHELL     = /bin/sh
PUBLICAN  = publican
LANGUAGE  = en-US

# Default directories:
FILEDIR   = $(LANGUAGE)
IMAGEDIR  = $(LANGUAGE)/images
ICONDIR   = $(LANGUAGE)/icons
BUILDDIR  = tmp/$(LANGUAGE)

# Known file extensions:
FILEEXTS  = XML xml ENT ent
IMAGEEXTS = BMP bmp CGM cgm DVI dvi EPS eps EQN eqn FAX fax GIF gif IGS igs \
            PCX pcx PDF pdf PIC pic PNG png SVG svg SWF swf TLB tbl TEX tex \
            WMF wmf WPG wpg PS ps SGML sgml TIFF tiff

# Prerequisites:
FILES     = $(foreach ext, $(FILEEXTS),  $(wildcard $(FILEDIR)/*.$(ext)))
IMAGES    = $(foreach ext, $(IMAGEEXTS), $(wildcard $(IMAGEDIR)/*.$(ext)))
ICONS     = $(foreach ext, $(IMAGEEXTS), $(wildcard $(ICONDIR)/*.$(ext)))

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

.PHONY: clean
clean:
	$(PUBLICAN) clean

.PHONY: test
test: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format test

$(BUILDDIR)/html-desktop: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format html-desktop

$(BUILDDIR)/html-single: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format html-single

$(BUILDDIR)/html: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format html

$(BUILDDIR)/epub: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format epub

$(BUILDDIR)/pdf: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format pdf

$(BUILDDIR)/txt: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format txt

$(BUILDDIR)/man: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format man

$(BUILDDIR)/eclipse: $(FILES) $(IMAGES) $(ICONS)
	$(PUBLICAN) build --lang $(LANGUAGE) --format eclipse

