all:
	preview

.PHONY: deploy staging update preview

preview:
	python compile.py preview && \
	cd published && \
	python -m http.server

# usage: make deploy m="commit message"
deploy:
	python compile.py production && \
	cd ../cs189.github.io && \
	git pull --force && \
	cp -r ../staging/published/* . && \
	cp ../staging/published/.gitignore . && \
	git add . && \
	git commit -m "deploy: $(m)" --allow-empty && \
	git push

# usage: make staging m="commit message"
staging:
	git pull && \
	rm -rf published && \
	python compile.py staging && \
	git add . && \
	git commit -m "stage: $(m)" --allow-empty && \
	git push && \
	make update

# Pushes the published folder to gh-pages to update the staging webpage.
update:
	git push origin `git subtree split --prefix published master`:gh-pages --force
	git subtree split --rejoin --prefix=published master
