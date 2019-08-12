let g:airline#themes#maxbucknell#palette = {}
let g:airline#themes#maxbucknell#palette.accents = {}

let g:airline_a_normal   = [ '#F0F1FF' , '#16182B' , 17  , 190 ]
let g:airline_b_normal   = [ '#F0F1FF' , '#16182B' , 17  , 190 ]
let g:airline_c_normal   = [ '#F0F1FF' , '#16182B' , 17  , 190 ]
let g:airline#themes#maxbucknell#palette.normal = airline#themes#generate_color_map(g:airline_a_normal, g:airline_b_normal, g:airline_c_normal)
