PATH = en
SOURCE_FILENAME =  0200-12-31-beginner.md 0200-12-21-moving-forward.md 0200-12-26-gps.md 0200-12-30-introduction.md
PDF_OUTPUT = samp
PDF_BUILDER = pandoc
PDF_BUILDER_FLAGS = \
	--latex-engine xelatex \
	--template ../common/pdf-template.tex \
	--listings

#Image path to replace
old = /images/en
new = images/en


#Convertion of Markdown to PDF
pdf_build: string_replace
	$(shell cd $(PATH) && $(PDF_BUILDER) $(PDF_BUILDER_FLAGS) $(SOURCE_FILENAME) -o $(PDF_OUTPUT).pdf)

# Replace image path and remove YAML rules
string_replace:
	$(shell cd $(PATH) && grep -rl $(old) ./ | xargs sed -i "s|$(old)|$(new)|g" && grep -rl ./ | xargs sed -i 1,6d )

# Resize images
#image_resize:

clean:
	rm -f */$(BOOK_OUTPUT).pdfmake



