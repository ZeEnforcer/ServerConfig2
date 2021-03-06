register_command(zord, 
    array(
        description: 'Power',
        permission: 'ch.alias.zord',
        noPermMsg: 'Sorry you don\'t have permission to use this command.',
        executor: closure() {        
            
            @plr = player()
            sudo(/disguise enderdragon)
            set_pflight(@plr,true)
            set_pflying(@plr,true)
                
        }
    )
)

register_command(unzord, 
    array(
        description: 'Power',
        permission: 'ch.alias.unzord',
        noPermMsg: 'Sorry you don\'t have permission to use this command.',
        executor: closure() {        
            include('/home/minecraft/server/plugins/CommandHelper/includes/changeSkin.ms')
    
            @player = player()
            include('/home/minecraft/server/plugins/CommandHelper/includes/getHeroClass.ms')
            @class = _getheroclass(@player)

            set_pflight(@player,false)
            
            @contents = read('/home/minecraft/server/plugins/CommandHelper/LocalPackages/commands/chars/'.@class.'.yml')
            @hero = yml_decode(@contents)

            
            @sig = @hero['sig']
            @val = @hero['val']
            _changeSkin(@player,@sig,@val)
                
        }
    )
)
