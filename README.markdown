Name
----

publican-makefile — a universal makefile for Publican-managed DocBook projects


Synopsis
--------

    make [OPTION...] [TARGET...]


Description
-----------

Publican-makefile provides an easy way to build projects managed by Publican, an open-source publishing system for documentation authored in DocBook XML. Once the attached **Makefile** is copied to the root directory of a DocBook project, users can simply type **make** to build an HTML version for the desktop, or use the **make** ***target*** command to build the document in any of the supported formats.

This project does not replace Publican. A working installation of Publican 2.5 or newer is required for the makefile to function.


Options
-------

The following *OPTION*s can be used to customize the way the document is built:

* **LANGUAGE**=*language_code* — Allows you to specify the code of the language in which the document is written. The default value is **en-US** (American English).
* **CONFIG**=*file_name* — Allows you to specify the configuration file to use. The default value is **publican.cfg**.
* **MAINFILE**=*file_name* — Allows you to specify the file that contains important document information such as the title, edition, or product name. Depending on the document type, the default value is either **Article_Info.xml** or **Book_Info.xml**.


Targets
-------

The following *TARGET*s can be used to specify what to build:

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
* **package** — Builds a package.
* **test** — Validates the XML files.
* **clean** — Removes temporary files and directories.


References
----------

For more information about Publican or DocBook XML, refer to the following resources:

* [Publican Wiki](https://fedorahosted.org/publican/) — The Publican Wiki serves as the official website for Publican and provides links to other documents, as well as information on how to subscribe to its mailing list or report a bug with Bugzilla.
* [Publican User's Guide](http://jfearn.fedorapeople.org/en-US/Publican/2.7/html/Users_Guide/index.html) — The Publican User's Guide describes in detail how to install and use Publican to create, manage, and publish DocBook XML-based documents.
* [DocBook: The Definitive Guide](http://www.docbook.org/tdg/) — DocBook: The Definitive Guide serves as the official documentation and reference book of DocBook XML.


See Also
--------

**publican**(1), **make**(1)

Copyright
---------

Copyright © 2011, 2012 Jaromir Hradilek

This program is free software; see the source for copying conditions. It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
