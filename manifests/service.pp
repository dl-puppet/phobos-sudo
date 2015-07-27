# Gestion des services/daemon du logiciel

class sudo::service inherits sudo
{
 
    if ! ($service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
    }
    
     
    if $service_manage == true {  
        service { '$service_name':
        name                  => $service_name,
        ensure                => $service_ensure,
        #binary               => $service_binary,
        enable                => $service_enable,
        #flags                => $service_flags, 
        #hasrestart           => $service_hasrestart,
        hasstatus             => $service_hasstatus,
        #manifest             => $service_manifest, 
        path                  => $service_path,
        #pattern              => $service_pattern,
        #restart              => $service_restart,
        #start                => $service_start,
        #status               => $service_status,
        #stop                 => $service_stop,
        }
    }
      

  
}