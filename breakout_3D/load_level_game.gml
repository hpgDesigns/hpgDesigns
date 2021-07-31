#define load_level_game
with (obj_ball)
{
    instance_destroy();
}
with (obj_powerup_3ball)
{
    instance_destroy();
}
with (obj_powerup_fire)
{
    instance_destroy();
}
with (obj_bat)
{
    if instance_number(obj_ball)<=0
    {
        if lives>0
        {
            var new_ball;
            new_ball=instance_create(x,y,obj_ball);
            new_ball.start=true;
        }
    }
}

load_name=global.level[argument0];
if load_name != "" && file_exists(load_name)// make sure we picked something...
{
    if filename_ext(load_name)=".lvl" // it's a level?
    {
        file=file_text_open_read(load_name); // it is, so load it.
    }
    else
    {
        file=file_text_open_read(load_name+".lvl"); // otherwise, chuck .lvl at the end, and try load it.
    }
    with (obj_block_parent)
    {
        instance_destroy();
    }
    var xx, yy, zz, obj, cc;
    while (!file_text_eof(file))
    {
        xx=file_text_read_real(file);
        file_text_readln(file);
        yy=file_text_read_real(file);
        file_text_readln(file);
        zz=file_text_read_real(file);
        file_text_readln(file);
        obj=file_text_read_real(file);
        file_text_readln(file);
        cc=file_text_read_string(file);
        file_text_readln(file);
        var ii;
        ii=instance_create(xx,yy,obj);
        ii.z=zz;
        ii.my_color=real(cc);
    }
    file_text_close(file);
}
