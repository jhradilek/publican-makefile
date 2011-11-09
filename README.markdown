Name
----

publican-makefile — a universal makefile for Publican-managed DocBook projects


Synopsis
--------

    make [OPTION...] [TARGET...]


Description
-----------

The publican-makefile provides a universal makefile to make it easier to build Publican-managed DocBook XML projects. To start using it, copy the file named **Makefile** to the root directory of your DocBook project (that is, the directory with the **publican.cfg** file).


Options
-------

* **LANGUAGE**=*language_code* — The code of the language in which the document is being written. The default value is **en-US**.
* **CONFIG**=*file_name* — The configuration file to use. The default value is **publican.cfg**.
* **MAINFILE**=*file_name* — The file that contains the document metadata. Depending on the document type,  default value is either **Article_Info.xml** or **Book_Info.xml**.


Targets
-------

* **html-desktop** — Builds a single HTML page with the table of contents in the sidebar. This is the default option.
* **html-single** — Builds a single HTML page with the table of contents at the beginning of the document.
* **html** — Builds multiple HTML pages.
* **epub** — Builds an EPUB file.
* **pdf** — Builds a PDF file.
* **txt** — Builds a plain text file.
* **man** — Builds a manual page.
* **eclipse** — Builds an Eclipse help plug-in.
* **all** — Builds the document in all available formats. Identical to running the **make** command with the **html-desktop**, **html-single**, **html**, **epub**, **pdf**, **txt**, **man**, and **eclipse** targets.
* **publish** — Prepares HTML, EPUB, and PDF builds that are ready for publishing.
* **test** — Validates the XML files.
* **clean** — Removes temporary files and directories.


References
----------

* [Publican Wiki](https://fedorahosted.org/publican/)
* [Publican User's Guide](http://jfearn.fedorapeople.org/en-US/Publican/2.7/html/Users_Guide/index.html)
* [DocBook: The Definitive Guide](http://www.docbook.org/tdg/)


Copyright
---------

Copyright © 2011 Jaromir Hradilek

This program is free software; see the source for copying conditions. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
