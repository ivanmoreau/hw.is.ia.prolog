:- use_module(library(pce)).
:- pce_image_directory('./imagenes').

% Metodo para llamar a una imagen con un nombre especifico
resource(portada, image, image('portada.jpg')).

% Ventana principal para la portada
inicio :- 
	new(@interfaz, dialog('Bienvenido al Sistema Experto')),
	send(@interfaz, size, size(630,400)),
	% mostrar_imagen(@interfaz, portada), % Llama al metodo mostrar imagen
	new(BotonComenzar, button('Iniciar programa', 
		and(message(@prolog, main), 
		and(message(@interfaz, destroy), message(@interfaz, free)) ))),
	new(BotonSalir, button('Salir',
		and(message(@interfaz, destroy), message(@interfaz, free)) )),
	new(TextoAutores, text('Autores: Gustavo Ivan Molina Rebolledo, Cesar Antonio Castro Sotelo, Alejandro Tonatiuh Garcia Espinoza')),
	new(TextoDescripcion, text('Descripcion: Dada la situacion actual de la escacez del agua, el presente sistema experto tiene como objetivo')),
	new(TextoDescripcion2, text('proponer alimentos alternativos que requieran menor cantidad de agua para su producion.')),
	send(@interfaz, append(BotonComenzar)),
	send(@interfaz, append(BotonSalir)),
	send(@interfaz, append(TextoAutores)),
	send(@interfaz, append(TextoDescripcion)),
	send(@interfaz, append(TextoDescripcion2)),
	send(@interfaz, display, BotonComenzar, point(150,100)),
	send(@interfaz, display, BotonSalir, point(400,100)),
	send(@interfaz, display, TextoAutores, point(50, 50)),
	send(@interfaz, display, TextoDescripcion, point(50, 65)),
	send(@interfaz, display, TextoDescripcion2, point(50, 75)),
	send(@interfaz, open_centered).

% Ventana secundaria
main :-
	new(D, dialog('Sistema experto - menu')),
	new(BotonCarnes, button('Carnes',
		and(message(@prolog, carnes),
		and(message(D, destroy), message(D, free))))),
	new(BotonCereales, button('Cereales',
		and(message(@prolog, cereales),
		and(message(D, destroy, message(D, free)))))),
	new(BotonVerduras, button('Verduras',
		and(message(@prolog, verduras),
		and(message(D, destroy, message(D, free)))))),
	new(BotonFrutas, button('Frutas',
		and(message(@prolog, frutas),
		and(message(D, destroy, message(D, free)))))),
	new(BotonBebidas, button('Bebidas',
		and(message(@prolog, bebidas),
		and(message(D, destroy, message(D, free)))))),	
	send(D, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, append, BotonCarnes),
	send(BTS, append, BotonCereales),
	send(BTS, append, BotonVerduras),
	send(BTS, append, BotonFrutas),
	send(BTS, append, BotonBebidas),
	send(D, open_centered).

% Metodo para mostrar imagen
mostrar_imagen(Pantalla, Imagen) :-
	new(Figura, figure),
	new(Bitmap, bitmap(resource(Imagen),@on)),
	send(Bitmap, name, 1),
	send(Figura, display, Bitmap),
	send(Figura, status, 1),
	send(Pantalla, display, Figura, point(10,30)).

% Menu de carnes
carnes :-
	new(D, dialog('Sistema experto - Carnes')),
	new(BotonRes, button('Res',
		and(message(@prolog, res),
		and(message(D, destroy), message(D, free))))),
	new(BotonPollo, button('Pollo',
		and(message(@prolog, pollo),
		and(message(D, destroy), message(D, free))))),
	new(BotonPuerco, button('Cerdo',
		and(message(@prolog, cerdo),
		and(message(D, destroy), message(D, free))))),
	send(D, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, append, BotonRes),
	send(BTS, append, BotonPollo),
	send(BTS, append, BotonPuerco),
	send(D, open_centered).

% Menu de Verduras
verduras :-
	new(D, dialog('Sistema experto - Vegetales')),
	new(BotonCol, button('Col',
		and(message(@prolog, col),
		and(message(D, destroy), message(D, free))))),
	new(BotonPapa, button('Papa',
		and(message(@prolog, papa),
		and(message(D, destroy), message(D, free))))),
	new(BotonJitomate, button('Jitomate',
		and(message(@prolog, jitomate),
		and(message(D, destroy), message(D, free))))),
	send(D, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, append, BotonCol),
	send(BTS, append, BotonPapa),
	send(BTS, append, BotonJitomate),
	send(D, open_centered).

% Menu de Cereales
cereales :-
	new(D, dialog('Sistema experto - Cereales')),
	new(BotonArroz, button('Arroz',
		and(message(@prolog, arroz),
		and(message(D, destroy), message(D, free))))),
	new(BotonPan, button('Pan',
		and(message(@prolog, pan),
		and(message(D, destroy), message(D, free))))),
	new(BotonPasta, button('Pasta',
		and(message(@prolog, pasta),
		and(message(D, destroy), message(D, free))))),
	send(D, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, append, BotonArroz),
	send(BTS, append, BotonPan),
	send(BTS, append, BotonPasta),
	send(D, open_centered).

% Menu de Frutas
frutas :-
	new(D, dialog('Sistema experto - Frutas')),
	new(BotonManzana, button('Manzana',
		and(message(@prolog, manzana),
		and(message(D, destroy), message(D, free))))),
	new(BotonPlatano, button('Platano',
		and(message(@prolog, platano),
		and(message(D, destroy), message(D, free))))),
	new(BotonAceituna, button('Aceituna',
		and(message(@prolog, aceituna),
		and(message(D, destroy), message(D, free))))),
	send(D, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, append, BotonManzana),
	send(BTS, append, BotonPlatano),
	send(BTS, append, BotonAceituna),
	send(D, open_centered).

% Menu de Bebidas
bebidas :-
	new(D, dialog('Sistema experto - Bebidas')),
	new(BotonVino, button('Vino',
		and(message(@prolog, vino),
		and(message(D, destroy), message(D, free))))),
	new(BotonLeche, button('Leche',
		and(message(@prolog, leche),
		and(message(D, destroy), message(D, free))))),
	new(BotonCerveza, button('Cerveza',
		and(message(@prolog, cerveza),
		and(message(D, destroy), message(D, free))))),
	send(D, append, new(BTS, dialog_group(buttons, group))),
	send(BTS, append, BotonVino),
	send(BTS, append, BotonLeche),
	send(BTS, append, BotonCerveza),
	send(D, open_centered).

:- inicio.
