Procedure to convert the LearnOSM markdown files to PDF
=================

1. Install pandoc, haskell and latex dependencies.
2. Clone this repository: https://github.com/essc/learnosmtopdf 
3. Clone the learnOSM repo: https://github.com/hotosm/learnosm
4. Create a folder within `learnosmtopdf` and copy the markdown files you want rendered.
5. Copy the `images` directory from the learnosm repo to the directory your just created.
6. Edit the `Makefile`:
	- `PATH` - where all the markdown files to be converted were located
	- `SOURCE_FILENAME` - list of the markdown files you want rendered. List should be ordered 
	  according to which one should be rendered first and so on.
	- `PDF_OUTPUT` - output filename of  PDF.
	- `PDF_BUILDER` - pandoc as the converter.
	- `PDF_BUILDER_FLAGS` - pandoc related flags/parameters (i.e. LaTex script).

7. In the Terminal, look for the directory where you added the repository then run `make`. 
8. To get updates from the main LearnOSM repo, pull updates, copy again the markdown files and images and run `make` again.


Tested using Ubuntu 13.10.


