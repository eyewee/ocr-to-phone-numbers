# INTRO

Un jour j'ai eu pour mission d'aider un ami à gérer l'afflux de nouveaux numéros de téléphone sur ses nombreux groupes WhatsApp. En effet, à peu près au bout de chaque nouvelle mois, mon ami faisait face à plus de 3000 nouveaux numéros auxquels il devait envoyer des messages en masse. Sauf que la limitation était telle, que pour ne pas se faire bannir sur Whatsapp, le numéros devaient être enregistrés dans ses contacts sur son téléphone.
Nous avons pu remédier à ce problème en faisant des captures d'écran des lignes contenant des numéros sur Whatsapp. 
Puis en les analysant avec n'importe quelle bibliothèque OCR (exemple: Abby Fine Reader). 
Ensuite on analyse la sortie avec un script fait maison. 
En même temps, on crée un fichier .csv que l'on renomme en fichier contacts  de format .vcf. 
Ce fichier est reconnu par Android comme par Iphone, il suffit de l'importer dans les contacts pour que l'OS fasse le nécessaire afin d'intégrer l'ensemble de nouveaux numéros.  

# OBJECTIF
- faire des captures d'écrans sur WhatsApp
- scanner à l'aide d'une  bibliothèque OCR (reconnaissance du texte)
- créer une série des scriptes capables de filtrer correctement la sortie de l'OCR
- composer un fichier qui liste l'ensemble de numéros trouvés- transformer le fichier en un fichier .vcf correctement formaté avec les noms des contacts qui seront auto incrémentés selon une règle prédéfinie.

# DIFFICULTES
- éviter la pertes de certains numéros à cause d'une mauvaise sortie OCR
( reconnaître le syntaxe systématique d'un groupe d'erreur pour gérer ces cas. Par exemple: +33 o6... est en réalité +33 06)
- gérer les doublons- gérer les formats internationaux des numéros et les types d'écriture (+33 06 ou 06 ou 336 ou +33-06.. etc.)
- correctement arranger les fiches numéros à l'intérieur du .vcf
- incrémenter les nouveaux noms des contacts
- savoir utiliser les expressions régulières 
- d'autres difficultés que j'ai déjà oubliées...

# UTILISATION DES SCRIPTS
Nous avons divisé cette procédure en plusieurs étapes (scripts) pour faciliter la compréhension.
- Étape 1: scanner les captures d'écran avec une bibliothèque OCR (Abby Fine Reader dans notre cas)
- Étape 2: dans le fichier obtenu; supprimer toutes les apparences des chaînes de caractère suivantes: 
Dans le cas de version WhatsApp russe, il y a des élément parasites qui s'infiltrent:
": "
"(-а)"
"номер"

ou si la version du WhatsApp est anglaise:
": "
"number"

ou française:
": "
"numéro"

- Étape 3: filtre des numéros.
De la manière suivante ulitiliser le script "script.sh" qui va créer une liste des numéros :

sh script.sh > step3.txt

(il faut l'exécuter dans un dossier contenant votre fichier "raw_output.txt" généré par la bibliothèque OCR)
Vérifiez si le fichier sortie_finale.txt ne comporte pas des anomalies.

- Étape 4 création d'un fichier VCF.
Il faut l'exécuter le script "script2.sh" dans un dossier contenant votre fichier précédent "step3.txt " de la manière suivante:

sh script2.sh > step4.txt

Le script va donner le nom "ccc-1-Client" au premier nouveau contact. Il va incrémenter le 1 en attribuant un nom unique à chaque client. Le nouveau groupe de contacts sera appelé "My CCC" mais on peut le changer, il suffit de remplacer "My CCC" dans le script par ce que vous voulez. 

- Étape 5 importer le fichier VCF.
Vous pouvez importer ce fichier de la manière qui vous plaît à l'aide des outils intégrés dans l'application contacts de Iphone ou Android.

- Remarque.
Si vous voulez tout faire en une seule étape, j'ai inclus le fichier "quick.sh" à éxecuter dans le dossier contenant votre fichier "raw_output.txt" de cette manière :sh quick.sh > output.txt




# PISTES D'AMELIORATION
- éviter les pertes de certains numéros car nous n'avons pas eu le temps de prendre en compte l'ensemble des cas de formats internationaux des numéros et des erreurs OCR. Il faudra peut-être trouver une meilleure bibliothèque OCR, ou penser à utiliser l'API WhatsApp (mais c'est payant).