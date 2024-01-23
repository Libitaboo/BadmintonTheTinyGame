draw_set_color(_color)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
_timer++
draw_text_transformed(x,y,_text,5-_timer/30,5-_timer/30,0)
if _timer>=150{instance_destroy()}

