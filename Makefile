.DEFAULT_GOAL: requirements

.PHONY: requirements forms clean

requirements:
	@curl -s https://apertium.projectjj.com/apt/install-nightly.sh | sudo bash
	sudo apt-get install hfst lexd

transcribe_latin: la2mkh.awk
	@echo "$(INPUT)" | awk -f $^

transcribe_mkherduli: mkh2la.awk
	@echo "$(INPUT)" | awk -f $^
