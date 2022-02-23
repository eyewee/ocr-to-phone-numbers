# INTRO

Un jour j'ai eu pour mission d'aider un ami à gérer l'afflux de nouveaux numéros de téléphone sur ses nombreux groupes WhatsApp. En effet, à peu près au bout de chaque nouvelle mois, mon ami faisait face à plus de 3000 nouveaux numéros auxquels il devait envoyer des messages en masse. Sauf que la limitation était telle, que pour ne pas se faire bannir sur Whatsapp, le numéros devaient être enregistrés dans ses contacts sur son téléphone.
Nous avons pu remédier à ce problème en faisant des captures d'écran des lignes contenant des numéros sur Whatsapp. 
Puis en les analysant avec n'importe quelle bibliothèque OCR (exemple: Adobe Reader). 
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
# PISTES D'AMELIORATION
- éviter les pertes de certains numéros car nous n'avons pas eu le temps de prendre en compte l'ensemble des cas de formats internationaux des numéros et des erreurs OCR. Il faudra peut-être trouver une meilleure bibliothèque OCR, ou penser à utiliser l'API WhatsApp (mais c'est payant).