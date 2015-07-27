# Phobos-sudo

Module Puppet pour configurer SUDO



# SUDO

La commande 'SUDO' permet à un utilisateur standard d’exécuter des commandes qui nécessitent des droits d'identité différente de l’utilisateur actuel (par exemple celle de root).

### 'rootpw', 'targetpw' et 'runaspw'

La politique 'SUDO' de l'utilisateur est entraîné par le fichier '/etc/sudoers' ou, éventuellement un annuaire 'LDAP'.	Contrairement à la commande 'SU', lorsque 'SUDO' demanande une authentification, il valide les informations d'identification de l'utilisateur invoquant la commande et non l'identification de l'utilisateur cible (exemple: root). Ce comportement peut être changé via les commandes 'rootpw', 'targetpw' et 'runaspw'.




# Syntaxe
## Qui  hôte = (identité) commande [... , ...]

    exemple :   
    		root    	ALL=(ALL)       	ALL
    		phobos 		ALL = (root) 		/usr/bin/useradd, /user/bin/usermod




# Trouver de aide

man sudo (8), man sudoers(5), man visudo(8)		




# Mailto

Si un utilisateur ne figure pas dans la politique 'SUDO' et tente d'exécuter une commande avec sudo, un courrier est envoyé aux autorités compétentes. Cette fonctionnalité est configuré via l'entrée par défaut 'mailto' qui est généralement 'root' par défaut.	Toutefois, notez que le courrier ne sera pas envoyé si l'utilisateur non autorisé tente d'exécuter 'sudo' avec l'option '-l' ou '-v'. Cela permet aux utilisateurs de déterminer eux-mêmes si ils sont ou non autorisés à utiliser sudo.	




# LOG/SYSLOG

Lors de l'utilisation de 'SUDO', les tentatives de connection qu'elles soient réussies ou non (ainsi que les erreurs de frappes) peuvent être envoyer à un serveur 'syslog', un fichier journal, ou les deux. Par défaut,  'SUDO' envoi les tentatives de connection via syslog.




# Fichier '/etc/sudoers'

Ce fichier décrit qui peut activer une commande avec sudo et sous quelle identité. 
Ce fichier est composé de deux types d'entrées: 

		* - Les 'alias' (essentiellement variables) 
		* - les spécifications utilisateur (qui spécifient qui peut exécuter quoi).

Lorsque plusieurs entrées correspondent à un même utilisateur, ils sont appliqués dans l'ordre. 
Lorsqu'il y a plusieurs matchs, le dernier match est utilisé.




# Editer le fichier /etc/sudoers

Pour éditer le fichier sudoers, il faut utiliser la commande 'visudo'. Pour forcer l'utilisation d'un éditeur lors de l'ouverture du fichier sudoers via la commande 'visudo' il faut utiliser la variable 'EDITOR': 

	* EDITOR=/usr/bin/vim visudo   (exemple: forcer l'ouverture du fichier sudoers avec l'editeur VIM )



# defaults

Configurer le comportement par defaut de sudo

    	defaults env_reset,timestamp_timeout=0,pwfeedback,badpass_message="Mauvais Password",



### ENV_RESET

Sur un système UNIX, les variables d'environnement peuvent influencer le comportement des programmes. 'SUDO' fournit un moyen de restreindre les variables d'environnement des utilisateurs via l'utilisation de l'option 'env_reset'. Par défaut, cette option est activée. Cela permet lancer les commandes à exécuter avec un nouvel environnement. 

        defaults env_reset,
            

* Sur AIX (et les systèmes Linux n'utilisant pas PAM), l'environnement est initialisé avec le contenu du fichier '/etc/environnement'.



### use_loginclass

si cette option est activée, l'environnement chargé sera basée sur le fichier et les paramètres dans setenv /etc/login.conf.

Toutefois, si l'option 'env_reset' est désactivé, toutes les variables ne sont pas explicitement exclus par le env_check et les options 'env_delete' sont héritées du processus appelant. Dans ce cas, 'env_check' et 'env_delete' se comportent comme une liste noire.
Dans tous les cas, les variables d'environnement avec une valeur commençant par () sont supprimés car ils pourraient être interprétées comme des fonctions du shell. Vous pouvez retrouver la liste des variables d'environnement autorisé ou refusé ar 'SUDO4 dans la sortie 'sudo -V'.



### timestamp_timeout=x

Cette option permet de régler le temps de grâce avant que la saisie du mot de passe soit de nouveau demandée.	La valeur X doit être remplacée par la durée (en minutes) durant laquelle le mot de passe n'a pas à être fourni. La valeur '0' désactive ce temps de grâce. Si cette option n'est pas précisée, le temps de grâce par défaut est 15 minutes.  

        defaults timestamp_timeout=5 ,



### pwfeedback

Cette options permet d'afficher des astérisques lors de la saisie du mot de pass.

        defaults pwfeedback ,



### badpass_message='text'

Cette option permet de changer le message d'erreur lorsqu'un utilisateur entre un mauvais mot de passe.

        defaults badpass_message="Mauvais password" ,

mail_badpass
secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin/bin"
always_set_home
!insults


### Insults

Cette options permet d'envoyer des insultes en cas d'erreur de mot de pass. 




# Les Alias 

Les alias permettent de simplifier l'écritue du fichier /etc/sudoers. Il existe quatre types d'alias: 

    User_Alias ​​, 
    Runas_Alias ​​, 
    Host_Alias
    Cmnd_Alias ​​.	

Chaque définition d'alias est de la forme :

    User_Alias NAME = name1, name2, name3
    

* NAME est une chaîne en 'MAJUSCULE' pouvant contenir des lettres, des chiffres et caractères de soulignement (' _ ').  Il est possible de mettre plusieurs définitions d'alias du même type sur une seule ligne, rejoint par deux points (« : »). 

Par exemple :

    User_Alias NAME1 = name1, name2, name3 : NAME2 = name4, name5
        


# Mot de passe	

Par default 'sudo' demande le mot de passe de l'utilisateur. L'option 'NOPASSWD' permet de ne pas le demander. 
L'exemple ci-dessous permet au membre du groupe 'admin' présent sur tous les hôtes (ALL) d'optenir les droits root (root) sans pour cela avoir besoin du mot de passe (NOPASSWD), afin d'executer les commandes contenu de le groupe (USER_CMDS):  	

	%admin ALL = (root) NOPASSWD : USER_CMDS	


Autre exemple: Donner tous les droits aux membres du groupe admin :
	
	%admins ALL=(ALL) ALL




# Variable disponible dans le module 'phobos-sudo'


### Installation du package 'sudo'i
$package_name		='sudo'   	# Le nom du paquet$package_ensure     ='present'  # Etat du paquet: n° version, present (also called installed), absent, purged, held, latest. 

### Installation du service 'sudo'

$service_manage     = 'true'          # Active le service
$service_name       = 'ntpd'          # Le nom du service
$service_ensure     = 'running'       # Etat du service: stopped (also called false), running (also called true).           
$service_enable     = 'true'          # Si un service doit être activé au démarrage système:  true, false, manual, mask.
$service_hasrestart = 'true'          # Spécifier que le script d'initialisation du service dispose d'une commande 'restart': true, false .  
$service_hasstatus  = 'true'          # Déclarer si le script d'initialisation du service dispose d'une commande 'status': true, false

	          
### Configuration des fichiers 'sudo'

$file_name          = 'sudoers'       # 
$file_path          = '/etc/sudoers'  # Si omis, la valeur par défaut correspondra au titre (file_name).     
$file_ensure        = 'present'       # Spécifier le type gérer:  fichiers, répertoires ou liens symboliques. Valeur possible: present, absent, file, directory, and link.    
$file_backup        = '.puppet-bak'   # le contenu du fichier doit être sauvegardé avant d'être remplacé.   
$file_content       = ''              # Le contenu souhaité d'un fichier, comme une chaîne. This attribute is mutually exclusive with source and target. template($config_template),  
$file_mode          = '0644'          # Autorisations désiré dans la notation symbolique (r,w,x,t,s,X,u,g,o)  ou numérique.
$file_owner         = 'root'          # L'utilisateur auquel le dossier devrait appartenir ( nom d'utilisateur ou ID )
		 





## Groups of machines:
Host_Alias     FILESERVERS = phobos

##regular groups: (ie, from files, LDAP, NIS, etc)
Host_Alias     FILESERVERS = phobos
Host_Alias     MAILSERVERS = smtp, smtp2



## Networking
Cmnd_Alias NETWORKING = /sbin/route, /sbin/ifconfig, /bin/ping, /sbin/dhclient, /usr/bin/net, /sbin/iptables, /usr/bin/rfcomm, /usr/bin/wvdial, /sbin/iwconfig, /sbin/mii-tool

## Installation and management of software
Cmnd_Alias SOFTWARE = /bin/rpm, /usr/bin/up2date, /usr/bin/yum

## Services
Cmnd_Alias SERVICES = /sbin/service, /sbin/chkconfig

## Updating the locate database
Cmnd_Alias LOCATE = /usr/bin/updatedb

## Storage
Cmnd_Alias STORAGE = /sbin/fdisk, /sbin/sfdisk, /sbin/parted, /sbin/partprobe, /bin/mount, /bin/umount

## Delegating permissions
Cmnd_Alias DELEGATING = /usr/sbin/visudo, /bin/chown, /bin/chmod, /bin/chgrp

## Processes
Cmnd_Alias PROCESSES = /bin/nice, /bin/kill, /usr/bin/kill, /usr/bin/killall, /usr/sbin/passwd [A-z]*, ! /usr/bin/passwd root

## Drivers
Cmnd_Alias DRIVERS = /sbin/modprobe



Defaults    requiretty








