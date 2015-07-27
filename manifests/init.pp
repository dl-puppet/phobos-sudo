#Classe principale

class sudo 
(
  ######################################## PACKAGES ############################################
  $package_name                     = $sudo::params::package_name,
  $package_ensure                   = $sudo::params::package_ensure,
  #$package_install_options         = $sudo::params::package_install_options,                
  #$package_settings                = $sudo::params::package_settings,              
  #$package_reinstall_on_refresh    = $sudo::params::package_reinstall_on_refresh,          
  #$package_responsefile            = $sudo::params::package_responsefile,              
  #$package_source                  = $sudo::params::package_source,              
  #$package_uninstall_options       = $sudo::params::package_uninstall_options,              
      
  ######################################## SERVICES ############################################
	$service_manage                   = $sudo::params::service_manage,
	$service_name                     = $sudo::params::service_name, 
	$service_ensure                   = $sudo::params::service_ensure,            
	#$service_binary                  = $sudo::params::service_binary,
	$service_enable                   = $sudo::params::service_enable,  
	#$service_flags                   = $sudo::params::service_flags,  
	#$service_hasrestart              = $sudo::params::service_hasrestart,   
	#$service_hasstatus               = $sudo::params::service_hasstatus,  
	#$service_manifest                = $sudo::params::service_manifest,   
	#$service_path                    = $sudo::params::service_path,     
	#$service_pattern                 = $sudo::params::service_pattern,    
	#$service_restart                 = $sudo::params::service_restart,   
	#$service_start                   = $sudo::params::service_star,   
	#$service_status                  = $sudo::params::service_status,   
	#$service_stop                    = $sudo::params::service_stop,    

  ############################# CONFIG_DEFAULT_PARAM_FILES ##################################### 
  $file_name                        = $sudo::params::file_name,    
  $file_path                        = $sudo::params::file_path,     
  $file_ensure                      = $sudo::params::file_ensure,      
  $file_backup                      = $sudo::params::file_backup,    
  #$file_checksum                   = $sudo::params::file_checksum,   
  $file_content                     = $sudo::params::file_content,    
  #$file_ctime                      = $sudo::params::file_ctime,     
  #$file_force                      = $sudo::params::file_force,    
  $file_group                       = $sudo::params::file_group,   
  #$file_ignore                     = $sudo::params::file_ignore,    
  #$file_links                      = $sudo::params::file_links,     
  $file_mode                        = $sudo::params::file_mode,     
  #$file_mtime                      = $sudo::params::file_mtime,    
  $file_owner                       = $sudo::params::file_owner,    
  #$file_provider                   = $sudo::params::file_provider,  
  #$file_purge                      = $sudo::params::file_purge,       
  #$file_recurse                    = $sudo::params::file_recurse,      
  #$file_recurselimit               = $sudo::params::file_recurselimit,  
  #$file_replace                    = $sudo::params::file_replace,     
  #$file_selinux_ignore_defaults    = $sudo::params::file_selinux_ignore_defaults, 
  #$file_selrange                   = $sudo::params::file_selrange,  
  #$file_selrole                    = $sudo::params::file_selrole,    
  #$file_seltype                    = $sudo::params::file_seltype,   
  #$file_seluser                    = $sudo::params::file_seluser,   
  #$file_show_diff                  = $sudo::params::file_show_diff,   
  #$file_source                     = $sudo::params::file_source,     
  #$file_source_permissions         = $sudo::params::file_source_permissions, 
  #$file_sourceselect               = $sudo::params::file_sourceselect,
  #$file_target                     = $sudo::params::file_target,
  #$file_validate_cmd               = $sudo::params::file_validate_cmd,  
  #$file_validate_replacement       = $sudo::params::file_validate_replacement,
 
 
   ############################### CONFIG_SPECIFIC_FILES #######################################
  ## Dirs
  #$config_dir         = $sudo::params::config_dir,
  #$service_dir        = $sudo::params::service_dir,
  #$home               = $sudo::params::home,

  ## Conf Files
  #$config_file        = $sudo::params::config_file,
  #$service_file       = $sudo::params::service_file,
  #$config_template    = $sudo::params::config_template,
  
  ## settings
  #$module_settings     = $sudo::params::module_settings,
  #$preferred_servers   = $sudo::params::preferred_servers,
  #$servers             = $sudo::params::servers,

) inherits sudo::params


{
   class{'sudo::install': } ->
   #include sudo::install
   class{'sudo::config': } ~>
   class{'sudo::service': } ->
   Class["sudo"]
		  
}

