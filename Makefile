.PHONY: all

all: bbl_analyzer.hfstol bbl_generator.hfstol

substring_search: bbl_generator.hfst
	@echo "$(INPUT)" | hfst-regexp2fst | hfst-compose-intersect bbl_generator.hfst | hfst-invert | hfst-fst2strings | awk -f linguistic_view.awk | tr ":" "\n"

glossing: bbl_analyzer.hfstol bbl_generator.hfstol
	@echo "$(INPUT)" | hfst-proc bbl_analyzer.hfstol | awk -f reformat_for_the_form_segmentation.awk | hfst-proc -x bbl_generator.hfstol | awk -f linguistic_view.awk | awk -f swap_columns.awk | column -t

raw_glossing: bbl_analyzer.hfstol
	@echo "$(INPUT)" | hfst-proc -x $^ | awk -f linguistic_view.awk

bbl_%.hfstol: bbl_%.hfst
	hfst-fst2fst -O $< -o $@

bbl_analyzer.hfst: bbl_generator.hfst remove_hyphen.hfst
	hfst-compose-intersect $^ | hfst-invert -o $@

remove_hyphen.hfst: remove_hyphen.twol
	hfst-twolc -q $< -o $@

bbl_generator.hfst: bbl_nouns.hfst
	cp bbl_nouns.hfst $@

bbl_%_merged.hfst: bbl_%.hfst bbl_%_twol.hfst
	hfst-compose-intersect $^ -o $@

bbl_%_twol.hfst: bbl_%.twol
	hfst-twolc -q $< -o $@

bbl_%.hfst: bbl_%.lexd
	lexd $< | hfst-txt2fst -o $@

bbl_%.lexd: bbl_%_formation.lexd bbl_%_lexicon.lexd
	cat $^ > $@

latin_transcription: la2mkh.awk
	@echo "$(INPUT)" | awk -f $^

mkherduli_transcription: mkh2la.awk
	@echo "$(INPUT)" | awk -f $^

clean:
	rm -f *.hfst *.hfstol

requirements:
	curl -s https://apertium.projectjj.com/apt/install-nightly.sh | sudo bash
	sudo apt-get install hfst lexd

