NOTEBOOKS ?=./notebooks/*.ipynb
NOTEBOOK ?=./notebooks/series-informe-bcra.ipynb
REPORT ?=./reports/series-informe-bcra.html

html:
	jupyter nbconvert  --template data-report.tpl --to html --output-dir ./reports $(NOTEBOOKS)

watch:
	while inotifywait -e close_write $(NOTEBOOK); do jupyter nbconvert  --template data-report.tpl --to html --output-dir ./reports $(NOTEBOOK); done

clean_white_spaces:
	python shrink_file.py --file '$(REPORT)'



