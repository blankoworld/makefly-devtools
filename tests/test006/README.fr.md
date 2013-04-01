<link href="./readme.css" rel="stylesheet"></link>

# Makefly

An english version of this documentation is available in **README.md** file.

## &Agrave; propos

Makefly est un moteur de blog statique qui utilise les fichiers Makefile BSD pour fonctionner.

### Site web

Visitez fr&eacute;quemment le [blog de Makefly](http://makefly.e-mergence.org/ "Visiter le blog officiel de Makefly") (en) pour avoir des nouvelles du projet.

### Contact

Vous pouvez me contacter [&agrave; cette adresse](mailto:olivier+makefly@dossmann.net "Me contacter").

### Licence

Ce logiciel est publi&eacute; sous la licence suivante : GNU Affero General Public License 3.0.

### Stats

Quelques stats du projet se trouvent [sur Ohloh.net](http://www.ohloh.net/p/makefly "Voir les analyses d'ohloh &agrave; propos du projet Makefly").

## Description

Makefly est un sous-projet de [BlogBox](http://blogbox.e-mergence.org/ "En savoir plus sur le projet BlogBox") qui vise &agrave; fournir de meilleurs moyens pour h&eacute;berger un blog &agrave; la maison.

## D&eacute;pendences

Quelques programmes dont Makefly d&eacute;pend : 

  * pmake ou bmake
  * la commande markdown
  * lua 5.1 ou plus r&eacute;cent

Ainsi utilisez le gestionnaire de paquet de votre distribution pour les installer. Par exemple sur Debian et d&eacute;riv&eacute;es, ce serait : 

    apt-get install pmake markdown lua5.1

Pour d'autres distributions, regardez du c&ocirc;t&eacute; des forums, d'IRC et/ou de la communaut&eacute; de votre distribution. Ils seront heureux de vous aider.

## Installation

Il y a deux mani&egrave;res d'installer Makefly sur votre ordinateur : 

  * Utiliser la derni&egrave;re version stable en r&eacute;cup&eacute;rant une archive (recommand&eacute;)
  * Utiliser la version en cours de d&eacute;veloppement en utilisant un d&eacute;p&ocirc;t de version (por les utilisateurs avanc&eacute;s seulemennt)

### Utiliser la derni&egrave;re version stable

R&eacute;cup&eacute;rez simplement la derni&egrave;re version sur le site officiel : [http://makefly.e-mergence.org/](http://makefly.e-mergence.org/ "Aller sur le site officiel de Makefly").

Par exemple [la version 0.1](http://makefly.e-mergence.org/makefly_0.1.zip "T&eacute;l&eacute;charger Makefly 0.1").

Puis extraire le contenu de l'archive dans un dossier.

### Utiliser la version en cours de d&eacute;veloppement

Vous devez utiliser la commande **git**. Si vous ne savez pas ce que c'est, jetez un &oelig;il au [site web Git SCM](http://git-scm.com/ "En savoir plus sur Git").

Apr&egrave;s une installation git, allez dans un r&eacute;pertoire de travail et faites : 

    git clone git://gitorious.org/makefly/master.git makefly_dev

Ceci va r&eacute;cup&eacute;rer le d&eacute;p&ocirc;t Makefly et ajouter les fichiers dans le dossier **makefly\_dev**.

**Note**: Utiliser git est utile pour mettre &agrave; jour Makefly au fur et &agrave; mesure du d&eacute;veloppement de ce dernier. En effet : 

    git pull git://gitorious.org/makefly/master.git

mettra &agrave; jour Makefly.

**ATTENTION**: Vous devez toujours sauvegarder vos fichiers ! Cette m&eacute;thode peut supprimer des modificiations faites pr&eacute;c&eacute;demment.

## Configuration

La premi&egrave;re fois que vous utilisez Makefly vous n'avez aucun fichier de configuration. Un exemple de fichier de configuration est disponible dans **makefly.rc.example*. Copiez le vers **makefly.rc** pour permettre &agrave; Makefly de fonctionner.

Pour plus d'informations, lisez la section **Le fichier de configuration makefly.rc**.

## Cr&eacute;er du contenu

Un script shell bash est disponible dans le r&eacute;pertoire **tools**: **create\_post.sh**. Pour l'utiliser : 

    cd tools
    bash create_post.sh

Donnez au script toutes les informations n&eacute;cessaires. Cela g&eacute;n&egrave;rera les fichiers n&eacute;cessaires &agrave; Makefly.

Il est &agrave; noter que Makefly utilise [le format markdown](http://daringfireball.net/projects/markdown/ "En savoir plus sur le format Markdown") pour ses articles.

### Fichiers statiques

Si vous voulez ajouter quelques fichiers statiques, rajoutez les simplement dans le dossier *static*. Ils seront copier dans le dossier de destination.

### Le dossier 'special'

Ce dossier nommé **special** peut contenir certains fichiers que vous devrez créer pour activer une fonctionnalité : 

  * *about.md* : Contient le contenu d'une page d'à propos au sujet de votre site. Cela va ajouter une entrée dans le menu principal du site (si votre thème le supporte).
  * *sidebar.md* : Ajoute une barre latérale sur votre site. Le thème doit supporter cette fonction.
  * *introduction.md* : Affiche le contenu de ce fichier comme introduction de votre page d'accueil. Varie selon le thème choisi.
  * *footer.md* : Affiche le contenu de ce fichier comme d'un pied de page sur l'ensemble de vos pages. Varie selon le thème choisi.

## Utilisez le !

Apr&egrave;s avoir cr&eacute;e le fichier *makefly.rc* (depuis le fichier makefly.rc.example) et avoir cr&eacute;e quelques articles, faites simplement : 

    pmake

Ceci g&eacute;n&egrave;rera un blog Makefly dans le dossier **pub**.

Note: *pmake* est sur les distributions Debian et d&eacute;riv&eacute;es. Pour les autres distributions, je vous sugg&egrave;re d'utiliser **bmake**.

## Le fichier de configuration makefly.rc

Voici quelques options que vous pouvez changer : 

  * BLOG\_TITLE : Titre de votre blog
  * BLOG\_SHORT\_DESC : Une courte description de votre blog
  * BLOG\_DESCRIPTION : Une description plus compl&egrave;te de votre blog
  * BLOG\_LANG : votre code langue. &Agrave; noter qu'un fichier lang/translate.VOTRE\_CODE\_LANGAGE doit exister. Par exemple si je configure ce param&egrave;tre &agrave; *fr*, un fichier *lang/translate.fr* doit exister !
  * BLOG\_CHARSET : votre configuration d'encodage. Doit ressembler &agrave; quelque chose comme **UTF-8** ou **ISO-8859-1**. Si vous ne savez pas ce que c'est, laissez la param&eacute;tr&eacute;e &agrave; *UTF-8*.
  * BASE\_URL : adresse URL absolue de votre blog. Par exemple http://makefly.e-mergence.org/.
  * RSS\_FEED\_NAME : Titre affich&eacute; dans le flux RSS.
  * MAX\_POST : Nombre maximum d'articles qui seront affich&eacute;s sur la page d'accueil.
  * MAX\_POST\_LINES : Nombre de lignes qui seront montr&eacute;es sur la page d'accueil. Si param&eacute;tr&eacute; &agrave; 0 ou inexistant dans le fichier *makefly.rc*, alors les articles sont enti&egrave;rement montr&eacute;s.
  * DATE\_FORMAT : Format de la date affich&eacute;e pour chaque article. Lisez les pages du manuel *date* pour plus d'informations.
  * SHORT\_DATE\_FORMAT : Format court de la date. Sera utilis&eacute; sur la page de la liste des articles. Pour plus d'informations, lire les pages du manuel *date*.
  * INDEX\_FILENAME : Nom donn&eacute; &agrave; toutes les pages index. Par exemple avec **INDEX\_FILENAME = mainpage**, la liste des articles se nommera *mainpage.html*.
  * PAGE\_EXT : suffixe que toutes les pages auront. **NE PAS OUBLIER D'AJOUTER UN POINT AVANT LE SUFFIXE**. Par exemple avec **PAGE\_EXT = .html**, toutes les pages seront de la forme : *index.html*.
  * ABOUT\_FILENAME : Comme son nom l'indique, c'est le titre du fichier utilis&eacute; pour la page "&Agrave; propos". Si vous le param&eacute;trez &agrave; "apropos" par exemple, vous devez cr&eacute;er un fichier "apropos.md" dans le r&eacute;pertoire nomm&eacute; **special** afin de permettre  l'obtention d'une page d'&agrave; propos. Si vous le changez &agrave; *toto*, vous devez cr&eacute;er un fichier *toto.md* dans le dossier **special**.
  * POSTDIR\_NAME : Le nom que vous voudriez afficher dans l'URL quand un utilisateur se rend sur la page de la liste des articles. Par exemple, param&eacute;tr&eacute; &agrave; "mesarticles" : http://makefly.e-mergence.org/mesarticles/ affichera la liste de vos articles. Ceci est utile pour divers langages.
  * TAGDIR\_NAME : M&ecirc;me chose que pour le param&egrave;tre *POSTDIR\_NAME*, mais pour les mots-cl&eacute;s (tags) cette fois. Modifiez le en "motcle" par exemple et l'adresse suivante affichera la liste des mots-cl&eacute;s : http://makefly.e-mergence.org/motcle/.
  * THEME : Nom du th&egrave;me choisi. Les th&egrave;mes sont disponibles dans le dossier nomm&eacute; **template**. Chaque th&egrave;me poss&egrave;de son propre r&eacute;pertoire. Par exemple, le th&egrave;me *default* poss&egrave;de son propre r&eacute;pertoire **template/default**.
  * BACKUPDIR : Nom du dossier o&ugrave; seront sauv&eacute;s les fichiers r&eacute;sultant de la commande *backup*.
  * SIDEBAR\_FILENAME : Comme d&eacute;crit, nom du fichier utilis&eacute; pour la barre lat&eacute;rale. Elle contient des liens et tout un tas d'autres choses. Si vous la param&eacute;trez &agrave; "sidebar.md", par exemple, vous devez cr&eacute;er le fichier dans le r&eacute;pertoire **special** pour obtenir cette barre. &Agrave; noter que votre th&egrave;me doit inclure les barres lat&eacute;rales !
  * SIDEBAR : Mis &agrave; 1 permet d'activer la barre lat&eacute;rale sur Makefly. &Agrave; noter que votre th&egrave;me doit inclure les barres lat&eacute;rales !
  * PUBLISH\_DESTINATION : Adresse compl&egrave;te du lieu o&ugrave; envoyer les fichiers afin de les publier.
  * PUBLISH\_SCRIPT\_NAME : Nom du fichier script utilis&eacute; pour envoyer les fichiers du dossier **pub** vers une destination renseign&eacute;e dans la variable *PUBLISH\_DESTINATION*.
  * SEARCH\_BAR : Mis &agrave; 1 permet d'activer une barre de recherche sur Makefly. &Agrave; noter que votre th&egrave;me doit supporter la barre de recherche.
  * MAX\_RSS : Nombre d'articles RSS maximum qui sera récupéré par vos utilisateurs.
  * JSKOMMENT : Mis &agrave; 1 permet d'activer un syst&eacute;me de commentaires pour Makefly. &Agrave; noter que votre th&egrave;me doit supporter le syst&eacute;me de commentaires. Attention, par d&eacute;faut cela utiliser jskomment.appspot.com en tant que serveur, il ne garantit pas un archivage &agrave; long terme des commentaires. Plus d'informations sont disponibles [sur la page d'installation du projet jskomment](http://code.google.com/p/jskomment/wiki/Installation "Se rendre sur la page du projet pour en savoir plus").
  * JSKOMMENT\_CAPTCHA\_THEME (optionnel) : Définissez un thème suivant la [page reCaptcha](https://developers.google.com/recaptcha/docs/customization "Plus d'infos sur les thèmes reCaptcha") pour les Catpcha dans le système de commentaires JSKOMMENT.
  * JSKOMMENT\_URL (optionnel) : Définit un serveur JSKOMMENT sur lequel envoyer les commentaires. Par défaut **http://jskomment.appspot.com/**.
  * JSKOMMENT\_MAX (optionnel) : Définit une limite de commentaires à afficher pour le système de commentaire JSKOMMENT. Par défaut **2**.
  * ELI\_USER: Si utilisé, ceci active un cadre pour identica. &Agrave; noter que votre th&egrave;me doit supporter le widget ELI. Par d&eacute;faut cette fonctionnalit&eacute; utiliser l'API d'IDENTICA.
  * ELI\_TYPE (optionel) : Changer cet &eacute;l&eacute;ment par "group" pour suivre un groupe plut&ocirc;t qu'un utilisateur d'IDENTICA. Par d&eacute;faut "user".
  * ELI\_MAX (optionnel) : Permet de choisir le nombre de statuts affich&eacute;s. Sur IDENTICA ceci ne peut d&eacute;passer 20 &eacute;l&eacute;ments. Valeur par d&eacute;faut : 5.
  * INSTALLDIR : Permet de choisir le dossier de destination lors de l'utilisation du script **install.sh** (Cf. Chapitre Publier le résultat sur le web).
  * COMPRESS_TOOL (optionnel) : Outil console utilisé pour la compression lors des sauvegardes via la commande *backup* (Cf. Chapitre *Sauvegardes*). Exemple : **gzip**.
  * COMPRESS_EXT (optionnel) : Extension des fichiers de sauvegarde. Attention à ne pas oublier le caractère point. Exemple : **.gz**.

## Publier le r&eacute;sultat sur le web

Le r&eacute;sultat de Makefly est compatible avec tout le serveurs HTML. En effet vous pouvez probablement utiliser le r&eacute;sultat sur le site web de votre h&eacute;bergeur. Il suffit d'envoyer le contenu du r&eacute;pertoire **pub** dans celui de votre h&eacute;bergeur.

### Sur un serveur web

Si vous lancez Makefly sur votre propre serveur ou tr&egrave;s certainement sur le serveur de votre h&eacute;bergeur, vous pourrez utiliser **install.sh** qui est un script shell. Lancez simplement : 

    cd tools
    bash install.sh

...et cela copiera tout les fichiers dans le r&eacute;pertoire **~/public\_html**.

**ATTENTION**: Cela supprimera tout les fichiers contenus dans le dossier *public\_html* !

**Note**: Vous pouvez personnaliser le script pour copier tout les fichiers dans un autre r&eacute;pertoire que le *public\_html*. Pour cela, modifiez le script **install.sh** et changez cette variable : 

    DESTDIR=${HOME}/public_html

en : 

    DESTDIR=/mon/site/web

Relancez le script *install.sh* pour voir le r&eacute;sultat.

### Vers un ordinateur distant : la commande *publish*

Pour publier votre blog vers une machine distante, vous devez : 

  * avoir un acc&egrave;s SSH &agrave; la machine distante
  * avoir le programme rsync
  * configurer la variable **PUBLISH\_DESTINATION** dans le fichier **makefly.rc**
  * lancer la commande **publish**

C'est tout!

&Agrave; noter que la variable **PUBLISH\_DESTINATION** ressemble &agrave; : 

    monUtilisateurDistant@domaineDistant.tld:/mondossierhome/dossier_public

Une fois cette variable renseign&eacute;e dans le fichier **makefly.rc**, lancez simplement : 

    pmake publish

Pour les d&eacute;velopeurs : Vous pouvez aussi modifier le fichier **tools/publish.sh** et changer le contenu du script par votre propre code.

## Traduction

Une fa&ccedil;on simple de traduire Makefly dans votre langage est de copier le fichier **lang/translate.en** dans un autre fichier. Par exemple, pour le Fran&ccedil;ais (avec le code fr), vous pouvez copier **lang/translate.en** en **lang/translate.fr** et changez les valeurs. Puis changez simplement l'option *BLOG\_LANG* dans le fichier **makefly.rc**.

## Sauvegardes

Peut-&ecirc;tre voudriez-vous sauvegarder les fichiers importants de Makefly ? C'est possible via la **commande backup**. Lancez la simplement de cette mani&egrave;re : 

    pmake backup

Requis : 

  * tar
  * gzip

Fichiers sauv&eacute;s : 

  * makefly.rc
  * le r&eacute;pertoire static
  * le r&eacute;pertoire special
  * le r&eacute;pertoire db
  * le r&eacute;pertoire src
  * le r&eacute;pertoire contenant le th&egrave;me choisi (par exemple *templates/default/*)

R&eacute;sultat : Ceci cr&eacute;era une *archive* nomm&eacute;e *YYYYMMDD\_makefly.tar.gz* (20120823\_makefly.tar.gz par exemple) dans le dossier **mbackup**. Vous pouvez ainsi sauvegarder votre Makefly chaque jour.

### Astuces

Vous pouvez personnaliser (dans votre fichier **makefly.rc**) :

  * le dossier de sauvegarde en utilisant l'option **BACKUPDIR**
  * l'outil de compression en utilisant l'option **COMPRESS_TOOL**, par exemple avec **gzip**
  * l'extension du fichier de sauvegarde en utilisant l'option **COMPRESS_EXT**, par exemple avec **.gz** (ne pas oublier le point)

## Sources

Les sources sont disponibles :  

  * [Sur gitorious](http://gitorious.org/makefly/master.git/)
  * [Sur github](https://github.com/blankoworld/makefly)
  * [Sur mon propre d&eacute;p&ocirc;t git](http://git.dossmann.net/blogbox/makefly.git/)

## Documentation

Ce fichier est la documentation. Vous pouvez [le lire sur github](https://github.com/blankoworld/makefly "Lire la documentation sur Github") ou simplement g&eacute;n&eacute;rer un fichier HTML &agrave; l'aide de cette commande : 

    pmake doc

Note: La commande pmake command est pour Debian et d&eacute;riv&eacute;s. Pour les autres distributions, utilisez **bmake** au lieu de pmake.

## Astuces

### Écrire des billets en avance

Dans Makefly vous pouvez écrire des billets en avance. Il suffit pour cela que le fichier de méta-données de votre billet possède un timestamp supérieur à celui du moment où est généré le blog.

Par exemple nous sommes le 6 mars 2013, à 12:30, le timestamp est : 1362569400. Il faut que dans le dossier **db**, votre article ait un timestamp inférieur à celui d'aujourd'hui.