# installation du logiciel

class sudo::install inherits sudo
{
   if $package_manage == true { 
     
        package { $package_name:      
				ensure                => $package_ensure, 
				name                  => $package_name,         
				#install_options      => $package_install_options,
				#package_settings     => $package_settings,
				#reinstall_on_refresh => $package_reinstall_on_refresh,
				#responsefile         => $package_responsefile,
				#source               => $package_source,
				#uninstall_options    => $package_uninstall_options,
				}
				
	 }
	 #default: { fail('Option Package_manage dont enable') }
	 
}