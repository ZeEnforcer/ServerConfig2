# checkpoint system for players in parkour
register_command(cp, 
    array(
        description: 'Create Checkpoint',
        usage: '/cp',
        permission: 'ch.alias.cp',
        noPermMsg: 'Sorry you don\'t have permission to use this command.',
        executor: closure() {
                
                @plr = player()
                
                if(pmode(@plr) == 'SPECTATOR'){
                    msg(color(RED).'Sorry, you cannot use that in spectator mode')
                    die()
                }
                @pinfo = pinfo(@plr)

                @world = @pinfo[7]
                @coords = @pinfo[1]
                
                @loc = ploc(@plr);
                @yaw = @loc['yaw'];
                @pitch = @loc['pitch'];
                
                export(@plr.'world',@world)
                export(@plr.'coords',@coords)
                export(@plr.'pitch',@pitch)
                export(@plr.'yaw',@yaw)
                
                tmsg(player(),concat(color(light_gray),
                'Saved your position!'))
        
        }
    )
)
register_command(gcp, 
    array(
        description: 'Go to Saved Checkpoint',
        usage: '/gcp',
        permission: 'ch.alias.gcp',
        noPermMsg: 'Sorry you don\'t have permission to use this command.',
        executor: closure() {
                
                @plr = player()
                @pinfo = pinfo(@plr)

                @world = import(@plr.'world')
                @coords = import(@plr.'coords')
                @pitch = import(@plr.'pitch')
                @yaw = import(@plr.'yaw')
                
                if(@world != @pinfo[7])
                {
                    tmsg(player(),concat(color(light_gray),
                    'You need to first use /cp.'))
                    die()
                }
                
                set_ploc(@plr,@coords)
                pfacing(@plr,@yaw,@pitch)
                tmsg(player(),concat(color(light_gray),
                'Loaded your position!'))
        
        }
    )
)
