- Glossing tool produces both glossing line and the morpheme segmentation line. It is done by using analyzer (*pħitʼev* -> frog.N.BD.obl-erg) at the first step and generator (frog.N.BD.obl-erg -> *pħitʼe-v*) at the second step. This procidure will produce multiple lines if there are multiple outputs by the generator:

```
!make glossing INPUT="kʼnatiⁿ"
```

will produce the following output:

```
kʼnata-ⁿ  kʼnat.N.VB.pl-gen
kʼnati-ⁿ  kʼnat.N.VB.pl-gen                                        
```

So *kʼnata-ⁿ* appeared even though there were just *kʼnatiⁿ* in the output.

- In oblique stems thematic vowel is not separated, e. g. *pħitʼe-v* frog.N.BD.obl-erg, not *pħitʼ-e-v* frog.N.BD-obl-erg

- I used Diana Kakashvili's dictionary for obtaining genetive and plural forms, hovewer there are cases, when this information is not sufficient for the paradigm construction, see an example from (Wichers Schreur 2025: 77):

| gloss | form         |
|-------|--------------|
| abs   | dok’ ‘heart’ |
| erg   | dak’av       |
| gen   | dak’iⁿ       |
| dat   | dak’an       |
| cont  | dak’ox       |

- I used Diana Kakashvili's dictionary for obtaining information about the gender in order to correctly match the ergatve case (*-v* vs *-s*), however this information should be checked and sometimes reannotated in a dictionary.

- There is a rule of a pharyngeal deletion (Wichers Schreur 2025: 49). Transducer works with the surface form, so for now you will need to add finaly deleted *ħ* in essives by hand.

- The Diana's dictionary provides just one plural form. In plural there are genetive and contact cases that can have *a* as an oblique stem, see (Holisky and Gagua 1994: 165). In order to cover all forms, I decided to overgenerate, so for each noun both forms will be generated:

```
!make generation INPUT="kʼnat<N><VB><pl>><gen>"
```

will produce the following output:

```
kʼnat.N.VB.pl-gen	kʼnata-ⁿ
kʼnat.N.VB.pl-gen	kʼnati-ⁿ
```

