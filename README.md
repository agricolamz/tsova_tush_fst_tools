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

- In order to transcribe from mkherduli to latin you need to use the following command (*at't'iv* means 'fate, luck')

```{bash}
!make -s mkherduli_transcription INPUT="ატტივ" 
```

```
at't'iv
```

- In order to transcribe from latin to mkherduli you need to use the following command (*pħe* means 'village')[^comment]

[^comment]: You need to be aware that there are multiple ways typing ŏ, t' etc. If you have problems, copy from the transliteration section.

```{bash}
!make latin_transcription INPUT="pħe" 
```

```
ფჰ'ე
```

- In order to gloss you need to use the following command (*vašeⁿ korcʼil* means 'brother’s wedding'):

```{bash}
!make -s glossing INPUT="vašeⁿ korcʼil"
```

```
vašeⁿ	vašŏ.N.VB.obl-gen

korcʼil	korcʼil.N.DD

```

- In order to see all possible forms for some lemma you can run a substring search. In order to do it, all symbols should be separated by spaces, all tags should be surrounded by `%<...%>` (kʼnat means ‘boy’ or ‘son’):

```{bash}
!make -s substring_search INPUT="k ʼ n a t %<N%> ?*"
```

```
hfst-compose-intersect: Warning: 
Found output symbols (e.g. "@_IDENTITY_SYMBOL_@") in transducer in
file <stdin> which will be filtered out because they are
not found on the input tapes of transducers in file
bbl_generator.hfst.
kʼnat
kʼnat.N.VB
kʼnate
kʼnat.N.VB.obl-lat
kʼnate
kʼnat.N.VB.obl-ess
kʼnate-ħ
kʼnat.N.VB.obl-ess
kʼnate-s
kʼnat.N.VB.obl-erg
kʼnate-ⁿ
kʼnat.N.VB.obl-gen
kʼnate-n
kʼnat.N.VB.obl-dat
kʼnate-v
kʼnat.N.VB.obl-ins
kʼnate-x
kʼnat.N.VB.obl-cont
kʼnate-go-ħ
kʼnat.N.VB.obl-ad-ess
kʼnate-go-ren
kʼnat.N.VB.obl-ad-abl
kʼnate-go-ğ
kʼnat.N.VB.obl-ad-trans
kʼnate-go-mciⁿ
kʼnat.N.VB.obl-ad-term
kʼnate-gŏ
kʼnat.N.VB.obl-ad.lat
kʼnate-go
kʼnat.N.VB.obl-ad.ess
kʼnate-lo-ħ
kʼnat.N.VB.obl-inter-ess
kʼnate-lo-ren
kʼnat.N.VB.obl-inter-abl
kʼnate-lo-ğ
kʼnat.N.VB.obl-inter-trans
kʼnate-lo-mciⁿ
kʼnat.N.VB.obl-inter-term
kʼnate-lŏ
kʼnat.N.VB.obl-inter.lat
kʼnate-lo
kʼnat.N.VB.obl-inter.ess
kʼnate-i-ħ
kʼnat.N.VB.obl-in-ess
kʼnate-i-ren
kʼnat.N.VB.obl-in-abl
kʼnate-i-ğ
kʼnat.N.VB.obl-in-trans
kʼnate-i-mciⁿ
kʼnat.N.VB.obl-in-term
kʼnate-i
kʼnat.N.VB.obl-in.lat
kʼnate-i
kʼnat.N.VB.obl-in.ess
kʼnate-ren
kʼnat.N.VB.obl-abl
kʼnate-ğ
kʼnat.N.VB.obl-trans
kʼnate-mciⁿ
kʼnat.N.VB.obl-term
kʼnate-guiħ
kʼnat.N.VB.obl-apud.lat
kʼnate-xiⁿ
kʼnat.N.VB.obl-apud.abl
kʼnate-ciⁿ
kʼnat.N.VB.obl-apud.ess
kʼnate
kʼnat.N.VB.obl.lat
kʼnate
kʼnat.N.VB.obl.ess
```
