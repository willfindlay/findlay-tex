.PHONY: install

# TEXDIR=$(shell kpsewhich -var-value=TEXMFHOME)/tex/latex/local
TEXDIR=${HOME}/texmf/tex/latex/local
TEXFILES=$(shell find ./ -type f \( -iname \*.cls -o -iname \*.sty \))

install:
	@mkdir -p $(TEXDIR); \
	for file in $(TEXFILES); \
		do echo "Installing $${file}..." && \
		cp $${file} $(TEXDIR) && \
		echo "$${file} installed."; \
	done;
