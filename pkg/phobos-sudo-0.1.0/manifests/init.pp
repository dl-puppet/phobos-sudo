#Classe principale

class sudo 
(
  ######################################## PACKAGES ############################################
  $package_manage                   = $sudo::params::package_manage,
  $package_name                     = $sudo::params::package_name,
  $package_ensure                   = $sudo::params::package_ensure,
  #$package_install_options         = $sudo::params::package_install_options,                
  #$package_settings                = $sudo::params::package_settings,              
  #$package_reinstall_on_refresh    = $sudo::params::package_reinstall_on_refresh,          
  #$package_responsefile            = $sudo::params::package_responsefile,              
  #$package_source                  = $sudo::params::package_source,              
  #$package_uninstall_options       = $sudo::params::package_uninstall_options,              
   

  ############################# CONFIG_DEFAULT_PARAM_FILES ##################################### 
  $file_name                        = $sudo::params::file_name,    
  #$file_path                       = $sudo::params::file_path,     
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
  $file_replace                     = $sudo::params::file_replace,     
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
  
  
  ############################# CONFIG_DEFAULT_PARAM_DIR ###################################### 
  $dir_name                         = $sudo::params::dir_name,    
  #$dir_path                        = $sudo::params::dir_path,     
  $dir_ensure                       = $sudo::params::dir_ensure,      
  #$dir_backup                      = $sudo::params::dir_backup,    
  #$dir_checksum                    = $sudo::params::dir_checksum,   
  #$dir_content                     = $sudo::params::dir_content,    
  #$dir_ctime                       = $sudo::params::dir_ctime,     
  #$dir_force                       = $sudo::params::dir_force,    
  $dir_group                        = $sudo::params::dir_group,   
  #$dir_ignore                      = $sudo::params::dir_ignore,    
  #$dir_links                       = $sudo::params::dir_links,     
  $dir_mode                         = $sudo::params::dir_mode,     
  #$dir_mtime                       = $sudo::params::dir_mtime,    
  $dir_owner                        = $sudo::params::dir_owner,    
  #$dir_provider                    = $sudo::params::dir_provider,  
  #$dir_purge                       = $sudo::params::dir_purge,       
  #$dir_recurse                     = $sudo::params::dir_recurse,      
  #$dir_recurselimit                = $sudo::params::dir_recurselimit,  
  #$dir_replace                     = $sudo::params::dir_replace,     
  #$dir_selinux_ignore_defaults     = $sudo::params::dir_selinux_ignore_defaults, 
  #$dir_selrange                    = $sudo::params::dir_selrange,  
  #$dir_selrole                     = $sudo::params::dir_selrole,    
  #$dir_seltype                     = $sudo::params::dir_seltype,   
  #$dir_seluser                     = $sudo::params::dir_seluser,   
  #$dir_show_diff                   = $sudo::params::dir_show_diff,   
  #$dir_source                      = $sudo::params::dir_source,     
  #$dir_source_permissions          = $sudo::params::dir_source_permissions, 
  #$dir_sourceselect                = $sudo::params::dir_sourceselect,
  #$dir_target                      = $sudo::params::dir_target,
  #$dir_validate_cmd                = $sudo::params::dir_validate_cmd,  
  #$dir_validate_replacement        = $sudo::params::dir_validate_replacement,
      
  
  
  
  
  ############################### CONFIG_SPECIFIC_FILES #######################################
  ## Dirs
  ## Conf Files
  ## settings


) inherits sudo::params


{
   class{'sudo::install': } ->
   class{'sudo::config': } ~>
   Class["sudo"]
		  
}

