PATH = en
SOURCE_FILENAME =  stub_0300-01-01-essc-foreword.md \
0200-12-31-beginner.md 0200-12-30-introduction.md 0200-12-29-start-osm.md 0200-12-28-start-josm.md 0200-12-27-more-about-josm.md 0200-12-26-gps.md 0200-12-24-papers.md 0200-12-23-editing-with-josm.md  0200-12-21-moving-forward.md \
0300-12-31-editing.md 0300-11-30-josm-tools.md 0300-11-29-josm-plugins.md 0300-11-28-josm-more-tools.md 0300-11-16-aerial-imagery.md 0300-11-15-correcting-imagery-offset.md 0300-11-20-josm-relations.md 0300-11-18-editing-techniques.md 0300-11-12-josm-conflict-resolution.md 0300-11-27-josm-presets.md 0300-11-26-creating-custom-presets.md \
0500-12-31-coordination.md 0500-11-29-tasking-manager.md \
0900-12-30-mobile_mapping.md 0900-12-29-osmand.md 0900-12-26-gpsessentials.md 0900-12-28-oruxmaps.md 0900-12-27-osmtracker.md \
0600-12-31-osm-data.md 0600-12-30-data-overview.md 0600-12-20-file-formats.md 0600-12-14-geofabrik-and-hotexport.md 0600-12-13-osm-in-qgis.md \
0700-12-31-map-design.md 0700-11-30-mapbox.md 0700-11-29-tilemill.md \
stub_0200-11-30-cc0-license.md \

#0600-12-10-setting-up-postgresql.md 0600-12-09-osm2pgsql.md 0600-12-08-osmosis.md \


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
	$(shell cd $(PATH) && grep -rl --include="*.md" ./ | xargs sed -i -e "s|$(old)|$(new)|g" -i -e "1,8d" -i -e "0,/---/ s///")


clean:
	rm -f */$(BOOK_OUTPUT).pdfmake



