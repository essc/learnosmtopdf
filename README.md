Procedure to convert the LearnOSM markdown files to PDF
=================

1. Install pandoc, haskell and latex dependencies.
2. Clone this repository: https://github.com/essc/learnosmtopdf 
3. Clone the leaornOSM repo: https://github.com/hotosm/learnosm
4. Create a  directory folder and copy the markdown files you want rendered.
5. Copy the `images` directory from the learnosm repor to the directory your just created.
6. Edit the `Makefile`:
	- PATH, this is where all the markdown files to be converted were located
	- SOURCE_FILENAME, input all the markdown files to be converted (in order)
	- PDF_OUTPUT, it will be the filename of the output PDF
	- PDF_BUILDER, we used pandoc as the converter
	- PDF_BUILDER_FLAGS, this is where the template is wherein you can design your file using LaTex script

7. In the Terminal, look for the directory where you added the repository then run `make`. 
8. To get updates from the main LearnOSM repo, pull updates, copy again the markdown files and images and run `make` again.
 
