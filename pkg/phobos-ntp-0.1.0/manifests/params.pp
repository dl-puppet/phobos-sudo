# définition des paramètres par défaut 

class sudo::params
{    
      ######################################## PACKAGES ############################################
      $package_manage                   = true
      $package_ensure                   = 'present'       # Etat du paquet: numéro de version, present (also called installed), absent, purged, held, latest. 
      #$package_install_options         = ''              # Un tableau d'options supplémentaires à passer lors de l'installation d'un paquet. (ex: [ '/S', { 'INSTALLDIR' => 'C:\mysql-5.5' } ],) 
      #$package_settings                = ''              # paramètres qui peuvent changer le contenu ou la configuration d'un paquet: (ex: { 'SUEXEC' => false } )
      #$package_reinstall_on_refresh    = 'false'         # utile pour les distributions basées sur les sources, où vous voudrez peut-être recompiler un paquet si les options de construction changent: true ou false
      #$package_responsefile            = ''              # Un fichier contenant toutes les réponses nécessaires aux questions posées par le paquet (pour Solaris et Debian)
      #$package_source                  = ''              # Où trouver le fichier de package. Ceci est utilisé uniquement par les fournisseurs qui ne téléchargent pas automatiquement les paquets à partir d'un référentiel central. (Par exemple: le yum et apt fournisseurs ignorent cet attribut, mais les rpm et dpkg fournisseurs exigent.)
      #$package_uninstall_options       = ''              # éventail d'options supplémentaires à passer lors de la désinstallation d'un paquet. (ex: [ { 'REMOVE' => 'Sync,VSS' } ],)
	  
	  		
	    ###################################### CONFIG_FILES ########################################## 
	    #peut gérer des fichiers normaux, les répertoires et les liens symboliques.
	    #Le contenu des fichiers peuvent être gérés directement avec l'attribut 'content', ou téléchargés à partir d'une source distante via l'attribut 'source'.
		  #$file_path                       = '/etc/sudoers'  # Si omis, la valeur par défaut correspondra au titre (file_name).     
		  $file_ensure                      = 'present'       # Spécifier le type gérer:  fichiers, répertoires ou liens symboliques. Valeur possible: present, absent, file, directory, and link.    
		  $file_backup                      = '.puppet-bak'   # le contenu du fichier doit être sauvegardé avant d'être remplacé.   
		  #$file_checksum                   = 'md5'           # type de contrôle à utiliser pour déterminer si vous voulez remplacer le contenu d'un fichier: md5, md5lite, sha256, sha256lite, mtime, ctime, none. 
		  $file_content                     = 'sudoers.erb'   # Le contenu souhaité d'un fichier, comme une chaîne. This attribute is mutually exclusive with source and target. template($config_template),  
		  #$file_ctime                      = ''              # Une seule lire l'état pour vérifier le fichier ctime. tel est le moment de la modification la plus récente à la propriétaire, le groupe, les permissions, ou le contenu du fichier.
		  #$file_force                      = 'true'          # Forcer la création, suppression,etc.... :  true, false, yes, no. 
		  $file_group                       = 'root'          # Quel groupe devrait posséder le fichier.
		  #$file_ignore                     = ''              # Un paramètre qui omet action sur les fichiers correspondant aux modèles spécifiés lors de la récursivité. 
		  #$file_links                      = 'manage'        # Comment gérer les liens: Au cours de la copie de fichiers, 'follow' va copier le fichier cible à la place du lien, 'manage' va copier le lien lui-même.
		  $file_mode                        = '0440'          # Le mode d'autorisations pour le fichier désiré dans la notation symbolique (r,w,x,t,s,X,u,g,o)  ou numérique.
		  #$file_mtime                      = ''              # Une seule lire l'état pour vérifier le fichier mtime. Sur les systèmes * nix, ceci est le moment de la modification la plus récente le contenu du fichier.
		  $file_owner                       = 'root'          # L'utilisateur auquel le dossier devrait appartenir. peut être un nom d'utilisateur ou un ID utilisateur.
		  #$file_provider                   = ''              # Le backend spécifique à utiliser pour ce fichier ressource.
		  #$file_purge                      = 'false'         # Si les fichiers non gérés doivent être purgées. Cette option n'a de sens qu'avec 'ensure => directory' and 'recurse => true'. (true, false, yes, no.)
		  #$file_recurse                    = 'false'         # Que ce soit pour gérer de manière récursive les contenus d'un répertoire. Cet attribut est utilisé uniquement lorsque ensure => directory  
		  #$file_recurselimit               = '1'             # Jusqu'où Puppet devrait descendre dans les sous-répertoires
		  $file_replace                     = 'true'          # Que ce soit pour remplacer un fichier ou un lien symbolique qui existe deja sur le système local. true, false, yes, no. 
		  #$file_selinux_ignore_defaults    = ''              # Puppet ne demandera pas SELinux (via matchpathcon) de fournir par défaut pour la SELinux attributs (seluser, selrole, seltype et selrange). Les valeurs valides sont true , false .
		  #$file_selrange                   = ''              # Qu'est-ce que la composante de gamme SELinux du contexte du fichier devrait être.
		  #$file_selrole                    = ''              # Qu'est-ce que la composante de SELinux rôle du contexte du fichier devrait être. 
		  #$file_seltype                    = ''              # Qu'est-ce que le composant de type SELinux du contexte du fichier devrait être. 
		  #$file_seluser                    = ''              # Qu'est-ce que la composante de l'utilisateur SELinux du contexte du fichier devrait être.   
		  #$file_show_diff                  = 'true'          # afficher les différences lorsque les modifications de fichiers, par défaut à true. (true, false, yes, no)
		  #$file_source                     = ''              # Un fichier source, qui sera copiée en place sur le système local. peuvent être URI pointant vers des fichiers à distance, ou chemins d'accès complets aux fichiers disponibles sur le système local 
		                                                      # puppet:///modules/name_of_module/filename   (Multiple source values can be specified as an array)
		  #$file_source_permissions         = 'ignore'        # Si (et comment) Puppet devrait copier propriétaire, le groupe et les autorisations de mode à partir de la source. (use, use_when_creating, and ignore:)
		  #$file_sourceselect               = 'first'         # par défaut, la première source valable est la seule utilisée, mais si ce paramètre est réglé sur tout , puis toutes les sources valides aura tous leurs contenus copiés sur le système local. (first, all.)
		  #$file_target                     = ''              # La cible pour créer un lien. Actuellement, les liens symboliques sont le seul type pris en charge. Cet attribut est mutuellement exclusive avec 'source' et 'content'
		  #$file_validate_cmd               = ''              # Une commande pour valider la syntaxe du fichier avant de le remplacer. (ex: /usr/sbin/apache2 -t -f %) <= remplacer eulement si le test a renvoyé true.
		  #$file_validate_replacement       = ''              # La chaîne de remplacement dans un validate_cmd qui sera remplacé par un nom de fichier d'entrée.
  
      ###################################### CONFIG_DIRECTORY #######################################     
		  #$dir_path                        = ''     
		  $dir_ensure                       = 'directory'     
		  #$dir_backup                      = ''    
		  #$dir_checksum                    = ''   
		  #$dir_content                     = ''    
		  #$dir_ctime                       = ''     
		  #$dir_force                       = ''   
		  $dir_group                        = 'root'  
		  #$dir_ignore                      = ''    
		  #$dir_links                       = ''     
		  $dir_mode                         = '0550'     
		  #$dir_mtime                       = ''    
		  $dir_owner                        = 'root'   
		  #$dir_provider                    = ''  
		  #$dir_purge                       = ''       
		  #$dir_recurse                     = ''      
		  #$dir_recurselimit                = ''  
		  #$dir_replace                     = ''     
		  #$dir_selinux_ignore_defaults     = '' 
		  #$dir_selrange                    = '' 
		  #$dir_selrole                     = ''    
		  #$dir_seltype                     = ''  
		  #$dir_seluser                     = ''  
		  #$dir_show_diff                   = ''   
		  #$dir_source                      = ''    
		  #$dir_source_permissions          = ''
		  #$dir_sourceselect                = ''
		  #$dir_target                      = ''
		  #$dir_validate_cmd                = ''  
		  #$dir_validate_replacement        = ''
		  
                  
      
  case $::osfamily {
    'RedHat': {
      $package_name                     = 'sudo'          # Le nom du paquet
      $file_name                        = '/etc/sudoers'       # 
      $dir_name                         = '/etc/sudoers.d'
         
      }  
  }
}
