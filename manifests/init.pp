#Classe principale

class template_project 
(
  ######################################## PACKAGES ############################################
  $package_name                     = $template_project::params::package_name,
  $package_ensure                   = $template_project::params::package_ensure,
  #$package_install_options         = $template_project::params::package_install_options,                
  #$package_settings                = $template_project::params::package_settings,              
  #$package_reinstall_on_refresh    = $template_project::params::package_reinstall_on_refresh,          
  #$package_responsefile            = $template_project::params::package_responsefile,              
  #$package_source                  = $template_project::params::package_source,              
  #$package_uninstall_options       = $template_project::params::package_uninstall_options,              
      
  ######################################## SERVICES ############################################
	$service_manage                    = $template_project::params::service_manage,
	$service_name                      = $template_project::params::service_name, 
	$service_ensure                    = $template_project::params::service_ensure,            
	#$service_binary                   = $template_project::params::service_binary,
	$service_enable                    = $template_project::params::service_enable,  
	#$service_flags                    = $template_project::params::service_flags,  
	$service_hasrestart                = $template_project::params::service_hasrestart,   
	$service_hasstatus                 = $template_project::params::service_hasstatus,  
	#$service_manifest                 = $template_project::params::service_manifest,   
	$service_path                      = $template_project::params::service_path,     
	#$service_pattern                  = $template_project::params::service_pattern,    
	#$service_restart                  = $template_project::params::service_restart,   
	#$service_start                    = $template_project::params::service_star,   
	#$service_status                   = $template_project::params::service_status,   
	#$service_stop                     = $template_project::params::service_stop,    

  ###################################### CONFIG_FILES ########################################## 
  $file_name                         = $template_project::params::file_name,    
  $file_path                         = $template_project::params::file_path,     
  $file_ensure                       = $template_project::params::file_ensure,      
  $file_backup                       = $template_project::params::file_backup,    
  $file_checksum                     = $template_project::params::file_checksum,   
  $file_content                      = $template_project::params::file_content,    
  #$file_ctime                       = $template_project::params::file_ctime,     
  $file_force                        = $template_project::params::file_force,    
  $file_group                        = $template_project::params::file_group,   
  #$file_ignore                      = $template_project::params::file_ignore,    
  $file_links                        = $template_project::params::file_links,     
  $file_mode                         = $template_project::params::file_mode,     
  #$file_mtime                       = $template_project::params::file_mtime,    
  $file_owner                        = $template_project::params::file_owner,    
  #$file_provider                    = $template_project::params::file_provider,  
  $file_purge                        = $template_project::params::file_purge,       
  $file_recurse                      = $template_project::params::file_recurse,      
  $file_recurselimit                 = $template_project::params::file_recurselimit,  
  $file_replace                      = $template_project::params::file_replace,     
  #$file_selinux_ignore_defaults     = $template_project::params::file_selinux_ignore_defaults, 
  #$file_selrange                    = $template_project::params::file_selrange,  
  #$file_selrole                     = $template_project::params::file_selrole,    
  #$file_seltype                     = $template_project::params::file_seltype,   
  #$file_seluser                     = $template_project::params::file_seluser,   
  $file_show_diff                    = $template_project::params::file_show_diff,   
  $file_source                       = $template_project::params::file_source,     
  $file_source_permissions           = $template_project::params::file_source_permissions, 
  $file_sourceselect                 = $template_project::params::file_sourceselect,
  $file_target                       = $template_project::params::file_target,
  #$file_validate_cmd                 = $template_project::params::file_validate_cmd,  
  #$file_validate_replacement         = $template_project::params::file_validate_replacement,
 
  ## Dirs
  #$config_dir         = $template_project::params::config_dir,
  #$service_dir        = $template_project::params::service_dir,
  #$home               = $template_project::params::home,

  ## Conf Files
  #$config_file        = $template_project::params::config_file,
  #$service_file       = $template_project::params::service_file,
  #$config_template    = $template_project::params::config_template,
  
  ## settings
  #$module_settings     = $template_project::params::module_settings,
  #$preferred_servers   = $template_project::params::preferred_servers,
  #$servers             = $template_project::params::servers,

) inherits template_project::params


{
   class{'template_project::install': } ->
   #include template_project::install
   class{'template_project::config': } ~>
   class{'template_project::service': } ->
   Class["template_project"]
		  
}

