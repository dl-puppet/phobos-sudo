# Phobos-sudo
Module Puppet pour configurer SUDO




# SUDO
La commande 'SUDO' permet à un utilisateur standard d’exécuter des commandes qui nécessitent des droits d'identité différente de l’utilisateur actuel (par exemple celle de root).

## 'rootpw', 'targetpw' et 'runaspw'
La politique 'SUDO' de l'utilisateur est entraîné par le fichier '/etc/sudoers' ou, éventuellement un annuaire 'LDAP'.	Contrairement à la commande 'SU', lorsque 'SUDO' demanande une authentification, il valide les informations d'identification de l'utilisateur invoquant la commande et non l'identification de l'utilisateur cible (exemple: root). Ce comportement peut être changé via les commandes 'rootpw', 'targetpw' et 'runaspw'.



	
# Syntaxe :   Qui  hôte = (identité) commande [, ...]
	exemple :   phobos ALL = (root) /usr/bin/useradd, /user/bin/usermod




# Trouver de aide
man sudo (8), man sudoers(5), man visudo(8)		
	

 	
 	
# Mailto 
Si un utilisateur ne figure pas dans la politique 'SUDO' et tente d'exécuter une commande avec sudo, un courrier est envoyé aux autorités compétentes. Cette fonctionnalité est configuré via l'entrée par défaut 'mailto' qui est généralement 'root' par défaut.	Toutefois, notez que le courrier ne sera pas envoyé si l'utilisateur non autorisé tente d'exécuter 'sudo' avec l'option '-l' ou '-v'. Cela permet aux utilisateurs de déterminer eux-mêmes si elles sont ou non autorisés à utiliser sudo.	




# LOG/SYSLOG
Lors de l'utilisation de 'SUDO', les tentatives de connection qu'elels soient réussies ou non (ainsi que les erreurs de frappes) peuvent être envoyer à un serveur 'syslog', un fichier journal, ou les deux. Par défaut,  'SUDO' envoi les tentatives de connection via syslog.




# Composition du fichier '/etc/sudoers'
Ce fichier décrit qui peut activer une commande avec sudo et sous quelle identité. 
Ce fichier est composé de deux types d'entrées: 
		- Les 'alias' (essentiellement variables) 
		- les spécifications utilisateur (qui spécifient qui peut exécuter quoi).

Lorsque plusieurs entrées correspondent à un même utilisateur, ils sont appliqués dans l'ordre. 
Lorsqu'il y a plusieurs matchs, le dernier match est utilisé.




# Editer le fichier /etc/sudoers
Pour éditer le fichier sudoers, il faut utiliser la commande 'visudo'. Pour forcer l'utilisation d'un éditeur lors de l'ouverture du fichier sudoers via la commande 'visudo' il faut utiliser la variable 'EDITOR': 
		EDITOR=/usr/bin/vim visudo   (exemple: forcer l'ouverture du fichier sudoers avec l'editeur VIM )




# defaults
Configurer le comportement par defaut de sudo

	defaults env_reset,timestamp_timeout=0,pwfeedback,badpass_message="Mauvais Password",

### ENV_RESET	
Sur un système UNIX, les variables d'environnement peuvent influencer le comportement des programmes. 'SUDO' fournit un moyen de restreindre les variables d'environnement des utilisateurs via l'utilisation de l'option 'env_reset'. Par défaut, cette option est activée. Cela permet lancer les commandes à exécuter avec un nouvel environnement. 

		defaults env_reset,
				
- Sur AIX (et les systèmes Linux n'utilisant pas PAM), l'environnement est initialisé avec le contenu du fichier '/etc/environnement'.
			
### use_loginclass : si cette option est activée, l'environnement chargé sera basée sur le fichier et les paramètres dans setenv /etc/login.conf. 

toutefois, si l'option 'env_reset' est désactivé, toutes les variables ne sont pas explicitement exclus par le env_check et les options 'env_delete' sont héritées du processus appelant. Dans ce cas, 'env_check' et 'env_delete' se comportent comme une liste noire.
Dans tous les cas, les variables d'environnement avec une valeur commençant par () sont supprimés car ils pourraient être interprétées comme des fonctions du shell. Vous pouvez retrouver la liste des variables d'environnement autorisé ou refusé ar 'SUDO4 dans la sortie 'sudo -V'.


### timestamp_timeout=x
Cette option permet de régler le temps de grâce avant que la saisie du mot de passe soit de nouveau demandée.	Ajoutez l'option timestamp_timeout=X à la fin de la ligne débutant par 'defaults'. La valeur X doit être remplacée par la durée (en minutes) durant laquelle le mot de passe n'a pas à être fourni" La valeur '0' désactive ce temps de grâce. Si cette option n'est pas précisée, le temps de grâce par défaut est 15 minutes.        

		defaults timestamp_timeout=5 ,


### pwfeedback
Cette options permet d'afficher des astérisques lors de la saisie du mot de pass.
		
		defaults pwfeedback ,


### badpass_message='text'
Cette option permet de changer le message d'erreur lorsqu'un utilisateur entre un mauvais mot de passe.
		
		defaults badpass_message="Mauvais password" ,


### Insults 
Des insultes en cas d'erreur de mot de pass

	

# Les Alias 	
Les alias permettent de simplifier l'écritue du fichier /etc/sudoers. Il existe quatre types d'alias: 

	User_Alias ​​, 
	Runas_Alias ​​, 
	Host_Alias
	Cmnd_Alias ​​.	
Chaque définition d'alias est de la forme :

	User_Alias NAME = name1, name2, name3
		
*NAME est une chaîne en 'MAJUSCULE' pouvant contenir des lettres, des chiffres et caractères de soulignement (' _ ').  Il est possible de mettre plusieurs définitions d'alias du même type sur une seule ligne, rejoint par deux points (« : »). Par exemple :

	User_Alias NAME1 = name1, name2, name3 : NAME2 = name4, name5
			
User_List ::=   User |	
	 User ',' User_List
	exemple : 	
Host_Alias     FILESERVERS = phobos	
User_Alias    ADMINS = david, paul	
Runas_Alias OPERATOR = root	
Cmnd_Alias NETWORKING = /sbin/route,    \	
/sbin/ifconfig, \	
/bin/ping,      \	
/sbin/dhclient, \	
/usr/bin/net,   \	
/sbin/iptables, \	
/usr/bin/rfcomm,\	
/usr/bin/wvdial,\	
/sbin/iwconfig, \	
/sbin/mii-tool	
Cmnd_Alias SOFTWARE =   /bin/rpm,       \	
/usr/bin/up2date, \	
/usr/bin/yum	
Cmnd_Alias SERVICES =   /sbin/service,  \	
/sbin/chkconfig	
Cmnd_Alias LOCATE =     /usr/bin/updatedb	
# Cmnd_Alias STORAGE = /sbin/fdisk, /sbin/sfdisk, /sbin/parted, /sbin/partprobe, /bin/mount, /bin/umount	
Cmnd_Alias DELEGATING = /usr/sbin/visudo, \	
/bin/chown,     \	
/bin/chmod,     \	
/bin/chgrp	
/usr/sbin/useradd, \	
/usr/sbin/userdel, \	
 /usr/bin/usermod, \	
/usr/sbin/passwd [A-z]*, ! /usr/bin/passwd root	
Cmnd_Alias PROCESSES =  /bin/nice,      \	
/bin/kill,      \	
/usr/bin/kill,  \	
/usr/bin/killall	
# Cmnd_Alias DRIVERS = /sbin/modprobe	

Defaults    requiretty	

ADM_USERS ALL = (OPERATOR) USER_CMDS	

Mot de passe :	
Par default sudo demande le mot de passe de l'utilisateur.	
NOPASSWD permet de ne pas le demander.	
exemple : 	
%admin ALL = (root) NOPASSWD : USER_CMDS	
	
Donner tous les droits aux membres du groupe admin :	
%admins ALL=(ALL) ALL




# Module phobos-sudo

	
