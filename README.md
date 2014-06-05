Procedure to convert the LearnOSM markdown files to PDF

1. Install pandoc, haskell and latex dependencies.
2. Clone this repository: https://github.com/essc/lernosmtopdf 
3. Clone the leaornOSM repo: http://github.com/hotosm/learnosm
4.Choose folder as the directory of markdown files you want to convert
5. Edit the Makefile:
	- PATH, this is where all the markdown files to be converted were located
	- SOURCE_FILENAME, input all the markdown files to be converted (in order)
	- PDF_OUTPUT, it will be the filename of the output PDF
	- PDF_BUILDER, we used pandoc as the converter
	- PDF_BUILDER_FLAGS, this is where the template is wherein you can design your file using LaTex script

Step 1: Replacing Image Path
---------------------
	We're changing it to make the path global in converting PDF
	
	`grep -rl $(old) ./ | xargs sed -i -e "s|$(old)|$(new)|g"` 

	- Using grep it will look for files having "$(old)" which is the varibale of "/images/en"
	- Then, using sed it will change strings from variable "$(old)" to $(new)

Step 2: Removing YAML rules
---------------------
	YAML didn't work during the convertion so we've decided to remove it

	`sed  -i "1,7d"`

	- Using sed we were going to remove lines from 1-7 where the YAML is located

Step 3: Convertion of MArkdon to PDF
----------------------

	`$(shell cd $(PATH) && $(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILENAME) -o $(PDF_OUTPUT).pdf)`

	We're going to covert the file using Pandoc. After setting the variable, we're going to call it to make this:

	`pandoc --latex-engine xelatex --template ../common/pdf-template.tex --listings (all the markdown files) -o samp.pdf`

5. In the Terminal, look for the directory where you added the repository then run `make`. 

To get updates, pull updates from LearnOSM and run `make` again. 
