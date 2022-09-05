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

% Metodo para mostrar imagen
mostrar_imagen(Pantalla, Imagen) :-
	new(Figura, figure),
	new(Bitmap, bitmap(resource(Imagen),@on)),
	send(Bitmap, name, 1),
	send(Figura, display, Bitmap),
	send(Figura, status, 1),
	send(Pantalla, display, Figura, point(10,30)).
	

:- inicio.
