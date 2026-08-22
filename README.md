Those are NLP tools for Tsova Tush that were created during [the CauLaGe Zemo Alvani Field Research (ZAFieR) Station](https://zafier.gitpages.huma-num.fr/homepage/index.html) from August 18 to 27, 2026.

See PROBLEMS.md for the known problems.

In order to use this tools you need to open a Google Colaboratory file. 

- Open your Google Drive <https://drive.google.com>
- Click `New` at the left corner
- In the list of possible formats choose `More` and find Google Colaboratory
- In case you can't see it, press `Add more application`, type Google Colaboratory and agree to install it to your Google Drive. Then try to open Google Colaboratory blank file as described in the previous bullet.
- Paste the following code press the `Play` button and wait about 20-30 seconds.

```{bash}
!git clone -q https://github.com/agricolamz/tsova_tush_fst_tools.git; mv tsova_tush_fst_tools/* .; rm -d tsova_tush_fst_tools; make -s requirements
```

- In order to transcribe from mkherduli to latin (*at't'iv* means 'fate, luck')

```{bash}
!make -s mkherduli_transcription INPUT="ატტივ" 
```

```
at't'iv
```

- In order to transcribe from latin to mkherduli (*pħe* means 'village')[^comment]

[^comment]: You need to be aware that there are multiple ways typing ŏ, t' etc. If you have problems, copy from the transliteration section.

```{bash}
!make latin_transcription INPUT="pħe" 
```

```
ფჰ'ე
```

- In order to gloss you need to type (I expect that *badreⁿ akʼvaⁿ* means 'child's cradle'):

```{bash}
!make -s glossing INPUT="badreⁿ akʼvaⁿ"
```

```
badreⁿ	bader.N.DD.obl-gen

akʼvaⁿ	akʼvaⁿ.N.DD

```

- In order to see all possible forms for some lemma you can run a substring search. In order to do it, all symbols should be separated by spaces, all tags should be surrounded by `%<...%>` (*pħit'* means 'frog'):

```{bash}
!make -s substring_search INPUT="p ħ i t ʼ %<N%> ?*"
```

```
hfst-compose-intersect: Warning: 
Found output symbols (e.g. "@_IDENTITY_SYMBOL_@") in transducer in
file <stdin> which will be filtered out because they are
not found on the input tapes of transducers in file
bbl_generator.hfst.
pħitʼ
pħitʼ.N.BD
pħitʼe-v
pħitʼ.N.BD.obl-erg
pħitʼe-ⁿ
pħitʼ.N.BD.obl-gen
pħitʼe-n
pħitʼ.N.BD.obl-dat
pħitʼe-v
pħitʼ.N.BD.obl-ins
pħitʼe-x
pħitʼ.N.BD.obl-cont
pħitʼe-go-ħ
pħitʼ.N.BD.obl-ad-ess
pħitʼe-go-ren
pħitʼ.N.BD.obl-ad-abl
pħitʼe-go-ğ
pħitʼ.N.BD.obl-ad-trans
pħitʼe-go-mciⁿ
pħitʼ.N.BD.obl-ad-term
pħitʼe-go
pħitʼ.N.BD.obl-ad.lat
pħitʼe-lo-ħ
pħitʼ.N.BD.obl-inter-ess
pħitʼe-lo-ren
pħitʼ.N.BD.obl-inter-abl
pħitʼe-lo-ğ
pħitʼ.N.BD.obl-inter-trans
pħitʼe-lo-mciⁿ
pħitʼ.N.BD.obl-inter-term
pħitʼe-lo
pħitʼ.N.BD.obl-inter.lat
pħitʼe-i-ħ
pħitʼ.N.BD.obl-in-ess
pħitʼe-i-ren
pħitʼ.N.BD.obl-in-abl
pħitʼe-i-ğ
pħitʼ.N.BD.obl-in-trans
pħitʼe-i-mciⁿ
pħitʼ.N.BD.obl-in-term
pħitʼe-i
pħitʼ.N.BD.obl-in.lat
pħitʼe-ħ
pħitʼ.N.BD.obl-ess
pħitʼe-ren
pħitʼ.N.BD.obl-abl
pħitʼe-ğ
pħitʼ.N.BD.obl-trans
pħitʼe-mciⁿ
pħitʼ.N.BD.obl-term
pħitʼe-guiħ
pħitʼ.N.BD.obl-apud.lat
pħitʼe-xiⁿ
pħitʼ.N.BD.obl-apud.abl
pħitʼe-ciⁿ
pħitʼ.N.BD.obl-apud.ess
pħitʼe
pħitʼ.N.BD.obl.lat
```
